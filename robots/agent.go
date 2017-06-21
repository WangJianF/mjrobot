package robots

import (
	"encoding/binary"
	"encoding/json"
	"fmt"
	"io"
	"mjrobot/comm"
	"net"
	"time"
)

type HandlerCB func(msg *Msg)

type Agent struct {
	conn     *net.TCPConn
	running  bool
	parent   *RobotMgr
	addr     string
	handlers map[uint32]HandlerCB
	ticker   *time.Ticker
}

func (agent *Agent) start(addr string) bool {
	var (
		err     error
		conn    *net.TCPConn
		tcpaddr *net.TCPAddr
	)

	tcpaddr, err = net.ResolveTCPAddr("tcp", addr)
	if err != nil {
		fmt.Printf("agent connect to server(addr: %s) failed 1: %v\n", addr, err.Error())
		return false
	}

	conn, err = net.DialTCP("tcp", nil, tcpaddr)
	if err != nil {
		fmt.Printf("agent connect to server(addr: %s) failed 2: %v\n", addr, err.Error())
		return false
	}

	agent.addr = addr
	agent.conn = conn
	agent.running = true

	agent.initListeners()
	go agent.regist()
	go agent.startHeartbeat()
	go agent.startReader()

	return true
}

func (agent *Agent) initListeners() {
	agent.AddMsgHandler(uint32(CMD_ADD_ROBOT), func(msg *Msg) {
		if len(agent.parent.robots) < MAX_ROBOT_NUM {
			var reqNewRobot ReqNewRobot
			if err := json.Unmarshal(msg.data, &reqNewRobot); err == nil {
				robotInfo := &RobotInfo{
					addr:    agent.parent.dstaddr,
					fieldId: reqNewRobot.FieldID,
				}
				agent.parent.chNewRobot <- robotInfo
				//agent.parent.NewRobot(agent.parent.dstaddr, reqNewRobot.FieldID)
			} else {
				fmt.Printf("server new robot cmd error when json Unmarshal: %v.\n", err)
			}
		}
	})
	agent.AddMsgHandler(uint32(CMD_REGIST_MGR2), func(msg *Msg) {
		fmt.Println("agent regist success.")
	})
	agent.AddMsgHandler(uint32(CMD_HEARTBEAT2), func(msg *Msg) {
		// fmt.Println("agent heartbeat2")
	})
}

func (agent *Agent) regist() {
	fmt.Println("agent regist to server. 111")

	msg := &Msg{
		robotIdx: 0,
		cmd:      uint32(CMD_REGIST_MGR),
		dataLen:  0,
		//data:     make([]byte, 1),
	}
	//msg.data[0] = byte(CMD_REGIST_MGR)

	agent.parent.chSendMsg <- msg
	fmt.Println("agent regist to server. 222")
}

func (agent *Agent) startHeartbeat() {

	for {
		select {
		case <-agent.ticker.C:
			msg := &Msg{
				robotIdx: 0,
				cmd:      uint32(CMD_HEARTBEAT),
				dataLen:  0,
				//data:     make([]byte, 1),
			}
			//msg.data[0] = byte(CMD_HEARTBEAT)

			agent.parent.chSendMsg <- msg
		}
	}

}

func (agent *Agent) startReader() {
	defer comm.PanicHandle(false)

	var (
		err     error
		head    = make([]byte, PACK_HEAD_LEN)
		readLen int
	)

	for {
		readLen, err = io.ReadFull(agent.conn, head)
		if err != nil || readLen < PACK_HEAD_LEN-1 {
			fmt.Printf("agent read data failed when read head: %v\n", err)
			goto Exit
		}

		msg := &Msg{
			cmd:     uint32(binary.BigEndian.Uint32(head[4:])),
			dataLen: uint32(binary.BigEndian.Uint32(head[:4])),
		}

		if msg.dataLen > 0 {
			msg.data = make([]byte, msg.dataLen)
			readLen, err = io.ReadFull(agent.conn, msg.data)

			if err != nil || readLen != int(msg.dataLen) {
				fmt.Printf("agent read data failed when read buf: %v\n", err)
				goto Exit
			}

			/*buf2, err = agent.parent.aes.Decrypt(buf1)
			if err != nil {
				fmt.Printf("agent read data failed when decrypt: %v\n", err)
				goto Exit
			}*/
			//fmt.Printf("agent read \n  data 1: %d %s\n  data 2: %d %d %s\n", buf1[0], string(buf1[1:]), buf2[0], len(string(buf2[1:])), string(buf2[1:]))

			if handler, ok := agent.handlers[msg.cmd]; ok {
				agentMsgHandler(handler, msg)
			}
		}

	}
Exit:
	agent.stop()
}

func (agent *Agent) stop() {
	comm.PanicHandle(false)
	if agent.running {
		agent.running = false
		agent.conn.Close()
		agent.ticker.Stop()
		agent.parent.Exit()
	}
}

func agentMsgHandler(handler HandlerCB, msg *Msg) {
	defer comm.PanicHandle(false)
	handler(msg)
}

func (agent *Agent) AddMsgHandler(cmd uint32, cb HandlerCB) {
	agent.handlers[cmd] = cb
}

func (agent *Agent) RemoveMsgHandler(cmd uint32, cb HandlerCB) {
	delete(agent.handlers, cmd)
}

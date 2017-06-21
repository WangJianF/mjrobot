package robots

import (
	"encoding/binary"
	"fmt"
	"mjrobot/comm"
	"mjrobot/crypto2"

	"github.com/yuin/gopher-lua"
	//"sync"
	"os"
	"time"
)

var (
	robotMgrNum = 0
	robotMgrs   = make(map[int]*RobotMgr)
)

type RobotMgr struct {
	idx        int
	luaState   *lua.LState
	agent      *Agent
	dstaddr    string
	robotNum   int
	robots     map[int]*Robot
	chRecvMsg  chan *Msg
	chSendMsg  chan *Msg
	chNewRobot chan *RobotInfo
	ticker     *time.Ticker
	aes        crypto2.Crypter
	agentsum   int
}

func (mgr *RobotMgr) initLua() bool {
	var (
		err error
	)

	mgr.luaState.SetGlobal("G_ROBOT_MGR_IDX", lua.LNumber(mgr.idx))
	mgr.luaState.SetGlobal("sendData", mgr.luaState.NewFunction(sendData))
	mgr.luaState.SetGlobal("robotExit", mgr.luaState.NewFunction(robotExit))

	if err = mgr.luaState.DoFile("./script/init.lua"); err != nil {
		fmt.Println(err.Error())
		return false
	}

	return true
}

func (mgr *RobotMgr) initAgent(addr string) bool {
	mgr.agent = &Agent{
		parent:   mgr,
		handlers: make(map[uint32]HandlerCB),
		ticker:   time.NewTicker(AGENT_TICKER_INTERNAL),
	}

	if mgr.agent.start(addr) {
		/*for i := 1; i <= 3; i++ {
			robotInfo := &RobotInfo{
				addr:    os.Args[2],
				fieldId: "",
			}

			mgr.chNewRobot <- robotInfo
		}*/
		return true
	}

	return false
}

/*func (mgr *RobotMgr) startTicker() {
	for {
		select {
		case <-mgr.ticker.C:
			msg := &Msg{
				robotIdx: 0,
				cmd:      1,
			}
			//fmt.Println("---------- tick 000")
			mgr.chRecvMsg <- msg
		}
	}
}*/

func (mgr *RobotMgr) startMsgSender() {
	//fmt.Println("startmsgSender ")
	for {
		defer comm.PanicHandle(true)
		var (
			msg *Msg
			err error
			buf []byte
			//enctyptBuf []byte
			wlen int
		)
		msg = <-mgr.chSendMsg
		if msg == nil {
			return
		}

		if msg.robotIdx == 0 {
			/*if err != nil {
				fmt.Printf("agent send data failed when enctypt: %v\n", err)
			}*/

			buf = make([]byte, PACK_HEAD_LEN+msg.dataLen)
			binary.LittleEndian.PutUint32(buf, uint32(len(msg.data)))
			binary.LittleEndian.PutUint32(buf[4:8], uint32(msg.cmd))
			copy(buf[PACK_HEAD_LEN:], msg.data)

			wlen, err = mgr.agent.conn.Write(buf)

			if err != nil || wlen != len(buf) {
				fmt.Printf("agent write failed: %v\n", err)
				mgr.agent.stop()
			} else {
				//fmt.Printf("agent write success: \n  data 1: %v\n  data 2: %v\n", msg.data, buf)
			}
		} else {
			if robot, ok := mgr.robots[msg.robotIdx]; ok {
				if err != nil {
					fmt.Printf("robot(idx: %d) send data failed when enctypt: %v\n", robot.idx, err)
				} else {
					buf = make([]byte, PACK_HEAD_LEN+msg.dataLen)
					binary.LittleEndian.PutUint32(buf, uint32(len(msg.data)))
					binary.LittleEndian.PutUint32(buf[4:8], uint32(msg.cmd))
					copy(buf[PACK_HEAD_LEN:], msg.data)
					wlen, err = robot.conn.Write(buf)

					if err != nil || wlen != len(buf) {
						fmt.Printf("robot(idx: %d) write failed: %v\n", robot.idx, err)
						robot.stop()
					} else {
						//fmt.Printf("robot(idx: %d) write success: \n  data 1: %v\n  data 2: %v\n", robot.idx, msg.data, buf)
					}
				}
			} else {
				fmt.Printf("robot(idx: %d) write failed: robot doesn't exist!\n", msg.robotIdx)
			}
		}
	}
}

func (mgr *RobotMgr) startMsgHandler() {
	for {
		//tmpFunc := func() bool {
		defer comm.PanicHandle(true)
		var (
			msg  *Msg
			info *RobotInfo
			err  error
		)
		select {
		case <-mgr.ticker.C:

			if err = mgr.luaState.CallByParam(lua.P{
				Fn:      mgr.luaState.GetGlobal("onMsg"),
				NRet:    1,
				Protect: true,
			}, lua.LNumber(0), lua.LNumber(0), lua.LString("")); err != nil { //idx==0 tick msg
				fmt.Println(err.Error())
			}

			mgr.luaState.Get(-1)
			mgr.luaState.Pop(1)

		case msg = <-mgr.chRecvMsg:
			if msg == nil {
				return
			}

			if msg.cmd == 0 {

				if err = mgr.luaState.CallByParam(lua.P{
					Fn:      mgr.luaState.GetGlobal("onDeleRobot"),
					NRet:    1,
					Protect: true,
				}, lua.LNumber(msg.robotIdx)); err != nil {
					fmt.Println(err.Error())
				}

				if robot, ok := mgr.robots[msg.robotIdx]; ok {
					robot.stop()
				}
				mgr.luaState.Get(-1)
				mgr.luaState.Pop(1)

				/*lbv := mgr.luaState.Get(-1)

				mgr.luaState.Pop(1)

				if ret, ok := lbv.(lua.LBool); ok && !bool(ret) {

				}*/
			} else {

				defer comm.PanicHandle(true)
				if err = mgr.luaState.CallByParam(lua.P{
					Fn:      mgr.luaState.GetGlobal("onMsg"),
					NRet:    1,
					Protect: true,
				}, lua.LNumber(msg.robotIdx), lua.LNumber(msg.cmd), lua.LString(msg.data)); err != nil {
					fmt.Printf("push msg to lua err: %v.", err.Error())
				}
				mgr.luaState.Get(-1)
				mgr.luaState.Pop(1)

				/*lbv := mgr.luaState.Get(-1)

				mgr.luaState.Pop(1)

				if ret, ok := lbv.(lua.LBool); ok && !bool(ret) {
					mgr.robots[msg.robotIdx].stop()
				}*/
			}

		case info = <-mgr.chNewRobot:
			if info == nil {
				fmt.Printf("robotMgr exit, info is nil.")
				mgr.Exit()
			}

			mgr.NewRobot(info.addr, info.roomid)
		}

		//return true
	}
	/*for {
		for {
			if !tmpFunc() {
				return
			}
		}
	}*/
}

func (mgr *RobotMgr) Start() {
	fmt.Println("RobotMgr Start()")
	//go mgr.startTicker()
	go mgr.startMsgSender()
	go mgr.startMsgHandler()
}

func (mgr *RobotMgr) Stop() {
	for _, v := range mgr.robots {
		v.stop()
	}

	mgr.luaState.Close()
	close(mgr.chRecvMsg)
	close(mgr.chSendMsg)
	mgr.ticker.Stop()
}

func (mgr *RobotMgr) NewRobot(addr string, roomid uint64) {
	robot := &Robot{
		idx:    mgr.robotNum,
		parent: mgr,
	}

	mgr.robots[mgr.robotNum] = robot
	mgr.robotNum = mgr.robotNum + 1

	if robot.start(addr) {
		tmpFunc := func() {
			if err := mgr.luaState.CallByParam(lua.P{
				Fn:      mgr.luaState.GetGlobal("onNewRobot"),
				NRet:    1,
				Protect: true,
			}, lua.LNumber(robot.idx), lua.LNumber(roomid)); err != nil {
				fmt.Printf("[Go_print  | RobotMgr] NewRobot(addr: %s, idx: %d) failed: %v.\n", addr, robot.idx, err)
			} else {
				fmt.Printf("[Go_print  | RobotMgr] NewRobot(addr: %s, idx: %d) success.\n", addr, robot.idx)
			}
			mgr.luaState.Get(-1)
			mgr.luaState.Pop(1)
		}
		tmpFunc()
	}

	return
}

func (mgr *RobotMgr) Exit() {
	mgr.Stop()
	fmt.Println("RobotMgr Exit!")
	os.Exit(0)
}

func sendData(state *lua.LState) int {
	comm.PanicHandle(true)

	strv := state.Get(-1) // get the value at the top of the stack
	icmd := state.Get(-2)
	iidx := state.Get(-3)
	iridx := state.Get(-4)

	if mgr, ok := robotMgrs[int(iridx.(lua.LNumber))]; ok {
		msg := &Msg{
			cmd:      uint32(icmd.(lua.LNumber)),
			dataLen:  uint32(len(string(strv.(lua.LString)))),
			robotIdx: int(iidx.(lua.LNumber)),
		}

		msg.data = make([]byte, len(string(strv.(lua.LString))))
		//msg.data[0] = byte(msg.cmd)
		copy(msg.data, string(strv.(lua.LString)))

		mgr.chSendMsg <- msg
		//fmt.Printf("robot(idx: %d)'s msg has been pushed into sender chan!\n", msg.robotIdx)
	} else {
		fmt.Printf("robot(idx: %d) sendData failed: robot mgr doesn't exist!\n", int(iridx.(lua.LNumber)))
	}

	return 1
}

func robotExit(state *lua.LState) int {
	comm.PanicHandle(true)

	iidx := state.Get(-1)
	iridx := state.Get(-2)

	if mgr, ok := robotMgrs[int(iridx.(lua.LNumber))]; ok {
		mgr.chRecvMsg <- &Msg{robotIdx: int(iidx.(lua.LNumber)), cmd: 0}
		fmt.Printf("pushed robot(idx: %d)'s exit msg into msg handler!\n", int(iidx.(lua.LNumber)))
	} else {
		//fmt.Printf("robot(idx: %d) robotExit: robot mgr doesn't exist!\n", int(iridx.(lua.LNumber)))
	}

	return 1
}

func (mgr *RobotMgr) NewRobots(roomid uint64) {
	for i := 1; i <= mgr.agentsum; i++ {
		robotInfo := &RobotInfo{
			addr:    os.Args[2],
			fieldId: "",
			roomid:  roomid,
		}

		mgr.chNewRobot <- robotInfo
	}
}

func NewRobotMgr(agentAddr string, serverAddr string, agentnum int) *RobotMgr {
	mgr := &RobotMgr{
		idx:        robotMgrNum,
		luaState:   lua.NewState(),
		dstaddr:    serverAddr,
		robotNum:   1,
		robots:     make(map[int]*Robot),
		chRecvMsg:  make(chan *Msg, 100),
		chSendMsg:  make(chan *Msg, 100),
		chNewRobot: make(chan *RobotInfo, 5),
		ticker:     time.NewTicker(LUA_TICKER_INTERNAL),
		agentsum:   agentnum,
	}

	aes, err := crypto2.NewAES([]byte(comm.AES_KEY))
	if err != nil {
		return nil
	}
	mgr.aes = aes

	if !mgr.initLua() {
		return nil
	}

	/*if !mgr.initAgent(agentAddr) {
		return nil
	}*/

	robotMgrs[robotMgrNum] = mgr
	robotMgrNum = robotMgrNum + 1

	//go mgr.Start()

	return mgr
}

func DeleRobotMgr(mgr *RobotMgr) {
	mgr.Stop()
	delete(robotMgrs, mgr.idx)
	robotMgrNum = robotMgrNum - 1
}

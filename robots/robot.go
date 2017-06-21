package robots

import (
	"encoding/binary"
	"fmt"
	"io"
	"mjrobot/comm"
	"net"
)

type Robot struct {
	idx     int
	conn    *net.TCPConn
	running bool
	parent  *RobotMgr
	addr    string
}

func (robot *Robot) start(addr string) bool {
	var (
		err     error
		conn    *net.TCPConn
		tcpaddr *net.TCPAddr
	)

	tcpaddr, err = net.ResolveTCPAddr("tcp", addr)
	if err != nil {
		fmt.Printf("robot connect to server(addr: %s) failed 1: %v\n", addr, err.Error())
		return false
	}

	conn, err = net.DialTCP("tcp", nil, tcpaddr)
	if err != nil {
		fmt.Printf("robot connect to server(addr: %s) failed 2: %v\n", addr, err.Error())
		return false
	}

	robot.addr = addr
	robot.conn = conn
	robot.running = true

	go robot.startReader()

	return true
}

func (robot *Robot) startReader() {
	defer comm.PanicHandle(false)

	var (
		err  error
		head = make([]byte, PACK_HEAD_LEN)
		//buf2    []byte
		readLen int
	)

	for {
		readLen, err = io.ReadFull(robot.conn, head)
		if err != nil || readLen < PACK_HEAD_LEN {
			fmt.Printf("robot(idx: %d) read data failed when read head: %v\n", robot.idx, err)
			goto Exit
		}

		msg := &Msg{
			cmd:      uint32(binary.LittleEndian.Uint32(head[4:])),
			dataLen:  uint32(binary.LittleEndian.Uint32(head[:4])),
			robotIdx: robot.idx,
		}

		if msg.dataLen > 0 {
			msg.data = make([]byte, msg.dataLen)
			readLen, err = io.ReadFull(robot.conn, msg.data)

			if err != nil || readLen != int(msg.dataLen) {
				fmt.Printf("robot(idx: %d) read data failed when read buf: %v\n", robot.idx, err)
				goto Exit
			}
			/*
				msg.data, err = robot.parent.aes.Decrypt(buf1)
				if err != nil {
					fmt.Printf("robot(idx: %d) read data failed when decrypt: %v\n", robot.idx, err)
					goto Exit
				}

				msg.data = buf2
				copy(msg.data, buf2[1:])
			*/
		}
		// fmt.Printf("[Go_print  | Robot] robot reader recv new: %d %d %s\n", msg.cmd, msg.dataLen, string(msg.data))
		robot.parent.chRecvMsg <- msg
	}
Exit:
	robot.stop()
}

func (robot *Robot) stop() {
	fmt.Printf("robot(idx: %d) stop()\n", robot.idx)
	//fmt.Printf("stacks: %s", GetStackInfo())
	delete(robot.parent.robots, robot.idx)
	comm.PanicHandle(false)
	if robot.running {
		robot.running = false
		robot.conn.Close()
		robot.parent.chRecvMsg <- &Msg{robotIdx: robot.idx, cmd: 0}
	}
}

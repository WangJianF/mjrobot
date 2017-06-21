package main

import (
	//	"comm"
	"bufio"
	"fmt"
	"github.com/ccppluagopy/zed"
	"mjrobot/comm"
	"mjrobot/robots"
	"os"
	"strconv"
)

func main() {
	comm.HandleSignal(true)

	argc := len(os.Args)
	if argc <= 1 {
		return
	}

	for i := 0; i < argc; i++ {
		fmt.Println("arg", i, os.Args[i])
	}

	agentaddr := os.Args[1]
	serveraddr := os.Args[2]
	agentnum, _ := strconv.Atoi(os.Args[3])
	fmt.Println("server addr: ", agentaddr, serveraddr, agentnum)
	addrs, err := zed.GetLocalAddr()
	if err == nil {
		for _, addr := range addrs {
			serveraddr = fmt.Sprintf("%s:9999", addr)
			break
		}

	}
	mgr := robots.NewRobotMgr(agentaddr, serveraddr, agentnum)
	if mgr == nil {
		return
	}
	mgr.Start()

	HandleCmd(mgr)
}

func HandleCmd(mgr *robots.RobotMgr) {
	reader := bufio.NewReader(os.Stdin)

	running := true
	for running {
		fmt.Println("*****************************")
		fmt.Println("Enter Room(input RoomID):")
		data, _, _ := reader.ReadLine()
		roomid, err := strconv.Atoi(string(data))
		if err != nil {
			fmt.Printf("RoomID(%s) is not valid: %v!\n", string(data), err)
		} else {
			mgr.NewRobots(uint64(roomid))
		}
		fmt.Println("*****************************")

	}
}

func ReadLine(reader *bufio.Reader, c chan string) {

}

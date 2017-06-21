package robots

import (
	"fmt"
	"runtime"
	"time"
)

type Msg struct {
	cmd      uint32
	dataLen  uint32
	data     []byte
	robotIdx int
}

type RobotInfo struct {
	addr    string
	fieldId string
	roomid  uint64
}

const (
	LUA_TICKER_INTERNAL   = time.Duration(time.Second) / 3
	AGENT_TICKER_INTERNAL = time.Duration(time.Second) * 3
	PACK_HEAD_LEN         = 8
	CMD_REGIST_MGR        = 1
	CMD_REGIST_MGR2       = 2
	CMD_ADD_ROBOT         = 3
	CMD_HEARTBEAT         = 5
	CMD_HEARTBEAT2        = 6
	MAX_ROBOT_NUM         = 1000
)

const (
	maxStack  = 20
	separator = "---------------------------------------\n"
)

type ReqNewRobot struct {
	FieldID string `json:"FieldID"`
}

func GetStackInfo() string {
	errstr := fmt.Sprintf("%straceback:\n", separator)

	i := 1
	for {
		pc, file, line, ok := runtime.Caller(i)

		errstr += fmt.Sprintf("    stack: %d %v [file: %s] [func: %s] [line: %d]\n", i, ok, file, runtime.FuncForPC(pc).Name(), line)

		i++
		if !ok || i > maxStack {
			break
		}
	}
	errstr += separator

	return errstr
}

package comm

import (
	"fmt"
	"os"
	"os/signal"
	"runtime"
	"syscall"
)

const (
	AES_KEY   = "7i5uMsCK8IUYcfWv"
	maxStack  = 20
	separator = "---------------------------------------\n"
)

func PanicHandle(needLog bool, args ...interface{}) {
	if len(args) > 0 {
		fmt.Printf(args[0].(string))
	}

	if err := recover(); err != nil {
		errstr := fmt.Sprintf("%sruntime error: %v\ntraceback:\n", separator, err)

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

		if needLog {
			fmt.Printf(errstr)
		}
	}
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

func HandleSignal(maskSigWithoutExit bool) {
	go func() {
		var (
			sig      os.Signal
			chSignal = make(chan os.Signal, 1)
		)

		handlemsg := func(sig string) {
			if maskSigWithoutExit {
				fmt.Printf("Handle Signal %s!\n", sig)
			} else {
				fmt.Printf("Exit By Signal %s!\n", sig)
				os.Exit(0)
			}
		}

		signal.Notify(chSignal, syscall.SIGHUP, syscall.SIGQUIT, syscall.SIGTERM, syscall.SIGINT, syscall.SIGABRT, syscall.SIGPIPE)

		for {
			sig = <-chSignal
			if sig == nil {
				return
			}

			switch sig {
			case syscall.SIGQUIT:
				handlemsg("SIGQUIT")

			case syscall.SIGTERM:
				handlemsg("SIGTERM")

			case syscall.SIGINT:
				handlemsg("SIGINT")

			case syscall.SIGHUP:
				handlemsg("SIGHUP")

			default:
			}
		}
	}()
}

/*
func Stop() {
	close(chSignal)
}*/

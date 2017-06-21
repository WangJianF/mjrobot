::start cmd /c lua filelist.lua win

::cd ./src

::go build -o mjrobot.exe main.go

::mjrobot.exe "127.0.0.1:8888" "127.0.0.1:9999" 

go run main.go "127.0.0.1:8888" "192.168.1.115:9999" "2" > RobotLog.md

pause
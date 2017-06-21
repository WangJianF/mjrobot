arg 0 C:\Users\scyl\AppData\Local\Temp\go-build205881306\command-line-arguments\_obj\exe\main.exe
arg 1 127.0.0.1:8888
arg 2 192.168.1.115:9999
arg 3 2
server addr:  127.0.0.1:8888 192.168.1.115:9999 2
lua init.
RobotMgr Start()
*****************************
Enter Room(input RoomID):
*****************************
*****************************
Enter Room(input RoomID):
--------- onNewRobot
[lua_print | Robot]	new robot idx: 	1	 id: 	114483b1-44e1-4065-98d8-6689add760b2	 roomid: 	228049
[lua_print | Robot]	robot(idx: 1, id: &{}, roomIdx: &{} ) request, cmd: TokenLogin-102, data: {"Token":"114483b1-44e1-4065-98d8-6689add760b2","Platform":"win","Thirdparty":1}.
[lua_print | RobotMgr]	newRobot	1	114483b1-44e1-4065-98d8-6689add760b2	228049
[Go_print  | RobotMgr] NewRobot(addr: 192.168.1.115:9999, idx: 1) success.
--------- onNewRobot
[lua_print | Robot]	new robot idx: 	2	 id: 	d10518fd-a79e-4b46-bf17-a1c7e9556729	 roomid: 	228049
[lua_print | Robot]	robot(idx: 2, id: &{}, roomIdx: &{} ) request, cmd: TokenLogin-102, data: {"Token":"d10518fd-a79e-4b46-bf17-a1c7e9556729","Platform":"win","Thirdparty":1}.
[lua_print | RobotMgr]	newRobot	2	d10518fd-a79e-4b46-bf17-a1c7e9556729	228049
[Go_print  | RobotMgr] NewRobot(addr: 192.168.1.115:9999, idx: 2) success.
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	TokenLogin	202	{"UserId":200014,"Name":"gust","Sex":1,"HeadUrl":"","RoomCardNum":30,"Token":"","RoomId":0,"Ip":"192.168.1.125","Now":1497527468,"RetCode":0}	1497527481
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	TokenLogin	202	{"UserId":200019,"Name":"gust","Sex":1,"HeadUrl":"","RoomCardNum":30,"Token":"","RoomId":0,"Ip":"192.168.1.125","Now":1497527468,"RetCode":0}	1497527481
[lua_print | Robot]	robot(idx: 1, id: 200014, roomIdx: &{} ) request, cmd: EnterRoom-106, data: {"RoomID":228049,"GPS":{"lon":0,"lat":0}}.
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	MailList	357	{"UnReadNum":0}	1497527482
[lua_print | Robot]	onMsg ----- no handler	357	{"UnReadNum":0}
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	Announcement	336	{"List":[{"Content":"987654","EndTime":1502050000}]}	1497527482
[lua_print | Robot]	onMsg ----- no handler	336	{"List":[{"Content":"987654","EndTime":1502050000}]}
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	MailList	357	{"UnReadNum":0}	1497527482
[lua_print | Robot]	onMsg ----- no handler	357	{"UnReadNum":0}
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	Announcement	336	{"List":[{"Content":"987654","EndTime":1502050000}]}	1497527482
[lua_print | Robot]	onMsg ----- no handler	336	{"List":[{"Content":"987654","EndTime":1502050000}]}
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	EnterRoom	206	{"RoomID":228049,"Owner":200026,"Zone":5,"State":"waiting","Voting":false,"GameCount":1,"TotalGameNum":10,"Zhuang":15,"ChargeWay":1,"SpecialWay":[],"CountRule":1,"TopLimit":0,"CountWay":0,"XJRemind":false,"Turn":-1,"Players":[{"UserId":200026,"Name":"gust","Score":0,"HeadUrl":"","Sex":1,"RoomIdx":0,"Ip":"192.168.1.125","Ready":false,"Disband":0,"OnLine":true,"GPS":{"lat":0,"lon":0}},{"UserId":200014,"Name":"gust","Score":0,"HeadUrl":"","Sex":1,"RoomIdx":1,"Ip":"192.168.1.125","Ready":false,"Disband":0,"OnLine":true,"GPS":{"lat":0,"lon":0}}],"OthersCardsInfo":null,"SelfCardInfo":null,"OutCardsInfo":null,"LieCardsInfo":null,"WallCardsNum":0,"LastCardInfo":{"UserId":0,"Card":0,"From":0,"Hide":false},"BaoInfo":null,"RetCode":0}	1497527482
[lua_print | Robot]	robot(idx: 1, id: 200014, roomIdx: 1 ) request, cmd: ReadyNext-133, data: .
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	EnterRoom	306	{"UserId":200014,"Name":"gust","Score":0,"HeadUrl":"","Sex":1,"RoomIdx":1,"Ip":"192.168.1.125","GPS":{"lat":0,"lon":0},"Ready":false}	1497527482
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	ReadyNext	333		1497527482
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	ReadyNext	233		1497527482
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	ReadyNext	333	{"UserId":200014}	1497527482
[lua_print | Robot]	robot(idx: 2, id: 200019, roomIdx: &{} ) request, cmd: EnterRoom-106, data: {"RoomID":228049,"GPS":{"lon":0,"lat":0}}.
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	EnterRoom	206	{"RoomID":228049,"Owner":200026,"Zone":5,"State":"waiting","Voting":false,"GameCount":1,"TotalGameNum":10,"Zhuang":15,"ChargeWay":1,"SpecialWay":[],"CountRule":1,"TopLimit":0,"CountWay":0,"XJRemind":false,"Turn":-1,"Players":[{"UserId":200026,"Name":"gust","Score":0,"HeadUrl":"","Sex":1,"RoomIdx":0,"Ip":"192.168.1.125","Ready":false,"Disband":0,"OnLine":true,"GPS":{"lat":0,"lon":0}},{"UserId":200014,"Name":"gust","Score":0,"HeadUrl":"","Sex":1,"RoomIdx":1,"Ip":"192.168.1.125","Ready":true,"Disband":0,"OnLine":true,"GPS":{"lat":0,"lon":0}},{"UserId":200019,"Name":"gust","Score":0,"HeadUrl":"","Sex":1,"RoomIdx":2,"Ip":"192.168.1.125","Ready":false,"Disband":0,"OnLine":true,"GPS":{"lat":0,"lon":0}}],"OthersCardsInfo":null,"SelfCardInfo":null,"OutCardsInfo":null,"LieCardsInfo":null,"WallCardsNum":0,"LastCardInfo":{"UserId":0,"Card":0,"From":0,"Hide":false},"BaoInfo":null,"RetCode":0}	1497527482
[lua_print | Robot]	robot(idx: 2, id: 200019, roomIdx: 2 ) request, cmd: ReadyNext-133, data: .
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	EnterRoom	306	{"UserId":200019,"Name":"gust","Score":0,"HeadUrl":"","Sex":1,"RoomIdx":2,"Ip":"192.168.1.125","GPS":{"lat":0,"lon":0},"Ready":false}	1497527482
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	EnterRoom	306	{"UserId":200019,"Name":"gust","Score":0,"HeadUrl":"","Sex":1,"RoomIdx":2,"Ip":"192.168.1.125","GPS":{"lat":0,"lon":0},"Ready":false}	1497527482
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	ReadyNext	333		1497527482
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	ReadyNext	233		1497527482
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	ReadyNext	333	{"UserId":200019}	1497527482
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	ReadyNext	333	{"UserId":200019}	1497527482
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	ReadyNext	333	{"UserId":200026}	1497527483
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	ReadyNext	333	{"UserId":200026}	1497527483
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	RoomCardChged	342	{"CurrRoomCardNum":30}	1497527483
[lua_print | Robot]	onMsg ----- no handler	342	{"CurrRoomCardNum":30}
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	GameStart	310	{"Zhuang":0,"SelfCardsInfo":[15,16,16,18,19,20,21,21,22,23,23,24,25,25,26,27,28,28,28,29],"LeftGameCount":9,"Quan":21}	1497527483
[lua_print | Robot]	robot(idx: 2, id: 200019, roomIdx: 2 ) request, cmd: Distribut21-159, data: .
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	RoomCardChged	342	{"CurrRoomCardNum":30}	1497527483
[lua_print | Robot]	onMsg ----- no handler	342	{"CurrRoomCardNum":30}
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	GameStart	310	{"Zhuang":0,"SelfCardsInfo":[10,10,12,13,13,15,16,17,18,20,20,21,21,22,22,24,26,26,27,29],"LeftGameCount":9,"Quan":21}	1497527483
[lua_print | Robot]	robot(idx: 1, id: 200014, roomIdx: 1 ) request, cmd: Distribut21-159, data: .
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	NewCard	326	{"UserId":200026,"InOrOut":true,"Card":0,"LeftCardsNum":19}	1497527489
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	NewCard	326	{"UserId":200026,"InOrOut":true,"Card":0,"LeftCardsNum":19}	1497527489
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	PlayHand	314	{"UserId":200026,"Card":0}	1497527489
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	PlayHand	314	{"UserId":200026,"Card":0}	1497527489
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	BroadPlayHand	315	{"UserId":200026,"Card":17}	1497527491
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	BroadPlayHand	315	{"UserId":200026,"Card":17}	1497527491
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	Ops	347	{"UserId":200014,"Ops":[2],"Card":17}	1497527491
[lua_print | Robot]	robot(idx: 1, id: 200014, roomIdx: 1 ) request, cmd: Pass-124, data: {"Card":17,"Object":2}.
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	NewCard	326	{"UserId":200014,"InOrOut":false,"Card":11,"LeftCardsNum":18}	1497527493
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	NewCard	326	{"UserId":200014,"InOrOut":false,"Card":11,"LeftCardsNum":18}	1497527493
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	ChiPai	246		1497527493
[lua_print | Robot]	onMsg ----- no handler	246	
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	ChiPai	246		1497527493
[lua_print | Robot]	onMsg ----- no handler	246	
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	Peng	318	{"UserId":200026,"Card":11}	1497527493
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	PlayHand	314	{"UserId":200026,"Card":0}	1497527493
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	Peng	318	{"UserId":200026,"Card":11}	1497527493
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	PlayHand	314	{"UserId":200026,"Card":0}	1497527493
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	BroadPlayHand	315	{"UserId":200026,"Card":28}	1497527496
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	BroadPlayHand	315	{"UserId":200026,"Card":28}	1497527496
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	ChiPai	246		1497527496
[lua_print | Robot]	onMsg ----- no handler	246	
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	ZhaoPai	345	{"UserId":200019,"Card":28}	1497527496
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	ZhaoPai	345	{"UserId":200019,"Card":28}	1497527496
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	PlayHand	314	{"UserId":200019,"Card":0}	1497527496
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	PlayHand	314	{"UserId":200019,"Card":0}	1497527497
[lua_print | Robot]	robot(idx: 2, id: 200019, roomIdx: 2 ) request, cmd: PlayHand-114, data: {"Card":15}.
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	PlayHand	214		1497527497
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	BroadPlayHand	315	{"UserId":200019,"Card":15}	1497527497
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	BroadPlayHand	315	{"UserId":200019,"Card":15}	1497527497
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	OffLine	331	{"UserId":200026}	1497527685
[lua_print | Robot]	onMsg ----- no handler	331	{"UserId":200026}
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	OffLine	331	{"UserId":200026}	1497527685
[lua_print | Robot]	onMsg ----- no handler	331	{"UserId":200026}
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	OnLine	332	{"UserId":200026}	1497527713
[lua_print | Robot]	onMsg ----- no handler	332	{"UserId":200026}
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	OnLine	332	{"UserId":200026}	1497527713
[lua_print | Robot]	onMsg ----- no handler	332	{"UserId":200026}
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	EnterRoom	306	{"UserId":200026,"Name":"gust","Score":0,"HeadUrl":"","Sex":1,"RoomIdx":0,"Ip":"192.168.1.125","GPS":{"lat":0,"lon":0},"Ready":true}	1497527713
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	EnterRoom	306	{"UserId":200026,"Name":"gust","Score":0,"HeadUrl":"","Sex":1,"RoomIdx":0,"Ip":"192.168.1.125","GPS":{"lat":0,"lon":0},"Ready":true}	1497527713
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	ChiPai	346	{"UserId":200026,"ChiCard":15,"Cards":[13,14,15,14,16,15]}	1497527736
[lua_print | Robot]	onMsg ----- no handler	346	{"UserId":200026,"ChiCard":15,"Cards":[13,14,15,14,16,15]}
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	PlayHand	314	{"UserId":200026,"Card":0}	1497527736
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	ChiPai	346	{"UserId":200026,"ChiCard":15,"Cards":[13,14,15,14,16,15]}	1497527736
[lua_print | Robot]	onMsg ----- no handler	346	{"UserId":200026,"ChiCard":15,"Cards":[13,14,15,14,16,15]}
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	PlayHand	314	{"UserId":200026,"Card":0}	1497527736
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	BroadPlayHand	315	{"UserId":200026,"Card":23}	1497527739
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	BroadPlayHand	315	{"UserId":200026,"Card":23}	1497527739
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	ChiPai	246		1497527739
[lua_print | Robot]	onMsg ----- no handler	246	
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	Peng	318	{"UserId":200019,"Card":23}	1497527739
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	Peng	318	{"UserId":200019,"Card":23}	1497527739
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	PlayHand	314	{"UserId":200019,"Card":0}	1497527739
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	PlayHand	314	{"UserId":200019,"Card":0}	1497527739
[lua_print | Robot]	robot(idx: 2, id: 200019, roomIdx: 2 ) request, cmd: PlayHand-114, data: {"Card":16}.
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	PlayHand	214		1497527739
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	BroadPlayHand	315	{"UserId":200019,"Card":16}	1497527739
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	BroadPlayHand	315	{"UserId":200019,"Card":16}	1497527739
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	NewCard	326	{"UserId":200026,"InOrOut":false,"Card":27,"LeftCardsNum":17}	1497527741
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	NewCard	326	{"UserId":200026,"InOrOut":false,"Card":27,"LeftCardsNum":17}	1497527741
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	Ops	347	{"UserId":200014,"Ops":[2],"Card":27}	1497527741
[lua_print | Robot]	robot(idx: 1, id: 200014, roomIdx: 1 ) request, cmd: Pass-124, data: {"Card":27,"Object":2}.
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	NewCard	326	{"UserId":200014,"InOrOut":false,"Card":12,"LeftCardsNum":16}	1497527742
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	NewCard	326	{"UserId":200014,"InOrOut":false,"Card":12,"LeftCardsNum":16}	1497527742
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	ChiPai	246		1497527742
[lua_print | Robot]	onMsg ----- no handler	246	
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	Peng	318	{"UserId":200026,"Card":12}	1497527743
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	PlayHand	314	{"UserId":200026,"Card":0}	1497527743
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	Peng	318	{"UserId":200026,"Card":12}	1497527743
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	PlayHand	314	{"UserId":200026,"Card":0}	1497527743
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	BroadPlayHand	315	{"UserId":200026,"Card":26}	1497527747
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	BroadPlayHand	315	{"UserId":200026,"Card":26}	1497527747
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	Peng	318	{"UserId":200014,"Card":26}	1497527747
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	Peng	318	{"UserId":200014,"Card":26}	1497527747
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	PlayHand	314	{"UserId":200014,"Card":0}	1497527747
[lua_print | Robot]	robot(idx: 1, id: 200014, roomIdx: 1 ) request, cmd: PlayHand-114, data: {"Card":10}.
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	PlayHand	314	{"UserId":200014,"Card":0}	1497527747
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	PlayHand	214		1497527747
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	BroadPlayHand	315	{"UserId":200014,"Card":10}	1497527747
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	BroadPlayHand	315	{"UserId":200014,"Card":10}	1497527747
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	Peng	318	{"UserId":200026,"Card":10}	1497527747
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	Peng	318	{"UserId":200026,"Card":10}	1497527747
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	PlayHand	314	{"UserId":200026,"Card":0}	1497527747
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	PlayHand	314	{"UserId":200026,"Card":0}	1497527747
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	BroadPlayHand	315	{"UserId":200026,"Card":20}	1497527753
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	BroadPlayHand	315	{"UserId":200026,"Card":20}	1497527753
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	Peng	318	{"UserId":200014,"Card":20}	1497527753
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	Peng	318	{"UserId":200014,"Card":20}	1497527753
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	PlayHand	314	{"UserId":200014,"Card":0}	1497527753
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	PlayHand	314	{"UserId":200014,"Card":0}	1497527753
[lua_print | Robot]	robot(idx: 1, id: 200014, roomIdx: 1 ) request, cmd: PlayHand-114, data: {"Card":10}.
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	PlayHand	214		1497527753
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	BroadPlayHand	315	{"UserId":200014,"Card":10}	1497527753
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	BroadPlayHand	315	{"UserId":200014,"Card":10}	1497527753
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	NewCard	326	{"UserId":200019,"InOrOut":false,"Card":14,"LeftCardsNum":15}	1497527755
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	NewCard	326	{"UserId":200019,"InOrOut":false,"Card":14,"LeftCardsNum":15}	1497527755
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	NewCard	326	{"UserId":200026,"InOrOut":false,"Card":11,"LeftCardsNum":14}	1497527761
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	NewCard	326	{"UserId":200026,"InOrOut":false,"Card":11,"LeftCardsNum":14}	1497527761
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	Ops	347	{"UserId":200014,"Ops":[2],"Card":11}	1497527761
[lua_print | Robot]	robot(idx: 1, id: 200014, roomIdx: 1 ) request, cmd: Pass-124, data: {"Card":11,"Object":2}.
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	NewCard	326	{"UserId":200014,"InOrOut":false,"Card":18,"LeftCardsNum":13}	1497527762
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	NewCard	326	{"UserId":200014,"InOrOut":false,"Card":18,"LeftCardsNum":13}	1497527762
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	Ops	347	{"UserId":200014,"Ops":[2],"Card":1}	1497527762
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	NewCard	326	{"UserId":200019,"InOrOut":false,"Card":23,"LeftCardsNum":12}	1497527764
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	NewCard	326	{"UserId":200019,"InOrOut":false,"Card":23,"LeftCardsNum":12}	1497527764
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	Ops	347	{"UserId":200019,"Ops":[2],"Card":23}	1497527764
[lua_print | Robot]	robot(idx: 2, id: 200019, roomIdx: 2 ) request, cmd: Pass-124, data: {"Card":23,"Object":2}.
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	NewCard	326	{"UserId":200026,"InOrOut":false,"Card":27,"LeftCardsNum":11}	1497527765
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	NewCard	326	{"UserId":200026,"InOrOut":false,"Card":27,"LeftCardsNum":11}	1497527765
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	Ops	347	{"UserId":200014,"Ops":[2],"Card":2}	1497527765
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	NewCard	326	{"UserId":200014,"InOrOut":false,"Card":17,"LeftCardsNum":10}	1497527767
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	NewCard	326	{"UserId":200014,"InOrOut":false,"Card":17,"LeftCardsNum":10}	1497527767
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	Ops	347	{"UserId":200014,"Ops":[2],"Card":2}	1497527767
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	Ops	347	{"UserId":200019,"Ops":[2],"Card":17}	1497527767
[lua_print | Robot]	robot(idx: 2, id: 200019, roomIdx: 2 ) request, cmd: Pass-124, data: {"Card":17,"Object":2}.
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	NewCard	326	{"UserId":200019,"InOrOut":false,"Card":19,"LeftCardsNum":9}	1497527768
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	NewCard	326	{"UserId":200019,"InOrOut":false,"Card":19,"LeftCardsNum":9}	1497527768
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	Ops	347	{"UserId":200019,"Ops":[2],"Card":19}	1497527768
[lua_print | Robot]	robot(idx: 2, id: 200019, roomIdx: 2 ) request, cmd: Pass-124, data: {"Object":2,"Card":19}.
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	NewCard	326	{"UserId":200026,"InOrOut":false,"Card":15,"LeftCardsNum":8}	1497527772
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	NewCard	326	{"UserId":200026,"InOrOut":false,"Card":15,"LeftCardsNum":8}	1497527772
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	Ops	347	{"UserId":200014,"Ops":[2],"Card":1}	1497527772
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	NewCard	326	{"UserId":200014,"InOrOut":false,"Card":19,"LeftCardsNum":7}	1497527773
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	NewCard	326	{"UserId":200014,"InOrOut":false,"Card":19,"LeftCardsNum":7}	1497527773
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	Ops	347	{"UserId":200019,"Ops":[2],"Card":2}	1497527773
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	Ops	347	{"UserId":200014,"Ops":[2],"Card":19}	1497527773
[lua_print | Robot]	robot(idx: 1, id: 200014, roomIdx: 1 ) request, cmd: Pass-124, data: {"Card":19,"Object":2}.
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	NewCard	326	{"UserId":200019,"InOrOut":false,"Card":18,"LeftCardsNum":6}	1497527775
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	NewCard	326	{"UserId":200019,"InOrOut":false,"Card":18,"LeftCardsNum":6}	1497527775
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	NewCard	326	{"UserId":200026,"InOrOut":false,"Card":25,"LeftCardsNum":5}	1497527776
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	NewCard	326	{"UserId":200026,"InOrOut":false,"Card":25,"LeftCardsNum":5}	1497527776
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	Peng	318	{"UserId":200019,"Card":25}	1497527777
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	PlayHand	314	{"UserId":200019,"Card":0}	1497527777
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	Peng	318	{"UserId":200019,"Card":25}	1497527777
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	PlayHand	314	{"UserId":200019,"Card":0}	1497527777
[lua_print | Robot]	robot(idx: 2, id: 200019, roomIdx: 2 ) request, cmd: PlayHand-114, data: {"Card":16}.
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	PlayHand	214		1497527777
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	BroadPlayHand	315	{"UserId":200019,"Card":16}	1497527777
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	BroadPlayHand	315	{"UserId":200019,"Card":16}	1497527777
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	NewCard	326	{"UserId":200026,"InOrOut":false,"Card":14,"LeftCardsNum":4}	1497527778
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	NewCard	326	{"UserId":200026,"InOrOut":false,"Card":14,"LeftCardsNum":4}	1497527778
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	Ops	347	{"UserId":200014,"Ops":[2],"Card":14}	1497527778
[lua_print | Robot]	robot(idx: 1, id: 200014, roomIdx: 1 ) request, cmd: Pass-124, data: {"Object":2,"Card":14}.
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	NewCard	326	{"UserId":200014,"InOrOut":false,"Card":22,"LeftCardsNum":3}	1497527780
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	NewCard	326	{"UserId":200014,"InOrOut":false,"Card":22,"LeftCardsNum":3}	1497527780
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	Ops	347	{"UserId":200019,"Ops":[2],"Card":1}	1497527780
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	Peng	318	{"UserId":200014,"Card":22}	1497527780
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	Peng	318	{"UserId":200014,"Card":22}	1497527780
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	PlayHand	314	{"UserId":200014,"Card":0}	1497527780
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	PlayHand	314	{"UserId":200014,"Card":0}	1497527780
[lua_print | Robot]	robot(idx: 1, id: 200014, roomIdx: 1 ) request, cmd: PlayHand-114, data: {"Card":12}.
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	PlayHand	214		1497527780
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	BroadPlayHand	315	{"UserId":200014,"Card":12}	1497527780
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	BroadPlayHand	315	{"UserId":200014,"Card":12}	1497527780
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	NewCard	326	{"UserId":200019,"InOrOut":false,"Card":17,"LeftCardsNum":2}	1497527782
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	NewCard	326	{"UserId":200019,"InOrOut":false,"Card":17,"LeftCardsNum":2}	1497527782
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	Ops	347	{"UserId":200019,"Ops":[2],"Card":2}	1497527782
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	NewCard	326	{"UserId":200026,"InOrOut":false,"Card":13,"LeftCardsNum":1}	1497527783
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	NewCard	326	{"UserId":200026,"InOrOut":false,"Card":13,"LeftCardsNum":1}	1497527783
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	Peng	318	{"UserId":200014,"Card":13}	1497527784
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	Peng	318	{"UserId":200014,"Card":13}	1497527784
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	PlayHand	314	{"UserId":200014,"Card":0}	1497527784
[lua_print | Robot]	robot(idx: 1, id: 200014, roomIdx: 1 ) request, cmd: PlayHand-114, data: {"Card":15}.
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	PlayHand	314	{"UserId":200014,"Card":0}	1497527784
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	PlayHand	214		1497527784
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	BroadPlayHand	315	{"UserId":200014,"Card":15}	1497527784
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	BroadPlayHand	315	{"UserId":200014,"Card":15}	1497527784
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	NewCard	326	{"UserId":200019,"InOrOut":false,"Card":25,"LeftCardsNum":0}	1497527785
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	NewCard	326	{"UserId":200019,"InOrOut":false,"Card":25,"LeftCardsNum":0}	1497527785
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	Ops	347	{"UserId":200019,"Ops":[2],"Card":25}	1497527785
[lua_print | Robot]	robot(idx: 2, id: 200019, roomIdx: 2 ) request, cmd: Pass-124, data: {"Card":25,"Object":2}.
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	HuPai	322	{"UserId":0,"HType":[]}	1497527785
[lua_print | Robot]	onMsg ----- no handler	322	{"UserId":0,"HType":[]}
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	HuPai	322	{"UserId":0,"HType":[]}	1497527785
[lua_print | Robot]	onMsg ----- no handler	322	{"UserId":0,"HType":[]}
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	AccountOne	328	{"Player":[{"UserId":200026,"HuType":[],"LieCards":{"LongCards":[],"ZhaoCards":[],"ChiPai":[{"ChiPai":15,"Cards":[13,14,15,14,15,16]}],"PengPai":[11,12,10,24]},"InCards":[19,29,29],"Score":0,"Fan":0,"HuShu":0,"HuCard":0,"GuiNum":0,"Rain":0},{"UserId":200014,"HuType":[],"LieCards":{"LongCards":[],"ZhaoCards":[],"ChiPai":[],"PengPai":[26,20,22,13]},"InCards":[16,17,18,21,21,24,27,29],"Score":0,"Fan":0,"HuShu":0,"HuCard":0,"GuiNum":0,"Rain":0},{"UserId":200019,"HuType":[],"LieCards":{"LongCards":[],"ZhaoCards":[28],"ChiPai":[],"PengPai":[23,25]},"InCards":[18,19,20,21,21,22,24,26,27,29],"Score":0,"Fan":0,"HuShu":0,"HuCard":0,"GuiNum":0,"Rain":0}],"LeftCards":[],"Zhuang":0,"DianPao":0}	1497527785
onAccountOne:
[lua_print | Robot]	robot(idx: 2, id: 200019, roomIdx: 2 ) request, cmd: ReadyNext-133, data: .
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	AccountOne	328	{"Player":[{"UserId":200026,"HuType":[],"LieCards":{"LongCards":[],"ZhaoCards":[],"ChiPai":[{"ChiPai":15,"Cards":[13,14,15,14,15,16]}],"PengPai":[11,12,10,24]},"InCards":[19,29,29],"Score":0,"Fan":0,"HuShu":0,"HuCard":0,"GuiNum":0,"Rain":0},{"UserId":200014,"HuType":[],"LieCards":{"LongCards":[],"ZhaoCards":[],"ChiPai":[],"PengPai":[26,20,22,13]},"InCards":[16,17,18,21,21,24,27,29],"Score":0,"Fan":0,"HuShu":0,"HuCard":0,"GuiNum":0,"Rain":0},{"UserId":200019,"HuType":[],"LieCards":{"LongCards":[],"ZhaoCards":[28],"ChiPai":[],"PengPai":[23,25]},"InCards":[18,19,20,21,21,22,24,26,27,29],"Score":0,"Fan":0,"HuShu":0,"HuCard":0,"GuiNum":0,"Rain":0}],"LeftCards":[],"Zhuang":0,"DianPao":0}	1497527785
onAccountOne:
[lua_print | Robot]	robot(idx: 1, id: 200014, roomIdx: 1 ) request, cmd: ReadyNext-133, data: .
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	ReadyNext	233		1497527785
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	ReadyNext	333	{"UserId":200019}	1497527785
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	ReadyNext	333		1497527785
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	ReadyNext	233		1497527785
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	ReadyNext	333	{"UserId":200014}	1497527785
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	ReadyNext	333	{"UserId":200019}	1497527785
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	ReadyNext	333	{"UserId":200014}	1497527785
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	ReadyNext	333	{"UserId":200026}	1497527791
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	GameStart	310	{"Zhuang":0,"SelfCardsInfo":[11,12,13,14,15,17,18,19,20,22,23,23,24,25,25,26,27,28,28,28],"LeftGameCount":8,"Quan":21}	1497527791
[lua_print | Robot]	robot(idx: 1, id: 200014, roomIdx: 1 ) request, cmd: Distribut21-159, data: .
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	ReadyNext	333	{"UserId":200026}	1497527791
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	GameStart	310	{"Zhuang":0,"SelfCardsInfo":[12,15,15,15,16,16,17,17,17,18,19,20,21,21,22,26,27,28,29,29],"LeftGameCount":8,"Quan":21}	1497527791
[lua_print | Robot]	robot(idx: 2, id: 200019, roomIdx: 2 ) request, cmd: Distribut21-159, data: .
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	NewCard	326	{"UserId":200026,"InOrOut":true,"Card":0,"LeftCardsNum":19}	1497527797
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	PlayHand	314	{"UserId":200026,"Card":0}	1497527797
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	NewCard	326	{"UserId":200026,"InOrOut":true,"Card":0,"LeftCardsNum":19}	1497527797
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	PlayHand	314	{"UserId":200026,"Card":0}	1497527797
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	BroadPlayHand	315	{"UserId":200026,"Card":27}	1497527810
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	BroadPlayHand	315	{"UserId":200026,"Card":27}	1497527810
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	Ops	347	{"UserId":200014,"Ops":[2],"Card":27}	1497527810
[lua_print | Robot]	robot(idx: 1, id: 200014, roomIdx: 1 ) request, cmd: Pass-124, data: {"Card":27,"Object":2}.
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	NewCard	326	{"UserId":200014,"InOrOut":false,"Card":29,"LeftCardsNum":18}	1497527812
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	NewCard	326	{"UserId":200014,"InOrOut":false,"Card":29,"LeftCardsNum":18}	1497527812
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	Peng	318	{"UserId":200019,"Card":29}	1497527812
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	Peng	318	{"UserId":200019,"Card":29}	1497527812
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	PlayHand	314	{"UserId":200019,"Card":0}	1497527812
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	PlayHand	314	{"UserId":200019,"Card":0}	1497527812
[lua_print | Robot]	robot(idx: 2, id: 200019, roomIdx: 2 ) request, cmd: PlayHand-114, data: {"Card":12}.
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	PlayHand	214		1497527812
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	BroadPlayHand	315	{"UserId":200019,"Card":12}	1497527812
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	BroadPlayHand	315	{"UserId":200019,"Card":12}	1497527812
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	ChiPai	346	{"UserId":200026,"ChiCard":12,"Cards":[10,11,12]}	1497527818
[lua_print | Robot]	onMsg ----- no handler	346	{"UserId":200026,"ChiCard":12,"Cards":[10,11,12]}
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	ChiPai	346	{"UserId":200026,"ChiCard":12,"Cards":[10,11,12]}	1497527818
[lua_print | Robot]	onMsg ----- no handler	346	{"UserId":200026,"ChiCard":12,"Cards":[10,11,12]}
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	PlayHand	314	{"UserId":200026,"Card":0}	1497527818
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	PlayHand	314	{"UserId":200026,"Card":0}	1497527818
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	BroadPlayHand	315	{"UserId":200026,"Card":25}	1497527823
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	BroadPlayHand	315	{"UserId":200026,"Card":25}	1497527823
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	Peng	318	{"UserId":200014,"Card":25}	1497527824
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	Peng	318	{"UserId":200014,"Card":25}	1497527824
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	PlayHand	314	{"UserId":200014,"Card":0}	1497527824
[lua_print | Robot]	robot(idx: 1, id: 200014, roomIdx: 1 ) request, cmd: PlayHand-114, data: {"Card":11}.
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	PlayHand	314	{"UserId":200014,"Card":0}	1497527824
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	PlayHand	214		1497527824
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	BroadPlayHand	315	{"UserId":200014,"Card":11}	1497527824
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	BroadPlayHand	315	{"UserId":200014,"Card":11}	1497527824
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	Ops	347	{"UserId":200019,"Ops":[2],"Card":11}	1497527824
[lua_print | Robot]	robot(idx: 2, id: 200019, roomIdx: 2 ) request, cmd: Pass-124, data: {"Card":11,"Object":2}.
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	NewCard	326	{"UserId":200019,"InOrOut":false,"Card":19,"LeftCardsNum":17}	1497527825
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	NewCard	326	{"UserId":200019,"InOrOut":false,"Card":19,"LeftCardsNum":17}	1497527825
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	NewCard	326	{"UserId":200026,"InOrOut":false,"Card":20,"LeftCardsNum":16}	1497527827
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	NewCard	326	{"UserId":200026,"InOrOut":false,"Card":20,"LeftCardsNum":16}	1497527827
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	NewCard	326	{"UserId":200014,"InOrOut":false,"Card":12,"LeftCardsNum":15}	1497527832
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	NewCard	326	{"UserId":200014,"InOrOut":false,"Card":12,"LeftCardsNum":15}	1497527832
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	Ops	347	{"UserId":200014,"Ops":[2],"Card":12}	1497527832
[lua_print | Robot]	robot(idx: 1, id: 200014, roomIdx: 1 ) request, cmd: Pass-124, data: {"Card":12,"Object":2}.
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	NewCard	326	{"UserId":200019,"InOrOut":false,"Card":11,"LeftCardsNum":14}	1497527833
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	NewCard	326	{"UserId":200019,"InOrOut":false,"Card":11,"LeftCardsNum":14}	1497527833
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	Ops	347	{"UserId":200019,"Ops":[2],"Card":2}	1497527833
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	NewCard	326	{"UserId":200026,"InOrOut":false,"Card":14,"LeftCardsNum":13}	1497527840
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	NewCard	326	{"UserId":200026,"InOrOut":false,"Card":14,"LeftCardsNum":13}	1497527840
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	Ops	347	{"UserId":200014,"Ops":[2],"Card":14}	1497527840
[lua_print | Robot]	robot(idx: 1, id: 200014, roomIdx: 1 ) request, cmd: Pass-124, data: {"Card":14,"Object":2}.
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	NewCard	326	{"UserId":200014,"InOrOut":false,"Card":10,"LeftCardsNum":12}	1497527847
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	NewCard	326	{"UserId":200014,"InOrOut":false,"Card":10,"LeftCardsNum":12}	1497527847
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	NewCard	326	{"UserId":200019,"InOrOut":false,"Card":26,"LeftCardsNum":11}	1497527849
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	NewCard	326	{"UserId":200019,"InOrOut":false,"Card":26,"LeftCardsNum":11}	1497527849
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	Ops	347	{"UserId":200019,"Ops":[2],"Card":26}	1497527849
[lua_print | Robot]	robot(idx: 2, id: 200019, roomIdx: 2 ) request, cmd: Pass-124, data: {"Card":26,"Object":2}.
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	NewCard	326	{"UserId":200026,"InOrOut":false,"Card":14,"LeftCardsNum":10}	1497527853
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	NewCard	326	{"UserId":200026,"InOrOut":false,"Card":14,"LeftCardsNum":10}	1497527853
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	Ops	347	{"UserId":200014,"Ops":[2],"Card":2}	1497527853
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	NewCard	326	{"UserId":200014,"InOrOut":false,"Card":12,"LeftCardsNum":9}	1497527854
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	NewCard	326	{"UserId":200014,"InOrOut":false,"Card":12,"LeftCardsNum":9}	1497527854
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	Ops	347	{"UserId":200014,"Ops":[2],"Card":2}	1497527854
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	NewCard	326	{"UserId":200019,"InOrOut":false,"Card":22,"LeftCardsNum":8}	1497527856
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	NewCard	326	{"UserId":200019,"InOrOut":false,"Card":22,"LeftCardsNum":8}	1497527856
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	Ops	347	{"UserId":200019,"Ops":[2],"Card":1}	1497527856
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	NewCard	326	{"UserId":200026,"InOrOut":false,"Card":29,"LeftCardsNum":7}	1497527872
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	NewCard	326	{"UserId":200026,"InOrOut":false,"Card":29,"LeftCardsNum":7}	1497527872
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	ChiPai	346	{"UserId":200026,"ChiCard":29,"Cards":[21,26,29]}	1497527875
[lua_print | Robot]	onMsg ----- no handler	346	{"UserId":200026,"ChiCard":29,"Cards":[21,26,29]}
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	PlayHand	314	{"UserId":200026,"Card":0}	1497527875
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	ChiPai	346	{"UserId":200026,"ChiCard":29,"Cards":[21,26,29]}	1497527875
[lua_print | Robot]	onMsg ----- no handler	346	{"UserId":200026,"ChiCard":29,"Cards":[21,26,29]}
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	PlayHand	314	{"UserId":200026,"Card":0}	1497527875
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	BroadPlayHand	315	{"UserId":200026,"Card":13}	1497527886
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	BroadPlayHand	315	{"UserId":200026,"Card":13}	1497527886
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	Ops	347	{"UserId":200014,"Ops":[2],"Card":13}	1497527886
[lua_print | Robot]	robot(idx: 1, id: 200014, roomIdx: 1 ) request, cmd: Pass-124, data: {"Card":13,"Object":2}.
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	NewCard	326	{"UserId":200014,"InOrOut":false,"Card":13,"LeftCardsNum":6}	1497527888
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	NewCard	326	{"UserId":200014,"InOrOut":false,"Card":13,"LeftCardsNum":6}	1497527888
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	Ops	347	{"UserId":200014,"Ops":[2],"Card":2}	1497527888
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	NewCard	326	{"UserId":200019,"InOrOut":false,"Card":23,"LeftCardsNum":5}	1497527889
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	NewCard	326	{"UserId":200019,"InOrOut":false,"Card":23,"LeftCardsNum":5}	1497527889
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	ChiPai	246		1497527889
[lua_print | Robot]	onMsg ----- no handler	246	
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	Peng	318	{"UserId":200014,"Card":23}	1497527890
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	Peng	318	{"UserId":200014,"Card":23}	1497527890
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	PlayHand	314	{"UserId":200014,"Card":0}	1497527890
[lua_print | Robot]	robot(idx: 1, id: 200014, roomIdx: 1 ) request, cmd: PlayHand-114, data: {"Card":12}.
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	PlayHand	314	{"UserId":200014,"Card":0}	1497527890
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	BroadPlayHand	315	{"UserId":200014,"Card":12}	1497527890
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	PlayHand	214		1497527890
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	BroadPlayHand	315	{"UserId":200014,"Card":12}	1497527890
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	NewCard	326	{"UserId":200019,"InOrOut":false,"Card":27,"LeftCardsNum":4}	1497527891
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	NewCard	326	{"UserId":200019,"InOrOut":false,"Card":27,"LeftCardsNum":4}	1497527891
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	Ops	347	{"UserId":200019,"Ops":[2],"Card":1}	1497527891
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	NewCard	326	{"UserId":200026,"InOrOut":false,"Card":24,"LeftCardsNum":3}	1497527893
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	NewCard	326	{"UserId":200026,"InOrOut":false,"Card":24,"LeftCardsNum":3}	1497527893
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	ChiPai	246		1497527893
[lua_print | Robot]	onMsg ----- no handler	246	
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	Peng	318	{"UserId":200026,"Card":24}	1497527893
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	PlayHand	314	{"UserId":200026,"Card":0}	1497527893
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	Peng	318	{"UserId":200026,"Card":24}	1497527893
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	PlayHand	314	{"UserId":200026,"Card":0}	1497527893
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	BroadPlayHand	315	{"UserId":200026,"Card":14}	1497527897
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	BroadPlayHand	315	{"UserId":200026,"Card":14}	1497527897
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	Ops	347	{"UserId":200014,"Ops":[2],"Card":2}	1497527897
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	NewCard	326	{"UserId":200014,"InOrOut":false,"Card":25,"LeftCardsNum":2}	1497527899
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	NewCard	326	{"UserId":200014,"InOrOut":false,"Card":25,"LeftCardsNum":2}	1497527899
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	Ops	347	{"UserId":200019,"Ops":[2],"Card":25}	1497527899
[lua_print | Robot]	robot(idx: 2, id: 200019, roomIdx: 2 ) request, cmd: Pass-124, data: {"Object":2,"Card":25}.
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	Ops	347	{"UserId":200014,"Ops":[2],"Card":25}	1497527899
[lua_print | Robot]	robot(idx: 1, id: 200014, roomIdx: 1 ) request, cmd: Pass-124, data: {"Card":25,"Object":2}.
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	NewCard	326	{"UserId":200019,"InOrOut":false,"Card":10,"LeftCardsNum":1}	1497527900
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	NewCard	326	{"UserId":200019,"InOrOut":false,"Card":10,"LeftCardsNum":1}	1497527900
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	NewCard	326	{"UserId":200026,"InOrOut":false,"Card":13,"LeftCardsNum":0}	1497527904
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	NewCard	326	{"UserId":200026,"InOrOut":false,"Card":13,"LeftCardsNum":0}	1497527904
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	Ops	347	{"UserId":200014,"Ops":[2],"Card":1}	1497527904
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	HuPai	322	{"UserId":0,"HType":[]}	1497527904
[lua_print | Robot]	onMsg ----- no handler	322	{"UserId":0,"HType":[]}
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	HuPai	322	{"UserId":0,"HType":[]}	1497527904
[lua_print | Robot]	onMsg ----- no handler	322	{"UserId":0,"HType":[]}
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	AccountOne	328	{"Player":[{"UserId":200026,"HuType":[],"LieCards":{"LongCards":[],"ZhaoCards":[],"ChiPai":[{"ChiPai":12,"Cards":[10,11,12]},{"ChiPai":29,"Cards":[21,26,29]}],"PengPai":[24]},"InCards":[10,11,16,16,18,18,19,20,21,22,23],"Score":0,"Fan":0,"HuShu":0,"HuCard":0,"GuiNum":0,"Rain":0},{"UserId":200014,"HuType":[],"LieCards":{"LongCards":[],"ZhaoCards":[],"ChiPai":[],"PengPai":[25,23]},"InCards":[13,14,15,17,18,19,20,22,24,26,27,28,28,28],"Score":0,"Fan":0,"HuShu":0,"HuCard":0,"GuiNum":0,"Rain":0},{"UserId":200019,"HuType":[],"LieCards":{"LongCards":[],"ZhaoCards":[],"ChiPai":[],"PengPai":[29]},"InCards":[15,15,15,16,16,17,17,17,18,19,20,21,21,22,26,27,28],"Score":0,"Fan":0,"HuShu":0,"HuCard":0,"GuiNum":0,"Rain":0}],"LeftCards":[],"Zhuang":0,"DianPao":0}	1497527904
onAccountOne:
[lua_print | Robot]	robot(idx: 2, id: 200019, roomIdx: 2 ) request, cmd: ReadyNext-133, data: .
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	AccountOne	328	{"Player":[{"UserId":200026,"HuType":[],"LieCards":{"LongCards":[],"ZhaoCards":[],"ChiPai":[{"ChiPai":12,"Cards":[10,11,12]},{"ChiPai":29,"Cards":[21,26,29]}],"PengPai":[24]},"InCards":[10,11,16,16,18,18,19,20,21,22,23],"Score":0,"Fan":0,"HuShu":0,"HuCard":0,"GuiNum":0,"Rain":0},{"UserId":200014,"HuType":[],"LieCards":{"LongCards":[],"ZhaoCards":[],"ChiPai":[],"PengPai":[25,23]},"InCards":[13,14,15,17,18,19,20,22,24,26,27,28,28,28],"Score":0,"Fan":0,"HuShu":0,"HuCard":0,"GuiNum":0,"Rain":0},{"UserId":200019,"HuType":[],"LieCards":{"LongCards":[],"ZhaoCards":[],"ChiPai":[],"PengPai":[29]},"InCards":[15,15,15,16,16,17,17,17,18,19,20,21,21,22,26,27,28],"Score":0,"Fan":0,"HuShu":0,"HuCard":0,"GuiNum":0,"Rain":0}],"LeftCards":[],"Zhuang":0,"DianPao":0}	1497527904
onAccountOne:
[lua_print | Robot]	robot(idx: 1, id: 200014, roomIdx: 1 ) request, cmd: ReadyNext-133, data: .
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	ReadyNext	233		1497527904
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	ReadyNext	333	{"UserId":200019}	1497527904
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	ReadyNext	333	{"UserId":200019}	1497527904
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	ReadyNext	333	{"UserId":200014}	1497527904
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	ReadyNext	333		1497527904
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	ReadyNext	233		1497527904
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	ReadyNext	333	{"UserId":200014}	1497527904
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	ReadyNext	333	{"UserId":200026}	1497527909
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	GameStart	310	{"Zhuang":0,"SelfCardsInfo":[10,11,11,12,12,13,14,14,16,19,19,20,21,21,22,25,25,27,27,28],"LeftGameCount":7,"Quan":21}	1497527909
[lua_print | Robot]	robot(idx: 1, id: 200014, roomIdx: 1 ) request, cmd: Distribut21-159, data: .
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	ReadyNext	333	{"UserId":200026}	1497527909
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	GameStart	310	{"Zhuang":0,"SelfCardsInfo":[10,11,14,14,15,15,16,16,17,19,20,20,22,23,23,25,26,26,27,29],"LeftGameCount":7,"Quan":21}	1497527909
[lua_print | Robot]	robot(idx: 2, id: 200019, roomIdx: 2 ) request, cmd: Distribut21-159, data: .
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	DisbandRoomVote	340	{"VoteInfo":{"200014":0,"200019":0,"200026":1},"BeginTime":1497527898,"EndTime":1497527958}	1497527912
[lua_print | Robot]	robot(idx: 1, id: 200014, roomIdx: 1 ) request, cmd: DisbandRoomVote-140, data: {"OP":2}.
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	DisbandRoomVote	340	{"VoteInfo":{"200014":0,"200019":0,"200026":1},"BeginTime":1497527898,"EndTime":1497527958}	1497527912
[lua_print | Robot]	robot(idx: 2, id: 200019, roomIdx: 2 ) request, cmd: DisbandRoomVote-140, data: {"OP":2}.
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	DisbandRoomVote	340	{"VoteInfo":{"200014":2,"200019":0,"200026":1},"BeginTime":1497527898,"EndTime":1497527958}	1497527912
[lua_print | Robot]	robot(idx: 2, id: 200019, roomIdx: 2 ) request, cmd: DisbandRoomVote-140, data: {"OP":2}.
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	DisbandRoomVote	340	{"VoteInfo":{"200014":2,"200019":0,"200026":1},"BeginTime":1497527898,"EndTime":1497527958}	1497527912
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	DisbandRoomVote	240		1497527912
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	DisbandRoomVote	340	{"VoteInfo":{"200014":2,"200019":2,"200026":1},"BeginTime":1497527898,"EndTime":1497527958}	1497527912
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	DisbandRoomVote	340	{"VoteInfo":{"200014":2,"200019":2,"200026":1},"BeginTime":1497527898,"EndTime":1497527958}	1497527912
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	AccountAll	329	{"Accounts":{"200014":0,"200019":0,"200026":0},"RoomCards":{"200014":30,"200019":30,"200026":30}}	1497527912
onAccountAll:
[lua_print | Robot]	exit()
pushed robot(idx: 1)'s exit msg into msg handler!
[lua_print | RobotMgr]	RobotMgr.msgHandler	1	DisbandRoomResult	308	{"Disbanded":true}	1497527912
[lua_print | Robot]	onMsg ----- no handler	308	{"Disbanded":true}
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	DisbandRoomVote	240		1497527912
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	AccountAll	329	{"Accounts":{"200014":0,"200019":0,"200026":0},"RoomCards":{"200014":30,"200019":30,"200026":30}}	1497527912
onAccountAll:
[lua_print | Robot]	exit()
pushed robot(idx: 2)'s exit msg into msg handler!
[lua_print | RobotMgr]	RobotMgr.msgHandler	2	DisbandRoomResult	308	{"Disbanded":true}	1497527912
[lua_print | Robot]	onMsg ----- no handler	308	{"Disbanded":true}
[lua_print | RobotMgr]	deleRobot	1
[lua_print | Robot]	robot(idx: 1, PlayerId: nil) clear.
robot(idx: 1) stop()
[lua_print | RobotMgr]	deleRobot	2
[lua_print | Robot]	robot(idx: 2, PlayerId: nil) clear.
robot(idx: 2) stop()
[lua_print | RobotMgr]	deleRobot	1
[lua_print | RobotMgr]	deleRobot	2
robot(idx: 1) read data failed when read head: read tcp 192.168.1.125:55804->192.168.1.115:9999: use of closed network connection
robot(idx: 1) stop()
robot(idx: 2) read data failed when read head: read tcp 192.168.1.125:55805->192.168.1.115:9999: use of closed network connection
robot(idx: 2) stop()

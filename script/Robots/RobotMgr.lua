local Robot = require("script.Robots.Robot")
local MessageCfg   = require("script.conf.MessageCfg")

RobotMgr = class("RobotMgr", sington)

local IdxTokenMap = {
	-- "7a23a4d1-d8da-4d9f-b07d-9916986c01f4",
	-- "4d2d1d9d-2cae-4060-9f51-75b8db3719c9",
	-- "c21dc856-807c-4076-a7e7-15becc7aee55",
	-- "f1aa445c-7460-4732-bd5e-8ee3f716de77",
	-- "cf8626de-f8d9-46ec-876d-550ad0b9532c",
	"114483b1-44e1-4065-98d8-6689add760b2",
	-- "83ee505d-c4fe-4da7-a65e-3db9c3475e62",
	"d10518fd-a79e-4b46-bf17-a1c7e9556729",
	-- "d10518fd-a79e-4b46-bf17-a1c7e9556729",
}

function RobotMgr:ctor()
	self.robots = {}
	self.robotsIdxIdMap = {}
	registMsgHandler(handler(RobotMgr, self.msgHandler))
end

function RobotMgr:newRobot(idx, roomid)
	if self.robotsIdxIdMap[idx] then
		assert(false, string.format("robot %d has exist!", idx))
	end
	-- local id = "robot_" .. os.time() .. "_" .. idx --math.random(1, G_MAX_ROBOT_NUM)
	-- local id = 10003
	-- if idx == 2 then
	-- 	id = 10007
	-- end
	local id = IdxTokenMap[idx]
	if not self.robots[id] then
		self.robots[id] = Robot.new(idx, id, roomid)
		self.robotsIdxIdMap[idx] = id
		
		log("RobotMgr", "newRobot", idx, id, roomid)
	end
end

function RobotMgr:getRobotByID(id)
	return self.robots[id] 
end

function RobotMgr:deleRobot(idx)
	local id = self.robotsIdxIdMap[idx]
	log("RobotMgr", "deleRobot", idx)
	if id then
		if self.robots[id] then
			self.robots[id]:clear()
		end
		self.robots[id] = nil
	end
	self.robotsIdxIdMap[idx] = nil
end

function RobotMgr:msgHandler(idx, cmd, str)
	local id = self.robotsIdxIdMap[idx]
	if id then
		if self.robots[id] then
			local cmdName = self:getCmdName(cmd)
			if cmdName ~= "Heartbeat" then
				log("RobotMgr", "RobotMgr.msgHandler", idx, cmdName, cmd, str, os.time())
			end
			self.robots[id]:onMsg(cmd, str)
		else
			log("RobotMgr", "RobotMgr.msgHandler 222 couldn't find robot: ", idx, id)
		end
	else
		log("RobotMgr", "RobotMgr.msgHandler 333 couldn't find robot: ", id)
	end
end

function RobotMgr:getCmdName(cmd)
	for k, v in pairs(MessageCfg) do
		if v.rsp == cmd or v.notify == cmd then
			return k
		end
	end
end

return RobotMgr
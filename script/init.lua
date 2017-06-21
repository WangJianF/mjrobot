--[[
local require_ = require
require = function(file)
	return require_("./script/" .. file) or require_(file)
end
--]]


require("script.framework.json")
--md5 = require("script.framework.md5")
--mp = require("script.framework.MessagePack")

require("script.framework.log")
require("script.framework.net")
require("script.framework.timer")
require("script.framework.functions")
require("script.framework.eventCenter")

utf8 = require("script.framework.utf8")

require("script.Robots.RobotMgr")
require("script.config")

collectgarbage("setpause", G_COLLECT_PAUSE) 
collectgarbage("setstepmul", G_COLLECT_INTERNAL)

gRobotMgr = RobotMgr.new()
-- for i = 1, 4 do
-- 	gRobotMgr:newRobot(i, 0)
-- end

math.randomseed(os.time())

print("lua init.")

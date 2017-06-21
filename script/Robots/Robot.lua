local Card         = require("script.Robots.Card")
local CardPrompter = require("script.Robots.CardPrompter")
local MessageCfg   = require("script.conf.MessageCfg")

local EnterRoomDelay = 0

local Robot = class("Robot", sington)

function Robot:ctor(idx, id, roomid)
    log("Robot", "new robot idx: ", idx, " id: ", id, " roomid: ", roomid)
    self.idx = idx
    self.roomid = roomid
    self.id = id
    self.uuidfix = idx * 10
    self.msgHandlers = {}
    self.info = {}

    self:login()
    self:startHeartbeat()
    self:initGameData()
    self:initGameListeners()
    self.taskCount = 0
end

function Robot:initGameData()
    self.timeLimit = 0
    self.playerId = 0
    self.mainCard = 0
    self.cards = nil
    self.opId = 0
    self.lastHand = nil
    self.promptIdx = 1
end

function Robot:startHeartbeat()
    schedule("robot_heartbeat_" .. self.idx, G_HEARTBEAT_TIME-2, G_HEARTBEAT_TIME, function()
        self:request("Heartbeat", "", handler(self, self.onHeartbeat))
    end)
end

function Robot:onHeartbeat(cmd, str)
    self.count = self.count or 1
    self.count = self.count + 1
end

function Robot:clear()
    log("Robot", string.format("robot(idx: %d, PlayerId: %s) clear.", self.idx, self.info.PlayerId))
    unschedule("robot_heartbeat_" .. self.idx)
    for i=1, self.taskCount do
        unschedule(self.id .. "delaytask" .. i)
    end
    self:clearGameListeners()
end

function Robot:exit()
    log("Robot", "exit()")
    robotExit(G_ROBOT_MGR_IDX, self.idx)
end

function Robot:request(cmd, str, cb)
    if not MessageCfg[cmd] then
        log("Robot", "request error: couldn't find cmd: " .. cmd)
        return
    end
    if not MessageCfg[cmd].req then
        log("Robot", "request error: couldn't find cmd: " .. cmd)
        return
    end

    if MessageCfg[cmd].rsp then
        self.msgHandlers[MessageCfg[cmd].rsp] = cb
    end
    if cmd ~= "Heartbeat" then
        log("Robot", string.format("robot(idx: %d, id: %d, roomIdx: %d ) request, cmd: %s-%d, data: %s.", self.idx, self.playerId, self.roomIdx, cmd, MessageCfg[cmd].req, str))
    end
    sendData(self.idx, MessageCfg[cmd].req, str)
end

function Robot:addMsgListener(cmd, cb)
    if not MessageCfg[cmd] then
        log("Robot", "request error: couldn't find cmd: " .. cmd)
        return
    end
    if not MessageCfg[cmd].notify then
        log("Robot", "request error: couldn't find cmd: " .. cmd)
        return
    end
    self.msgHandlers[MessageCfg[cmd].notify] = cb
end

function Robot:removeMsgListener(cmd)
    if not MessageCfg[cmd] then
        log("Robot", "request error: couldn't find cmd: " .. cmd)
        return
    end
    if not MessageCfg[cmd].rsp then
        log("Robot", "request error: couldn't find cmd: " .. cmd)
        return
    end
    self.msgHandlers[MessageCfg[cmd].rsp] = nil
end

function Robot:onMsg(cmd, str)
    local cb = self.msgHandlers[cmd]
    if cb then
        cb(cmd, str)
    else
        log("Robot", "onMsg ----- no handler", cmd, str)
    end
end

function Robot:getGamerById(id)
    for i, v in ipairs(self.gamers) do
        if v.UserId == id then
            return v, i
        end
    end
    return nil, nil
end

function Robot:login()
    local data = {
        Token = self.id,
        Platform = "win",
        Thirdparty = 1,
    }    
    self:request("TokenLogin", json.encode(data), handler(self, self.onLoginRsp))
    -- local uuid = tostring(os.time())
    -- uuid = uuid + self.uuidfix
    -- local data = {Thirdparty = 0, Platform = "widows", ID = uuid}
    -- self:request("Login", json.encode(data), handler(self, self.onLoginRsp))
end

function Robot:onLoginRsp(cmd, str)
    local data = json.decode(str)
    self.info = data
    local robot = self
    self.playerId = self.info.UserId

    scheduleOnce("enter" .. robot.idx, EnterRoomDelay, function()
        self:reqEnterRoom(self.roomid)
    end)
end

function Robot:reqEnterRoom(roomID)
    local req = {RoomID = roomID, GPS = {lon = 0, lat = 0}}
    self:request("EnterRoom", json.encode(req), handler(self, self.onEnterRoomRsp))
end

function Robot:onEnterRoomRsp(cmd, str)
    self.roomInfo = json.decode(str)
    for _, v in pairs(self.roomInfo.Players) do
        if v.UserId == self.playerId and not v.Ready then
            self.roomIdx = v.RoomIdx
            self:request("ReadyNext", "", function(cmd, str)end)
            break
        end
    end
end

function Robot:reqPlayHand(card)
    local data = {Card = card}
    self:request("PlayHand", json.encode(data), handler(self, self.onPlayHandRsp))
end

function Robot:onPlayHandRsp(cmd, str)
   table.remove(self.cards, self.handoutCardIdx)
end

function Robot:onPlayHandBroad(cmd, str)
    local data = json.decode(str)
end

function Robot:onPlayHandNotify(cmd, str)
    local data = json.decode(str)
    if data.UserId ~= self.playerId then
        return
    end
    local t = {}
    for _, v in pairs(self.cards) do
        t[v] = 1 + (t[v] or 0)
    end
    for k, v in pairs(t) do
        if v < 3 then
            for key, value in pairs(self.cards) do
                if value == k then
                    self.handoutCardIdx = key
                    break
                end
            end
            self:reqPlayHand(k)
            break
        end
    end
end

function Robot:onNewCardNotify(cmd, str)
   local data = json.decode(str)
   self.LeftCardsNum = data.LeftCardsNum
   if data.UserId == self.playerId and data.InOrOut then
       table.insert(self.cards, data.Card)
    end
end

function Robot:onActionNotify(cmd, str)
    local data = json.decode(str)
    if data.Card > 9 then
        self:request("Pass", "", function(cmd, str) end)
    end
end

function Robot:onNewCardAction(cmd, str)
    local data = json.decode(str)
    self.LeftCardsNum = data.LeftCardsNum
    if data.UserId == self.id then
        table.insert(self.cards.StandCards, data.Card)
        local flag = true
        for _, v in pairs(data.Actions) do
            if v.OP == 6 and self.LeftCardsNum <= 4 then
                flag = false
                self:request("HuPai", "", function(cmd, str)end)
            end
        end
        if flag then
            self:request("Pass", "", function(cmd, str)
                if str == "" then
                    self.handoutCardIdx = math.random(1,#self.cards.StandCards)
                    local card = self.cards.StandCards[self.handoutCardIdx]
                    self:reqPlayHand(card)
                end
            end)
        end
    end
end

function Robot:onAccountOne(cmd, str)
    print("onAccountOne:")
    self:request("ReadyNext", "", function(cmd, str) end)
end

function Robot:onReadyNextIn(cmd, str)
    
end

function Robot:onAccountAll(cmd, str)
    print("onAccountAll:")
    self:exit()
end

function Robot:removeByValue(num)
    for k, v in pairs(self.cards) do
        if v == num then
            table.remove(self.cards, k)
        end
    end
end

function Robot:onBroadPeng(cmd, str)
    local rsp = json.decode(str)
    if rsp.UserId == self.playerId then
        self:removeByValue(rsp.Card)
        self:removeByValue(rsp.Card)
    end
end

function Robot:onZhaoPaiIn(cmd, str)
    local rsp = json.decode(str)
    if rsp.UserId == self.playerId then
        self:removeByValue(rsp.Card)
        self:removeByValue(rsp.Card)
        self:removeByValue(rsp.Card)
    end
end

function Robot:onLongPaiIn(cmd, str)
    local rsp = json.decode(str)
    if rsp.UserId == self.playerId then
        self:removeByValue(rsp.Card)
        self:removeByValue(rsp.Card)
        self:removeByValue(rsp.Card)
        self:removeByValue(rsp.Card)
    end
end

function Robot:onPengIn(cmd, str)
    local rsp = json.decode(str)
    if rsp.UserId == self.playerId then
        self:removeByValue(rsp.Card)
        self:removeByValue(rsp.Card)
    end
end

function Robot:onBroadPass(cmd, str)
    print("onBroadPass:", str)
end

function Robot:onBroadGang(cmd, str)
    print("onBroadGang:", str)
    local rsp = json.decode(str)
    if rsp.UserId == self.playerId then
        self:removeByValue(rsp.Card)
        self:removeByValue(rsp.Card)
        self:removeByValue(rsp.Card)
    end
end

function Robot:onBroadHuPai(cmd, str)
    print("onBroadHuPai:", str)
end

-------------------- listeners --------------------
function Robot:initGameListeners()
    self:addMsgListener("EnterRoom", handler(self, self.onPlayerIn))
    self:addMsgListener("GameStart", handler(self, self.onGameStart))
    self:addMsgListener("SelectLack", handler(self, self.onSelectLackNotify))
    self:addMsgListener("BroadPlayHand", handler(self, self.onPlayHandBroad))
    self:addMsgListener("PlayHand", handler(self, self.onPlayHandNotify))
    self:addMsgListener("NewCard", handler(self, self.onNewCardNotify))
    self:addMsgListener("Action", handler(self, self.onActionNotify))
    self:addMsgListener("NewCardAction", handler(self, self.onNewCardAction))
    self:addMsgListener("AccountOne", handler(self, self.onAccountOne))
    self:addMsgListener("AccountAll", handler(self, self.onAccountAll))
    self:addMsgListener("BroadPeng", handler(self, self.onBroadPeng))
    self:addMsgListener("BroadPass", handler(self, self.onBroadPass))
    self:addMsgListener("BroadGang", handler(self, self.onBroadGang))
    self:addMsgListener("BroadHuPai", handler(self, self.onBroadHuPai))
    self:addMsgListener("ReadyNext", handler(self, self.onReadyNextIn))
    self:addMsgListener("Ops", handler(self, self.onOpsIn))
    self:addMsgListener("ZhaoPai", handler(self, self.onZhaoPaiIn))
    self:addMsgListener("LongPai", handler(self, self.onLongPaiIn))
    self:addMsgListener("Peng", handler(self, self.onPengIn))
    self:addMsgListener("BaoPai", handler(self, self.onBaoPaiIn))
    self:addMsgListener("DisbandRoomVote", handler(self, self.onDisbandRoomVoteIn))
end

function Robot:clearGameListeners()
    self:removeMsgListener("EnterRoom")
    self:removeMsgListener("GameStart")
    self:removeMsgListener("SelectLack")
    self:removeMsgListener("BroadPlayHand")
    self:removeMsgListener("NewCard")
    self:removeMsgListener("Action")
    self:removeMsgListener("NewCardAction")
    self:removeMsgListener("AccountOne")
    self:removeMsgListener("AccountAll")
    self:removeMsgListener("BroadPeng")
    self:removeMsgListener("BroadPass")
    self:removeMsgListener("BroadGang")
    self:removeMsgListener("BroadHuPai")
    self:removeMsgListener("ReadyNext")
    self:removeMsgListener("Ops")
    self:removeMsgListener("ZhaoPai")
    self:removeMsgListener("LongPai")
    self:removeMsgListener("Peng")
    self:removeMsgListener("BaoPai")
end

function Robot:onGameStart(cmd, str)
    local data = json.decode(str)
    self.currPlayerID = data.CurrPlayerID
    self.cards = data.SelfCardsInfo
    self:request("Distribut21", "", function()
        
    end)
    -- local t = {[1] = {}, [2] = {}, [3] = {}}
    -- local minIdx = 1
    -- for k, v in pairs(self.cards) do
    --     local idx = math.floor(v/100)
    --     table.insert(t[idx], v)
    -- end
    -- if #t[2] < #t[minIdx] then
    --     minIdx = 2
    -- end
    -- if #t[3] < #t[minIdx] then
    --     minIdx = 3
    -- end

    -- self:reqSelectLack(minIdx)
end

function Robot:onOpsIn(cmd, str)
    local rsp = json.decode(str)
    if rsp.Card < 10 then
        return
    end
    local req = {Card = rsp.Card, Object = rsp.Ops[1]}
    if #rsp.Ops >= 2 then
        req.Object = 0
    end
    self:request("Pass", json.encode(req), function() end)
end


function Robot:chat(msgId, minDelay, maxDelay)
    local cahtMsg = { MessageId = msgId } -- kuai dian kuai dian,deng de hua dou xie le
    local cahtStr = json.encode(cahtMsg)
    return self:delayTask(minDelay or 1, maxDelay or 3, function()
        self:request("ChatNotify", cahtStr, handler(self, self.onChatBroadcast))
    end)
end

function Robot:onPlayerIn(cmd, str)
    local rsp = json.decode(str)
    if rsp.UserId == self.playerId then
        self.roomIdx = rsp.RoomIdx
    end
end

function Robot:onBaoPaiIn(cmd, str)
    local rsp = json.decode(str)
    local req = {Object = 1}
    self:request("Pass", json.encode(req), function()end)
end

function Robot:onDisbandRoomVoteIn(cmd, str)
    local rsp = json.decode(str)
    for k, v in pairs(rsp.VoteInfo) do
        if tonumber(k) == self.playerId and v == 0 then
            self:request("DisbandRoomVote", json.encode({OP = 2}), function()end)
        end
    end
end


-------------------- actions --------------------
function Robot:delayTask(minDelay, maxDelay, cb)
    local delay = math.random(minDelay, maxDelay)
    self.taskCount = self.taskCount + 1
    scheduleOnce(self.id .. "delaytask" .. self.taskCount, delay, cb)
    return self.id .. "delaytask" .. self.taskCount
end

function Robot:pass()
    -- local data = 
    -- {
    --     OpId = self.opId,
    --     Cards = {},
    -- }
    -- local s = json.encode(data)
    -- self:delayTask(1, 3, function()
    --     self:request("PlayHand", s, handler(self, self.onHandoutRsp))
    -- end)
    -- log("Robot", "pass")
end

function Robot:beatFriend()
    local isBomb = CardPrompter.isEqualValues(self.mainCard, self.lastHand.cards) and (#self.lastHand.cards >= 4)
    
    if isBomb then
        self:pass()
    else
        local point = CardPrompter.getCardsPoint(self.mainCard, self.lastHand.cards)
        if (point == self.mainCard) or (point > G_BEAT_FRIEND_MAX_CARD) then
            self:pass()
        else
            self:handout(G_BEAT_FRIEND_RATE)
        end
    end
end

function Robot:handout(rate)
    do return end
    --local needHandout = true
    local needHandout = math.random(1, 100) <= rate
    if needHandout then
        local res = CardPrompter.prompt(self.mainCard, self.cards, self.lastHand)

        if res and (type(res) == 'table') and (#res > 0) then
            local data = 
            {
                OpId = self.opId,
                Cards = {},
            }

            --local promptCards = res[math.random(1, #res)]
            local promptIdx = self.promptIdx%(#res)+1
            local promptCards = res[promptIdx]

            if self.lastHand and (#self.lastHand.cards >= 4) and CardPrompter.isEqualValues(self.mainCard, promptCards) then
                local needBomb = true
                local isLastBomb = CardPrompter.isEqualValues(self.mainCard, self.lastHand.cards)
                if isLastBomb then
                    needBomb = math.random(1, 100) <= G_BOMB_BOMB_RATE
                else  
                    needBomb = math.random(1, 100) <= G_BOMB_NOTBOMB_RATE
                end

                if needBomb then
                    if type(promptCards) == 'table' then
                        for i, v in pairs(promptCards) do
                            table.insert(data.Cards, 1, v)    
                        end  
                    end

                    local s = json.encode(data)
                    self:delayTask(1, 3, function()
                    --self:delayTask(1, math.floor(self.timeLimit/2), function()
                        self:request("PlayHand", s, handler(self, self.onHandoutRsp))
                    end)
                else
                    self:pass()
                end
            else
                if type(promptCards) == 'table' then
                    for i, v in pairs(promptCards) do
                        table.insert(data.Cards, 1, v)    
                    end  
                end

                local s = json.encode(data)
                self:delayTask(1, 3, function()
                --self:delayTask(1, math.floor(self.timeLimit/2), function()
                    self:request("PlayHand", s, handler(self, self.onHandoutRsp))
                end)
            end
        else
            self:pass()
        end
    else
        self:pass()
    end
end

return Robot

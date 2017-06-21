log = print

require("framework.functions")
local Card = require("Robots.Card")
local CardPrompter = require("Robots.CardPrompter")



local mainCard = 2

--local preValues = { 413, 313, 213, 211, 311 }
--local preValues = { 413, 313, 213, 211, 311 }
local preValues = { 406, 307, 208, 409, 110 }
local values    = { 406, 307, 208, 409, 110, 210, 310, 211, 312,  113, 114, 214, 305 }


local cards = {}
local preCards = {}

local card
for i, v in ipairs(values) do
	card = Card.new({}, v, mainCard)
	table.insert(cards, card)
end

for i, v in ipairs(preValues) do
	card = Card.new({}, v, mainCard)
	table.insert(preCards, card)
end


if #preCards == 0 then
	preCards = nil
end

local lastHand = 
{
	idx = 2,
	cards = preCards,
}

print("**********************")
local res = CardPrompter.prompt(mainCard, cards)
print("#######################")
for i, v in pairs(res) do
	print("-------------")
	local ss = "" .. i .. ": "
	for ii, vv in pairs(v) do
		ss = ss .. vv .. " "
		--print("res " .. i, vv)
	end
	print(ss)
end

--print(isEqualValues(2, {202, 313, 413, 213, 213}))
--dump(res, "res")
-- local valid, value2 = CardChecker.check(res[1], {cards=preCards})
-- print(valid, value2)
-- print(CardChecker.isEqualValues(cards))
-- print(CardChecker.isEqualValues(preCards))

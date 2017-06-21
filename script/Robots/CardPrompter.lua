local math = math
local table = table
local log = print
local CardPrompter = {}

-- function sortTable(tab, func)
-- 	for i, v in ipairs(tab) do
-- 		for j=i+1, #tab do
-- 			if not func(tab[i], tab[j]) then
-- 				local tmp = tab[i]
-- 				tab[i] = tab[j]
-- 				tab[j] = tmp
-- 			end
-- 		end
-- 	end
-- end
local function is4Kings(tab)
	if (type(tab) == 'table') and (#tab == 4) and (tab[1] > 500) and (tab[2] > 500) and (tab[3] > 500) and (tab[4] > 500) then
		return true
	end

	return false
end
CardPrompter.is4Kings = is4Kings

local function isEqualValues(mainCard, tab)
	local point = tab[1]
	for k, v in pairs(tab) do
		if v < 500 then
			point = v%100
		end
		if point ~= mainCard then
			break
		end
	end
	for k, v in pairs(tab) do
		if v > 500 then
			if v ~= point then
				return false, point
			end
		elseif (v-200 ~= mainCard) and (v % 100 ~= point) then
			return false, point
		end
	end

	return true, point
end
CardPrompter.isEqualValues = isEqualValues

local function sortPointArray(a, b, mainCard)
	local alen, blen = #a, #b
	if alen >= 4 and blen >= 4 then
		if alen ~= blen then
			return alen >= blen
		else
			local pa, pb = a[1]%100, b[1]%100
			if pa == mainCard then
				return true
			elseif pb == mainCard then
				return false
			else
				return pa >= pb
			end
		end
	elseif #a >= 4 then
		return true
	elseif #b >= 4 then
		return false
	elseif a[1] < 500 and b[1] < 500 then
		local pa, pb = a[1]%100, b[1]%100
		if pa == mainCard then
			return true
		elseif pb == mainCard then
			return false
		else
			return pa >= pb
		end
		--return a[1]%100 <= b[1]%100
	else
		return a[1] >= b[1]
	end
end
CardPrompter.sortPointArray = sortPointArray


local function quickSort(tab, compare, mainCard)
	local function quickSort_(head, tail)
		if head >= tail then
	        return
	    end
		
	    local tmpHead, tmpTail = head, tail
	    local mid, i = tab[head], head+1
	 
	    while head < tail do
	        if compare(tab[i], mid, mainCard) then
	            tab[i], tab[tail] = tab[tail], tab[i]
	            tail = tail - 1
	        else 
	            tab[i], tab[head] = tab[head], tab[i]
	            head = head+1
	            i = i+1
	        end
	    end

	    quickSort_(head+1, tmpTail)
	    quickSort_(tmpHead, head)
	end
	quickSort_(1, #tab)
end
CardPrompter.quickSort = quickSort

local function makePointCardsArray(cards)
	local point
	local tab = {}
	for k, v in pairs(cards) do
		if v < 500 then
			point = v % 100
			tab[point] = tab[point] or {}
			table.insert(tab[point], 1, v)
		else
			tab[v] = tab[v] or {}
			table.insert(tab[v], 1, v)
		end
	end

	return tab
end
CardPrompter.makePointCardsArray = makePointCardsArray

local function makeColorCardsArray(cards)
	local color
	local tab = {}
	for k, v in pairs(cards) do
		color = math.floor(v/100)
		tab[color] = tab[color] or {}
		table.insert(tab[color], 1, v)	
	end

	return tab
end
CardPrompter.makeColorCardsArray = makeColorCardsArray

function CardPrompter.getCardsPoint(mainCard, tab)
	local point = tab[1]
	for k, v in ipairs(tab) do
		if v < 500 then
			point = v%100
		end
		if point ~= mainCard then
			break
		end
	end

	return point
end

local function containKing(mainCard, cards)
	for k, v in pairs(cards) do
		if v > 500 then
			return true
		end
	end
	return false
end
CardPrompter.containKing = containKing

local function containMaincard(mainCard, cards)
	for k, v in pairs(cards) do
		if type(v) == 'table' then
			if containMaincard(mainCard, v) then
				return true
			end
		elseif (type(v) == 'number') and (v%100 == mainCard) then
			return true
		end
	end
	return false
end
CardPrompter.containMaincard = containMaincard

local function is3With2(mainCard, cards)
	if #cards ~= 5 then
		return false
	end

	local tab = makePointCardsArray(cards)
	if tab[mainCard] then
		for k, v in pairs(tab[mainCard]) do
			if (v - 200) == mainCard then
				return false
			end
		end
	end

	local n = 0
	local p = 0
	for k, v in pairs(tab) do
		n = n + 1
		if p == 0 and #v == 3 then
			p = k
		end
	end
	if n ~= 2 then
		return false
	end

	return (p ~= 0), p
end
CardPrompter.is3With2 = is3With2

local function isFlush222(mainCard, cards)
	if #cards ~= 6 then
		return false
	end

	local tab = makePointCardsArray(cards)
	if tab[mainCard] then
		for k, v in pairs(tab[mainCard]) do
			if (v - 200) == mainCard then
				return false
			end
		end
	end

	local flushArr = {}
	for k, v in pairs(tab) do
		if #v ~= 2 then
			return false
		end
		table.insert(flushArr, v)
	end

	if #flushArr ~= 3 then
		return false
	end

	quickSort(flushArr, sortPointArray, mainCard)

	local p1 = flushArr[1][1]
	local p2 = flushArr[2][1]
	local p3 = flushArr[3][1]
	if p1 < 500 then p1 = p1%100 end
	if p2 < 500 then p2 = p2%100 end
	if p3 < 500 then p3 = p3%100 end
	if p1 + 1 == p2 and p2 + 1 == p3 then
		return true, p3
	end


	return false
end
CardPrompter.isFlush222 = isFlush222

local function isFlush33(mainCard, cards)
	if #cards ~= 6 then
		return false
	end

	local tab = makePointCardsArray(cards)
	if tab[mainCard] then
		for k, v in pairs(tab[mainCard]) do
			if (v - 200) == mainCard then
				return false
			end
		end
	end

	local flushArr = {}
	for k, v in pairs(tab) do
		if #v ~= 3 then
			return false
		end
		table.insert(flushArr, v)
	end
	if #flushArr ~= 2 then
		return false
	end

	quickSort(flushArr, sortPointArray, mainCard)

	local p1 = flushArr[1][1]
	local p2 = flushArr[2][1]
	if p1 < 500 then p1 = p1%100 end
	if p2 < 500 then p2 = p2%100 end
	if p1 + 1 == p2 then
		return true, p2
	end

	return false
end
CardPrompter.isFlush33 = isFlush33

local function isShunzi(mainCard, cards)
	if #cards ~= 5 then
		print("isShunzi 111")
		return false
	end

	local corArr = makeColorCardsArray(cards)
	for k, v in pairs(corArr) do
		if #v == 5 then
			print("isShunzi 222")
			return false
		end
	end

	local tab = makePointCardsArray(cards)
	local n = 0
	for k, v in pairs(tab) do
		n = n + 1
	end
	if n ~= 5 then
		print("isShunzi 333")
		return false
	end

	local poiArr = {}
	for k, v in pairs(tab) do
		table.insert(poiArr, v)
	end

	quickSort(poiArr, sortPointArray, mainCard)

	local p1 = poiArr[1][1]
	local p2 = poiArr[2][1]
	local p3 = poiArr[3][1]
	local p4 = poiArr[4][1]
	local p5 = poiArr[5][1]
	if p1 < 500 then p1 = p1%100 end
	if p2 < 500 then p2 = p2%100 end
	if p3 < 500 then p3 = p3%100 end
	if p4 < 500 then p4 = p4%100 end
	if p5 < 500 then p5 = p5%100 end

	if p1+1 == p2 and p2+1 == p3 and p3+1 == p4 and p4+1 == p5 then
		return true, p5
	end

print("isShunzi 444", p1, p2, p3, p4, p5)
	return false
end
CardPrompter.isShunzi = isShunzi

local function isTonghuashun(mainCard, cards)
	if #cards ~= 5 then
		return false
	end

	local corArr = makeColorCardsArray(cards)
	for k, v in pairs(corArr) do
		if #v ~= 1 then
			return false
		end
	end

	local poiArr = makePointCardsArray(cards)
	local n = 0
	for k, v in pairs(poiArr) do
		n = n + 1
	end
	if n ~= 5 then
		return false
	end

	quickSort(poiArr, sortPointArray, mainCard)

	local p1 = poiArr[1][1]
	local p2 = poiArr[2][1]
	local p3 = poiArr[3][1]
	local p4 = poiArr[4][1]
	local p5 = poiArr[5][1]
	if p1+1 == p2 and p2+1 == p3 and p3+1 == p4 and p4+1 == p5 then
		return true, p5
	end

	return false
end
CardPrompter.isTonghuashun = isTonghuashun

local function promptMust(mainCard, outCards)
	local tab = makePointCardsArray(outCards)
	local ret = {}
	for k, v in pairs(tab) do
		table.insert(ret, 1, v)
	end
	quickSort(ret, sortPointArray, mainCard)

	local arr11 = {}
	local arr12 = {}
	local arr2 = {}
	local arr3 = {}
	for k, v in ipairs(ret) do
		if #v == 1 then
			table.insert(arr11, v)
			table.insert(arr12, v)
		end
		if #v == 2 then
			table.insert(arr11, v)
			table.insert(arr2, v)
		end
		if #v == 3 then
			table.insert(arr12, v)
			table.insert(arr3, v)
		end
	end
	if #arr2 > 0 and #arr3 > 0 then
		if #outCards <= 7 or (not containMaincard(mainCard, arr2) and not containMaincard(mainCard, arr3)) then
			quickSort(arr2, sortPointArray, mainCard)
			quickSort(arr3, sortPointArray, mainCard)
			local arr3reverse = {}
			for i, v in ipairs(arr3) do
				table.insert(arr3reverse, 1, {v[1], v[2], v[3], arr2[1][1], arr2[1][2]})
			end
			for i, v in ipairs(arr3reverse) do
				table.insert(ret, 1, v)
			end
		end
	end
	if #arr11 >= 5 then
		quickSort(arr11, sortPointArray, mainCard)
		local tmp
		for i=#arr11-4, 1, -1 do

			if #arr11[i] + #arr11[i+1] + #arr11[i+2] + #arr11[i+3] + #arr11[i+4] <= 7 then
				tmp = {[1]=arr11[i][1], [2]=arr11[i+1][1], [3]=arr11[i+2][1], [4]=arr11[i+3][1], [5]=arr11[i+4][1]}
				dump(tmp, "tmp")
				if isShunzi(mainCard, tmp) then
					table.insert(ret, 1, tmp)
				end
			end
		end
	end
	if #arr12 >= 5 then
		quickSort(arr12, sortPointArray, mainCard)
		local tmp
		for i=#arr12-4, 1, -1 do
			if #arr12[i] + #arr12[i+1] + #arr12[i+2] + #arr12[i+3] + #arr12[i+4] <= 7 then
				tmp = {[1]=arr12[i][1], [2]=arr12[i+1][1], [3]=arr12[i+2][1], [4]=arr12[i+3][1], [5]=arr12[i+4][1]}
				if isShunzi(mainCard, tmp) then
					table.insert(ret, 1, tmp)
				end
			end
		end
	end
	return ret
end
CardPrompter.promptMust = promptMust

function CardPrompter.prompt(mainCard, selfCards, lastHand)
	if selfCards and #selfCards > 0 then
		local outCards = clone(selfCards)
		
		local preCards
		if lastHand then
			preCards = clone(lastHand.cards)
			if preCards then
				if is4Kings(preCards) or containMaincard(mainCard, lastHand.cards) then
					return false
				end
			end
		end

		if not preCards then
			-- local tab = makePointCardsArray(outCards)
			-- local ret = {}
			-- for k, v in pairs(tab) do
			-- 	table.insert(ret, 1, v)
			-- end
			-- quickSort(ret, sortPointArray, mainCard)

			-- local arr2 = {}
			-- local arr3 = {}
			-- for k, v in ipairs(ret) do
			-- 	if #v == 2 then
			-- 		table.insert(arr2, v)
			-- 	end
			-- 	if #v == 3 then
			-- 		table.insert(arr3, v)
			-- 	end
			-- end
			-- if #arr2 > 0 and #arr3 > 0 and not containMaincard(arr2) and not containMaincard(arr3) then
			-- 	quickSort(arr3, sortPointArray, mainCard)
			-- 	for i, v in ipairs(arr3) do
			-- 		table.insert(ret, 1, {v[1], v[2], v[3], arr2[1][1], arr2[1][2]})
			-- 	end
			-- end
			-- return ret
			return promptMust(mainCard, outCards)
		end
		
		local len = #preCards
		if CardPrompter["prompt" .. len] then
			return CardPrompter["prompt" .. len](mainCard, outCards, preCards)
		end
	end
	
	return false
end



function CardPrompter.prompt1(mainCard, cards, preCards)
	log("CardPrompter", "prompt 111", #cards)

	local preValue = preCards[1]
	local ret = {}
	if preValue == 502 then
		local tab = makePointCardsArray(cards)
		for k, v in pairs(tab) do
			if #v >= 4 then
				table.insert(ret, 1, v)
			end
		end
		if #ret > 0 then
			return ret
		end
	elseif preValue == 501 then
		local tab = makePointCardsArray(cards)
		if tab[502] then
			table.insert(ret, 1, {[1]=tab[502][1]})
		end
		if #ret == 0 then
			for k, v in pairs(tab) do
				if #v >= 4 then
					table.insert(ret, 1, v)
				end
			end
		end
		if #ret > 0 then
			return ret
		end
	else
		if preValue % 100 == mainCard then
			local tab = makePointCardsArray(cards)
			if tab[501] then
				table.insert(ret, 1, {[1]=tab[501][1]})
			end
			if tab[502] then
				table.insert(ret, 1, {[1]=tab[502][1]})
			end
			if #ret > 0 then
				quickSort(ret, sortPointArray, mainCard)
				return ret
			end
		else
			local tab = makePointCardsArray(cards)
			for k, v in pairs(tab) do
				if #v == 1  then
					if k > preValue%100 or k == mainCard then
						table.insert(ret, 1, {[1]=v[1]})
					end
				elseif #v >= 4 then
					table.insert(ret, 1, v)
				end
			end

			if #ret > 0 then
				quickSort(ret, sortPointArray, mainCard)
				return ret
			else
				for k, v in pairs(tab) do
					if #v == 2 or #v == 3  then
						if k > preValue%100 or k == mainCard then
							table.insert(ret, 1, {[1]=v[1]})
						end
					end
				end				
				if #ret > 0 then
					quickSort(ret, sortPointArray, mainCard)
					return ret
				end
			end
		end
	end
	
	return false
end


function CardPrompter.prompt2(mainCard, cards, preCards)
	log("CardPrompter", "prompt 222")
	
	local ret = {}
	local equalV, point = isEqualValues(mainCard, preCards)
	print("equalV, point, mainCard: ", equalV, point, mainCard)
	local tab = makePointCardsArray(cards)
	for k, v in pairs(tab) do
		print("k, #v, v[1]: ", k, #v, v[1])
		if #v == #preCards then
			if point ~= mainCard then
				local ev, p = isEqualValues(mainCard, v)
				print("ev, p: ", ev, p)
				if p > point or (p == mainCard and point < 500) then 
					table.insert(ret, 1, v)
				end
			else
				if v[1] > 500 then
					table.insert(ret, 1, v)
				end
			end
		elseif #v >= 4 then
			table.insert(ret, 1, v)
		end
	end
	
	if #ret > 0 then
		quickSort(ret, sortPointArray, mainCard)
		return ret
	end
	
	return false
end


function CardPrompter.prompt3(mainCard, cards, preCards)
	log("CardPrompter", "prompt 333")

	local ret = {}
	local equalV, point = isEqualValues(mainCard, preCards)
	local tab = makePointCardsArray(cards)
	for k, v in pairs(tab) do
		if #v == #preCards then
			if point ~= mainCard then
				local ev, p = isEqualValues(mainCard, v)
				if p == mainCard or p > point then 
					table.insert(ret, 1, v)
				end
			end
		elseif #v > #preCards then
			table.insert(ret, 1, v)
		end
	end
	
	if #ret > 0 then
		quickSort(ret, sortPointArray, mainCard)
		return ret
	end

	return false
end


function CardPrompter.prompt4(mainCard, cards, preCards)
	log("CardPrompter", "prompt 444")

	local ret = {}
	local equalV, point = isEqualValues(mainCard, preCards)
	local tab = makePointCardsArray(cards)
	for k, v in pairs(tab) do
		if #v == #preCards then
			if point ~= mainCard then
				local ev, p = isEqualValues(mainCard, v)
				if p == mainCard or p > point then 
					table.insert(ret, 1, v)
				end
			end
		elseif #v > #preCards then
			table.insert(ret, 1, v)
		end
	end

	if #ret > 0 then
		quickSort(ret, sortPointArray, mainCard)
		return ret
	end

	return false
end


function CardPrompter.prompt5(mainCard, cards, preCards)
	log("CardPrompter", "prompt 555")

	local ret = {}
	local tab = makePointCardsArray(cards)
	
	local isShun, pShun = isShunzi(mainCard, preCards)
	if isShun then
		local arr11 = {}
		local arr12 = {}
		local arr2 = {}
		local arr3 = {}
		for k, v in pairs(tab) do
			print(".. ", k, #v)
			if #v == 1 then
				table.insert(arr11, v)
				table.insert(arr12, v)
			end
			if #v == 2 then
				table.insert(arr11, v)
			end
			if #v == 3 then
				table.insert(arr12, v)
			end
		end
		
		if #arr11 >= 5 then
			quickSort(arr11, sortPointArray, 0)
			local tmp
			for i=#arr11-4, 1, -1 do
				if #arr11[i] + #arr11[i+1] + #arr11[i+2] + #arr11[i+3] + #arr11[i+4] <= 7 then
					tmp = {[1]=arr11[i][1], [2]=arr11[i+1][1], [3]=arr11[i+2][1], [4]=arr11[i+3][1], [5]=arr11[i+4][1]}
					dump(tmp, "tmp")
					local shun, p = isShunzi(mainCard, tmp)
					if shun and p > pShun then
						table.insert(ret, 1, tmp)
					end
				end
			end
		end
		if #arr12 >= 5 then
			quickSort(arr12, sortPointArray, 0)
			local tmp
			for i=#arr12-4, 1, -1 do
				if #arr12[i] + #arr12[i+1] + #arr12[i+2] + #arr12[i+3] + #arr12[i+4] <= 7 then
					tmp = {[1]=arr12[i][1], [2]=arr12[i+1][1], [3]=arr12[i+2][1], [4]=arr12[i+3][1], [5]=arr12[i+4][1]}
					local shun, p = isShunzi(mainCard, tmp)
					if shun and p > pShun then
						table.insert(ret, 1, tmp)
					end
				end
			end
		end
	end

	local is32, p32 = is3With2(mainCard, preCards)
	if is32 then
		local arr2 = {}
		local arr3 = {}
		for k, v in pairs(tab) do
			if #v == 2 then
				table.insert(arr2, v)
			end
			if #v == 3 then
				table.insert(arr3, v)
			end
		end

		if #arr2 > 0 and #arr3 > 0 then
			quickSort(arr2, sortPointArray, mainCard)
			quickSort(arr3, sortPointArray, mainCard)
			local arr3reverse = {}
			local parr3 = 0
			for i, v in ipairs(arr3) do
				parr3 = v[1] % 100
				if parr3 ~= p32 then
					if parr3 == mainCard or (parr3 > p32 and p32 ~= mainCard) then
						table.insert(arr3reverse, 1, {v[1], v[2], v[3], arr2[1][1], arr2[1][2]})
					end
				end
			end
			for i, v in ipairs(arr3reverse) do
				table.insert(ret, 1, v)
			end
		end

		if #ret > 0 then
			return ret
		else
			for k, v in pairs(tab) do
				if #v > 4 then
					table.insert(ret, 1, v)
				end
			end
		end
	end

	local equalV, point = isEqualValues(mainCard, preCards)
	if equalV then
		for k, v in pairs(tab) do
			if #v == #preCards then
				if point ~= mainCard then
					local ev, p = isEqualValues(mainCard, v)
					if p == mainCard or p > point then 
						table.insert(ret, 1, v)
					end
				end
			elseif #v > #preCards then
				table.insert(ret, 1, v)
			end
		end
		if #ret > 0 then
			quickSort(ret, sortPointArray, mainCard)
			return ret
		end
	end

	if #ret == 0 then
		for k, v in pairs(tab) do
			if #v > #preCards then
				table.insert(ret, 1, v)
			end
		end
	end

	if #ret > 0 then
		quickSort(ret, sortPointArray, mainCard)
		return ret
	end

	return false
end

function CardPrompter.prompt6(mainCard, cards, preCards)
	log("CardPrompter", "prompt 666")

	local ret = {}
	local tab = makePointCardsArray(cards)
	
	local is33, p33 = isFlush33(mainCard, preCards)
	print("---- 111 ", is33, p33)
	if is33 then
		local arr3 = {}
		for k, v in pairs(tab) do
			if #v == 3 then
				table.insert(arr3, v)
			end
		end

		if #arr3 > 1 then
			quickSort(arr3, sortPointArray, mainCard)
			local p1, p2
			local arr3reverse = {}
			for i=1, #arr3-1 do
				p1 = arr3[i][1]%100
				p2 = arr3[i+1][1]%100
				if p1+1 == p2 and p2 ~= p33 then
					if p33 == mainCard or (p2 > p33 and p33 ~= mainCard) then
						table.insert(arr3reverse, 1, {arr3[i][1], arr3[i][2], arr3[i][3], arr3[i+1][1], arr3[i+1][2], arr3[i+1][3]})
					end
				end
			end
			for i, v in ipairs(arr3reverse) do
				table.insert(ret, 1, v)
			end
		end

		if #ret > 0 then
			return ret
		else
			for k, v in pairs(tab) do
				if #v > 4 then
					table.insert(ret, 1, v)
				end
			end
		end
	end

	local is222, p222 = isFlush222(mainCard, preCards)
	if is222 then
		local arr2 = {}
		for k, v in pairs(tab) do
			if #v == 2 and v[1] < 500 then
				table.insert(arr2, v)
			end
		end

		if #arr2 > 2 then
			quickSort(arr2, sortPointArray, mainCard)
			local p1, p2, p3
			local arr2reverse = {}
			for i=1, #arr2-2 do
				p1 = arr2[i][1]%100
				p2 = arr2[i+1][1]%100
				p3 = arr2[i+2][1]%100
				
				if p1+1 == p2 and p2+1 == p3 and p3 ~= p222 then
					if p3 == mainCard or (p3 > p222 and p222 ~= mainCard) then
						table.insert(arr2reverse, 1, {arr2[i][1], arr2[i][2], arr2[i+1][1], arr2[i+1][2], arr2[i+2][1], arr2[i+2][2]})
					end
				end
			end
			for i, v in ipairs(arr2reverse) do
				table.insert(ret, 1, v)
			end
		end

		if #ret > 0 then
			return ret
		else
			for k, v in pairs(tab) do
				if #v > 4 then
					table.insert(ret, 1, v)
				end
			end
		end
	end


	local equalV, point = isEqualValues(mainCard, preCards)
	print("---- 333 ",  equalV, point)
	if equalV then
		for k, v in pairs(tab) do
			if #v == #preCards then
				if point ~= mainCard then
					local ev, p = isEqualValues(mainCard, v)
					if p == mainCard or p > point then 
						table.insert(ret, 1, v)
					end
				end
			elseif #v > #preCards then
				table.insert(ret, 1, v)
			end
		end
		if #ret > 0 then
			quickSort(ret, sortPointArray, mainCard)
			return ret
		end
	end

	if #ret == 0 then
		for k, v in pairs(tab) do
			if #v > #preCards then
				table.insert(ret, 1, v)
			end
		end
	end

	if #ret > 0 then
		quickSort(ret, sortPointArray, mainCard)
		return ret
	end

	return false
end

function CardPrompter.prompt7(mainCard, cards, preCards)
	log("CardPrompter", "prompt 777")

	local ret = {}
	local equalV, point = isEqualValues(mainCard, preCards)
	local tab = makePointCardsArray(cards)
	for k, v in pairs(tab) do
		if #v == #preCards then
			if point ~= mainCard then
				local ev, p = isEqualValues(mainCard, v)
				if p == mainCard or p > point then 
					table.insert(ret, 1, v)
				end
			end
		elseif #v > #preCards then
			table.insert(ret, 1, v)
		end
	end
	

	if #ret > 0 then
		quickSort(ret, sortPointArray, mainCard)
		return ret
	end

	return false
end

function CardPrompter.prompt8(mainCard, cards, preCards)
	log("CardPrompter", "prompt 888")

	local ret = {}
	local equalV, point = isEqualValues(mainCard, preCards)
	local tab = makePointCardsArray(cards)
	for k, v in pairs(tab) do
		if #v == #preCards then
			if point ~= mainCard then
				local ev, p = isEqualValues(mainCard, v)
				if p == mainCard or p > point then 
					table.insert(ret, 1, v)
				end
			end
		elseif #v > #preCards then
			table.insert(ret, 1, v)
		end
	end


	if #ret > 0 then
		quickSort(ret, sortPointArray, mainCard)
		return ret
	end

	return false
end

function CardPrompter.prompt9(mainCard, cards, preCards)
	log("CardPrompter", "prompt 999")

	-- local ret = {}
	-- local equalV, point = isEqualValues(mainCard, cards)
	-- if equalV then
	-- 	local tab = makePointCardsArray(mainCard)
	-- 	for k, v in pairs(tab) do
	-- 		if #v == #cards then
	-- 			if point ~= mainCard then
	-- 				local ev, p = isEqualValues(mainCard, v)
	-- 				if p == mainCard or p > point then 
	-- 					table.insert(ret, 1, v)
	-- 				end
	-- 			end
	-- 		elseif #v > #cards then
	-- 			table.insert(ret, 1, v)
	-- 		end
	-- 	end
	-- else
	-- 	local tab = makePointCardsArray(mainCard)
	-- 	for k, v in pairs(tab) do
	-- 		if #v >= 4 then
	-- 			table.insert(ret, 1, v)
	-- 		end
	-- 	end
	-- end

	-- if #ret > 0 then
	-- 	return ret
	-- end

	return false
end

function CardPrompter.prompt10(mainCard, cards, preCards)
	log("CardPrompter", "prompt 10 10 10")

	return false
end

function CardPrompter.promptEqualValues(mainCard, cards, preCards)
	

	return false
end

function CardPrompter.prompt3With2(mainCard, cards, preCards)
	

	return false
end

function CardPrompter.promptFlush222(mainCard, cards, preCards)
	
	return false
end

function CardPrompter.promptFlush33(mainCard, mainCard, cards, preCards)
	
	return false
end

function CardPrompter.promptShunzi(mainCard, cards, preCards)
	local tab = makePointCardsArray(cards)

	return false
end

function CardPrompter.promptTonghuashun(mainCard, cards, preCards)
	log("CardPrompter", "promptTonghuashun")

	local tab = makeColorCardsArray(cards)
	for k, v in pairs(tab) do
		local rt = {}
		for kk, vv in pairs(v) do
			rt[vv] = true
		end
	end
	return false
end

function CardPrompter.prompt4Kings(mainCard, cards, preCards)
	
	return false
end


return CardPrompter

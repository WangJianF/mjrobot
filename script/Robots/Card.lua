local Card = {}
function Card.new(model, value, mainCard)
	return value
end

function Card:ctor(model, value, mainCard)
	self.value = value
	if value%100 == mainCard then
		self.universal = true
	end
end

function Card:description(s)
	log("Card", "card description:", s, self.color, self.point, self.weight)
end

---------------------------------------------
return Card



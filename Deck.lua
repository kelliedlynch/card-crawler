Deck = Class()

local function shuffleTable( t )
    local rand = math.random 
    local iterations = #t
    local j
    
    for i = iterations, 2, -1 do
        j = rand(i)
        t[i], t[j] = t[j], t[i]
    end
end

function Deck:constructor(cards)
	if cards then
		self.cards = cards
	else
		self.cards = {
			AttackCard.new(),
			DefenseCard.new(),
			MagicCard.new(),
			AttackCard.new(),
			DefenseCard.new(),
			MagicCard.new(),
			AttackCard.new(),
			DefenseCard.new(),
			MagicCard.new(),
			AttackCard.new(),
			DefenseCard.new(),
			MagicCard.new(),
			AttackCard.new(),
			DefenseCard.new(),
			MagicCard.new(),
			AttackCard.new(),
			DefenseCard.new(),
			MagicCard.new(),
			AttackCard.new(),
			DefenseCard.new(),
			MagicCard.new(),
			AttackCard.new(),
			DefenseCard.new(),
			MagicCard.new(),
			AttackCard.new(),
			DefenseCard.new(),
			MagicCard.new()
		}
	end

	self.drawPile = {}
	for _, card in ipairs(self.cards) do
		table.insert(self.drawPile, card)
	end

	shuffleTable(self.drawPile)
	self.discardPile = {}
	self.hand = {}
	return self
end



function Deck:shuffle()
	for i,card in ipairs(self.discardPile) do
		table.insert(self.drawPile, card)
	end
	self.discardPile = {}
	shuffleTable(self.drawPile)
	UI:updateDrawPile(self.drawPile)
	UI:updateDiscardPile(self.discardPile)
end

function Deck:deal(toDeal)
	for i=1, toDeal do
		if self.drawPile[1] == nil then
			if self.discardPile[1] == nil then
				break
			else
				self:shuffle()
			end
		end
		local card = self.drawPile[1]
		table.insert(self.hand, card)
		removeByValue(self.drawPile, card)
		UI:updateDrawPile(self.drawPile)
	end
	UI:displayHand(self.hand)
end

function Deck:moveToDiscard(card)
	card.image:removeSelf()
	table.insert(self.discardPile, card)
	removeByValue(self.hand, card)
	UI:updateDiscardPile(self.discardPile)	
end
Card = Class()

function Card:constructor()
	self.width = 80
	self.height = 80
	self.red = 0
	self.green = 0
	self.blue = 0
	self.attackValue = 0
	self.defenseValue = 0
	self.magicValue = 0
	return self
end

function Card:playCard()
	
end

AttackCard = Class(Card)

function AttackCard:constructor()
	Card:constructor()
	self.red = 1
	self.green = 0
	self.blue = 0.5
	self.attackValue = 1
end

function AttackCard:playCard()
	player.currentAttackValue = player.currentAttackValue + self.attackValue
	player.deck:moveToDiscard(self)
	UI:updateCurrentStats()
end

DefenseCard = Class(Card)

function DefenseCard:constructor()
	Card:constructor()
	self.red = 0
	self.green = 0.5
	self.blue = 1
	self.defenseValue = 1
end

function DefenseCard:playCard()
	player.currentDefenseValue = player.currentDefenseValue + self.defenseValue
	player.deck:moveToDiscard(self)
	UI:updateCurrentStats()
end

MagicCard = Class(Card)

function MagicCard:constructor()
	Card:constructor()
	self.red = 0
	self.green = 1
	self.blue = 0
	self.magicValue = 1
end

function MagicCard:playCard()
	player.currentMagicValue = player.currentMagicValue + self.magicValue
	player.deck:moveToDiscard(self)
	UI:updateCurrentStats()
end
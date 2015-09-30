Enemy = Class()

function Enemy:constructor()
	self.radius = 40
	self.red = .2
	self.green = .9
	self.blue = .4
	self.hitPoints = 10
	self.attackValue = 0
	self.defenseValue = 0
	self.magicValue = 0
	return self
end
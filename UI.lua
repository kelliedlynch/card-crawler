UI = {}

function UI:displayCard(card, x, y)
	x = x or 0
	y = y or 0
	local function onTouchCard(event)
		local card = event.target
		local phase = event.phase
		if "began" == phase then
			card.strokeWidth = 3
		elseif "ended" == phase then
			card.strokeWidth = 1
			card.cardObject:playCard()
		end
	end

	card.image = display.newRoundedRect(x, y, card.width, card.height, 10)
	card.image:setFillColor(card.red, card.green, card.blue)
	card.image.strokeWidth = 1
	card.image:setStrokeColor(1, 1, 1)
	card.image.cardObject = card
	card.image:addEventListener( "touch", onTouchCard )
end

function UI:displayHand(hand)
	local margin = 10
	local offset = (display.viewableContentWidth - (margin * 2)) / #hand
	local currentCardY = 260
	for i, card in ipairs(hand) do
		local currentCardX = margin + (offset / 2) +  (offset * (i - 1)) 
		self:displayCard(card, currentCardX, currentCardY)
	end
end

function UI:displayDrawPile(pile)
	local drawPile = display.newRoundedRect(410, 180, 40, 40, 3)
	drawPile:setFillColor(.1, .2, .7)
	drawPile.strokeWidth = 1
	drawPile:setStrokeColor(1, 1, 1)
	self.drawCount = display.newText( #pile, drawPile.x, drawPile.y, native.systemFont, 18 )
end

function UI:updateDrawPile(pile)
	self.drawCount.text = #pile
end

function UI:displayDiscardPile(pile)
	local discardPile = display.newRoundedRect(360, 180, 40, 40, 3)
	discardPile:setFillColor(.4, .4, .4)
	discardPile.strokeWidth = 1
	discardPile:setStrokeColor(1, 1, 1)
	self.discardCount = display.newText( #pile, discardPile.x, discardPile.y, native.systemFont, 18 )
end

function UI:updateDiscardPile(pile)
	self.discardCount.text = #pile
end

function UI:displayCurrentStats()
	self.atkLabel = display.newText("ATK", 400, 20, native.systemFont, 16)
	self.atkValue = display.newText(player.currentAttackValue, 440, 20, native.systemFont, 16)
	self.defLabel = display.newText("DEF", 400, 40, native.systemFont, 16)
	self.defValue = display.newText(player.currentDefenseValue, 440, 40, native.systemFont, 16)
	self.magLabel = display.newText("MAG", 400, 60, native.systemFont, 16)
	self.magValue = display.newText(player.currentMagicValue, 440, 60, native.systemFont, 16)
end

function UI:updateCurrentStats()
	self.atkValue.text = player.currentAttackValue
	self.defValue.text = player.currentDefenseValue
	self.magValue.text = player.currentMagicValue
end

function UI:displayDealButton()

	local function onTouchDealButton(event)
		if "ended" == event.phase then
			for i=1, #player.deck.hand do
				player.deck:moveToDiscard(player.deck.hand[1])
			end
			player.deck.hand = {}
			player.deck:deal(5)
		end
	end

	self.dealButton = display.newRoundedRect(32,12,60,20,3)
	self.dealButton:setFillColor(1, .2, 1)
	self.dealButton.strokeWidth = 1
	self.dealButton:setStrokeColor(1,1,1)
	self.dealButton.text = display.newText("Deal", 32, 12, native.systemFont, 12)
	self.dealButton:addEventListener( "touch", onTouchDealButton )
end

function UI:displayEndTurnButton()

	local function onTouchEndTurnButton(event)
		if "ended" == event.phase then
			player.currentAttackValue = player.attackValue
			player.currentDefenseValue = player.defenseValue 
			player.currentMagicValue = player.magicValue 
			self:updateCurrentStats()
			for i=1, #player.deck.hand do
				player.deck:moveToDiscard(player.deck.hand[1])
			end
			player.deck.hand = {}
			player.deck:deal(5)
		end
	end

	self.endTurnButton = display.newRoundedRect(32,36,60,20,3)
	self.endTurnButton:setFillColor(1, .2, .8)
	self.endTurnButton.strokeWidth = 1
	self.endTurnButton:setStrokeColor(1,1,1)
	self.endTurnButton.text = display.newText("End Turn", 32, 36, native.systemFont, 12)
	self.endTurnButton:addEventListener( "touch", onTouchEndTurnButton )
end
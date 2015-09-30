-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
display.setStatusBar(display.HiddenStatusBar)

function removeByValue(t, v)
	for i,c in ipairs(t) do
		if c == v then
			table.remove(t, i)
			return
		end
	end
end

require "Class"
require "Card"
require "Deck"
require "UI"
require "player"
require "Enemy"
math.randomseed( os.time() )

UI:displayDealButton()
UI:displayEndTurnButton()
UI:displayDrawPile(player.deck.drawPile)
UI:displayDiscardPile(player.deck.discardPile)
UI:displayCurrentStats()

enemy = Enemy.new()
local enemyImage = display.newCircle(display.viewableContentWidth/2, display.viewableContentHeight/2 - enemy.radius, enemy.radius)
enemyImage:setFillColor(enemy.red, enemy.green, enemy.blue)
enemyImage.strokeWidth = 1
enemyImage:setStrokeColor(1, 1, 1)
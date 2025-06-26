local LoreBoard, super = Class(Event)

function LoreBoard:init(data)
    super.init(self, data.x, data.y, {data.width, data.height})

    self.solid = true

    self.properties = data.properties or {}

    self.sprite_b = Sprite("world/cutscenes/cliffs/lore_board")

    self.sprite_b:setScale(2)
    self.sprite_b.debug_select = false
    self.sprite_b:setOrigin(0.5, 1)

    self:addChild(self.sprite_b)
end

function LoreBoard:onInteract()
    Game.world:startCutscene(function(cutscene)
		cutscene:text("* It's the Lore Board's cousin,[wait:5] the Lore Board 2.")
		cutscene:text("* (You feel like a Lore Board 3 is on its way.)")
		cutscene:text("* (...Not here.[wait:10] Just somewhere.)")
	end)
end

return LoreBoard
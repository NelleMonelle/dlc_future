local ElevatorDoor, super = Class(Event)

function ElevatorDoor:init(data)
    super.init(self, data.x, data.y, {data.width, data.height})

    self.solid = true

    local properties = data.properties or {}
    self.sprite_frame      = Sprite("world/events/busted_elevator_floorone")
    self:addChild(self.sprite_frame)
    self.sprite_frame:setScale(2)

    self.sprite_frame.x = 15
    self.sprite_frame.y = -65
end

function ElevatorDoor:onInteract()
	Game.world:startCutscene(function(cutscene)
		cutscene:text("* The elevator seems out of order.")
	end)
end

return ElevatorDoor
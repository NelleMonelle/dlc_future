local TorCar, super = Class(Event)

function TorCar:init(data)
    super.init(self, data.x, data.y, {data.width, data.height})
    self:setSprite("world/events/torcar")
    self.sprite:stop()
    self.solid = true
end

function TorCar:onInteract()
    Game.world:startCutscene(function(cutscene)
		cutscene:text("* (It's Toriel's van.)")
    end)
end

return TorCar
local CastleTownExit, super = Class(Event)

function CastleTownExit:init(data)
    super.init(self, data.x, data.y, {data.width, data.height})
    self:setSprite("world/events/shine", 1/4)
    self.solid = true
end

function CastleTownExit:onInteract()
    Game.world:startCutscene(function(cutscene)
		cutscene:text("* (There's a climbable wall here.)")
        local go_back = cutscene:textChoicer("* (Go back to Hometown?)", {"Yes", "No"})
		if go_back == 1 then
            cutscene:wait(1)
			cutscene:wait(cutscene:fadeOut(0.75))
			cutscene:wait(0.5)
            Assets.playSound("wing")
            cutscene:wait(0.3)
            Assets.playSound("wing")
            cutscene:wait(0.3)
            Assets.playSound("wing")
            cutscene:wait(1)
            Assets.playSound("jump")
            cutscene:wait(0.75)
            Assets.playSound("noise")
            cutscene:wait(1.5)
            cutscene:loadMap("hometown/school/school_door", 620, 280)
            Game.world:getEvent("darkdoor").sprite:setFrame(2)
			cutscene:wait(cutscene:fadeIn(0.75))
            cutscene:wait(0.25)
            Assets.playSound("locker")
            Game.world:getEvent("darkdoor").sprite:setFrame(1)
            cutscene:wait(0.5)
        end
    end)
end

return CastleTownExit
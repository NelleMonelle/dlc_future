local DeadMap, super = Class(Map)

function DeadMap:onEnter()
    super.onEnter(self)
    if not Game.sepia_shader then
		Game.sepia_shader = Game.stage:addFX(ShaderFX("sepia", {intensity = 1}))
	end
end

return DeadMap
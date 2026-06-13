return {
	secret = function(cutscene, event)
		Game.world.player:setState("WALK")
		Game.world.camera.pan_target = nil		-- I hate this
		cutscene:wait()
		cutscene:wait(cutscene:mapTransition("forest/ax_cave", 320, -40))
		cutscene:setAnimation(Game.world.player, "jump_ball")
		cutscene:wait(cutscene:slideTo(Game.world.player, 320, 840, 1.5))
		cutscene:setSprite(Game.world.player, "landed_1")
		Assets.playSound("impact")
		cutscene:shakeCamera(6)
		cutscene:wait(0.5)
		cutscene:setAnimation(Game.world.player, {"landed", 1/15, false})
		cutscene:wait(3/15)
		cutscene:look(Game.world.player, "down")
		Game.world.player:resetSprite()
    end,
}

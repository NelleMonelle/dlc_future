local WorldCutscene, super = Class("WorldCutscene", true)

function WorldCutscene:walk(chara, x, y, time, facing, keep_facing, ease, after)
    if type(chara) == "string" then
        chara = self:getCharacter(chara)
    end
    local walked = false
    if chara:walkTo(chara.x + x, chara.y + y, time, facing, keep_facing, ease, after) then
        chara.physics.move_target.after = Utils.override(chara.physics.move_target.after, function(orig) orig() walked = true end)
        table.insert(self.moving_objects, chara)
        return function() return walked end
    else
        return _true
    end
end

function WorldCutscene:walkSpeed(chara, x, y, speed, facing, keep_facing, after)
	if type(chara) == "string" then
        chara = self:getCharacter(chara)
    end
    local walked = false
    if chara:walkToSpeed(chara.x + x, chara.y + y, speed, facing, keep_facing, after) then
        chara.physics.move_target.after = Utils.override(chara.physics.move_target.after, function(orig) orig() walked = true end)
        table.insert(self.moving_objects, chara)
        return function() return walked end
    else
        return _true
    end
end

function WorldCutscene:slide(obj, x, y, time, ease)
    if type(obj) == "string" then
        obj = self:getCharacter(obj)
    end
    local slided = false
    if obj:slideTo(obj.x + x, obj.y + y, time, ease, function() slided = true end) then
        table.insert(self.moving_objects, obj)
        return function() return slided end
    else
        return _true
    end
end

function WorldCutscene:slideSpeed(obj, x, y, speed)
    if type(obj) == "string" then
        obj = self:getCharacter(obj)
    end
    local slided = false
    if obj:slideToSpeed(obj.x + x, obj.y + y, speed, function() slided = true end) then
        table.insert(self.moving_objects, obj)
        return function() return slided end
    else
        return _true
    end
end

function WorldCutscene:flashFade(speed, options)
	options = options or {}
	optionsinit = options

    local fader = options["global"] and Game.fader or Game.world.fader
	
	optionsinit["speed"] = 0
	
	if speed then
		options["speed"] = speed
	end

    local fade_done = false

    fader.alpha = 1

    fader:fadeIn(function() fade_done = true end, options)

    return function() return fade_done end
end

function WorldCutscene:healEffect(chara)
	local flash_sprite = chara.sprite.texture
	local flash_offset = chara.sprite:getOffset()
	local flash = FlashFade(flash_sprite, flash_offset[1], flash_offset[2])
	flash.layer = 100
	chara:addChild(flash)
	effect_done = false
	Game.world.timer:every(1/30, function()
		for i = 1, 2 do
			local x = chara.x + ((love.math.random() * chara.width) - (chara.width / 2)) * 2
			local y = chara.y - (love.math.random() * chara.height) * 2
			local sparkle = HealSparkle(x, y)
			sparkle.color = {0,1,0}
			Game.world:spawnObject(sparkle, chara.layer + 0.1)
		end
	end, 4)
	Assets.playSound("power")
	
	return function() return effect_done end
end

return WorldCutscene
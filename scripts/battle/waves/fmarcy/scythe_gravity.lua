local Basic, super = Class(Wave)

function Basic:onStart()
    -- Every 0.33 seconds...
    self.timer:every(1/2, function()
        -- Our X position is offscreen, to the right
        local x = MathUtils.random(Game.battle.arena.left, Game.battle.arena.right)
        -- Get a random Y position between the top and the bottom of the arena
        local y = -30

        -- Spawn smallbullet going left with speed 8 (see scripts/battle/bullets/smallbullet.lua)
        local bullet = self:spawnBullet("scythe_gravity", x, y)

        -- Dont remove the bullet offscreen, because we spawn it offscreen
        bullet.remove_offscreen = false
    end)
end

function Basic:update()
    -- Code here gets called every frame

    super.update(self)
end

return Basic
---@class WorldBullet.KnightDagger: WorldBullet
---@field facing facing
local KnightDagger, super = Class(WorldBullet)

-- Thanks to Hyperboid and Skerch for letting me use this

---@param facing facing?
function KnightDagger:init(x, y, facing, delay, damage)
    super.init(self, x, y, "bullets/world/knight_sword")

    self.delay = delay or 1

    -- This fade is inaccurate but it looks more wrong with no fade at all
    self.alpha = 0
    self:fadeToSpeed(1, 0.02)
    
    self.damage = damage or 230

    self.ypos = y

    self.timer = 0

    self.con = 0
    self.freeze = false

    self.draw_texture = Assets.getTexture("bullets/world/knight_sword")
    self.do_once_phase = 0

    self.collidable = false

    self.facing = facing or "down"
    if self.facing == "up" then
        self.rotation = math.pi
        self.parallax_y = 0
    elseif self.facing == "down" then
        self.parallax_y = 0
    elseif self.facing == "left" then
        self.rotation = math.pi * 0.5
    elseif self.facing == "right" then
        self.rotation = math.pi * 1.5
    end
end

function KnightDagger:update()
    if self.timer >= 15 then
        if self.freeze then
            self.active = false
            self.freeze = false
            return
        end
    end
    super.update(self)

    self.y = (0)+self.ypos

    if self.alpha <= 1 and self.timer <= 10 then
        if self.facing == "down" then
            self.ypos = self.ypos - DTMULT
        elseif self.facing == "up" then
            self.ypos = self.ypos + DTMULT
        end
        self.alpha = self.alpha + DTMULT/10
    end
    self.timer = self.timer + DTMULT/self.delay
    if self.timer >= 1 and self.do_once_phase < 1 then
        self.do_once_phase = 1
        Assets.stopSound("knight_jump_quick")
        Assets.playSound("knight_jump_quick", 0.5, 1.3)
    end
    if self.timer >= 10 and self.timer < 16 then
        self.color[2] = Utils.lerp(1, 0, ((self.timer - 10) / 6))
        self.color[3] = Utils.lerp(1, 0, ((self.timer - 10) / 6))
        if self.facing == "down" then
            self.ypos = Utils.lerp(self.ypos, 38, ((self.timer - 10) / 6))
        elseif self.facing == "up" then
            self.ypos = Utils.lerp(self.ypos, 442, ((self.timer - 10) / 6))
        end
    end
    if self.timer >= 16 and self.do_once_phase < 16 and Game.world:inBattle() then
        self.do_once_phase = 16
        local x, y = self:getScreenPos()
        self.con = y
        if self.facing == "down" then
            self.ypos = self.ypos + 600
        elseif self.facing == "up" then
            self.ypos = self.ypos - 300
        end
        Assets.stopSound("knight_cut2")
        Assets.playSound("knight_cut2", 0.5, 1.3)
        self.alpha = 0
    end
    if self.timer >= 16+(2/self.delay) and self.do_once_phase < 18 then
        self.do_once_phase = 18
        if self.x >= Game.world.player.x-10 and self.x <= Game.world.player.x+10 and Game.world:inBattle() then
            self:onCollide(Game.world.soul)
        end
        self:remove()
    end
end

function KnightDagger:draw()
    if self.con ~= 0 then
        for i = 0, 9 do
            -- BUG: This visually breaks when the camera is far away from
            --      y ~= 480ish. Try it on the Celestial Spire, you'll see
            --      what I mean. Potential fix could be to use `love.graphics.origin`?
            --      I haven't actually seen the GML code, though.
            love.graphics.setColor(1, 0, 0, i/10)
            love.graphics.origin()
            local x, y = self:getScreenPos()
            if self.facing == "down" then
                love.graphics.draw(self.draw_texture, x-self.width, Utils.lerp(self.con, y, (i / 10)) + (Game.world.camera.y - 240), 0, 2, 2)
            elseif self.facing == "up" then
                love.graphics.draw(self.draw_texture, 0, math.floor(Utils.lerp(300, 0, (i / 10))), 0, 2, 2)
            end
        end
    end
    super.draw(self)
end

return KnightDagger

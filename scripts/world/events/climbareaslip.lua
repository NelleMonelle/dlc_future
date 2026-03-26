---@class Event.climbarea : Event
local event, super = Class(Event, "climbareaslip")

function event:init(data)
    super.init(self, data)
    local properties = data and data.properties or {}
    self.climbable = true
	self.slippery = true
	self.falldir = "down"
	self.fallingtimer = 8
	self:setHitbox(5, 5, self.width - 10, self.height - 10)
end

function event:draw()
    super.draw(self)
    if DEBUG_RENDER then
        Draw.setColor(0.7, 1, 1)
        for x=0,self.width-1,40 do
            for y=0,self.height-1,40 do
                love.graphics.rectangle("line", x+4,y+4,40-8,20-8)
                love.graphics.rectangle("line", x+4,y+24,40-8,20-8)
                love.graphics.rectangle("line", x+4,y+4,40-8,40-8)
            end
        end
    end
end

function event:onClimbEnter(player)
    if player.facing == "up" or player.facing == "down" then
		Assets.playSound("motor_upper_2", 0.6, 1.2)
		local dust = Sprite("effects/slide_dust")
		dust:play(1 / 15, false, function () dust:remove() end)
		dust:setOrigin(0.5, 0.5)
		dust:setScale(2, 2)
		dust:setPosition(player.x, player.y - 17)
		dust.layer = player.layer - 0.01
		dust.physics.speed_y = -3
		dust.physics.speed_x = MathUtils.random(-1, 1)
		if player.onrotatingtower then
			dust.x = self.world.map.cyltower.tower_x
		end
		self.world:addChild(dust)
		player.falldir = self.falldir
		player.falling = 1
		player.fallingtimer = self.fallingtimer
		player.cancel = 1
	else
		Assets.playSound("noise")
		player.slippery = self
		player:setState("CLIMBSLIP")
	end
end

return event
---@class Event.climbarea : Event
local event, super = Class(Event, "climbareafall")

function event:init(data)
    super.init(self, data)
    local properties = data and data.properties or {}
    self.climbable = true
	self.falldir = "down"
	self.fallingtimer = 12
end

function event:draw()
    super.draw(self)
    if DEBUG_RENDER then
        Draw.setColor(1, 0, 0)
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
    player.falldir = self.falldir
	player.falling = 1
	player.fallingtimer = self.fallingtimer
	player.cancel = 1
end

return event
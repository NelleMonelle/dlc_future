local RalseiRoomWindow, super = Class(Event)

function RalseiRoomWindow:init(data)
    super.init(self, data)
    self:setOrigin(0)
    self:setSprite("world/maps/castletown/ralsei_room_window", (1/30)/0.07)
end

return RalseiRoomWindow
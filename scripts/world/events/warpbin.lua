local WarpBin, super = Class(Event)

function WarpBin:init(data)
    super.init(self, data.x, data.y, {data.width, data.height})

    self.solid = true

    self.properties = data.properties or {}

    if self.properties["skin"] then
        self.sprite_b = Sprite("world/events/".. self.properties["skin"])
    else
        self.sprite_b = Sprite("world/events/damaged_warp_bin")
    end

    self.sprite_b:setScale(2)
    self.sprite_b.debug_select = false

    self.sprite_b.y = -50
    self:addChild(self.sprite_b)
end

function WarpBin:onInteract()
    Game.world:startCutscene("warp_bin_alter")
end

return WarpBin
local actor, super = Class(Actor, "titan_spawn")

function actor:init()
    super.init(self)

    self.name = "Titan Spawn"

    self.width = 40
    self.height = 46

    --self.hitbox = {0, 23, 40, 23}

    self.flip = "right"

    self.path = "enemies/titan_spawn"
    self.default = "idle"

    self.animations = {
        ["idle"] = {"idle", 1/5, true},
        ["nooutline"] = {"nooutline", 1/5, true}, -- used when they chase you in dark rooms
        ["hurt"] = {"hurt", 0, false}
    }

    self.offsets = {
        ["idle"] = {0, 0},
        ["nooutline"] = {0, 0},
        ["hurt"] = {0, 0},
    }
end

return actor
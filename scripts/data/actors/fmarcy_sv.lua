local actor, super = Class(Actor, "fmarcy_sv")

function actor:init()
    super.init(self)

    -- Display name (optional)
    self.name = "Future Marcy Soul Vessel"

    -- Width and height for this actor, used to determine its center
    self.width = 19
    self.height = 37

    -- Hitbox for this actor in the overworld (optional, uses width and height by default)
    self.hitbox = {4, 29, 12, 8}

    -- Color for this actor used in outline areas (optional, defaults to red)
    self.color = {0, 1, 1}

    -- Path to this actor's sprites (defaults to "")
    self.path = "world/npcs/fmarcy_sv"
    -- This actor's default sprite or animation, relative to the path (defaults to "")
    self.default = "walk"

    -- Table of sprite animations
    self.animations = {}

    -- Table of sprite offsets (indexed by sprite name)
    self.offsets = {
        -- Movement offsets
        ["walk/left"] = {0, 0},
        ["walk/right"] = {0, 0},
        ["walk/up"] = {0, 0},
        ["walk/down"] = {0, 0},
	}
end

return actor
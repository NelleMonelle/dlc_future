local actor, super = Class(Actor, "fbrenda")

function actor:init()
    super.init(self)

    -- Display name (optional)
    self.name = "Future Brenda"

    -- Width and height for this actor, used to determine its center
    self.width = 25
    self.height = 59

    -- Hitbox for this actor in the overworld (optional, uses width and height by default)
    self.hitbox = {7, 43, 15, 7}

    -- Color for this actor used in outline areas (optional, defaults to red)
    self.color = {1, 0.2, 0.4}

    -- Path to this actor's sprites (defaults to "")
    self.path = "party/future_brenda/dark"
    -- This actor's default sprite or animation, relative to the path (defaults to "")
    self.default = "walk"

    -- Sound to play when this actor speaks (optional)
    self.voice = "brenda" -- Temporary
    -- Path to this actor's portrait for dialogue (optional)
    self.portrait_path = "face/fbrenda"
    -- Offset position for this actor's portrait (optional)
    self.portrait_offset = {-19,-3}

    -- Whether this actor as a follower will blush when close to the player
    self.can_blush = false

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

    -- self.menu_anim = "bs_win"		-- TODO
end

return actor
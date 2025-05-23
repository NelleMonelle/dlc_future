local actor, super = Class(Actor, "fkanako")

function actor:init()
    super.init(self)

    -- Display name (optional)
    self.name = "Future Kanako"

    -- Width and height for this actor, used to determine its center
    self.width = 25
    self.height = 59

    -- Hitbox for this actor in the overworld (optional, uses width and height by default)
    self.hitbox = {4, 50, 17, 9}

    -- Color for this actor used in outline areas (optional, defaults to red)
    self.color = {0, 1, 1}

    -- Path to this actor's sprites (defaults to "")
    self.path = "party/future_kanako/dark"
    -- This actor's default sprite or animation, relative to the path (defaults to "")
    self.default = "walk"

    -- Sound to play when this actor speaks (optional)
    self.voice = "kanako" -- Temporary
    -- Path to this actor's portrait for dialogue (optional)
    self.portrait_path = "face/fkanako"
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
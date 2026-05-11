local actor, super = Class(Actor, "martlet")

function actor:init()
    super.init(self)

    -- Display name (optional)
    self.name = "Martlet"

    -- Width and height for this actor, used to determine its center
    self.width = 27
    self.height = 49

    -- Hitbox for this actor in the overworld (optional, uses width and height by default)
    self.hitbox = {5, 39, 17, 10}

    -- Color for this actor used in outline areas (optional, defaults to red)
    self.color = {0, 1, 1}

    -- Path to this actor's sprites (defaults to "")
    self.path = "world/npcs/martlet"
    -- This actor's default sprite or animation, relative to the path (defaults to "")
    self.default = "walk"

    -- Sound to play when this actor speaks (optional)
    self.voice = "martlet"
    -- Path to this actor's portrait for dialogue (optional)
    self.portrait_path = "face/martlet"
    -- Offset position for this actor's portrait (optional)
    self.portrait_offset = {-17, -17}

    -- Whether this actor as a follower will blush when close to the player
    self.can_blush = false

    self.talk_sprites = {
        ["talk/down"] = 1/6,
        ["talk/right"] = 1/6,
        ["talk/left"] = 1/6,
        ["talk/up"] = 1/6
    }

    -- Table of sprite animations
    self.animations = {
        -- Cutscene animations
        -- 1/15, 1/12, or 1/9???? All are used at various points in UTY UGGHHH where's the damn consistency
        ["fly_away"] = {"fly_away", 1/12, false},
    }

    -- Table of sprite offsets (indexed by sprite name)
    self.offsets = {
        -- Movement offsets
        ["talk/down"] = {0, 0},
        ["talk/right"] = {2, -1},
        ["talk/left"] = {4, -1},
        ["talk/up"] = {0, 0},

        ["walk/down"] = {0, 0},
        ["walk/right"] = {1, -3},
        ["walk/left"] = {1, -3},
        ["walk/up"] = {-3, -2},

        -- Cutscene offsets
        ["fly_away"] = {-18, -151},
    }

    self.directional_talking = true
end

function actor:onTextSound()
    Assets.stopAndPlaySound("voice/martlet")
    return true
end

return actor
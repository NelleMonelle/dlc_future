local actor, super = Class(Actor, "knight")

function actor:init()
    super.init(self)

    self.name = "Knight"

    self.width = 117
    self.height = 115

    self.hitbox = {28, self.height/2 + 32, self.width-72, self.height/2 - 32}

    self.color = {1, 0, 0}

    self.flip = "right"

    self.path = "enemies/knight"
    self.default = "idle"

    self.animations = {
        ["idle"]           = {"idle", 1/25, true},
		
        ["attack"]         = {"attack_ol", 1/25, true},

        ["point"]          = {"point_ol", 1/25, false},
        ["point_end"]      = {"point_ol", 0.1, false, next="idle", frames={5,4,3,2,1}},

        ["flurry_prepare"] = {"flurry_prepare", 1/25, true},
        ["flurry"]         = {"flurry", 1/25, true},

        ["ball_fly"]       = {"ball_fly", 1/25, true},

		--unused animations in Deltarune
        ["block"]          = {"block_ol", 1/25, true},
        ["sword_glow"]     = {"sword_glow", 0.1, true},
    }

    self.offsets = {
        ["point_ol"]  = {7, 23},

        ["flurry_prepare"]  = {2, 10},
        ["flurry"]  = {2, 24},

        ["ball_fly"]  = {7, 23},
        ["arms_cross"]  = {7, 23},

        ["block_ol"]  = {14, 26},
        ["sword_glow"]  = {7, 23},
    }
end

function actor:createSprite()
    return KnightActor(self)
end

return actor
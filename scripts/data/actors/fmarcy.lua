local actor, super = Class(Actor, "fmarcy")

function actor:init()
    super.init(self)

    -- Display name (optional)
    self.name = "Future Marcy"

    -- Width and height for this actor, used to determine its center
    self.width = 19
    self.height = 37

    -- Hitbox for this actor in the overworld (optional, uses width and height by default)
    self.hitbox = {4, 29, 12, 8}

    -- Color for this actor used in outline areas (optional, defaults to red)
    self.color = {0, 1, 1}

    -- Path to this actor's sprites (defaults to "")
    self.path = "party/future_marcy/dark"
    -- This actor's default sprite or animation, relative to the path (defaults to "")
    self.default = "walk"

    -- Sound to play when this actor speaks (optional)
    self.voice = "fmarcy"
    -- Path to this actor's portrait for dialogue (optional)
    self.portrait_path = "face/fmarcy"
    -- Offset position for this actor's portrait (optional)
    self.portrait_offset = {-19,-3}

    -- Whether this actor as a follower will blush when close to the player
    self.can_blush = false

    -- Table of sprite animations
    self.animations = {
        -- Movement animations
        ["slide"]               		= {"slide", 4/30, true},

        -- Battle animations
        ["battle/idle"]         		= {"battle/idle", 0.2, true},

        ["battle/attack"]       		= {"battle/attack", 1/20, false},
        ["battle/act"]          		= {"battle/spell", 1/15, false},
        ["battle/spell"]        		= {"battle/spell", 1/15, false},
        ["battle/item"]         		= {"battle/item", 1/15, false, next="battle/idle"},
        ["battle/spare"]        		= {"battle/spell", 1/15, false, next="battle/idle"},

        ["battle/attack_ready"] 		= {"battle/attackready", 0.2, true},
        ["battle/act_ready"]    		= {"battle/spellready", 0.2, true},
        ["battle/spell_ready"]  		= {"battle/spellready", 0.2, true},
        ["battle/item_ready"]   		= {"battle/itemready", 0.2, true},
        ["battle/defend_ready"] 		= {"battle/defend", 1/15, false},

        ["battle/act_end"]      		= {"battle/idle", 1/15, false, next="battle/idle"},

        ["battle/hurt"]         		= {"battle/hurt", 1/15, false, temp=true, duration=0.5},
        ["battle/defeat"]       		= {"battle/defeat", 0.5, true},

        ["battle/transition"]   		= {"walk/right", 0.2, true},
        ["battle/intro"]        		= {"battle/attack", 1/20, false},
        ["battle/victory"]      		= {"battle/victory", 1/10, false},
		
		-- training encounter
		["idle"]      					= {"battle/idle", 0.2, true},
        ["hurt"]         				= {"battle/hurt", 1/15, false},
    }

    -- Table of sprite offsets (indexed by sprite name)
    self.offsets = {
        -- Movement offsets
        ["walk/left"] = {0, 0},
        ["walk/right"] = {0, 0},
        ["walk/up"] = {0, 0},
        ["walk/down"] = {0, 0},

        ["slide"] = {0, 0},

        -- Battle offsets
        ["battle/idle"] = {-5, -1},

        ["battle/attack"] = {5, -3},
        ["battle/attackready"] = {5, -3},
        ["battle/spell"] = {5, -3},
        ["battle/spellready"] = {5, -3},
        ["battle/item"] = {-5, -1},
        ["battle/itemready"] = {-5, -1},
        ["battle/defend"] = {5, -1},

        ["battle/defeat"] = {-8, -5},
        ["battle/hurt"] = {-5, -1},

        ["battle/intro"] = {-8, -9},
        ["battle/victory"] = {-5, -1},
		
        ["idle"] = {-5, -1},
        ["hurt"] = {-5, -1},
    }

    -- self.menu_anim = "bs_win"		-- TODO
end

return actor
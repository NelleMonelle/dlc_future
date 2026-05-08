local actor, super = HookSystem.hookScript("jamm")

function actor:init()
    super.init(self)
	
	self.animations["battle/critical"] = {"battle/defeat", 1/15, true}	-- TODO: Critical animation

    self.offsets["carry_f_marcy/down"] = {-12, 0}
    self.offsets["carry_f_marcy/left"] = {-12, 0}
    self.offsets["carry_f_marcy/right"] = {-12, 0}
    self.offsets["carry_f_marcy/up"] = {-12, 0}

    self.offsets["mirror/down"] = {-2, -2}
    self.offsets["mirror/left"] = {-2, -2}
    self.offsets["mirror/right"] = {-2, -2}
    self.offsets["mirror/up"] = {-2, -2}
	
	self.mirror_sprites = {
        ["walk/down"] = "mirror/up",
        ["walk/up"] = "mirror/down",
        ["walk/left"] = "mirror/left",
        ["walk/right"] = "mirror/right",
		
        ["walk_serious/down"] = "mirror/up",
        ["walk_serious/up"] = "mirror/down",
        ["walk_serious/left"] = "mirror/left",
        ["walk_serious/right"] = "mirror/right",
    }
	
	self.animations_disarmed = {
        ["battle/idle"]         		= {"battle_disarmed/idle", 0.2, true},

        ["battle/act"]          		= {"battle_disarmed/act", 1/15, false},
        ["battle/spell"]        		= {"battle_disarmed/spell", 1/15, false},
        ["battle/item"]         		= {"battle_disarmed/item", 1/15, false, next="battle/idle"},
        ["battle/spare"]        		= {"battle_disarmed/act", 1/15, false, next="battle/idle"},

        ["battle/act_ready"]    		= {"battle_disarmed/actready", 0.2, true},
        ["battle/spell_ready"]  		= {"battle_disarmed/actready", 0.2, true},
        ["battle/item_ready"]   		= {"battle_disarmed/itemready", 0.2, true},
        ["battle/defend_ready"] 		= {"battle_disarmed/defend", 1/15, false},

        ["battle/act_end"]      		= {"battle_disarmed/actend", 1/15, false, next="battle/idle"},

        ["battle/hurt"]         		= {"battle_disarmed/hurt", 1/15, false, temp=true, duration=0.5},
        ["battle/defeat"]       		= {"battle_disarmed/defeat", 0.5, true},
    }
	
	self.offsets = TableUtils.merge(self.offsets, {
        ["battle_disarmed/idle"] = {-9, -3},

        ["battle_disarmed/attack"] = {-9, -3},
        ["battle_disarmed/attackready"] = {-9, -3},
        ["battle_disarmed/act"] = {-9, -3},
        ["battle_disarmed/actend"] = {-9, -3},
        ["battle_disarmed/actready"] = {-9, -3},
        ["battle_disarmed/spell"] = {-9, -3},
        ["battle_disarmed/item"] = {-9, -3},
        ["battle_disarmed/itemready"] = {-9, -3},
        ["battle_disarmed/defend"] = {-9, -3},

        ["battle_disarmed/defeat"] = {-8, -3},
        ["battle_disarmed/hurt"] = {-9, -3},
    })
end

function actor:getDefault()
	if self.default ~= "walk" then return self.default end
	if Game:getFlag("future_carrying_marcy") then
		return "carry_f_marcy"
	end
	if Game:getFlag("future_met_fp") then
		return "walk_serious"
	end
	return self.default
end

function actor:getAnimation(anim)
	if Game:getPartyMember("jamm").disarmed and self.animations_disarmed[anim] then
		return self.animations_disarmed[anim]
	end
	return self.animations[anim]
end

return actor
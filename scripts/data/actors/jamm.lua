local actor, super = Class("jamm", true)

function actor:init()
    super.init(self)

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
end

function actor:getDefault()
	if Game:getFlag("future_carrying_marcy") then
		return "carry_f_marcy"
	end
	if Game:getFlag("future_met_fp") then
		return "walk_serious"
	end
	return self.default
end

return actor
local actor, super = Class("jamm", true)

function actor:init()
    super.init(self)

    self.offsets["carry_f_marcy/down"] = {-12, 0}
    self.offsets["carry_f_marcy/left"] = {-12, 0}
    self.offsets["carry_f_marcy/right"] = {-12, 0}
    self.offsets["carry_f_marcy/up"] = {-12, 0}
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
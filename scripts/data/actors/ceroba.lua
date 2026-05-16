local actor, super = HookSystem.hookScript("ceroba")

function actor:init()
    super.init(self)
	
	self.animations["battle/critical"] = {"battle/defeat", 1/15, true}	-- TODO: Critical animation
    self.animations["crouch"] = {"crouch", 1/10, false}

    TableUtils.merge(self.offsets, {
        ["crouch"] = {1, -1},

        ["shadowed_down"] = {-1, -1},
        ["climb/climb"] = {9, 28},
        ["climb/climb_zero_degrees"] = {9, 28},
        ["climb/climb_fortyfive_degrees"] = {9, 28},
        ["climb/climb_ninety_degrees"] = {9, 28},
        ["climb/charge"] = {-5, 7},
        ["climb/slip_left"] = {-5, 4},
        ["climb/slip_right"] = {-5, 4},
        ["climb/slip_fall"] = {-5, 4},
        ["climb/land_left"] = {-5, 4},
        ["climb/land_right"] = {-5, 4},
        ["climb/jump_up"] = {-5, 4},
        ["climb/jump_left"] = {-5, 4},
        ["climb/jump_right"] = {-5, 4},
    }, false)
end

return actor
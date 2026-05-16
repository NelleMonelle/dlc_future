local actor, super = HookSystem.hookScript("susie")

function actor:init(style)
    super.init(self)
	
	self.animations["battle/critical"] = {"battle/defeat", 1/15, true}	-- TODO: Critical animation

    TableUtils.merge(self.offsets, {
        -- Cutscene offsets
        ["fail_avoid_gaze"] = {0, 0},

        ["serious_kick"] = {0, 0},
        ["serious_kick_ready"] = {0, 0},
        ["climb/climb"] = {9, 18},
        ["climb/climb_zero_degrees"] = {9, 18},
        ["climb/climb_fortyfive_degrees"] = {9, 18},
        ["climb/climb_ninety_degrees"] = {9, 18},
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
local actor, super = HookSystem.hookScript("susie")

function actor:init(style)
    super.init(self)
	
	self.animations["battle/critical"] = {"battle/defeat", 1/15, true}	-- TODO: Critical animation

    TableUtils.merge(self.offsets, {
        -- Cutscene offsets
        ["fail_avoid_gaze"] = {0, 0},

        ["serious_kick"] = {0, 0},
        ["serious_kick_ready"] = {0, 0},
    }, false)
end

return actor
local actor, super = HookSystem.hookScript("ceroba")

function actor:init()
    super.init(self)
	
	self.animations["battle/critical"] = {"battle/defeat", 1/15, true}	-- TODO: Critical animation
    self.animations["crouch"] = {"crouch", 1/10, false}

    TableUtils.merge(self.offsets, {
        ["crouch"] = {1, -1},

        ["shadowed_down"] = {-1, -1},
    }, false)
end

return actor
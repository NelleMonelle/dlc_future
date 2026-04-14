local actor, super = HookSystem.hookScript("ceroba")

function actor:init()
    super.init(self)
	
	self.animations["battle/critical"] = {"battle/defeat", 1/15, true}	-- TODO: Critical animation

    TableUtils.merge(self.offsets, {
        ["shadowed_down"] = {-1, -1},
    }, false)
end

return actor
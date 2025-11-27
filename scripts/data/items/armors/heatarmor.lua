local item, super = Class("heatarmor", true)

function item:init()
    super.init(self)
	
	self.can_equip = TableUtils.merge(self.can_equip, {
        fmarcy = false
    })

    -- Character reactions
    self.reactions = TableUtils.merge(self.reactions, {
		fmarcy = "No chance of frostbite.",
    fbrenda = ""
    })
end

return item
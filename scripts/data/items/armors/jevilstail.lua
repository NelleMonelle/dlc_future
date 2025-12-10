local item, super = Class("jevilstail", true)

function item:init()
    super.init(self)
	
	self.can_equip = TableUtils.merge(self.can_equip, {
        fmarcy = false
    })

    -- Character reactions
    self.reactions = TableUtils.merge(self.reactions, {
		fmarcy = "It'd get in the way of mine...",
    fbrenda = ""
    })
end

return item
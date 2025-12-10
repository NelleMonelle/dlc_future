local item, super = Class("blackribbon", true)

function item:init()
    super.init(self)
	
	self.can_equip = TableUtils.merge(self.can_equip, {
        fmarcy = false,
        fbrenda = false
    })

    -- Character reactions
    self.reactions = TableUtils.merge(self.reactions, {
		fmarcy = "...No. Definitely not.",
    fbrenda = "... No..."
    })
end

return item
local item, super = Class("blackribbon", true)

function item:init()
    super.init(self)
	
	self.can_equip = Utils.merge(self.can_equip, {
        fmarcy = false
    })

    -- Character reactions
    self.reactions = Utils.merge(self.reactions, {
		fmarcy = "...No. Definitely not."
    })
end

return item
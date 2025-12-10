local item, super = Class("glowwrist", true)

function item:init()
    super.init(self)
	
	self.can_equip = TableUtils.merge(self.can_equip, {
        fmarcy = false
    })

    -- Character reactions
    self.reactions = TableUtils.merge(self.reactions, {
		fmarcy = "What, are you trying to attract attention?",
    fbrenda = ""
    })
end

return item
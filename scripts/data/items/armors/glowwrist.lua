local item, super = Class("glowwrist", true)

function item:init()
    super.init(self)
	
	self.can_equip = Utils.merge(self.can_equip, {
        fmarcy = false
    })

    -- Character reactions
    self.reactions = Utils.merge(self.reactions, {
		fmarcy = "What, are you trying to attract attention?",
    })
end

return item
local item, super = Class("bshotbowtie", true)

function item:init()
    super.init(self)
	
	  self.can_equip = Utils.merge(self.can_equip, {
        fbrenda = false
    })

    -- Character reactions
    self.reactions = Utils.merge(self.reactions, {
		fmarcy = "At least I can look nice at the end.",
    fbrenda = "I'm not wearing this filth."
    })
end

return item
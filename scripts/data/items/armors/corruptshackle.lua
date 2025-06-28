local item, super = Class("corruptshackle", true)

function item:init()
    super.init(self)
	
	--self.can_equip = Utils.merge(self.can_equip, {
        --fmarcy = false
    --})

    -- Character reactions
    self.reactions = Utils.merge(self.reactions, {
		fmarcy = "...Eh, worth a shot.",
    fbrenda = ""
    })
end

return item
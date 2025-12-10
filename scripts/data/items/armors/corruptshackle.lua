local item, super = Class("corruptshackle", true)

function item:init()
    super.init(self)
	
	--self.can_equip = TableUtils.merge(self.can_equip, {
        --fmarcy = false
    --})

    -- Character reactions
    self.reactions = TableUtils.merge(self.reactions, {
		fmarcy = "...Eh, worth a shot.",
    fbrenda = ""
    })
end

return item
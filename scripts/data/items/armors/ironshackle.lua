local item, super = Class("ironshackle", true)

function item:init()
    super.init(self)
	
	--self.can_equip = TableUtils.merge(self.can_equip, {
        --fmarcy = false
    --})

    -- Character reactions
    self.reactions = TableUtils.merge(self.reactions, {
		fmarcy = "...Sometimes, it feels like I...",
    fbrenda = ""
    })
end

return item
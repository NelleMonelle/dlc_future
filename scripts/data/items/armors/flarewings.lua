local item, super = Class("flarewings", true)

function item:init()
    super.init(self)
	
	--self.can_equip = Utils.merge(self.can_equip, {
        --fmarcy = false
    --})

    -- Character reactions
    self.reactions = Utils.merge(self.reactions, {
		fmarcy = "...Metal and heat don't mix.",
    fbrenda = ""
    })
end

return item
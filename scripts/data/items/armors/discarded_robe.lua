local item, super = Class("discarded_robe", true)

function item:init()
    super.init(self)
	
	--self.can_equip = Utils.merge(self.can_equip, {
        --fmarcy = false
    --})

    -- Character reactions
    self.reactions = Utils.merge(self.reactions, {
		fmarcy = "I mean, I'm a physical attacker, but...",
    fbrenda = ""
    })
end

return item
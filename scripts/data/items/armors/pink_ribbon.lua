local item, super = Class("pink_ribbon", true)

function item:init()
    super.init(self)
	
	self.can_equip = Utils.merge(self.can_equip, {
        fmarcy = false
    })

    -- Character reactions
    self.reactions = Utils.merge(self.reactions, {
		fmarcy = "Pink is... not my color.",
    fbrenda = ""
    })
	
	--self.reactions["jamm"] = {
		--jamm = "Now all I need is the chill.",
		--fmarcy = "What does that even mean???"
	--}
end

return item
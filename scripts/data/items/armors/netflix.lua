local item, super = Class("netflix", true)

function item:init()
    super.init(self)
	
	--self.can_equip = TableUtils.merge(self.can_equip, {
        --fmarcy = false
    --})

    -- Character reactions
    self.reactions = TableUtils.merge(self.reactions, {
		fmarcy = "This was discontinued...",
    })
	
	self.reactions["jamm"] = {
		jamm = "Now all I need is the chill.",
		fmarcy = "What does that even mean???"
	}
end

return item
local item, super = Class("punch_bowl", true)

function item:init()
    super.init(self)

    -- Character reactions
    self.reactions = TableUtils.merge(self.reactions, {
		fmarcy = {
			fmarcy = "You... drink the whole thing?"
		}
    })
	
	self.reactions["jamm"] = {
		jamm = "Alright. I punched it. What next?",
		fmarcy = "It's spilling..."
	}
end

return item
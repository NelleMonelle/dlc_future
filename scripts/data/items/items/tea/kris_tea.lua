local item, super = Class("kris_tea", true)

function item:init()
    super.init(self)
	
	self.heal_amounts = TableUtils.merge(self.heal_amounts, {
		["fmarcy"] = 300
	})

    -- Character reactions
    self.reactions = TableUtils.merge(self.reactions, {
		fmarcy = {
			fmarcy = "A sour taste..."
		}
    })
end

return item
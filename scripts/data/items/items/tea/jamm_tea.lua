local item, super = Class("jamm_tea", true)

function item:init()
    super.init(self)
	
	self.heal_amounts = TableUtils.merge(self.heal_amounts, {
		["fmarcy"] = 1500
	})

    -- Character reactions
    self.reactions = TableUtils.merge(self.reactions, {
		fmarcy = {
			fmarcy = "Did you just give me wine?",
			jamm = "Huh... Must've aged well."
		}
    })
end

return item
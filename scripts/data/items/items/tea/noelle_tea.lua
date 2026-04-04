local item, super = Class("noelle_tea", true)

function item:init()
    super.init(self)
	
	self.heal_amounts = TableUtils.merge(self.heal_amounts, {
		["fmarcy"] = 300
	})

    -- Character reactions
    self.reactions = TableUtils.merge(self.reactions, {	-- Present teas also apply to future party members.
		fmarcy = {
			fmarcy = "A taste of pappermint..."
		}
    })
end

return item
local item, super = Class("ralsei_tea", true)

function item:init()
    super.init(self)
	
	self.heal_amounts = TableUtils.merge(self.heal_amounts, {
		["fmarcy"] = 300
	})

    -- Character reactions
    self.reactions = TableUtils.merge(self.reactions, {
		fmarcy = "It tastes like... water."
    })
end

return item
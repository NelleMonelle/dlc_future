local item, super = Class("dess_tea", true)

function item:init()
    super.init(self)
	
	self.heal_amounts = TableUtils.merge(self.heal_amounts, {
		["fmarcy"] = 7
	})

    -- Character reactions
    self.reactions = TableUtils.merge(self.reactions, {
		fmarcy = {
			fmarcy = "Ugh! Potent garlic...",
			jamm = "I can see why you think that."
		}
    })
end

function item:getReactions()
	local reactions = super.getReactions(self)
    if Game:isDessMode() then
		reactions["fmarcy"] = {
			fmarcy = "This MUST be expired by now...!"
		}
	end
end

return item
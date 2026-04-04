local item, super = Class("ceroba_tea", true)

function item:init()
    super.init(self)
	
	self.heal_amounts = TableUtils.merge(self.heal_amounts, {
		["fmarcy"] = 450
	})

    -- Character reactions
    self.reactions = TableUtils.merge(self.reactions, {
		fmarcy = "It tastes like... water."
    })
end

function item:getReactions()
	local reactions = super.getReactions(self)
    if Game:getFlag("future_variable") == "ceroba" then
		reactions["fmarcy"] = {
			fmarcy = "...Iced tea.",
			jamm = "(Do you not like iced tea?)"
		}
	end
end

return item
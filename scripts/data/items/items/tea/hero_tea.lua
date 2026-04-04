local item, super = Class("hero_tea", true)

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

function item:getReactions()
	local reactions = super.getReactions(self)
    if Game:isDessMode() then
		reactions["fmarcy"] = {
			fmarcy = "...Is this Sprite?"
		}
	end
end

return item
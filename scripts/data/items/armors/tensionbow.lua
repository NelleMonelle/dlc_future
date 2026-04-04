local item, super = Class("tensionbow", true)

function item:init()
    super.init(self)
	
	-- self.can_equip = TableUtils.merge(self.can_equip, {
        -- fmarcy = false
    -- })

    -- Character reactions
    self.reactions = TableUtils.merge(self.reactions, {
		fmarcy = "Tension's high. Let's make the most of it."
    })
	
	--self.reactions["jamm"] = {
		--jamm = "Well, I'm on my way to YouTube. Don't wait up.",
		--fmarcy = "Dad..."
	--}
end

return item
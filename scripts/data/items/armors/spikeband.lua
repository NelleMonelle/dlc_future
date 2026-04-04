local item, super = Class("spikeband", true)

function item:init()
    super.init(self)
	
	-- self.can_equip = TableUtils.merge(self.can_equip, {
        -- fmarcy = false
    -- })

    -- Character reactions
    self.reactions = TableUtils.merge(self.reactions, {
		fmarcy = "I could see the use of this..."
    })
	
	self.reactions["jamm"] = {
		jamm = "Huh, sharp. Better keep it away from Marcy.",
		fmarcy = "And just what is that supposed to mean?"
	}
end

return item
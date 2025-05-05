local item, super = Class("riot_shield", true)

function item:init()
    super.init(self)
	
	--self.can_equip = Utils.merge(self.can_equip, {
        --fmarcy = false
    --})

    -- Character reactions
    self.reactions = Utils.merge(self.reactions, {
		fmarcy = {
			fmarcy = "...Don't say it, dad.",
			jamm = "What? What was I going to say?"
		},
    })
	
	self.reactions["jamm"] = {
		jamm = "Well, I'm on my way to YouTube. Don't wait up.",
		fmarcy = "Dad..."
	}
end

return item
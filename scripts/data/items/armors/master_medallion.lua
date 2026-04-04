local item, super = Class("master_medallion", true)

function item:init()
    super.init(self)
	
	--self.can_equip = TableUtils.merge(self.can_equip, {
        --fmarcy = false
    --})

    -- Character reactions
    self.reactions = TableUtils.merge(self.reactions, {
		fmarcy = "If you're certain..."
    })
	
	self.reactions_double = TableUtils.merge(self.reactions_double, {
		fmarcy = "We can always take it off, you know."
	})
	
	--self.reactions["jamm"] = {
		--jamm = "Well, I'm on my way to YouTube. Don't wait up.",
		--fmarcy = "Dad..."
	--}
end

return item
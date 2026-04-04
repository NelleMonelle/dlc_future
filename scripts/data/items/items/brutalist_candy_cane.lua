local item, super = Class("brutalist_candy_cane", true)

function item:init()
    super.init(self)
	
	self.heal_amounts = TableUtils.merge(self.heal_amounts, {
		["fmarcy"] = nil
	})

    -- Character reactions
    self.reactions = TableUtils.merge(self.reactions, {
		fmarcy = {
			fmarcy = "Do you take me for an idiot?"
		}
    })
	
	--self.reactions["jamm"] = {
		--jamm = "Well, I'm on my way to YouTube. Don't wait up.",
		--fmarcy = "Dad..."
	--}
end

return item
local item, super = Class("tvdinner", true)

function item:init()
    super.init(self)

    -- Character reactions
    self.reaction_variants[1] = TableUtils.merge(self.reaction_variants[1], {
		fmarcy = {
			fmarcy = "How is it still cold???"
		}
    })
	
    self.reaction_variants[2] = TableUtils.merge(self.reaction_variants[2], {
		fmarcy = {
			fmarcy = "Not the biggest vegan fan out there...",
			jamm = "You mean the food, right?"
		}
    })
	
    self.reaction_variants[3] = TableUtils.merge(self.reaction_variants[3], {
		fmarcy = {
			fmarcy = "Is that cherry? That's good."
		}
    })
	
    self.reaction_variants[4] = TableUtils.merge(self.reaction_variants[4], {
		fmarcy = {
			fmarcy = "Kinda like our rations..."
		}
    })
	
	--self.reactions["jamm"] = {
		--jamm = "Well, I'm on my way to YouTube. Don't wait up.",
		--fmarcy = "Dad..."
	--}
end

return item
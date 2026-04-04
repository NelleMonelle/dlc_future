local item, super = Class("mysticband", true)

function item:init()
    super.init(self)
	
	-- self.can_equip = TableUtils.merge(self.can_equip, {
        -- fmarcy = false
    -- })

    -- Character reactions
    self.reactions = TableUtils.merge(self.reactions, {
		fmarcy = "V-Slash will keep our hope."
    })
	
	--self.reactions["jamm"] = {
		--jamm = "Well, I'm on my way to YouTube. Don't wait up.",
		--fmarcy = "Dad..."
	--}
end

return item
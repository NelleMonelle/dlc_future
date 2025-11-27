local item, super = Class("dice_brace", true)

function item:init()
    super.init(self)
	
	--self.can_equip = TableUtils.merge(self.can_equip, {
        --fmarcy = false
    --})

    -- Character reactions
    self.reactions = TableUtils.merge(self.reactions, {
		fmarcy = "\"Future\"...?",
    fbrenda = "\"Angel\"."
    })
end

return item
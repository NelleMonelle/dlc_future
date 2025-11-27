local item, super = Class("leadmaker", true)

function item:init()
    super.init(self)
	
	--self.can_equip = TableUtils.merge(self.can_equip, {
        --fmarcy = false
    --})

    -- Character reactions
    self.reactions = TableUtils.merge(self.reactions, {
		fmarcy = "I mean, if it'll get us more money...",
    fbrenda = ""
    })
end

return item
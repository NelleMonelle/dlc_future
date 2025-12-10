local item, super = Class("program_socks", true)

function item:init()
    super.init(self)
	
	  self.can_equip = TableUtils.merge(self.can_equip, {
        fbrenda = false
    })

    -- Character reactions
    self.reactions = TableUtils.merge(self.reactions, {
		fmarcy = "...Are you implying something?",
    fbrenda = "Make me wear that and I'll kill you."
    })
	
	self.reactions["jamm"] = {
		jamm = "For (i = 0, i < 2, i++), equip socks.",
		fmarcy = "Dad, these aren't what you think they are."
	}
end

return item
local item, super = Class("program_socks", true)

function item:init()
    super.init(self)
	
	--self.can_equip = Utils.merge(self.can_equip, {
        --fmarcy = false
    --})

    -- Character reactions
    self.reactions = Utils.merge(self.reactions, {
		fmarcy = "...Are you implying something?",
    })
	
	self.reactions["jamm"] = {
		jamm = "For (i = 0, i < 2, i++), equip socks.",
		fmarcy = "Dad, these aren't what you think they are."
	}
end

return item
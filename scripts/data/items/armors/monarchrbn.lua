local item, super = Class("monarchrbn", true)

function item:init()
    super.init(self)

	self.can_equip = TableUtils.merge(self.can_equip, {
        fmarcy = false
    })

    -- Character reactions
    self.reactions = TableUtils.merge(self.reactions, {
		fmarcy = "...You know they're not my thing.",
		fbrenda = ""
    })

	--self.reactions["jamm"] = {
		--jamm = "",
		--fmarcy = ""
	--}
end

return item
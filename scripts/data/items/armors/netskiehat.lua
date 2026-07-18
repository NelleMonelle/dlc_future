local item, super = Class("netskiehat", true)

function item:init()
    super.init(self)

    self.can_equip = TableUtils.merge(self.can_equip, {
        fmarcy = false
    })

    -- Character reactions
    self.reactions = TableUtils.merge(self.reactions, {
		fmarcy = "The time is past.",
		fbrenda = ""
    })

	--self.reactions["jamm"] = {
		--jamm = "",
		--fmarcy = ""
	--}
end

return item
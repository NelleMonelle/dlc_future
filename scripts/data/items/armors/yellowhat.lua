local item, super = Class("yellowhat", true)

function item:init()
    super.init(self)

    --self.can_equip = TableUtils.merge(self.can_equip, {
        --fmarcy = false
    --})

    -- Character reactions
    self.reactions = TableUtils.merge(self.reactions, {
		fmarcy = "High noon is past now.",
		fbrenda = ""
    })

	--self.reactions["jamm"] = {
		--jamm = "",
		--fmarcy = ""
	--}
end

return item
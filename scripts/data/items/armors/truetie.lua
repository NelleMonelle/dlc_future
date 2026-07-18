local item, super = Class("truetie", true)

function item:init()
    super.init(self)

    --self.can_equip = TableUtils.merge(self.can_equip, {
        --fmarcy = false
    --})

    -- Character reactions
    self.reactions = TableUtils.merge(self.reactions, {
		fmarcy = "...Worn down. Just like me.",
		fbrenda = ""
    })

	--self.reactions["jamm"] = {
		--jamm = "",
		--fmarcy = ""
	--}
end

return item
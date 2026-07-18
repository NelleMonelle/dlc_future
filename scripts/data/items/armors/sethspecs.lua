local item, super = Class("sethspecs", true)

function item:init()
    super.init(self)

    --self.can_equip = TableUtils.merge(self.can_equip, {
        --fmarcy = false
    --})

    -- Character reactions
    self.reactions = TableUtils.merge(self.reactions, {
		fmarcy = "So long as they're not blurry...",
		fbrenda = ""
    })

	--self.reactions["jamm"] = {
		--jamm = "",
		--fmarcy = ""
	--}
end

return item
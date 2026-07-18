local item, super = Class("s_potion", true)

function item:init()
    super.init(self)

    -- Character reactions
    self.reactions = TableUtils.merge(self.reactions, {
		fmarcy = {
			fmarcy = "...You sure it's not poison?"
		}
    })

	--self.reactions["jamm"] = {
		--jamm = "",
		--fmarcy = ""
	--}
end

return item

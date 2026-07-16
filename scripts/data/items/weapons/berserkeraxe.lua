local item, super = Class("berserkeraxe", true)

function item:init()
    super.init(self)

    self.reactions = TableUtils.merge(self.reactions, {
		fmarcy = "",
		fbrenda = ""
    })

	--self.reactions["jamm"] = {
		--jamm = "",
		--fmarcy = ""
	--}
end

return item

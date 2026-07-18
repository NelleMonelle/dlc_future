local item, super = Class("brokenscarf", true)

function item:init()
    super.init(self)

    self.reactions = TableUtils.merge(self.reactions, {
		fbrenda = ""
    })

	--self.reactions["jamm"] = {
		--jamm = "",
		--fmarcy = ""
	--}
end

return item

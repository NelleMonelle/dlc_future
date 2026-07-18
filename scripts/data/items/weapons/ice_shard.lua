local item, super = Class("ice_shard", true)

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

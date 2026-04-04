local item, super = Class("lancercookie", true)

function item:init()
    super.init(self)

    -- Character reactions
    self.reactions = TableUtils.merge(self.reactions, {
		fmarcy = {
			fmarcy = "Is this... just dough?"
		}
    })
	
	self.reactions["jamm"] = {
		jamm = "Can barely taste the \"cookie\"..."
	}
end

return item
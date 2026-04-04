local item, super = Class("bigsling", true)

function item:init()
    super.init(self)
	
	self.reactions["jamm"] = {
		jamm = "I suppose it's better...",
		fmarcy = "Not by much."
	}
end

return item
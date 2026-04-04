local item, super = Class("simpsling", true)

function item:init()
    super.init(self)
	
	self.reactions["jamm"] = {
		jamm = "Don't have a cow, man.",
		fmarcy = "...What?"
	}
end

return item
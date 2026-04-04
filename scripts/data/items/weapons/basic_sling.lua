local item, super = Class("basic_sling", true)

function item:init()
    super.init(self)
	
	self.reactions["jamm"] = {
		jamm = "Ol' reliable.",
		fmarcy = "You really need an upgrade."
	}
end

return item
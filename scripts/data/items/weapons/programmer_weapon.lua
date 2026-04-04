local item, super = Class("programmer_weapon", true)

function item:init()
    super.init(self)
	
	self.reactions["jamm"] = {
		jamm = "Oh, yeah. This is easy to read.",
		fmarcy = "How...?"
	}
end

return item
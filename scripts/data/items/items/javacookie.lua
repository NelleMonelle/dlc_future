local item, super = Class("javacookie", true)

function item:init()
    super.init(self)

    -- Character reactions
    self.reactions = TableUtils.merge(self.reactions, {
		fmarcy = {
			fmarcy = "Is that... coffee?"
		}
    })
	
	self.reactions["jamm"] = {
		jamm = "Better than Bedrock.",
		fmarcy = "What are you even saying right now?"
	}
end

return item
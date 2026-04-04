local item, super = Class("banana", true)

function item:init()
    super.init(self)

    -- Character reactions
    self.reactions = TableUtils.merge(self.reactions, {
		fmarcy = {
			fmarcy = "Dad. Don't say it.",
			jamm = "You know the joke too, huh?"
		}
    })
	
	self.reactions["jamm"] = {
		jamm = "Gotta cut it up so I don't look gay...",
        brenda = "What?? Huh???",
        dess = "> implying there's something wrong with looking gay",
		fmarcy = "Should be the least of your concerns..."
	}
end

return item
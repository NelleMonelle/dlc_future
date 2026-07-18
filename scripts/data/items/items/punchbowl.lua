local item, super = Class("punchbowl", true)

function item:init()
    super.init(self)

    -- Character reactions
    self.reactions = TableUtils.merge(self.reactions, {
		fmarcy = {
			fmarcy = "I felt that..."
		}
    })
end

return item

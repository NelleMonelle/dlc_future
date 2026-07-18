local item, super = Class("treecake", true)

function item:init()
    super.init(self)

    -- Character reactions
    self.reactions = TableUtils.merge(self.reactions, {
		fmarcy = {
			fmarcy = "To have it all back..."
		}
    })
end

return item

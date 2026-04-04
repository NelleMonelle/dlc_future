local item, super = Class("bloombowtie", true)

function item:init()
    super.init(self)

    -- Character reactions
    self.reactions = TableUtils.merge(self.reactions, {
		fmarcy = "It doesn't even look good on me..."
    })
end

return item
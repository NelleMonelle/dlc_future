local item, super = Class("binariband", true)

function item:init()
    super.init(self)

    -- Character reactions
    self.reactions = TableUtils.merge(self.reactions, {
		fmarcy = "My dad would like this."
    })
end

return item
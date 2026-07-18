local item, super = Class("schadenbrot", true)

function item:init()
    super.init(self)

    -- Character reactions
    self.reactions = TableUtils.merge(self.reactions, {
		fmarcy = {
			fmarcy = "It's... Bread."
		}
    })
end

return item

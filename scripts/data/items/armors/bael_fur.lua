local item, super = Class("bael_fur", true)

function item:init()
    super.init(self)

    -- Character reactions
    self.reactions = TableUtils.merge(self.reactions, {
		fmarcy = "I guess spider fur works...?"
    })
end

return item
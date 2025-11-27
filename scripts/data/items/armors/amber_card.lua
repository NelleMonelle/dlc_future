local item, super = Class("amber_card", true)

function item:init()
    super.init(self)

    -- Character reactions
    self.reactions = TableUtils.merge(self.reactions, {
		fmarcy = "I mean, it doesn't seem very...",
    fbrenda = "What even is this junk?"
    })
end

return item
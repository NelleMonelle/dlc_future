local item, super = Class("blueribbon", true)

function item:init()
    super.init(self)

    -- Character reactions
    self.reactions = TableUtils.merge(self.reactions, {
		fmarcy = "Not much to cheer for anymore."
    })
end

return item
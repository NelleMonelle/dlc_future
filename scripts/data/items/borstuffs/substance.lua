local item, super = Class("borstuff/substance", true)

function item:init()
    super.init(self)

    -- Character reactions
    self.reactions = TableUtils.merge(self.reactions, {
		fmarcy = "Well... okay."
    })
	
	--self.reactions["jamm"] = {
		--jamm = "Well, I'm on my way to YouTube. Don't wait up.",
		--fmarcy = "Dad..."
	--}
end

return item
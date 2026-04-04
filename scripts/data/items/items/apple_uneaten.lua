local item, super = Class("apple_uneaten", true)

function item:init()
    super.init(self)

    -- Character reactions
    self.reactions = TableUtils.merge(self.reactions, {
		fmarcy = {
			fmarcy = "...Maybe don't keep the doctors away.",
			jamm = "You're eating it, you know..."
		}
    })
	
	--self.reactions["jamm"] = {
		--jamm = "Well, I'm on my way to YouTube. Don't wait up.",
		--fmarcy = "Dad..."
	--}
end

return item
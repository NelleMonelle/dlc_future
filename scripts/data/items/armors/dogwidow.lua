local item, super = Class("dogwidow", true)

function item:init()
    super.init(self)

	--self.can_equip = TableUtils.merge(self.can_equip, {
        --fmarcy = false
    --})

    -- Character reactions
    self.reactions = TableUtils.merge(self.reactions, {
		fmarcy = "Must be quite the relic...",
		fbrenda = ""
    })
	
    if Game:getFlag("future_variable") == "celestial" then
		reactions["fmarcy"] = {
			fmarcy = "Brenda won't like this..."
		}
	end
end

return item
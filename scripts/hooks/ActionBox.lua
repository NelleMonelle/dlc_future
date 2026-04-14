local ActionBox, super = Class(ActionBox)

function ActionBox:draw()
	super.draw(self)
	
	if self.battler.criticond then
		Draw.setColor(PALETTE["action_fill"])
		love.graphics.setFont(Assets.getFont("smallnumbers"))
		if self.battler.chara:usesMana() then
			love.graphics.rectangle("fill", 125, 6 - self.data_offset, 81, 12)
			Draw.setColor(PALETTE["action_health_text_down"])
			love.graphics.print("CRIT (" .. self.battler.crititimer .. ")", 129, 14 - self.data_offset)
		else
			love.graphics.rectangle("fill", 125, 9 - self.data_offset, 81, 12)
			Draw.setColor(PALETTE["action_health_text_down"])
			love.graphics.print("CRIT (" .. self.battler.crititimer .. ")", 129, 9 - self.data_offset)
		end
	end
end

return ActionBox
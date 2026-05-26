local ActionBox, super = Class(ActionBox)

function ActionBox:draw()
	local i = 0
	love.graphics.setFont(Assets.getFont("smallnumbers"))
	for k, status in pairs(self.battler.statuses) do
		if not status.statcon.hidden then
			Draw.setColor(1, 1, 1, 1)
			if Kristal.getLibConfig("status_core", "match_color") then
				Draw.setColor(self.battler.chara.color)
			end
			love.graphics.draw(Assets.getTexture(status.statcon.icon), (i * 24) + 4, -24 + self.box.y)
			
			local width = Assets.getFont("smallnumbers"):getWidth(status.turn_count)
			Draw.setColor(0, 0, 0, 1)
			love.graphics.print(status.turn_count, (i * 24) + 25 - width, -12 + self.box.y)
			love.graphics.print(status.turn_count, (i * 24) + 25 - width, -11 + self.box.y)
			love.graphics.print(status.turn_count, (i * 24) + 25 - width, -13 + self.box.y)
			love.graphics.print(status.turn_count, (i * 24) + 26 - width, -11 + self.box.y)
			love.graphics.print(status.turn_count, (i * 24) + 27 - width, -12 + self.box.y)
			love.graphics.print(status.turn_count, (i * 24) + 27 - width, -11 + self.box.y)
			love.graphics.print(status.turn_count, (i * 24) + 27 - width, -13 + self.box.y)
			love.graphics.print(status.turn_count, (i * 24) + 26 - width, -13 + self.box.y)
			Draw.setColor(1, 1, 1, 1)
			love.graphics.print(status.turn_count, (i * 24) + 26 - width, -12 + self.box.y)
			
			if status.statcon.amplifier and status.statcon.amplifier >= 1 then
				Draw.setColor(0, 0, 0, 1)
				love.graphics.print(status.statcon.amplifier, (i * 24) + 3, -28 + self.box.y)
				love.graphics.print(status.statcon.amplifier, (i * 24) + 3, -27 + self.box.y)
				love.graphics.print(status.statcon.amplifier, (i * 24) + 3, -29 + self.box.y)
				love.graphics.print(status.statcon.amplifier, (i * 24) + 4, -27 + self.box.y)
				love.graphics.print(status.statcon.amplifier, (i * 24) + 5, -28 + self.box.y)
				love.graphics.print(status.statcon.amplifier, (i * 24) + 5, -27 + self.box.y)
				love.graphics.print(status.statcon.amplifier, (i * 24) + 5, -29 + self.box.y)
				love.graphics.print(status.statcon.amplifier, (i * 24) + 4, -29 + self.box.y)
				Draw.setColor(1, 1, 1, 1)
				love.graphics.print(status.statcon.amplifier, (i * 24) + 4, -28 + self.box.y)
			end
		
			i = i + 1
		end
	end
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
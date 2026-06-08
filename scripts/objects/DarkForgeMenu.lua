local DarkForgeMenu, super = Class(Object)

function DarkForgeMenu:init()
    super.init(self, 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)

    self.parallax_x = 0
    self.parallax_y = 0

    self.font = Assets.getFont("main")
    self.font2 = Assets.getFont("main", 16)
	
	self.box = UIBox(100, 120, 440, 120)
    self.box.layer = -1
    self:addChild(self.box)
	
	self.warn_box = UIBox(100, 320, 440, 70)
    self.warn_box.layer = -1
    self:addChild(self.warn_box)
	
	self.name_box = UIBox(240, 95, 160, 10)
    self.name_box.layer = -1
    self:addChild(self.name_box)
	
	local trades = {
		"blackaxe",
		"blacksling"
	}
	
	local chartrades = {
		ceroba = "blackkatana",
		brenda = "blackrifle"
	}
	
	table.insert(trades, chartrades[Game:getFlag("future_variable")])
	
	self.current_selecting = 1
	
	self.from_items = {}
	
	for k,v in ipairs(Game.party) do
		table.insert(self.from_items, v:getWeapon())
	end
	
	self.to_items = {}
	
	for k,v in ipairs(trades) do
		table.insert(self.to_items, Registry.createItem(v))
	end
	
	self.done = false
	self.selected = false
end

function DarkForgeMenu:update()
	super.update(self)
	
	if self.done then return end
	
	if Input.pressed("right") then
		Assets.playSound("ui_move")
		self.current_selecting = self.current_selecting + 1
		if self.current_selecting == 4 then
			self.current_selecting = 1
		end
	end
	
	if Input.pressed("left") then
		Assets.playSound("ui_move")
		self.current_selecting = self.current_selecting - 1
		if self.current_selecting == 0 then
			self.current_selecting = 3
		end
	end
	
	if Input.pressed("cancel") then
		Assets.playSound("ui_cancel")
		self.done = true
	end
	
	if Input.pressed("confirm") then
		Assets.playSound("ui_select")
		self.done = true
		self.selected = true
	end
end

function DarkForgeMenu:draw()
    super.draw(self)
	
	Draw.setColor(1, 1, 1, 1)
	love.graphics.setLineWidth(4)
	love.graphics.line(320, 125, 320, 260)
	Draw.draw(Assets.getTexture("ui/conversion_arrow_right"), 310, 180)
	Draw.draw(Assets.getTexture("ui/page_arrow_left"), 100, 120)
	Draw.draw(Assets.getTexture("ui/page_arrow_right"), 520, 120)
	
	love.graphics.setFont(self.font)
	love.graphics.printf(Game.party[self.current_selecting]:getName(), 0, 80, 640, "center")
	
	love.graphics.printf(self.from_items[self.current_selecting]:getName(), 80, 140, 240, "center")
	love.graphics.printf(
		"AT " .. self.from_items[self.current_selecting]:getStatBonus("attack") .. 
		"  DF " .. self.from_items[self.current_selecting]:getStatBonus("defense") .. 
		"  MG " .. self.from_items[self.current_selecting]:getStatBonus("magic"),
	80, 172, 240, "center")
	if self.from_items[self.current_selecting]:getBonusName() then
		Draw.setColor(self.from_items[self.current_selecting].bonus_color)
		Draw.draw(Assets.getTexture(self.from_items[self.current_selecting].bonus_icon), 100, 206, 0, 2, 2)
		love.graphics.print(self.from_items[self.current_selecting]:getBonusName(), 132, 204)
	else
		Draw.setColor(0.5, 0.5, 0.5, 1)
		love.graphics.print("--------------", 100, 204)
	end
	Draw.setColor(1, 1, 1, 1)
	
	love.graphics.printf(self.to_items[self.current_selecting]:getName(), 320, 140, 240, "center")
	love.graphics.printf(
		"AT " .. self.to_items[self.current_selecting]:getStatBonus("attack") .. 
		"  DF " .. self.to_items[self.current_selecting]:getStatBonus("defense") .. 
		"  MG " .. self.to_items[self.current_selecting]:getStatBonus("magic"),
	320, 172, 240, "center")
	-- don't check, it's certain
	Draw.setColor(self.from_items[self.current_selecting].bonus_color)
	Draw.draw(Assets.getTexture(self.to_items[self.current_selecting].bonus_icon), 340, 206, 0, 2, 2)
	love.graphics.print(self.to_items[self.current_selecting]:getBonusName(), 372, 204)
	Draw.setColor(1, 1, 1, 1)
	
	love.graphics.setFont(self.font2)
	love.graphics.printf("[WARNING] If you choose to go through with this trade, the weapon this party member is currently using (displayed on the left) will be permanently lost. If you don't want to lose anything you currently have equipped, you may press " .. Input.getText("cancel") .. " to cancel.", 100, 320, 440, "center")
end

return DarkForgeMenu
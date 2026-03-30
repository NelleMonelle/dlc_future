local DarkMenu, super = Class(DarkMenu)

function DarkMenu:init()
	super.init(self)
	
	if Game:getFlag("future_hometown_graveyard_cutscene") then
		self.repbar = ReputationBar(700, 270)
		Game.stage:addChild(self.repbar)
		self.repbar:show()
	end
end

function DarkMenu:closeBox()
    super.closeBox(self)
	
	if self.repbar then
		self.repbar.visible = true
	end
end

function DarkMenu:onKeyPressed(key)
	if self.state == "MAIN" and Input.isConfirm(key) then
		if self.repbar then
			self.repbar.visible = false
		end
	end
	
	super.onKeyPressed(self, key)
end

function DarkMenu:transitionOut()
	super.transitionOut(self)
	
	if self.repbar then
		self.repbar:hide()
	end
end

return DarkMenu
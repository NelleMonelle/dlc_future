local PressHelper, super = Class(Object)

function PressHelper:init()
	super.init(self, 0, 0)
	self.pressed = false
end

function PressHelper:update()
    super.update(self)
	if Input.pressed("confirm") then
        self.pressed = true
		Kristal.Console:log("PRESSED")
	end
end

return PressHelper
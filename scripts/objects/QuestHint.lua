local QuestHint, super = Class(Sprite)

function QuestHint:init(x, y)
    super.init(self, "effects/alert", x, y)
	self:setOrigin(0.5, 1)

	self.siner = 0
end

function QuestHint:update()
	self.siner = self.siner + 0.1 * DTMULT

	self.y = self.y - math.sin(self.siner) * 0.2

	super.update(self)
end

return QuestHint
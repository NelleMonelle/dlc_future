local Dummy, super = Class(Encounter)

function Dummy:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* Collapse Creatures block your way."

    -- Battle music ("battle" is rude buster)
    self.music = "knight_chase_battle"
    -- Enables the purple grid battle background
    self.background = true

    -- Add the dummy enemy to the encounter
    self:addEnemy("slitherer")
    self:addEnemy("slitherer")
	
	self.flee = false
end

return Dummy
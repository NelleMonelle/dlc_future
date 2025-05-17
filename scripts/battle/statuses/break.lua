local Break, super = Class("StatusCondition")

function Break:init()
	super.init(self)
	
	self.name = "Break"
	
	self.desc = "Sets the party member's static defense to 0 while active."
	
	self.default_turns = 5
	
	self.icon = "ui/status/break"
end

function Break:onStatus(battler)
	self.base = battler.chara:getBaseStat("defense") + battler.chara:getEquipmentBonus("defense")
end

function Break:applyStatModifier(stat, value)
    if stat == "defense" then
        value = value - self.base
    end
    return value
end

return Break
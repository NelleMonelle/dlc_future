local spell, super = Class(Spell, "life_sever")

function spell:init()
    super.init(self)

    -- Display name
    self.name = "Life Sever"

    -- Battle description
    self.effect = "Boost\nParty"
    -- Menu description
    self.description = "Sacrifice health to give an ally (or self) an attack buff."
    -- Check description
    self.check = "Sacrifice health to give an ally (or self) an attack buff."
	
	self.default_resource = "health"

    -- TP cost
    self.health_cost = 600

    -- Target mode (ally, party, enemy, enemies, or none)
    self.target = "ally"

    -- Tags that apply to this spell
    self.tags = {"Boost"}
end

function spell:getCastMessage(user, target)
    return "* "..user.chara:getName().." used "..self:getCastName().."!\n* " .. target.chara:getName() .. "'s attack increased!"
end

function spell:onCast(user, target)
	target:healEffect({1, 0.5, 0})
	Assets.playSound("cardrive", 0.8, 1.4)
	target.chara:addStatBuff("attack", 5, 20)
end

function spell:getResourceType(chara) return self.default_resource end

return spell

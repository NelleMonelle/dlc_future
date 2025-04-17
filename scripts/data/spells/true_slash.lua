local spell, super = Class(Spell, "true_slash")

function spell:init()
    super.init(self)

    -- Display name
    self.name = "True Slash"

    -- Battle description
    self.effect = "Pierce"
    -- Menu description
    self.description = "Deals damage to an enemy, piercing all defense."
    -- Check description
    self.check = "Piercing damage to enemies."

    -- TP cost
    self.cost = 32

    -- Target mode (ally, party, enemy, enemies, or none)
    self.target = "enemy"

    -- Tags that apply to this spell
    self.tags = {"Damage"}
end

function spell:getCastMessage(user, target)
    return "* "..user.chara:getName().." used "..self:getCastName().."!"
end

function spell:onCast(user, target)
	local damage = math.floor(user.chara:getStat("attack") * 8)
	
	target:hurt(damage, user)
	Assets.playSound("damage")
end

return spell

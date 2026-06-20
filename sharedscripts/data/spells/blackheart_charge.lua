local spell, super = Class(Spell, "blackheart_charge")

function spell:init()
    super.init(self)

    -- Display name
    self.name = "Blackheart"

    -- Battle description
    self.effect = "Fatal\nDamage"
    -- Menu description
    self.description = "Takes a turn to charge, then attacks all enemies with fatal DARK damage."
    -- Check description
    self.check = "Takes a turn to charge, then attacks all enemies with fatal DARK damage."

    -- Resource costs
    self.cost = 96
    self.mana_cost = 96

    -- Target mode (ally, party, enemy, enemies, or none)
    self.target = "enemies"
end

function spell:getCastMessage(user, target)
	return "* "..user.chara:getName().." charges up an attack..."
end

function spell:onCast(user, target)
	user.chara.blackheart_charge = true
	afterimage = AfterImage(user, 0.5)
	afterimage.grow_x = 10
	afterimage.grow_y = 10
	Assets.playSound("boost")
    user:flash()
end

return spell

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
	local ph = PressHelper()
	Game.battle:addChild(ph)
	
	user:setAnimation("battle/attack")
    user:toggleOverlay(true)
    local afterimage1 = AfterImage(user, 0.5)
    local afterimage2 = AfterImage(user, 0.6)
    user:toggleOverlay(false)
    afterimage1.physics.speed_x = 2.5
    afterimage2.physics.speed_x = 5
    afterimage2:setLayer(afterimage1.layer - 1)
    Assets.playSound("scytheburst")
    Assets.playSound("criticalswing", 1.2, 1.3)
    Game.battle:addChild(afterimage1)
    Game.battle:addChild(afterimage2)
	
	Game.battle.timer:after(15/30, function()
		local damage = math.floor(user.chara:getStat("attack") * 8)
		
		if ph.pressed then
			damage = damage + 200
		end
		
		ph:remove()
		
		target:hurt(damage, user)
		Assets.playSound("damage")
		user:setAnimation("battle/idle")
		Game.battle.timer:after(15/30, function()
			Game.battle:finishAction()
		end)
	end)
	return false
end

return spell

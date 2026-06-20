local spell, super = Class(Spell, "blackheart")

function spell:init()
    super.init(self)

    -- Display name
    self.name = "Blackheart"
	
    -- Menu description
    self.description = "!! Give the party member \"blackheart_charge\", not this one !!"
    -- Check description
    self.check = "!! Give the party member \"blackheart_charge\", not this one !!"

    -- Target mode (ally, party, enemy, enemies, or none)
    self.target = "enemies"
end

function spell:onCast(user, target)
    local rect = Rectangle(-50, -50, 740, 580)
	rect:setColor(1, 0, 0, 1)
	Game.battle:addChild(rect)
	rect:setLayer(BATTLE_LAYERS["above_ui"])
	user.chara.blackheart_charge = false
	
	local hurt_sprites = {}
	for _,battler in ipairs(Game.battle:getActiveEnemies()) do
		local hs = battler.actor:createSprite()
		hs:setAnimation("hurt")
		hs:setOrigin(0.5, 1)
		hs:setScale(2)
		hs.x = battler.x
		hs.y = battler.y
		hs:addFX(RecolorFX(0,0,0,1))
		Game.battle:addChild(hs)
		table.insert(hurt_sprites, hs)
		hs:setLayer(BATTLE_LAYERS["above_ui"] + 1)
	end
	local bs = user.actor:createSprite()
	bs:setAnimation("battle/attack")
	bs:setOrigin(0.5, 1)
	bs:setScale(2)
	bs.x = user.x
	bs.y = user.y
	bs:addFX(RecolorFX(0,0,0,1))
	Game.battle:addChild(bs)
	bs:setLayer(BATTLE_LAYERS["above_ui"] + 1)
	Assets.playSound("knight_cut2")
	
	local rect2 = Rectangle(hurt_sprites[1].x, 0, 10, 580)
	rect2:setOrigin(0.5, 0)
	rect2:setColor(0, 0, 0, 1)
	Game.battle:addChild(rect2)
	rect2:setLayer(BATTLE_LAYERS["above_ui"] + 2)
	
	Game.battle.timer:tween(0.1, rect2, {width = 40})
	Game.battle.timer:after(0.1, function()
		Game.battle.timer:tween(0.6, rect2, {width = 0}, "out-cubic")
		Game.battle.timer:after(0.8, function()
			rect:remove()
			rect2:remove()
			for i=#hurt_sprites, 1, -1 do
				hurt_sprites[i]:remove()
			end
			bs:remove()
			Assets.playSound("damage") -- TODO: Find a more fitting damage sound
			Game.battle:shakeCamera(6)
			for _,battler in ipairs(Game.battle:getActiveEnemies()) do
				battler:hurt(self:getDamage(user, battler), user, battler.onDefeatFatal)
			end
			Game.battle.timer:after(0.2, function()
				Game.battle:finishAction()
			end)
		end)
	end)
    return false
end

function spell:getDamage(user, target)
    local damage = math.ceil((user.chara:getStat("magic") * 15) + (user.chara:getStat("attack") * 40) - (target.defense * 2))
    damage = math.ceil(damage/target:getResistance("DARK"))
    return damage
end

return spell

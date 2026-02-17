local Dummy, super = Class(EnemyBattler)

function Dummy:init()
    super.init(self)

    -- Enemy name
    self.name = "Creature α"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/dummy.lua)
    self:setActor("slitherer")

    -- Enemy health
    self.max_health = 3500
    self.health = 3500
    -- Enemy attack (determines bullet damage)
    self.attack = 16
    -- Enemy defense (usually 0)
    self.defense = 0
    -- Enemy reward
    self.money = 100

    -- Mercy given when sparing this enemy before its spareable (20% for basic enemies)
    self.spare_points = 0
    self.service_mercy = 0

    -- List of possible wave ids, randomly picked each turn
    self.waves = {
        "rudinn/diamonds_aim",
        "rudinn/diamonds_up_lots",
        "rudinn/diamonds_vert_lots",
    }

    -- Dialogue randomly displayed in the enemy's speech bubble
    self.dialogue = {}

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = {"AT 16 DF 0\n* You don't know what to make of it.", "The more time passes,[wait:5] the more you feel it stare into your SOUL."}

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
        "* Something foams at Creature α's... Mouth?",
        "* Creature α stares straight into your SOUL.",
        "* Smells like void.",
    }
	
	self.tired_percentage = 0
    self.low_health_percentage = 0
	
	self.disable_mercy = true

    self.weakspot = false
    self.weakspot_will_close = false
end

function Dummy:onAct(battler, name)
    if name == "Standard" then
        return "* But "..battler.chara:getName().." didn't know what to do."
    elseif name == "SoulShine" then
        battler:setAnimation("act")
        Game.battle:startCutscene(function(cutscene)
            cutscene:text("* "..battler.chara:getName().."'s SOUL emitted a brilliant \nlight!")
            battler:flash()

            local bx, by = battler:getRelativePos(battler.width/2 + 4, battler.height/2 + 4)

            local texture = "player/heart_centered"
            if battler.chara.id == "susie" then texture = "player/heart_centered_flip" end -- hacky
            local soul = Game.battle:addChild(TitanSpawnPurifySoul(texture, bx, by, true, self))
            soul.color = Game:getPartyMember(Game.party[1].id).soul_color or { 1, 0, 0 }
            soul.layer = 501

            cutscene:wait(function() return soul.t >= 500 end)
            cutscene:after(function()
                if #Game.battle.enemies == 0 then
                    Game.battle:setState("VICTORY")
                else
                    Game.battle:finishAction()
                    Game.battle:setState("ACTIONS", "CUTSCENE")
                end
            end)
        end)
        return
    end

    -- If the act is none of the above, run the base onAct function
    -- (this handles the Check act)
    return super.onAct(self, battler, name)
end

function Dummy:update()
	super.update(self)
	
	if Game.battle.soul then
		self.sprite.eye.target = Game.battle.soul
	else
		self.sprite.eye.target = Game.battle.party[1]
	end
end

function Dummy:getSpareText(battler, success)
    return "* But,[wait:20] it was not something that\ncan understand MERCY."
end

function Dummy:getEncounterText()
	if self.weakspot then
		return "* Creature α's weak spot has been revealed! It's defense dropped dramatically!"
	else
		return super.getEncounterText(self)
	end
end

function Dummy:getAttackDamage(damage, battler, points)
    if self.weakspot then
        local dmg = super.getAttackDamage(self, damage, battler, points)
        return math.ceil(dmg * 3)
    end
    return super.getAttackDamage(self, damage, battler, points)
end

function Dummy:onHurt(damage, battler)
	super.onHurt(self, damage, battler)

    if self.weakspot then
        self.weakspot_will_close = true
        Assets.playSound("punch_lower_heavy")
    end
end

function Dummy:onTurnEnd()
	if self.weakspot and self.weakspot_will_close then
        self.sprite.eye.rotating = true
        self.sprite.eye.sprite:fadeTo(1, 0.2)
        self.weakspot = false
        self.weakspot_will_close = false
    end
end

return Dummy
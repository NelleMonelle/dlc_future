local Knight, super = Class(EnemyBattler)

function Knight:init()
    super.init(self)

    self.name = "Knight"
    self:setActor("knight")

    -- ch3 accurate stats
    self.max_health = 7300
    self.health = 7300
    self.attack = 40
    self.defense = 0
    self.money = 0

    self.disable_mercy = true
    self.spare_points = 0
    self.tired_percentage = 0

    self.exit_on_defeat = false

    self.waves = {
        "basic"
    }

    self.text = {
        "* You felt lightheaded.",
        "* The Knight's image blurs in your eyes.",
        "* Smells like darkness.",
    }

    self.service_mercy = 0
    self.boss = true
    -- Ultra Break immunity
    self.unbreakable = true

    self:registerAct("HoldBreath")

    self.damagereduction = 0.1
    self.holdbreath = false
end

function Knight:getHealthDisplay()
    -- chapter 3 accuracy
    return "???"
end

function Knight:onAct(battler, name)
    if name == "Check" then
        -- prophecy callback
        return "* ROARING KNIGHT - AT 400 DF 800\n* The one which makes with blackened knife."
    elseif name == "HoldBreath" then
        if not self.holdbreath then
            self.holdbreath = true
            return "* Marcy holds her breath.\n* Her heartbeat quickened.\n* The SOUL now moves faster."
        else
            return "* Marcy holds her breath.\n* Nothing happens."
        end
    end
end

function Knight:getAttackDamage(damage, battler, points)
    local dmg = super.getAttackDamage(self, damage, battler, points)
    dmg = math.ceil(dmg * self.damagereduction)
    return dmg
end

function Knight:onTurnStart()
    if self.damagereduction < 0.2 then
        self.damagereduction = self.damagereduction + 0.01
    end
end

function Knight:onHurt(damage, battler)
    -- ch3 accuracy
    if damage >= 100 then
        Assets.playSound("knight_hurtb")
        self.sprite.hurttimer = 30
        self.sprite.stronghurtanim = true
    end
    -- I left the shake unchanged but in the game it's clearly less shake-ey looking???
    self:getActiveSprite():shake(9, 0, 0.5, 2 / 30)
end

function Knight:onDefeat(damage, battler)
    self.hurt_timer = -1
    self.defeated = true
    self:defeat("VIOLENCED", true)

    Game.battle.music:fade(0, 1/30)

    self.sprite.hurttimer = 999

    Assets.playSound("knight_hurt", 0.8, 1)
    Assets.playSound("knight_hurt", 0.8, 0.7)
    Assets.playSound("knight_hurt", 0.8, 1.3)

    self.sprite.end_cutscene_version = 1

    Game.battle:startCutscene(function(cutscene)
		Game.battle.tension_bar:hide()
		Game.battle.battle_ui:transitionOut()
        cutscene:wait(1.5)
		cutscene:wait(cutscene:fadeOut(0.5, {color={1, 1, 1}}))
		cutscene:wait(0.5)
		Game.battle:returnToWorld()
	end)
end

function Knight:freeze() self:onDefeat() end

function Knight:update()
    if self.holdbreath and Game.battle.soul and Game.battle.soul.speed < 5 then
        Game.battle.soul.speed = 5
    end

    super.update(self)
end

return Knight
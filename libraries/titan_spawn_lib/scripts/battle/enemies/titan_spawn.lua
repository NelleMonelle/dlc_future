local TitanSpawn, super = Class(EnemyBattler)

function TitanSpawn:init()
    super.init(self)

    self.name = "Titan Spawn"
    self:setActor("titan_spawn")

    self.max_health = 3000
    self.health = 3000
    self.attack = 18
    self.defense = 0
    self.money = 0

    self.spare_points = 0
    self.tired_percentage = 0
    self.disable_mercy = true

    self.waves = {}

    self.text = {
        "* You hear your heart beating in\nyour ears.",
        "* When did you start being\nyourself?",
        "* It sputtered in a voice like\ncrushed glass.",
        "* Smells like adrenaline."
    }

    self:getAct("Check").description = "Consider\nstrategy"
    self:registerAct("Brighten", "Powerup\nlight", "all", 4)
    self:registerAct("DualHeal", "Heal\nparty", "all", 16)
    self:registerAct("Banish", "Defeat\nenemy", nil, 64)
end

function TitanSpawn:onAct(battler, name)
    if name == "Check" then
        if Game:getTension() >= 64 then
            return {"* TITAN SPAWN - AT 30 DEF 200\n* A shard of fear. Appears in\nplaces of deep dark.", "* The atmosphere feels tense...\n* (You can use \"[color:yellow]BANISH[color:reset]\"!)"}
        else
            return {"* TITAN SPAWN - AT 30 DEF 200\n* A shard of fear. Appears in\nplaces of deep dark.", "* Expose it to LIGHT... and\ngain COURAGE to gain TP.", "* Then, \"[color:yellow]BANISH[color:reset]\" it!"}
        end
    elseif name == "Brighten" then
        Assets.playSound("boost")
        local bx, by = Game.battle:getSoulLocation()
        local soul = Sprite("effects/soulshine", bx, by)
        soul:play(1/30, false, function() soul:remove() end)
        soul:setOrigin(0.25, 0.25)
        soul:setScale(2, 2)
        Game.battle:addChild(soul)
        for _,pm in ipairs(Game.battle.party) do
            pm:flash()
        end
		return "* "..battler.chara:getName().."'s SOUL shone brighter!"
    elseif name == "DualHeal" then
        Game.battle:powerAct("dual_heal", battler, "ralsei") -- not really accurate
        return
    elseif name == "Banish" then
        Game.battle:startActCutscene(function(cutscene)
            local kris = Game.battle:getPartyBattler("kris") -- Kris should be replaced by the party leader
            cutscene:text("* "..battler.chara:getName().."'s SOUL emitted a brilliant\nlight!")
            local soul = Sprite("player/heart_dodge", kris.x, kris.y-kris.height)
            soul.layer = 9998
            soul.color = {1, 0, 0}
            soul:setOrigin(0.5, 0.5)
            Game.battle:addChild(soul)
            cutscene:playSound("revival") -- copied that flash thing from fountain seal, unaccurate at the moment
            local flash_parts = {}
            local flash_part_total = 12
            local flash_part_grow_factor = 0.5
            for i = 1, flash_part_total - 1 do
                -- width is 1px for better scaling
                local part = Rectangle(SCREEN_WIDTH / 2, 0, 1, SCREEN_HEIGHT)
                part:setOrigin(0.5, 0)
                part.layer = soul.layer - i
                part:setColor(1, 1, 1, -(i / flash_part_total))
                part.graphics.fade = flash_part_grow_factor / 16
                part.graphics.fade_to = math.huge
                part.scale_x = i*i * 2
                part.graphics.grow_x = flash_part_grow_factor*i * 2
                table.insert(flash_parts, part)
                Game.battle:addChild(part)
            end

            cutscene:wait(50/30)
            soul:fadeOutAndRemove(1)
            cutscene:wait(cutscene:fadeOut(1, {color={1, 1, 1}}))
            for _, part in ipairs(flash_parts) do
                part:remove()
            end
            for _, enemy in ipairs(Game.battle.enemies) do
                if enemy.id == "titan_spawn" then
                    enemy.alpha = 0
                end
            end
            cutscene:fadeIn(1, {color={1, 1, 1}})
            cutscene:wait(1)
            for _, enemy in ipairs(Game.battle.enemies) do
                if enemy.id == "titan_spawn" then
                    enemy:statusMessage("msg", "purified")
                    Assets.playSound("spare")
                    enemy:defeat("SPARED", false)
                end
            end
            cutscene:wait(1)
        end)
        return
    elseif name == "WakeKris" then -- unaccurate at the moment
        local kris = Game.battle:getPartyBattler("kris")
        if not kris.is_down then
            return "* (But, Kris wasn't DOWNed...)"
        else
            battler:setAnimation("throw")
            local slap = Sprite("effects/attack/slap_purple", kris.x, kris.y-kris.height/2)
            slap:setOrigin(0.5, 0.5)
            slap.layer = kris.layer + 1
            Game.battle:addChild(slap)
            Assets.playSound("damage")
            kris:heal(math.ceil(-kris.chara.health + 1))
            slap:play(1/15, false, function(s) s:remove() end)
            return "* "..battler.chara:getName().." used Wake Up!"
        end
    elseif name == "ReviveKris" then -- unaccurate at the moment
        battler:setAnimation("battle/spell")
        local kris = Game.battle:getPartyBattler("kris")
        if not kris.is_down then
            kris:heal(math.ceil(kris.chara.stats["health"]*0.5))
        else
            kris:heal(math.ceil(-kris.chara.health + kris.chara.stats["health"]/3))
        end
        return "* "..battler.chara:getName().." used Reviver!"
    elseif name == "Standard" then -- normal X-Action is supposed to be inaccessible in this fight
        return "* "
    end
    return super.onAct(self, battler, name)
end

function TitanSpawn:getAttackDamage(damage, battler, points)
    if damage > 0 then
        return damage
    end
    local dmg = ((battler.chara:getStat("attack") * points) / 20) - (self.defense * 3)
    if battler.chara:checkWeapon("blackshard") then
        dmg = dmg * 10
    end
    return dmg
end

function TitanSpawn:onHurt(damage, battler)
    super.onHurt(self, damage, battler)
    Assets.stopAndPlaySound("spawn_weaker")
end

function TitanSpawn:freeze()
	self:onDefeatFatal()
end

function TitanSpawn:onDefeat(reason, violent)
    self:onDefeatFatal()
end

function TitanSpawn:getSpareText(battler, success)
    return "* But,[wait:20] it was not something that\ncan understand MERCY."
end

function TitanSpawn:getEncounterText()

    if Game:getTension() >= 64 then
        return "* The atmosphere feels tense...\n* (You can use \"[color:yellow]BANISH[color:reset]\"!)"

    end

    return Utils.pick(self.text)
end

return TitanSpawn
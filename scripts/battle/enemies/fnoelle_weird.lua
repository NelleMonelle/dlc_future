local FNoelle, super = Class(EnemyBattler)

function FNoelle:init()
    super.init(self)

    -- Enemy name
    self.name = "Noelle"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/dummy.lua)
    self:setActor("dummy")

    -- Enemy health
    self.max_health = 1700
    self.health = 500
    -- Enemy attack (determines bullet damage)
    self.attack = 4
    -- Enemy defense (usually 0)
    self.defense = 0
    -- Enemy reward
    self.money = 100

    -- Mercy given when sparing this enemy before its spareable (20% for basic enemies)
    self.spare_points = 0
	
	self.service_mercy = 0
	
	self.tired_percentage = 0
	self.low_health_percentage = 0

    -- List of possible wave ids, randomly picked each turn
    self.waves = {
        "basic",
        "aiming",
        "movingarena"
    }

    -- Dialogue randomly displayed in the enemy's speech bubble
    self.dialogue = {
        "..."
    }

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = "AT 4 DF 0\n* Deep in the trance of the CrimsonSpire."

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
        "* The dummy gives you a soft\nsmile.",
        "* The power of fluffy boys is\nin the air.",
        "* Smells like cardboard.",
    }

    self.crimson_spire_timer = 0
	
    self.wake_first = true
    self.fail_first = true
    self.win_first = true
end

function FNoelle:update()
    super.update(self)
    self.crimson_spire_timer = (self.crimson_spire_timer or 0) + DTMULT

    if self.crimson_spire_timer >= 4 then
        self.crimson_spire_timer = self.crimson_spire_timer - 4

        if self.health > Utils.round(self.max_health / 6) then
            self.health = self.health - 1
        end
    end
end

function FNoelle:onAct(battler, name)
    if name == "Pull" then
		local s_act = Game.battle:getActionBy(Game.battle:getPartyBattler("susie"), false)
		if s_act and s_act.name == "Pull" then
			self.susie_pull = true
		end
		local j_act = Game.battle:getActionBy(Game.battle:getPartyBattler("jamm"), false)
		if j_act and j_act.name == "Pull" then
			self.jamm_pull = true
		end
		local v_act = Game.battle:getActionBy(Game.battle.party[3], false)
		if v_act and v_act.name == "Pull" then
			self.var_pull = true
		end
		
		Game.battle:startActCutscene("forcePull")
		
		if s_act and s_act.action == "ACT" and s_act.name == "Pull" and battler.chara.id ~= "susie" then
			Game.battle:finishActionBy("susie")
			Game.battle.processed_action[s_act] = true
		end
		
		if j_act and j_act.action == "ACT" and j_act.name == "Pull" and battler.chara.id ~= "jamm" then
			Game.battle:finishActionBy("jamm")
			Game.battle.processed_action[j_act] = true
		end

		if v_act and v_act.action == "ACT" and v_act.name == "Pull" and battler ~= Game.battle.party[3] then
			Game.battle:finishActionBy(Game.battle.party[3].chara.id)
			Game.battle.processed_action[v_act] = true
		end
		
		self.wake_first = false
        return
	elseif name == "Talk" then --X-Action
        if battler.chara.id == "susie" then
            Game.battle:startCutscene(function(cutscene)
				if not self.talk_susie then
					self.talk_susie = true
					-- TODO: Write Ceroba's dialogue to F!Noelle
				end
				cutscene:text("* But Susie's words couldn't reach her.")
				Game.battle:finishAction()
			end)
            return
        elseif battler.chara.id == "jamm" then
            Game.battle:startCutscene(function(cutscene)
				if not self.talk_jamm then
					self.talk_jamm = true
					cutscene:text("* Noelle,[wait:5] I may not know what you've been through...", "nervous_left", "jamm")
					cutscene:text("* But you have people in your own time counting on you!", "nostalgia", "jamm")
					cutscene:text("* Please,[wait:5] can't you think of them?", "worried_down", "jamm")
				end
				cutscene:text("* But Jamm's words couldn't reach her.")
				Game.battle:finishAction()
			end)
			return
        elseif battler.chara.id == "ceroba" then
            Game.battle:startCutscene(function(cutscene)
				if not self.talk_variant then
					self.talk_variant = true
					-- TODO: Write Ceroba's dialogue to F!Noelle
				end
				cutscene:text("* But Ceroba's words couldn't reach her.")
				Game.battle:finishAction()
			end)
            return
        else
            -- undefined character
            return "* Undefined character "..battler.chara:getName()
        end
    end

    -- If the act is none of the above, run the base onAct function
    -- (this handles the Check act)
    return super.onAct(self, battler, name)
end

function FNoelle:getXAction(battler)
    return "Talk"
end

function FNoelle:onDefeat()
    Game:setFlag("dark_future_ending", "kill")
    Game.battle:returnToWorld()
end

function FNoelle:onDefeatThorn()
    Game.battle.timer:after(1, function()
        Game.battle:startCutscene(function(cutscene)
            self:setAnimation("battle/defeat")
            Assets.playSound("noise")
            cutscene:wait(0.75)
            Game.battle.music:fade(0, 1/3)
            Game.battle.tension_bar.animating_in = false
            Game.battle.tension_bar.shown = false
            Game.battle.tension_bar.physics.speed_x = -10
            Game.battle.tension_bar.physics.friction = -0.4
            Game.battle.battle_ui:transitionOut()
            Game.battle.timer:tween(0.5, Game.battle.party[1], {x=Game.battle.party_beginning_positions[1][1], y=Game.battle.party_beginning_positions[1][2]})
            Game.battle.timer:tween(0.5, Game.battle.party[2], {x=Game.battle.party_beginning_positions[2][1], y=Game.battle.party_beginning_positions[2][2]})
            Game.battle.timer:tween(0.5, Game.battle.party[3], {x=Game.battle.party_beginning_positions[3][1], y=Game.battle.party_beginning_positions[3][2]})
            Game.battle.timer:tween(0.5, Game.battle.enemies[1], {x=Game.battle.enemy_beginning_positions[Game.battle.enemies[1]][1], y=Game.battle.enemy_beginning_positions[Game.battle.enemies[1]][2]})
            Game:setFlag("dark_future_ending", "kill")
            cutscene:wait(0.75)
            Game.battle:returnToWorld()
        end)
    end)
end

return FNoelle
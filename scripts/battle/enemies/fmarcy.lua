local Marcy, super = Class(EnemyBattler)

function Marcy:init()
    super.init(self)

    -- Enemy name
    self.name = "Marcy"
    -- Sets the actor, which handles the enemy's sprites (see scripts/data/actors/dummy.lua)
    self:setActor("fmarcy")
	self:setAnimation("idle")
	self.sprite.flip_x = true
	self.overlay_sprite.flip_x = true

    -- Enemy health
    self.max_health = 1800
    self.health = 1800
    -- Enemy attack (determines bullet damage)
    self.attack = 10
    -- Enemy defense (usually 0)
    self.defense = 4
    -- Enemy reward
    self.money = 100

    -- Mercy given when sparing this enemy before its spareable (20% for basic enemies)
    self.spare_points = 0
    self.service_mercy = 0

    -- List of possible wave ids, randomly picked each turn
    self.waves = {
        "basic",
        "aiming",
        "movingarena"
    }

    -- Dialogue randomly displayed in the enemy's speech bubble
    self.dialogue = {}

    -- Check text (automatically has "ENEMY NAME - " at the start)
    self.check = {"AT " .. Game:getPartyMember("fmarcy").stats.attack .. " DF " .. Game:getPartyMember("fmarcy").stats.defense .. "\n* A resistance member once known as a sweet girl.", "Testing your abilities to see if you're worth bringing along."}

    -- Text randomly displayed at the bottom of the screen each turn
    self.text = {
        "* You hear the rest of your party cheer for you in the distance.",
        "* Marcy aims Liberator towards you,[wait:5] hoping you'll match her might.",
        "* For a second,[wait:5] you swear Marcy smiled a little.",
		"* Marcy doesn't speak.[wait:10]\n* Her silence says she believes in your power.",
		"* She's not trying to win.[wait:10]\n* She's trying to wake something up inside you.",
		"* Marcy adjusts her stance — just like Jamm taught her."
    }
	
	-- Text that will show whenever Marcy is about to do a particularly strong attack.
	self.strong_text = "* Marcy's gaze sharpens;[wait:5] she's about to cut through [color:red]more than just air[color:white]."
	
	self.weakened_text = {
		"* Even weakened,[wait:5] Marcy doesn’t flinch.",
		"* You can tell Marcy is overexerting herself a lot.",
		"* Marcy's grip on Liberator slackens for a moment.",
		"* Marcy staggers for a second,[wait:5] but quickly corrects her balance.",
		"* Marcy's knees nearly buckle,[wait:5] but she stays standing for Jamm's sake."
	}

    -- Register act called "Smile"
    self:registerAct("Smile")
	
	self.times_smiled = 0
	
	self.boss = true
end

function Marcy:onAct(battler, name)
    if name == "Smile" then
        Game.battle:startActCutscene(function(cutscene)
			cutscene:text("* Jamm gives a warm smile to Marcy.")
			if self.times_smiled == 0 then
				cutscene:text("* The hell are you doing,[wait:5] dad?", "neutral", "fmarcy")
				cutscene:text("* You realize mercy won't get you anywhere,[wait:5] right?", "lookright", "fmarcy")
			elseif self.times_smiled == 1 then
				cutscene:text("* I don't remember how it was back when you came from...", "upset", "fmarcy")
				cutscene:text("* But now,[wait:5] the world is cruel.[wait:10]\n* Merciless.", "upset", "fmarcy")
				cutscene:text("* So why the hell are you hesitating!?", "mad", "fmarcy")
			elseif self.times_smiled == 2 then
				cutscene:text("* ...", "closed", "fmarcy")
				cutscene:text("* Marcy,[wait:5] for a quick second,[wait:5] seems as if she feels nostalgia...")
				cutscene:text("* Marcy's ATTACK and DEFENSE dropped!")
				Game:setFlag("marcy_training_distracted", true)
				self.attack = 8
				self.defense = 0
			else
				cutscene:text("* ...But nothing happened.")
			end
			self.times_smiled = self.times_smiled + 1
		end)
    end

    -- If the act is none of the above, run the base onAct function
    -- (this handles the Check act)
    return super.onAct(self, battler, name)
end

function Marcy:getXAction(battler)
	return "Smile"
end

function Marcy:getAttackDamage(damage, battler, points)
	if self.health == self.max_health then
		return 1
	end
	return super.getAttackDamage(self, damage, battler, points)
end

function Marcy:onHurt(damage, battler)
	super.onHurt(self, damage, battler)
	
	if self.health == self.max_health - 1 then
		Game.battle.encounter.do_first_cutscene = true
	end
end

return Marcy
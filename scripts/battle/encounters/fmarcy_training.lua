local Marcy, super = Class(Encounter)

function Marcy:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* Let the sparring commence!"

    -- Battle music ("battle" is rude buster)
    self.music = "battle"	-- we need more fitting music for this
    -- Enables the purple grid battle background
    self.background = false

	self.flee = false

    -- Add the dummy enemy to the encounter
    self.marcy = self:addEnemy("fmarcy", 540, 260)

    self.enemy_tension_bar_on_start = true

	Game.battle:registerXAction("jamm", "Check", "Useless\nanalysis")

	self.reaches = 0
end

function Marcy:onGameOver()
	Game.battle:startCutscene(function(cutscene)
		Game.battle.tension_bar:hide()
		Game.battle.battle_ui:transitionOut()
		Game.battle.party[1]:toggleOverlay(false)
		Game.battle.party[1]:setSprite("landed_1")
		Game.battle.party[1].chara.disarmed = false
		cutscene:wait(cutscene:fadeOut(1, {color={1,1,1,1}}))
		cutscene:wait(1)
		Game.battle:returnToWorld()
	end)
	return true
end

function Marcy:getPartyPosition(index)
    return 100, 260
end

function Marcy:onTurnEnd()
	self.reaching = false
	Game.battle.enemy_v_slash = false
	Game.battle.enemy_ultra_break = false
end

function Marcy:getDialogueCutscene()
	if self.do_first_cutscene then
		self.do_first_cutscene = false
		return function(cutscene)
			local jamm = cutscene:getCharacter("jamm")
			local marcy = cutscene:getCharacter("fmarcy")
			cutscene:battlerText(marcy, "Dad,[wait:5] what was that!?", {x=marcy.x - 40, y=marcy.y - 60})
			cutscene:battlerText(jamm, "I'm sorry,[wait:5] I...", {x=jamm.x + 40, y=jamm.y - 50, right=true})
			cutscene:battlerText(jamm, "I don't want to\nhurt you,[wait:5] Marcy.", {x=jamm.x + 40, y=jamm.y - 50, right=true})
			cutscene:battlerText(marcy, "I can take a bit\nof thrashing,[wait:5] dad.[wait:10]\nIt's fine.", {x=marcy.x - 40, y=marcy.y - 60})
			cutscene:battlerText(marcy, "You want to prove\nyourself?", {x=marcy.x - 40, y=marcy.y - 60})
			cutscene:battlerText(marcy, "Then show me what\nyou can really do.", {x=marcy.x - 40, y=marcy.y - 60})
			Game:setFlag("marcy_training_ever_attacked", true)
			cutscene:gotoCutscene("fmarcy_spells")
        end
	elseif self.marcy.health < 1500 and not self.jamm_disarmed then
		self.jamm_disarmed = true
		return function(cutscene)
			local jamm = cutscene:getCharacter("jamm")
			local marcy = cutscene:getCharacter("fmarcy")
			if not Game:getFlag("marcy_training_ever_disarmed") then
				cutscene:battlerText(marcy, "You've got a\ndecent aim...", {x=marcy.x - 40, y=marcy.y - 60})
				cutscene:battlerText(marcy, "However,[wait:5] it's\nnot enough.", {x=marcy.x - 40, y=marcy.y - 60})
			end
			marcy:setAnimation("battle/attack")
			Assets.playSound("laz_c")
			jamm.chara.disarmed = true
			Game.battle.battle_ui.action_boxes[1].buttons[1].disabled = true
			cutscene:wait(0.6)
			jamm:setSprite("trip")
			local sling = Sprite("misc/slingshot")
			sling.x = jamm.x
			sling.y = jamm.y - jamm.height/2
			sling:setScale(2)
			sling:setOrigin(0.5)
			sling:setLayer(jamm.layer + 1)
			Game.battle:addChild(sling)
			sling.physics.gravity = 0.5
			sling.physics.speed_x = -1
			sling.physics.speed_y = -0.5
			cutscene:wait(0.5)
			marcy:setAnimation("battle/idle")
			if not Game:getFlag("marcy_training_ever_disarmed") then
				cutscene:battlerText(jamm, "What the!?", {x=jamm.x + 40, y=jamm.y - 50, right=true})
				cutscene:battlerText(marcy, "That ought to make\nthings more\ninteresting...", {x=marcy.x - 40, y=marcy.y - 60})
			else
				cutscene:battlerText(jamm, "Not again!", {x=jamm.x + 40, y=jamm.y - 50, right=true})
			end
			jamm:setAnimation("battle/idle")
			cutscene:battlerText(jamm, "I'll find it,[wait:5]\nno sweat!", {x=jamm.x + 40, y=jamm.y - 50, right=true})
			Game.battle:registerXAction("jamm", "Reach", "Grab\nslingshot")
			Game:setFlag("marcy_training_ever_disarmed", true)
        end
	elseif self.marcy.health < 300 and not self.special_ready then
		self.special_ready = true
		return function(cutscene)
			local jamm = cutscene:getCharacter("jamm")
			local marcy = cutscene:getCharacter("fmarcy")
			cutscene:battlerText(marcy, "I'm about to go\nall out, dad.", {x=marcy.x - 40, y=marcy.y - 60})
			cutscene:battlerText(marcy, "You'd better prepare.", {x=marcy.x - 40, y=marcy.y - 60})
			cutscene:gotoCutscene("fmarcy_spells")
        end
	end
	return "fmarcy_spells"
end

return Marcy
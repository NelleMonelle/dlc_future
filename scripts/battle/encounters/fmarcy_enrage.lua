local Marcy, super = Class(Encounter)

function Marcy:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = ""

    -- Battle music ("battle" is rude buster)
    self.music = "vs_susie"
    -- Enables the purple grid battle background
    self.background = true

    -- Add the dummy enemy to the encounter
    self:addEnemy("fmarcy_first")

    --- Uncomment this line to add another!
    --self:addEnemy("dummy")
	
	self.cutscenes = 0
	self.turn_count = 0
end

function Marcy:beforeStateChange(old, new)
	if new == "ACTIONSELECT" and Game.battle.turn_count == 0 and self.cutscenes < 1 then
		Game.battle:showUI()
		Game.battle.music:play(self.music)
		Game.battle.started = true
		Game.battle:startCutscene(function(cutscene)
			local susie = cutscene:getCharacter("susie")
				
			cutscene:after(function()
				Game.battle:pushAction("SPELL", nil, {data = Registry.createSpell("rage")}, 1)
				Game.battle:setState("ACTIONS")
			end)
				
			cutscene:battlerText(susie, "Man,[wait:5] I don't know\nwhat it is...", {x=susie.x + 40, y=susie.y - 50, right=true})
			cutscene:battlerText(susie, "But something about\nyou is REALLY\npissing me off.", {x=susie.x + 40, y=susie.y - 50, right=true})
			
			self.cutscenes = 1
		end)
		return true
	elseif new == "ACTIONS" and Game.battle.turn_count == 1 and self.cutscenes < 2 then
		Game.battle:startCutscene(function(cutscene)
			local fmarcy = cutscene:getCharacter("fmarcy_first")
				
			cutscene:battlerText(fmarcy, "I'm just doing my\njob.", {x=fmarcy.x - 40, y=fmarcy.y - 50})
			cutscene:battlerText(fmarcy, "You outsiders don't\nget it.", {x=fmarcy.x - 40, y=fmarcy.y - 50})
			cutscene:battlerText(fmarcy, "You never do.", {x=fmarcy.x - 40, y=fmarcy.y - 50})
			
			self.cutscenes = 2
		end)
		return true
	elseif new == "ACTIONS" and Game.battle.turn_count == 2 and self.cutscenes < 3 then
		Game.battle:startCutscene(function(cutscene)
			local fmarcy = cutscene:getCharacter("fmarcy_first")
				
			cutscene:battlerText(fmarcy, "It's for the protection\nof my people.", {x=fmarcy.x - 40, y=fmarcy.y - 50})
			cutscene:battlerText(fmarcy, "The survival of our\nworld.", {x=fmarcy.x - 40, y=fmarcy.y - 50})
			
			self.cutscenes = 3
		end)
		return true
	elseif new == "ACTIONS" and Game.battle.turn_count == 3 and self.cutscenes < 4 then
		Game.battle:startCutscene(function(cutscene)
			local fmarcy = cutscene:getCharacter("fmarcy_first")
			local susie = cutscene:getCharacter("susie")
				
			cutscene:battlerText(fmarcy, "We can't risk any\nmalintent in--", {x=fmarcy.x - 40, y=fmarcy.y - 50, auto=true})
			cutscene:battlerText(susie, "[shake:2]SHUT UP!", {x=susie.x + 40, y=susie.y - 50, right=true})
			
			self.cutscenes = 4
		end)
		return true
	elseif new == "ACTIONS" and Game.battle.turn_count == 4 and self.cutscenes < 5 then
		Game.battle:startCutscene(function(cutscene)
			local susie = cutscene:getCharacter("susie")
			cutscene:battlerText(susie, "[shake:2]I don't care who\nthis is for.", {x=susie.x + 40, y=susie.y - 50, right=true})
			cutscene:battlerText(susie, "[shake:2]I don't care what\nyour game is.", {x=susie.x + 40, y=susie.y - 50, right=true})
			cutscene:battlerText(susie, "[shake:2]My friend is\nin critical\ncondition.", {x=susie.x + 40, y=susie.y - 50, right=true})
			cutscene:battlerText(susie, "[shake:2]And it's all\nyour fault.", {x=susie.x + 40, y=susie.y - 50, right=true})
			
			self.cutscenes = 5
		end)
	elseif new == "ACTIONS" and Game.battle.turn_count == 5 then
		Game.battle:startCutscene(function(cutscene)
			local susie = cutscene:getCharacter("susie")
			cutscene:battlerText(susie, "[shake:2]So stand still...", {x=susie.x + 40, y=susie.y - 50, right=true})
			cutscene:battlerText(susie, "[shake:2]And just...", {x=susie.x + 40, y=susie.y - 50, right=true})
			cutscene:battlerText(susie, "[shake:2]JUST DI--", {x=susie.x + 40, y=susie.y - 50, right=true, auto=true})
			
			Game.world.player:setSprite("battle_serious/idle_2")
			Game.world:getEvent(14):resetSprite()
			Assets.playSound("noise")
			Game.world:getEvent(14).x = Game.world.player.x - 80
			Game.world:getEvent(14).y = Game.world.player.y
			Game.world:getEvent(13).x = Game.world.player.x - 140
			Game.world:getEvent(13).y = Game.world.player.y
			Game.world.music.volume = 0
			Game.battle:returnToWorld()
		end)
		return true
	else
		super.beforeStateChange(self, old, new)
	end
end

return Marcy
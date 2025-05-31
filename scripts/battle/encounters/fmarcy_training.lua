local Marcy, super = Class(Encounter)

function Marcy:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "* Let the sparring commence!"

    -- Battle music ("battle" is rude buster)
    self.music = "battle"
    -- Enables the purple grid battle background
    self.background = true

    -- Add the dummy enemy to the encounter
    self:addEnemy("fmarcy")

    --- Uncomment this line to add another!
    --self:addEnemy("dummy")
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
        end
	end
end

return Marcy
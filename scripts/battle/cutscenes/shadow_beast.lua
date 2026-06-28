return {
    ---@param cutscene BattleCutscene
    skilled_phase_transition = function(cutscene, encounter)
        local susie = Game.battle.party[1]
        local variant = Game.battle.party[2]
		
		cutscene:text("* TODO: Shadow beast screaming and smoke")
		
		cutscene:battlerText(susie, "H-hey,[wait:5] wait![wait:10]\nWhat is it...[wait:8]\ndoing...?", {x=susie.x + 40, y=susie.y - 50, right=true})
		cutscene:battlerText(susie, "[voice:noelle]It's trying to\ntake us with\nit...", {x=susie.x - 70, y=susie.y - 50, right=true})
		if variant.chara.id == "ceroba" then
			cutscene:battlerText(variant, "I don't think\nthat smoke is\nsafe to breathe...", {x=variant.x + 40, y=variant.y - 50, right=true})
		end
		cutscene:battlerText(susie, "Then we can't\nlet it touch\nus!", {x=susie.x + 40, y=susie.y - 50, right=true})
		cutscene:battlerText(susie, "If only we could\nclear out the\nsmoke...", {x=susie.x + 40, y=susie.y - 50, right=true})
		
		cutscene:text("* Susie's SOUL resonates with the smoke...[wait:10]\n* Susie can now PURIFY!")
		
		encounter.phase = 2
		encounter.smoke_active = true
		
		Game.battle:registerXAction("susie", "Purify", "Clear\nSmoke", 50)
    end,
}
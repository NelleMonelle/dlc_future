return {
    ---@param cutscene BattleCutscene
    skilled_phase_transition = function(cutscene, encounter)
        local hadrian = cutscene:getCharacter("neo_knight")
		
		-- cutscene:after(function()
			-- Game.battle.current_selecting = 1
			-- Game.battle:setState("ACTIONSELECT")
		-- end, true)
		
		Game.battle.music:fade(0, 1)
		
		cutscene:battlerText(hadrian, "Enough.", {x=hadrian.x - 40, y=hadrian.y - 50})
		cutscene:battlerText(hadrian, "Enough with your fighting.", {x=hadrian.x - 40, y=hadrian.y - 50})
		cutscene:battlerText(hadrian, "I must fulfill their mission.", {x=hadrian.x - 40, y=hadrian.y - 50})
		cutscene:battlerText(hadrian, "I must... can't...", {x=hadrian.x - 40, y=hadrian.y - 50})
		cutscene:battlerText(hadrian, "I can't let you stop me!", {x=hadrian.x - 40, y=hadrian.y - 50})
		
		cutscene:wait(1)
		
		local rect = Rectangle(-50, -50, 740, 580)
		rect:setColor(1, 0, 0, 1)
		Game.battle:addChild(rect)
		rect:setLayer(BATTLE_LAYERS["above_ui"])
		
		local hurt_sprites = {}
		for _,battler in ipairs(Game.battle.party) do
			local hs = Sprite(battler.actor:getSpritePath() .. "/battle/hurt")
			hs:setOrigin(0.5, 1)
			hs:setScale(2)
			hs.x = battler.x
			hs.y = battler.y
			hs:addFX(RecolorFX(0,0,0,1))
			Game.battle:addChild(hs)
			table.insert(hurt_sprites, hs)
			hs:setLayer(BATTLE_LAYERS["above_ui"] + 1)
		end
		
		local rect2 = Rectangle(hurt_sprites[1].x, 0, 10, 580)
		rect2:setOrigin(0.5, 0)
		rect2:setColor(0, 0, 0, 1)
		Game.battle:addChild(rect2)
		rect2:setLayer(BATTLE_LAYERS["above_ui"] + 2)
		
		Assets.playSound("knight_cut2")
		Game.battle.timer:tween(0.1, rect2, {width = 40})
		cutscene:wait(0.1)
		Game.battle.timer:tween(0.6, rect2, {width = 0}, "out-cubic")
		cutscene:wait(0.8)
		
		rect:remove()
		rect2:remove()
		for i=#hurt_sprites, 1, -1 do
			hurt_sprites[i]:remove()
		end
		
		for _,battler in ipairs(Game.battle.party) do
			battler:fakeSwoon()
		end
		
		Assets.playSound("t_down")
		
		cutscene:wait(1)
		
		cutscene:battlerText(hadrian, "Do you even realize what\nyou're doing here?", {x=hadrian.x - 40, y=hadrian.y - 50})
		cutscene:battlerText(hadrian, "This world,[wait:5] which has now\nbecome our hell...", {x=hadrian.x - 40, y=hadrian.y - 50})
		cutscene:battlerText(hadrian, "It won't change if we\nstand idle.", {x=hadrian.x - 40, y=hadrian.y - 50})
		
        local fmarcy = Game.battle.party[1]
        local fnoelle = Game.battle.party[2]
        local fvariable = Game.battle.party[3]
		
		Game:setPartyMembers("susie", "jamm", Game:getFlag("third_party_member_future", "ceroba"))
		
		Game.battle.party[1] = PartyBattler(Game.party[1], -30, fmarcy.y)
		Game.battle.party[2] = PartyBattler(Game.party[2], -30, fnoelle.y)
		Game.battle.party[3] = PartyBattler(Game.party[3], -30, fvariable.y)
		Game.battle:addChild(Game.battle.party[1])
		Game.battle:addChild(Game.battle.party[2])
		Game.battle:addChild(Game.battle.party[3])
		
		Game.battle.party[1]:setAnimation({"walk/right", 1/4, true})
		Game.battle.party[2]:setAnimation({"walk/right", 1/4, true})
		Game.battle.party[3]:setAnimation({"walk/right", 1/4, true})
		Game.battle.timer:tween(0.6, Game.battle.party[1], {x = fmarcy.x})
		Game.battle.timer:tween(0.6, Game.battle.party[2], {x = fnoelle.x})
		Game.battle.timer:tween(0.6, Game.battle.party[3], {x = fvariable.x})
		cutscene:wait(0.6)
		
		for i=1, 3 do
			local box = Game.battle.battle_ui.action_boxes[i]
            box.battler = Game.battle.party[i]
            box:createButtons()
            if box.battler.chara:getNameSprite() then
                if not box.name_sprite then
                    box.name_sprite = Sprite(box.battler.chara:getNameSprite(), 51 + box.name_offset_x, 14 + box.name_offset_y)
                    box.box:addChild(box.name_sprite)
                end
                box.name_sprite:setSprite(box.battler.chara:getNameSprite())
            elseif box.name_sprite then
                box.name_sprite:remove()
                box.name_sprite = nil
            end
		end
		
		Game.battle.party[1]:setAnimation("battle/attack")
		Game.battle.party[2]:setAnimation("battle/attack")
		Game.battle.party[3]:setAnimation("battle/attack")
		
		Assets.playSound("laz_c")
		
		Game.battle.timer:tween(0.6, fmarcy, {x = fmarcy.x - 80}, "out-sine")
		Game.battle.timer:tween(0.6, fnoelle, {x = fnoelle.x - 80}, "out-sine")
		Game.battle.timer:tween(0.6, fvariable, {x = fvariable.x - 80}, "out-sine")
		cutscene:wait(1)
		
		local susie = cutscene:getCharacter("susie")
		local jamm = cutscene:getCharacter("jamm")
		
		cutscene:battlerText(hadrian, "I take down your\nstrongest warriors,[wait:5]\nand yet...", {x=hadrian.x - 40, y=hadrian.y - 50})
		
		Game.battle.party[1]:setAnimation("battle/idle")
		Game.battle.party[2]:setAnimation("battle/idle")
		Game.battle.party[3]:setAnimation("battle/idle")
		
		cutscene:battlerText(susie, "You still have to\ngo through us.", {x=susie.x + 40, y=susie.y - 50, right=true})
		cutscene:battlerText(jamm, "Hadrian,[wait:5] we can't\nlet you go past.", {x=jamm.x + 40, y=jamm.y - 50, right=true})
		cutscene:battlerText(jamm, "If you do,[wait:5] our world\nwill...", {x=jamm.x + 40, y=jamm.y - 50, right=true})
		
		cutscene:battlerText(hadrian, "Very well then...", {x=hadrian.x - 40, y=hadrian.y - 50})
		cutscene:battlerText(hadrian, "Let it be so.", {x=hadrian.x - 40, y=hadrian.y - 50})
		
		Game.battle.enemies[1].just_weakened = true
		encounter.phase = 2
		
		Game.battle:registerXAction("susie", "Check")
		
		Game.battle.music:play(encounter.music, 1, 1)
    end,
	
    ---@param cutscene BattleCutscene
    lol_skill_issue = function(cutscene, encounter)
        local hadrian = cutscene:getCharacter("neo_knight")
		
		cutscene:after(function()
			Game.battle:setState("ACTIONSELECT")
		end)
		
		cutscene:battlerText(hadrian, "...That takes care of that.", {x=hadrian.x - 40, y=hadrian.y - 50})
		
		local fmarcy = Game.battle.party[1]
        local fnoelle = Game.battle.party[2]
        local fvariable = Game.battle.party[3]
		
		Game:setPartyMembers("susie", "jamm", Game:getFlag("third_party_member_future", "ceroba"))
		
		Game.battle.party[1] = PartyBattler(Game.party[1], -30, fmarcy.y)
		Game.battle.party[2] = PartyBattler(Game.party[2], -30, fnoelle.y)
		Game.battle.party[3] = PartyBattler(Game.party[3], -30, fvariable.y)
		Game.battle:addChild(Game.battle.party[1])
		Game.battle:addChild(Game.battle.party[2])
		Game.battle:addChild(Game.battle.party[3])
		
		Game.battle.party[1]:setAnimation({"walk/right", 1/4, true})
		Game.battle.party[2]:setAnimation({"walk/right", 1/4, true})
		Game.battle.party[3]:setAnimation({"walk/right", 1/4, true})
		Game.battle.timer:tween(0.6, Game.battle.party[1], {x = fmarcy.x})
		Game.battle.timer:tween(0.6, Game.battle.party[2], {x = fnoelle.x})
		Game.battle.timer:tween(0.6, Game.battle.party[3], {x = fvariable.x})
		cutscene:wait(0.6)
		
		for i=1, 3 do
			local box = Game.battle.battle_ui.action_boxes[i]
            box.battler = Game.battle.party[i]
            box:createButtons()
            if box.battler.chara:getNameSprite() then
                if not box.name_sprite then
                    box.name_sprite = Sprite(box.battler.chara:getNameSprite(), 51 + box.name_offset_x, 14 + box.name_offset_y)
                    box.box:addChild(box.name_sprite)
                end
                box.name_sprite:setSprite(box.battler.chara:getNameSprite())
            elseif box.name_sprite then
                box.name_sprite:remove()
                box.name_sprite = nil
            end
		end
		
		Game.battle.party[1]:setAnimation("battle/attack")
		Game.battle.party[2]:setAnimation("battle/attack")
		Game.battle.party[3]:setAnimation("battle/attack")
		
		Assets.playSound("laz_c")
		
		Game.battle.timer:tween(0.6, fmarcy, {x = fmarcy.x - 80}, "out-sine")
		Game.battle.timer:tween(0.6, fnoelle, {x = fnoelle.x - 80}, "out-sine")
		Game.battle.timer:tween(0.6, fvariable, {x = fvariable.x - 80}, "out-sine")
		cutscene:wait(1)
		
		local susie = cutscene:getCharacter("susie")
		local jamm = cutscene:getCharacter("jamm")
		
		cutscene:battlerText(hadrian, "I take down your\nstrongest warriors,[wait:5]\nand yet...", {x=hadrian.x - 40, y=hadrian.y - 50})
		
		Game.battle.party[1]:setAnimation("battle/idle")
		Game.battle.party[2]:setAnimation("battle/idle")
		Game.battle.party[3]:setAnimation("battle/idle")
		
		cutscene:battlerText(susie, "You still have to\ngo through us.", {x=susie.x + 40, y=susie.y - 50, right=true})
		cutscene:battlerText(jamm, "Hadrian,[wait:5] we can't\nlet you go past.", {x=jamm.x + 40, y=jamm.y - 50, right=true})
		cutscene:battlerText(jamm, "If you do,[wait:5] our world\nwill...", {x=jamm.x + 40, y=jamm.y - 50, right=true})
		
		cutscene:battlerText(hadrian, "Very well then...", {x=hadrian.x - 40, y=hadrian.y - 50})
		cutscene:battlerText(hadrian, "Let it be so.", {x=hadrian.x - 40, y=hadrian.y - 50})
		
		Game.battle.enemies[1].just_weakened = true
		encounter.phase = 2
		
		Game.battle:registerXAction("susie", "Check")
		
		Game.battle.music:play(encounter.music, 1, 1)
    end,
	
}
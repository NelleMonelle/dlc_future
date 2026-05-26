return function(cutscene, battler, enemy)
    if Game.battle.enemy_tension_bar:getTension() >= 70 and Game.battle.enemies[1].health < 1400 then
		Game.battle.enemies[1]:setAnimation("battle/spell")
		Game.battle.enemy_tension_bar:removeTension(70)
		cutscene:text("* Marcy used V-SLASH![wait:10]\n* Taken damage will heal her this turn.")
		Game.battle.enemy_v_slash = true
		Game.battle.enemies[1]:setAnimation("battle/idle")
	elseif Game.battle.enemy_tension_bar:getTension() >= 64 then
		Game.battle.enemies[1]:setAnimation("battle/spell")
		Game.battle.enemy_tension_bar:removeTension(64)
		cutscene:text("* Marcy used ULTRA BREAK![wait:10]\n* Hits will break your defenses.")
		Game.battle.enemy_ultra_break = true
		Game.battle.enemies[1]:setAnimation("battle/idle")
    end
end
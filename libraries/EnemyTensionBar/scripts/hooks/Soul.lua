local Soul, super = HookSystem.hookScript(Soul)

function Soul:onGraze(bullet, old_graze)
    if Kristal.getLibConfig("enemy_tension_bar", "grazing_tp") then
        if old_graze then
            if Game.battle.enemy_tension_bar and Game.battle.enemy_tension_bar.shown then
                Game.battle.enemy_tension_bar:giveTension(bullet:getGrazeTension() * DT * self.graze_tp_factor)
            end
        else
            if Game.battle.enemy_tension_bar and Game.battle.enemy_tension_bar.shown then
                Game.battle.enemy_tension_bar:giveTension(bullet:getGrazeTension() * self.graze_tp_factor)
            end
        end
    end
    
    super.onGraze(self, bullet, old_graze)
end

return Soul
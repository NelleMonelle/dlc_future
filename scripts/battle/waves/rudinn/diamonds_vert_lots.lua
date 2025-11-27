local DiamondsUpLots, super = Class(Wave)

function DiamondsUpLots:init()
	super.init(self)
	
	self.time = 7
end

function DiamondsUpLots:onStart()
    self.timer:every(4/15, function()
        local x = MathUtils.random(Game.battle.arena.left, Game.battle.arena.right)
        local y = MathUtils.random(Game.battle.arena.bottom + 50, Game.battle.arena.bottom + 100)

        self:spawnBullet("rudinn/diamond_mix", x, y, math.rad(270))
        x = MathUtils.random(Game.battle.arena.left, Game.battle.arena.right)
        y = MathUtils.random(Game.battle.arena.top - 50, Game.battle.arena.top - 100)

        self:spawnBullet("rudinn/diamond_mix", x, y, math.rad(90))
    end)
end

return DiamondsUpLots
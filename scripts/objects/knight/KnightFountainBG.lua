local KnightFountainBG, super = Class(Object)

function KnightFountainBG:init()
    super.init(self)

    self.siner = 0
    self.color = {39/255, 41/255, 63/255}
    self.battleprog = 0
    self.alphafactor = 0

    self.oceanspeed = 1
    self.death = 0
    Game.battle.timer:tween(6, self, {alphafactor = 1})
	
    self.knight = Game.battle:getEnemyBattler("knight")
end

function KnightFountainBG:draw()
    super.draw(self)

    if Game.battle.encounter.background then
        love.graphics.setColor(0, 0, 0, 1)
        Draw.rectangle("fill", -20, -20, SCREEN_WIDTH + 40, SCREEN_HEIGHT + 40)
    end

    local shakex, shakey = 0, 0

    self.siner = self.siner + DTMULT
	
    if self.knight then
        self.battleprog = 1 - (((self.knight.health - (self.knight.max_health * 0.8)) / self.knight.max_health) * 5)
    end

    self.oceanspeed = 1
    if self.battleprog >= 0.65 then
        self.oceanspeed = 2
    end
	
    local function fcolor(h, s, v)
        self.hue = (h / 255) % 1
        return Utils.hsvToRgb((h / 255) % 1, s / 255, v / 255)
    end

    local desicolor = {fcolor(127.5 + ((math.sin(self.siner / 90) * 255) / 2), 255, 255)}

    love.graphics.setColor(0.5, 0, 0.5, (0.5 * self.alphafactor * (self.battleprog + 0.3)))
    Draw.drawWrapped(Assets.getTexture("battle/bg/knight/fountain"), true, true, shakex - (self.siner * self.oceanspeed), shakey + (self.siner * self.oceanspeed), 0, 2, 2)
    love.graphics.setColor(0.5, 0, 0.5, (0.35 * self.alphafactor * (self.battleprog + 0.2)))
    Draw.drawWrapped(Assets.getTexture("battle/bg/knight/fountain"), true, true, shakex - ((self.siner * self.oceanspeed) / 2), shakey - ((self.siner * self.oceanspeed) / 2), 0, 2, 2)

    love.graphics.setColor(0, 0, 0, self.alphafactor)
    Draw.draw(Assets.getTexture("battle/bg/knight/gradient"), shakex, shakey + 90, 0, 2, 2.05)

    love.graphics.setColor(0, 0, 0, 1)
    Draw.rectangle("fill", shakex - 40, shakey + 0, 720, 90)

    self.color = Utils.mergeColor({39/255, 41/255, 63/255}, desicolor, self.battleprog / 2)

    local r, g, b = Utils.mergeColor(self.color, COLORS.black, 0.8)
    love.graphics.setColor(r, g, b, 1 * self.alphafactor)
    Draw.rectangle("fill", (shakex + 138) + 50, shakey + 0, 240, 90)

    local fountain = Assets.getFrames("battle/bg/knight/cc_fountainbg_white")
    local frame = math.floor(self.siner/10) % #fountain + 1
    for i = 1, 3-1 do
        love.graphics.setColor(self.color[1], self.color[2], self.color[3], (i / 12) * self.alphafactor)
        Draw.draw(fountain[frame], ((shakex + 138) - math.sin(self.siner / 20) * (i * 12)), shakey + 0, 0, 2, 2)
        Draw.draw(fountain[frame], ((shakex + 138) - math.sin(self.siner / 13) * (i * 6)), shakey + 0, 0, 2, 2)
    end
	
    love.graphics.setColor(self.color[1], self.color[2], self.color[3], 1)
    Draw.draw(fountain[frame], shakex + 138, shakey + 0, 0, 2, 2)
end

return KnightFountainBG
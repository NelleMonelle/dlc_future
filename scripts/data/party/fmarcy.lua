local character, super = Class(PartyMember, "fmarcy")

function character:init()
    super.init(self)

    self.name = "Marcy"

    self:setActor("fmarcy")

    self.level = 19
    self.title = "Light Slasher\nEmpty attacker who\ndeals heavy damage"

    self.soul_priority = 1
    self.soul_color = {39/255, 106/255, 179/255}
    self.has_spells = true

    self.has_xact = false
    self.xact_name = "M-Action"

    self.health = 1800

    self.stats = {
        health = 1800,
        attack = 100,
        defense = 20,
        magic = 30
    }

    self.weapon_icon = "ui/menu/equip/sword"

    self:setWeapon("liberator")
	
	self:addSpell("true_slash")

    self.lw_weapon_default = "light/rope_sling"
    self.lw_armor_default = "light/bandage"

    self.color = {0, 0, 1}
    self.dmg_color = nil
    self.attack_bar_color = {0, 0, 0.5}
    self.attack_box_color = {39/255, 106/255, 179/255}
    self.xact_color = nil

    self.menu_icon = "party/future_marcy/head"
    self.head_icons = "party/future_marcy/icon"
    self.name_sprite = "party/future_marcy/name"

    self.battle_offset = {2, 1}
    self.head_icon_offset = {0, -3}
    self.menu_icon_offset = nil
end

function character:onLevelUp(level)
    self:increaseStat("health", 10)
    if level % 10 == 0 then
        self:increaseStat("attack", 4)
    end
end

function character:onLevelUpLVLib(level)
    self:increaseStat("health", 50)
    self:increaseStat("attack", 5)
    self:increaseStat("defense", 3)
    self:increaseStat("magic", 2)
end

function character:drawPowerStat(index, x, y, menu)
    if index == 1  then
        local icon = Assets.getTexture("ui/menu/icon/demon")
        love.graphics.draw(icon, x-26, y+6, 0, 2, 2)
        love.graphics.print("Heart", x, y, 0, 0.7, 1)
        love.graphics.print("No", x+130, y)
        return true
    elseif index == 2 then
        local icon = Assets.getTexture("ui/menu/icon/magic")
        love.graphics.draw(icon, x-26, y+6, 0, 2, 2)
        love.graphics.print("Years Alone", x, y)
        love.graphics.print("10", x+130, y, 0)
        return true
    elseif index == 3 then
        local icon = Assets.getTexture("ui/menu/icon/fire")
        love.graphics.draw(icon, x-26, y+6, 0, 2, 2)
        love.graphics.print("Guts:", x, y)

        love.graphics.draw(icon, x+90, y+6, 0, 2, 2)
        love.graphics.print("x", x+111, y)
        love.graphics.print("14", x+122, y+3)
        
        return true
    end
end

return character

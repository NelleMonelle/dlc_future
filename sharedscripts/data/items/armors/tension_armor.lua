local item, super = Class(Item, "tension_armor")

function item:init()
    super.init(self)

    -- Display name
    self.name = "TensionArmor"

    -- Item type (item, key, weapon, armor)
    self.type = "armor"
    -- Item icon (for equipment)
    self.icon = "ui/menu/icon/armor"

    -- Battle description
    self.effect = ""
    -- Shop description
    self.shop = ""
    -- Menu description
    self.description = "A bronze chestplate that glows gold with the tension of the battle."

    -- Shop buy price
    self.buy_price = 0
    -- Shop sell price (set to nil)
    self.sell_price = nil

    -- Consumable target mode (party, enemy, noselect, or none/nil)
    self.target = nil
    -- Where this item can be used (world, battle, all, or none/nil)
    self.usable_in = "all"
    -- Item this item will get turned into when consumed
    self.result_item = nil
    -- Will this item be instantly consumed in battles?
    self.instant = false

    -- Equip bonuses (for weapons and armor)
    self.bonuses = {
        defense = 4,
    }
	
    -- Bonus name and icon (displayed in equip menu)
    self.bonus_name = "Tension DEF"
    self.bonus_icon = "ui/menu/icon/up"

    -- Equippable characters (default true for armors, false for weapons)
    self.can_equip = {}

    -- Character reactions
    self.reactions = {
        jamm = "Gotta graze a lot, huh...",
        fmarcy = "It's difficult to wear...",
	}
end

function item:getStatBonus(stat)
	if stat == "defense" then
		return math.floor(Game.tension/10)
	end
	return super.getStatBonus(self, stat)
end

return item
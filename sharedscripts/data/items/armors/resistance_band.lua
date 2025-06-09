local item, super = Class(Item, "resistance_band")

function item:init()
    super.init(self)

    -- Display name
    self.name = "ResistBand"

    -- Item type (item, key, weapon, armor)
    self.type = "armor"
    -- Item icon (for equipment)
    self.icon = "ui/menu/icon/armor"

    -- Battle description
    self.effect = ""
    -- Shop description
    self.shop = ""
    -- Menu description
    self.description = "A headband with Resistance insignia.\nHeavily decreases Resistance type damage."

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
        defense = 5,
    }
	
    -- Bonus name and icon (displayed in equip menu)
    self.bonus_name = "R. Damage DOWN"
    self.bonus_icon = "down"

    -- Equippable characters (default true for armors, false for weapons)
    self.can_equip = {}

    -- Character reactions
    self.reactions = {
        jamm = "Remember what they're fighting for...",
        susie = "(It's my fault they...)",
        fmarcy = "I fight for my people.",
		ceroba = "This symbol...",
	}
end

function item:getReactions()
	if not Game:getFlag("future_chase_one") then
		return {
			jamm = "Y-you're giving it to me!?",
			susie = "It's kinda cool, I guess...",
			ceroba = "What's this smell on it...?",
		}
	end
	return self.reactions
end

return item
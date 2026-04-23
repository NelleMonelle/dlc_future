local item, super = Class(Item, "duskreaver")

function item:init()
    super.init(self)

    -- Display name
    self.name = "Duskreaver"

    -- Item type (item, key, weapon, armor)
    self.type = "weapon"
    -- Item icon (for equipment)
    self.icon = "ui/menu/icon/sword"

    -- Battle description
    self.effect = ""
    -- Shop description
    self.shop = ""
    -- Menu description
    self.description = "A powerful blade, weakened by defeat.\nStill holds great power."

    -- Default shop price (sell price is halved)
    self.price = 300
    -- Whether the item can be sold
    self.can_sell = false

    -- Consumable target mode (ally, party, enemy, enemies, or none)
    self.target = "none"
    -- Where this item can be used (world, battle, all, or none)
    self.usable_in = "all"
    -- Item this item will get turned into when consumed
    self.result_item = nil
    -- Will this item be instantly consumed in battles?
    self.instant = false

    -- Equip bonuses (for weapons and armor)
    self.bonuses = {
        attack = 16,
    }
	
	self.bonus_name = "BlackHeart"
    self.bonus_icon = "ui/menu/icon/shard"

    -- Equippable characters (default true for armors, false for weapons)
    self.can_equip = {
        kris = true,
        hero = true,
    }

    -- Character reactions
    self.reactions = {
        susie = "It's pretty long...",
        jamm = "I can't keep it up...!"
    }
end

return item
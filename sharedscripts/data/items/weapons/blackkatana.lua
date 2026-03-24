local item, super = Class(Item, "blackkatana")

function item:init()
    super.init(self)

    -- Display name
    self.name = "BlackKatana"

    -- Item type (item, key, weapon, armor)
    self.type = "weapon"
    -- Item icon (for equipment)
    self.icon = "ui/menu/icon/katana"

    -- Battle description
    self.effect = ""
    -- Shop description
    self.shop = "Dark\nSwings"
    -- Menu description
    self.description = "A katana with a BlackShard embedded in the blade collar."

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
	
	self.bonus_name = "SlayDark"
    self.bonus_icon = "ui/menu/icon/shard"

    -- Equippable characters (default true for armors, false for weapons)
    self.can_equip = {
        ceroba = true,
    }

    -- Character reactions
    self.reactions = {
        susie = "Don't want to break it. Let Ceroba have it.",
        jamm = "Not a good idea. It's Ceroba's anyways."
    }
end

return item
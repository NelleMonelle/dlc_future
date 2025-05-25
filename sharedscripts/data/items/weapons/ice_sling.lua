local item, super = Class(Item, "ice_sling")

function item:init()
    super.init(self)

    -- Display name
    self.name = "Ice Sling"

    -- Item type (item, key, weapon, armor)
    self.type = "weapon"
    -- Item icon (for equipment)
    self.icon = "ui/menu/icon/sling"

    -- Battle description
    self.effect = ""
    -- Shop description
    self.shop = "Cold\nShots"
    -- Menu description
    self.description = "An ice-blue slingshot that is cold to the touch\nbut really powerful."

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
        attack = 6,
    }

    -- Equippable characters (default true for armors, false for weapons)
    self.can_equip = {
        jamm = true,
    }

    -- Character reactions
    self.reactions = {
        jamm = "I feel the cold through my gloves...!"
    }
end

return item
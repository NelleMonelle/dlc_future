local item, super = Class(Item, "liberator")

function item:init()
    super.init(self)

    -- Display name
    self.name = "Liberator"

    -- Item type (item, key, weapon, armor)
    self.type = "weapon"
    -- Item icon (for equipment)
    self.icon = "ui/menu/icon/axe"

    -- Battle description
    self.effect = ""
    -- Shop description
    self.shop = "Last\nStand"
    -- Menu description
    self.description = "A fire-red scythe forged to seek the liberation\nof its people."

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
        attack = 30,
    }

    -- Equippable characters (default true for armors, false for weapons)
    self.can_equip = {
        fmarcy = true,
    }

    -- Character reactions
    self.reactions = {
        susie = "I mean, as cool as this is...",
        jamm = "It's my daughter's... I can't."
    }
end

return item
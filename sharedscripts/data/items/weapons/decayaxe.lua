local item, super = Class(Item, "decayaxe")

function item:init()
    super.init(self)

    -- Display name
    self.name = "DecayAxe"

    -- Item type (item, key, weapon, armor)
    self.type = "weapon"
    -- Item icon (for equipment)
    self.icon = "ui/menu/icon/axe"

    -- Battle description
    self.effect = ""
    -- Shop description
    self.shop = "Seems\broken"
    -- Menu description
    self.description = "It may be tough, but remember to sharpen it before battle!"

    -- Default shop price (sell price is halved)
    self.price = 40
    -- Whether the item can be sold
    self.can_sell = true

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
        attack = 18,
    }
    -- Bonus name and icon (displayed in equip menu)
    self.bonus_name = "Decay"
    self.bonus_icon = "ui/menu/icon/down"

    -- Equippable characters (default true for armors, false for weapons)
    self.can_equip = {
        susie = true,
    }

    -- Character reactions
    self.reactions = {
        susie = "Maybe I can give it a few more battles.",
        ralsei = "It's breaking as I speak!",
        noelle = "Oops! I... Oh wait, it does that?",
        jamm = "How do I reattach the head...?",
    }
end

return item
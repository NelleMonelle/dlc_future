local item, super = Class(Item, "unityblade")

function item:init()
    super.init(self)

    -- Display name
    self.name = "UnityBlade"

    -- Item type (item, key, weapon, armor)
    self.type = "weapon"
    -- Item icon (for equipment)
    self.icon = "ui/menu/icon/katana"

    -- Battle description
    self.effect = ""
    -- Shop description
    self.shop = ""
    -- Menu description
    self.description = "A golden katana that resonates with all but its user."

    -- Default shop price (sell price is halved)
    self.price = 200
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
        attack = 6,
    }
    -- Bonus name and icon (displayed in equip menu)
    self.bonus_name = "Teamwork"
    self.bonus_icon = "ui/menu/icon/up"

    -- Equippable characters (default true for armors, false for weapons)
    self.can_equip = {
        ceroba = true,
    }

    -- Character reactions
    self.reactions = {
        susie = "Doesn't look very strong...",
        ralsei = "That's a lot of blade...!",
        noelle = "(Why is it golden?)",
        jamm = "Such a short handle, huh...",
    }
end

function item:getStatBonus(stat)
	if Game.battle and stat == "attack" then
		local cstat = 6
		for k,v in ipairs(Game.battle.party) do
			if v.chara:getWeapon().id ~= "unityblade" and not (v.is_down or v.sleeping) then
				cstat = cstat + v.chara:getEquipmentBonus("attack")
			end
		end
		return cstat
	end
	return super.getStatBonus(self, stat)
end

return item
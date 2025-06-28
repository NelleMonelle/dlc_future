local item, super = Class(Item, "judgement")

function item:init()
    super.init(self)

    self.name = "Judgement"

    self.type = "weapon"
    self.icon = "ui/menu/icon/gun"

    self.effect = ""
    self.shop = ""
    self.description = "A holy revolver ordained by the Angel...\n... Or so Brenda says."

    self.price = 400
    self.can_sell = false

    self.target = "none"
    self.usable_in = "all"
    self.result_item = nil
    self.instant = false

    self.bonuses = {
        attack = 50,
        magic = 25,
    }

    self.can_equip = {
        fbrenda = true,
    }

    self.reactions = {
    }
end

return item
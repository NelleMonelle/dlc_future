local item, super = Class(Item, "kanakos_staff")

function item:init()
    super.init(self)

    self.name = "Kanako's Staff"

    self.type = "weapon"
    self.icon = "ui/menu/icon/staff"

    self.effect = ""
    self.shop = ""
    self.description = "A powerful staff attuned to its owner that is\nused to save many lives."

    self.price = 400
    self.can_sell = false

    self.target = "none"
    self.usable_in = "all"
    self.result_item = nil
    self.instant = false

    self.bonuses = {
        attack = 10,
        magic = 30,
    }

    self.can_equip = {
        fkanako = true,
    }

    self.reactions = {
        ceroba = "This is my daughter's...",
        jamm = "I don't do staffs."
    }
end

return item
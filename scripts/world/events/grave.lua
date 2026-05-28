local Grave, super = Class(Event)

function Grave:init(data)
    super.init(self, data)

    self.properties = data.properties or {}

    self:setOrigin(0, 0)
    if self.properties["special"] then
        if Game:getFlag("future_variable") == "ceroba" then
            self:setSprite("world/events/graves/grave_ceroba")
        else
            self:setSprite("world/events/graves/grave_blank")
        end
    else
        self:setSprite("world/events/graves/grave_"..self.properties["sprite"])
    end

    self.collider = Hitbox(self, 0, self.height/2, self.width, self.height/2)
    self.solid = true
end

function Grave:onInteract(player, dir)
    Game.world:startCutscene(function(cutscene)
        if self.properties["sprite"] == "susie" then
            cutscene:text("* SUSIE\n* STRONG-WILLED GIRL WHO BROUGHT US HOPE")
        elseif self.properties["sprite"] == "jamm" then
            cutscene:text("* LUTHANE JAMM\n* WISE, CAREFUL, AND A HOPEFUL FATHER")
        elseif self.properties["special"] then
            -- inspired by Hometown graves
            if Game:getFlag("future_variable") == "ceroba" then
                cutscene:text("* CEROBA KETSUKANE\n* UNBREAKABLE, STUBBORN, AND A DEVOTED MOTHER")
            else
                cutscene:text("* UNKNOWN\n* MAY THE ANGEL GUIDE YOU THROUGH THE DARK")
            end
        end
    end)
end

return Grave
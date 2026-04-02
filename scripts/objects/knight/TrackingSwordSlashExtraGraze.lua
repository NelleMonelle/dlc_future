local TrackingSwordSlashExtraGraze, super = Class(Object) --this whole thing should probably be an Object instead. It's not a bullet in DR according to its parent object setting.

function TrackingSwordSlashExtraGraze:init(x, y)
    super.init(self, x, y)

    -- Add a sprite, if we provide one
    self:setSprite("battle/bullets/knight/pxwhite2", 0.25, true)
    self.collider = Hitbox(self, 0, 0, self.width, self.height)

    self:setScale(900, 7)
    self:setOriginExact(0, 1)
    self:setColor(COLORS.red)
    self:setLayer(BATTLE_LAYERS["soul"] - 1)

    self.alpha = 0
    self.timer = 0

    self.grazetpfactor = 1
    self.grazetimefactor = 1
    self.grazesizefactor = 1
    self.grazecount = 0
    self.grazetpfactor = self.grazetpfactor + ((Game:checkPartyEquipped("tensionbow") and 1 or 0) * 0.1)       -- TensionBow
    self.grazetpfactor = self.grazetpfactor + ((Game:checkPartyEquipped("lodestone") and 1 or 0) * 0.05)       -- LodeStone
    self.grazetimefactor = self.grazetimefactor + ((Game:checkPartyEquipped("silver_watch") and 1 or 0) * 0.1) -- Silver Watch

    if (self.grazetimefactor > 3) then
        self.grazetimefactor = 3
    end

    if (self.grazetpfactor > 3) then
        self.grazetpfactor = 3
    end
end

function TrackingSwordSlashExtraGraze:setSprite(texture, speed, loop, on_finished)
    if self.sprite then
        self:removeChild(self.sprite)
    end
    if texture then
        self.sprite = Sprite(texture)
        self.sprite.inherit_color = true
        self:addChild(self.sprite)

        if speed then
            self.sprite:play(speed, loop, on_finished)
        end

        self.width = self.sprite.width
        self.height = self.sprite.height

        return self.sprite
    end
end

function TrackingSwordSlashExtraGraze:update()
    local swordvortexmanager = Game.stage:getObjects(Registry.getBullet("knight/swordvortex_manager"))[1]
    local trackingswordsmanager = Game.stage:getObjects(Registry.getBullet("knight/tracking_swords_manager"))[1]

    if Game.battle.soul.inv_timer <= 0 then
        if self.collider:collidesWith(Game.stage:getObjects(Soul)) then
            local _grazetpfactor = self.grazetpfactor
            local _grazetimefactor = self.grazetimefactor
        
            if (trackingswordsmanager and trackingswordsmanager.variant == 1) then
                Game:giveTension((4 * _grazetpfactor)/2.5)
            elseif swordvortexmanager then
                Game:giveTension((4 * _grazetpfactor)/2.5)
            else
                Game:giveTension((7 * _grazetpfactor)/2.5)
            end

            local remaining_time = Game.battle.wave_length - Game.battle.wave_timer
            if remaining_time >= (10/30) then
                remaining_time = remaining_time - ((1/30) * _grazetimefactor) * DTMULT
            end

            self:remove()
        end
    end


    self.timer = self.timer + DTMULT
    if self.timer >= 3 then
        self:remove()
    end

    super.update(self)
end

function TrackingSwordSlashExtraGraze:draw()
    super.draw(self)

    if DEBUG_RENDER and self.collider then
        self.collider:drawFor(self, 0, 1, 0)
    end
end

return TrackingSwordSlashExtraGraze
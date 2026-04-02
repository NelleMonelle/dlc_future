local KnightActor, super = Class(ActorSprite)

function KnightActor:init(actor)
    super.init(self, actor)

    self.floating = true
    self.aetrail = true
	
    self.siner = 0
    self.siner2 = 0
	
    self.aetimer = 0
    self.aemaxtime = 3
	
    self.stronghurtanim = false
    self.shakex = 0
    self.hurtspriteoffx = 0
    self.hurtspriteoffy = 0
	
    self.chargeupcon = 0
    self.chargeuptimer = 0

    self.highlight = self:addFX(ColorMaskFX())
    self.highlight.color = {1, 1, 1}
    self.highlight.amount = 0
end

function KnightActor:update()
    self.draw_children_below = 0

    local chara = self.parent

    if self.visible then -- have to check for this so it doesn't create duplicates of the afterimage trail lol.
        if self.chargeupcon == 2 then
            
        end


        if self.floating == true then
            self.siner2 = self.siner2 + DTMULT
            self.y = self.init_y + ((math.cos(self.siner2/8) * 8) / 2)
        end

        if (self.aetimer > 0) then
            self.aetimer = self.aetimer - DTMULT
        else
            if self.aetrail == true then
                if (chara.alpha ~= 0 and self.chargeupcon == 0) then
                    local afterimage = SpriteAfterImage(self:getTexture(), self.x, self.y)
                    afterimage:setLayer(chara.layer - 0.1)
                    afterimage:setScale(2)
                    afterimage.alpha = 0.6
                    afterimage:fadeOutSpeedAndRemove(0.02)

                    if self.anim == "strong_hurt" then
                        afterimage.x = self.x + self.shakex + self.hurtspriteoffx
                        afterimage.y = self.y + self.hurtspriteoffy
                    end

                    afterimage.physics.speed_x = 2
                    afterimage.debug_select = false
                    afterimage:setParent(chara.parent)
                    afterimage:setScreenPos(self:getScreenPos())

                    local offset_x, offset_y = unpack(self:getOffset())
                    afterimage.x = afterimage.x + (offset_x * 2)
                    afterimage.y = afterimage.y + (offset_y * 2)
                end
            end

            self.aetimer = self.aemaxtime
        end

        if self.chargeupcon == 1 then
            self.highlight.amount = self.chargeuptimer / 10
        end
    end

    super.update(self)
end

return KnightActor
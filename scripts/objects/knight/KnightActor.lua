local KnightActor, super = Class(ActorSprite)

function KnightActor:init(actor)
    super.init(self, actor)

    self.floating = true
    self.aetrail = true
	
    self.siner = 0
    self.siner2 = 0
	
    self.aetimer = 0
    self.aemaxtime = 3
	
    self.hurttimer = 0
    self.stronghurtanim = false
    self.shakex = 0
    self.hurtspriteoffx = 0
    self.hurtspriteoffy = 0

    self.end_cutscene_version = 0
	
    self.chargeupcon = 0
    self.chargeuptimer = 0

    self.highlight = self:addFX(ColorMaskFX())
    self.highlight.color = {1, 1, 1}
    self.highlight.amount = 0

    self.warp = false
    self.warp_timer = 0
    self.warp_cache = 0
    self.warp_start = false

    self.state = 0
    self.static_timer = 0
    self.static_fx = Assets.newSound("tv_static")
    self.static_fx_looping = false
end

function KnightActor:update()
    self.draw_children_below = 0

    if self.hurttimer > 0 then
        self.hurttimer = self.hurttimer - DTMULT
    end

    local chara = self.parent

    if self.visible then -- have to check for this so it doesn't create duplicates of the afterimage trail lol.
        if self.chargeupcon == 2 then
            
        end

        if self.hurttimer > 0 then
            local num = self.end_cutscene_version == 1 and 3 or 2
            if (self.hurttimer % num) == 0 then
                self:setSprite("ball_transition_8")
            else
                self:setSprite("idle")
            end
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

    if self.warp then
        self.warp_timer = self.warp_timer + DTMULT
        if self.warp_timer == 1 then
            if self.warp_cache == 0 then
                --roaring_knight_warp_cache = new Vector2(roaring_knight.x, roaring_knight.y) -- what
            end
            self.state = 2
        elseif self.warp_timer == 31 or self.warp_timer == 56 or self.warp_timer == 69 or self.warp_timer == 82 then
            self.warp_start = true
        elseif self.warp_timer == 95 then
            self.warp = false
            self:setSprite("overworld_warp")
            self:setFrame(6)
            self.state = 3
        end
        if self.warp_start then
            self.warp_start = false
            self:setSprite("static")
            self.x = self.x + TableUtils.pick({-20, -10, 10, 20})
            self.y = self.y + TableUtils.pick({-20, -10, 10, 20})
            self.state = 2
        end
    end

    if self.state == 2 then
        self.static_timer = self.static_timer + DTMULT
        if self.static_timer == 1 then
            self.static_fx:stop()
            self.static_fx:play()
            self:setSprite("overworld_warp")
            self:setFrame(6)
        elseif self.static_timer == 2 then
            self:setFrame(7)
        elseif self.static_timer == 3 then
            self:setFrame(8)
        elseif self.static_timer == 4 then
            self:setFrame(9)
        elseif self.static_timer >= 5 and self.static_timer < 10 then
            self:setFrame(TableUtils.pick({7, 8, 9}))
        elseif self.static_timer == 10 then
            self:setFrame(7)
            self.static_fx:stop()
        elseif self.static_timer == 11 then
            self:setFrame(6)
        elseif self.static_timer == 12 then
            self:setFrame(1)
        elseif self.static_timer >= 13 then
            self.static_timer = 0
            self.state = 0
        end
        self.static_fx:setPitch(0.5 + MathUtils.random(1))

        local afterimage = SpriteAfterImage(self:getTexture(), self.x, self.y)
        afterimage:setLayer(chara.layer - 0.1)
        afterimage:setScale(2)
        afterimage.alpha = 0.5
        afterimage:fadeOutSpeedAndRemove(1/25)

        afterimage.physics.speed = 1
        afterimage.physics.direction = MathUtils.random(360)
        afterimage.debug_select = false
        afterimage:setParent(chara.parent)
        afterimage:setScreenPos(self:getScreenPos())

        local offset_x, offset_y = unpack(self:getOffset())
        afterimage.x = afterimage.x + (offset_x * 2)
        afterimage.y = afterimage.y + (offset_y * 2)
    elseif self.state == 3 then
        self.static_timer = self.static_timer + DTMULT
        if self.static_timer == 1 then
            self:setSprite("overworld_warp")
            self.static_fx_looping = true
            self.static_fx:stop()
            self.static_fx:play()
            self.static_fx:setLooping(true)
        elseif (self.static_timer % 2) == 0 then
            self:setFrame(6 + math.floor(MathUtils.random(3) + 2.8))
            self.x = TableUtils.pick({-2, -1, 0, 1, 2})
            self.y = TableUtils.pick({-2, -1, 0, 1, 2})
            for i = 1, 2 do
                local afterimage = SpriteAfterImage(self:getTexture(), self.x, self.y)
                afterimage:setScale(2)
                if i == 1 then
                    afterimage:setLayer(chara.layer - 0.1)
                    afterimage.alpha = 0.3
                else
                    afterimage:setLayer(chara.layer + 0.1)
                    afterimage.alpha = 0.5
                end
                afterimage:fadeOutSpeedAndRemove(1/25)

                afterimage.physics.speed = 1
                afterimage.physics.direction = MathUtils.random(360)
                afterimage.debug_select = false
                afterimage:setParent(chara.parent)
                afterimage:setScreenPos(self:getScreenPos())

                local offset_x, offset_y = unpack(self:getOffset())
                afterimage.x = afterimage.x + (offset_x * 2)
                afterimage.y = afterimage.y + (offset_y * 2)
            end
            if math.floor(MathUtils.random(10)) == 0 then
                self.static_fx:setPitch(0.5 + MathUtils.random(1))
            end
        end
    end

    if self.state ~= 3 and self.static_fx_looping then
        self.static_fx_looping = false
        self.static_fx:stop()
    end

    super.update(self)
end

return KnightActor
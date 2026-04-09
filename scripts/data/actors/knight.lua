local actor, super = Class(Actor, "knight")

function actor:init()
    super.init(self)

    self.name = "Knight"

    self.width = 117
    self.height = 115

    self.hitbox = {28, self.height/2 + 32, self.width-72, self.height/2 - 32}

    self.color = {1, 0, 0}

    self.flip = "right"

    self.path = "enemies/knight"
    self.default = "idle"

    self.animations = {
        ["idle"]           = {"idle", 1/25, true},
		
        ["attack"]         = {"attack_ol", 1/25, true},
        ["attack_nl"]      = {"attack_ol", 1/25, false},

        ["point"]          = {"point_ol", 1/25, false},
        ["point_end"]      = {"point_ol", 0.1, false, next="idle", frames={5,4,3,2,1}},

        ["flurry_prepare"] = {"flurry_prepare", 1/25, true},
        ["flurry"]         = {"flurry", 1/25, true},

        ["ball_fly"]       = {"ball_fly", 1/25, true},
		
		["laughing_anim"]  = {"laugh_body", 1, true},

		--unused animations in Deltarune
        ["block"]          = {"block_ol", 1/25, true},
        ["sword_glow"]     = {"sword_glow", 0.1, true},
    }

    self.offsets = {
        ["point_ol"]  = {7, 23},

        ["flurry_prepare"]  = {2, 10},
        ["flurry"]  = {2, 24},

        ["ball_fly"]  = {7, 23},
        ["arms_cross"]  = {7, 23},

        ["block_ol"]  = {14, 26},
        ["sword_glow"]  = {7, 23},
    }
end

function actor:onSpriteInit(sprite)
    sprite.anim_siner = 0
    sprite.anim_alpha = 1
end

function actor:preSpriteDraw(sprite)
    if sprite.anim ~= "laughing_anim" then
        return false
    end

    local body = Assets.getFrames(sprite:getPath("laugh_body"))
    local mouth = Assets.getFrames(sprite:getPath("laugh_mouth"))

    sprite.anim_siner = sprite.anim_siner + 0.5*DTMULT
    sprite.anim_alpha = Utils.clamp(sprite.anim_alpha + Utils.randomSign()*DTMULT, 0.6, 1)

    local frame = sprite.anim_siner

    local kristal_offset_x_dont_ask = 55
    local kristal_offset_y_dont_ask = 44

    local r, g, b, a = sprite:getColor()
    Draw.setColor(r, g, b, a)
    Draw.draw(body[(math.floor(frame*0.3)%#body)+1], sprite.x + Utils.random(-1, 1)/2, sprite.y + Utils.random(-1, 1)/2)
    Draw.setColor(r, g, b, sprite.anim_alpha)
    Draw.draw(mouth[(math.floor(frame*0.7)%#mouth)+1], sprite.x + Utils.random(-2, 2)/2 + kristal_offset_x_dont_ask, sprite.y + Utils.random(-2, 5)/2 + kristal_offset_y_dont_ask)

    for i=1,5 do
        Draw.setColor(r, g, b, -0.3 + math.sin((sprite.anim_siner + (i * 4)) / 4))
        Draw.draw(mouth[(math.floor(frame*0.7)%#mouth)+1], sprite.x + (math.sin(((sprite.anim_siner * i) + (3.32 * i)) / 32) * 20 * i) + kristal_offset_x_dont_ask, sprite.y + (math.cos(((sprite.anim_siner * i) + (i * 2.1 * i)) /49) * 20 * i) + kristal_offset_y_dont_ask)
    end

    return true
end

function actor:createSprite()
    return KnightActor(self)
end

return actor
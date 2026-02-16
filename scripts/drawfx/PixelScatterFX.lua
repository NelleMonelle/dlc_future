local PixelScatterFX, super = Class(FXBase)

function PixelScatterFX:init(options, priority)
    super.init(self, priority or 0)

    options = options or {}
    self.max_dist = options["max_dist"] or 1
    self.pixel_size = options["pixel_size"] or 1
    self.account_for_screen_pos = options["account_screen_pos"]
    self:renewShaderSeed()
    self.seed_renew_speed = options["speed"] or 15
    self.seed_renew_timer = 0
end

function PixelScatterFX:renewShaderSeed()
    self.seed = {MathUtils.random(0, 100), MathUtils.random(0, 100)}
end

---@param texture love.Canvas
function PixelScatterFX:draw(texture)
    self.seed_renew_timer = self.seed_renew_timer + DTMULT
    if self.seed_renew_speed > 0 and self.seed_renew_timer >= self.seed_renew_speed then
        self.seed_renew_timer = 0
        self:renewShaderSeed()
    end

    local x, y = self.parent:getScreenPos()

    Draw.pushShader("pixel_scatter", {
        max_dist = (type(self.max_dist) == "function") and self.max_dist() or self.max_dist,
        pixel_size = (type(self.pixel_size) == "function") and self.pixel_size() or self.pixel_size,
        seed = self.seed,
        texture_size = {texture:getDimensions()},
        screen_pos = self.account_for_screen_pos and
                    {x / SCREEN_WIDTH, y / SCREEN_HEIGHT} or
                    {0, 0}
    })
    Draw.setColor(COLORS.white)
    love.graphics.draw(texture)
    Draw.popShader()
end

return PixelScatterFX
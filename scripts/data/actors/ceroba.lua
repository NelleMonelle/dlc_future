local actor, super = HookSystem.hookScript("ceroba")

function actor:init()
    super.init(self)

    TableUtils.merge(self.offsets, {
        ["shadowed_down"] = {-1, -1},
    }, false)
end

return actor
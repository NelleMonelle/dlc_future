local Lib = {}

function Lib:init()
    TableUtils.merge(MUSIC_VOLUMES, {
        titan_spawn = 0.7,
    })
end

return Lib
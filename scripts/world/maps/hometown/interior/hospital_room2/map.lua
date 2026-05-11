local hospital_room, super = Class(Map)

function hospital_room:load()
    super.load(self)
end

function hospital_room:init(world, data)
    super.init(self, world, data)
end

function hospital_room:onEnter()
    super.onEnter(self)
    if Game:getFlag("POST_SNOWGRAVE") then
        Game.world.map:getImageLayer("room").visible = false
        if Game.world:getCharacter("susie") then
            Game.world:getCharacter("susie"):setSprite("walk_unhappy")
            Game:getPartyMember("susie"):getActor().walk_path = "walk_unhappy"
            Game:getPartyMember("susie"):getActor().run_path = "run_serious"
        end
    end
end

function hospital_room:onExit()
    super.onExit(self)
    if Game:getFlag("POST_SNOWGRAVE") then
        if Game.world:getCharacter("susie") then
            Game:getPartyMember("susie"):getActor().walk_path = "walk"
            Game:getPartyMember("susie"):getActor().run_path = "run"
        end
    end
end

return hospital_room
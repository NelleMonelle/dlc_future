local hospital_room, super = Class(Map)

function hospital_room:onEnter()
    super.onEnter(self)

    local has_fkanako_follower = false
    for _, follower in ipairs(Game.world.followers) do
        if follower.actor.id == "fkanako" then
            has_fkanako_follower = true
            break
        end
    end

    if has_fkanako_follower then
        Game.world:getCharacter("fkanako"):remove()
        local fkanako = Game.world:spawnNPC("fkanako", 624, 220, {cutscene="hometown_quests.fkanako"})
        if not Game:getFlag("fkanako_quest_completed") then
            fkanako.quest_hint = fkanako:addChild(QuestHint(fkanako.width/2, 6))
        end
    end
end

function hospital_room:onExit()
    super.onExit(self)
end

return hospital_room
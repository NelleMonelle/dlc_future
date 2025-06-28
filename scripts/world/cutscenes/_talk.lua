return {
    ---@param cutscene WorldCutscene
    main = function(cutscene, map, partyleader)
        if Game:isDessMode() or Game.world.player:getName() == "Dess" then
            cutscene:showNametag("Dess")
            if map == "cliffs_1" then
                cutscene:text("* ", "mspaint", "dess")  -- yeah erm placeholder
            elseif map == "cliffs_2" then
                cutscene:text("* ", "mspaint", "dess")  -- yeah erm placeholder
            elseif map == "cliffs_3" then
                cutscene:text("* ", "mspaint", "dess")  -- yeah erm placeholder
            elseif map == "cliffs_4" then
                cutscene:text("* ", "mspaint", "dess")  -- yeah erm placeholder
            elseif map == "cliffs_5" then
                cutscene:text("* ", "mspaint", "dess")  -- yeah erm placeholder
            elseif map == "cliffs_6" then
                cutscene:text("* ", "mspaint", "dess")  -- yeah erm placeholder
            elseif map == "cliffs_7" then
                cutscene:text("* ", "mspaint", "dess")  -- yeah erm placeholder
            elseif map == "cliffs_8" then
                cutscene:text("* ", "mspaint", "dess")  -- yeah erm placeholder
            elseif map == "cliffs_9" then
                cutscene:text("* ", "mspaint", "dess")  -- yeah erm placeholder
            elseif map == "chase_4" then
                cutscene:text("* ", "mspaint", "dess")  -- yeah erm placeholder
            elseif map == "cliffs_10" then
                cutscene:text("* ", "mspaint", "dess")  -- yeah erm placeholder
            elseif map == "main_hub" then
                cutscene:text("* ", "mspaint", "dess")  -- yeah erm placeholder
            elseif map == "hub_marketplace" then
                cutscene:text("* ", "mspaint", "dess")  -- yeah erm placeholder
            elseif map == "hub_prefountain" then
                cutscene:text("* ", "mspaint", "dess")  -- yeah erm placeholder
            elseif map == "hub_fountain" then
                cutscene:text("* ", "mspaint", "dess")  -- yeah erm placeholder
            else
                cutscene:text("* allan please add dialogue", "neutral", "dess")
            end
            cutscene:hideNametag()
        else
            if map == "cliffs_1" then
                cutscene:showNametag("Susie")
                cutscene:text("* This place reminds me of the one where I first met Lancer.", "nervous", "susie")
                cutscene:text("* He ambushed me and Kris there.", "smile", "susie")
                cutscene:text("* ...[wait:5] hopefully the same won't happen here.", "nervous_side", "susie")
                cutscene:hideNametag()
            elseif map == "cliffs_2" then
                cutscene:showNametag("Susie")
                cutscene:text("* Anyone's got a guess on what is this thing on the horizon?", "nervous", "susie")
                cutscene:showNametag("Jamm")
                cutscene:text("* Mmm[wait:5]nope.", "look_left", "jamm")
                if Game:getFlag("future_variable") == "ceroba_dw" then
                    cutscene:showNametag("Ceroba")
			        cutscene:text("* Sorry,[wait:5] I got nothing.", "dissapproving", "ceroba")
		        end
                cutscene:showNametag("Susie")
                cutscene:text("* ...[wait:5] yeah,[wait:5] same here.", "nervous_side", "susie")
                cutscene:hideNametag()
            elseif map == "cliffs_3" then
                cutscene:showNametag("Susie")
                cutscene:text("* ...", "nervous_side", "susie") -- yeah erm placeholder
                cutscene:hideNametag()
            elseif map == "cliffs_4" then
                cutscene:showNametag("Susie")
                cutscene:text("* ...", "nervous_side", "susie") -- yeah erm placeholder
                cutscene:hideNametag()
            elseif map == "cliffs_5" then
                cutscene:showNametag("Susie")
                cutscene:text("* ...", "nervous_side", "susie") -- yeah erm placeholder
                cutscene:hideNametag()
            elseif map == "cliffs_6" then
                cutscene:showNametag("Susie")
                cutscene:text("* ...", "nervous_side", "susie") -- yeah erm placeholder
                cutscene:hideNametag()
            elseif map == "cliffs_7" then
                cutscene:showNametag("Susie")
                cutscene:text("* ...", "nervous_side", "susie") -- yeah erm placeholder
                cutscene:hideNametag()
            elseif map == "cliffs_8" then
                cutscene:showNametag("Susie")
                cutscene:text("* ...", "nervous_side", "susie") -- yeah erm placeholder
                cutscene:hideNametag()
            elseif map == "cliffs_9" then
                cutscene:showNametag("Susie")
                cutscene:text("* ...", "nervous_side", "susie") -- yeah erm placeholder
                cutscene:hideNametag()
            elseif map == "chase_4" then
                cutscene:showNametag("Susie")
                cutscene:text("* ...", "nervous_side", "susie") -- yeah erm placeholder
                cutscene:hideNametag()
                elseif map == "cliffs_10" then
                cutscene:showNametag("Susie")
                cutscene:text("* ...", "nervous_side", "susie") -- yeah erm placeholder
                cutscene:hideNametag()
            elseif map == "main_hub" then
                cutscene:showNametag("Susie")
                cutscene:text("* ...", "nervous_side", "susie") -- yeah erm placeholder
                cutscene:hideNametag()
            elseif map == "hub_marketplace" then
                cutscene:showNametag("Susie")
                cutscene:text("* ...", "nervous_side", "susie") -- yeah erm placeholder
                cutscene:hideNametag()
            elseif map == "hub_prefountain" then
                cutscene:showNametag("Susie")
                cutscene:text("* ...", "nervous_side", "susie") -- yeah erm placeholder
                cutscene:hideNametag()
            elseif map == "hub_fountain" then
                cutscene:showNametag("Susie")
                cutscene:text("* ...", "nervous_side", "susie") -- yeah erm placeholder
                cutscene:hideNametag()
            else
                cutscene:text("* (But your voice echoed aimlessly.)")
            end
        end
    end,
}
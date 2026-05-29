return {
	sign_up = function(cutscene, event)
		cutscene:text("* (2F : LIVING QUARTERS)\n* (3F : EXTENDED LIVING QUARTERS! NEW!)")
    end,

	central_door = function(cutscene, event)
		cutscene:text("* (The door is locked.)")
    end,

	sign_down = function(cutscene, event)
		cutscene:text("* (BF : LIVING QUARTERS FOR BAD GUYS)")
    end,

	lancer_door = function(cutscene, event)
		cutscene:text("* What has been a door,[wait:5] now just a wall.")
    end,

	queen_door = function(cutscene, event)
		cutscene:text("* The doors are sealed shut.")
    end,

	tenna_door = function(cutscene, event)
		cutscene:text("* The doors are boarded up.")
    end,

	kris_wardrobe = function(cutscene, event)
		cutscene:text("* It's a wardrobe full of all sorts of different clothes.")
    end,

	kris_shelf = function(cutscene, event)
		cutscene:text("* It's a shelf.")
    end,

	kris_stand = function(cutscene, event)
		cutscene:text("* It's a stand.")
    end,

	kris_bed = function(cutscene, event)
		cutscene:text("* It's Kris's bed.")
		cutscene:text("* It feels incredibly soft.[wait:5] Like sleeping on a dream...")
    end,

	susie_bed = function(cutscene, event)
		cutscene:text("* It's Susie's spike bed.")
    end,

	susie_fridge = function(cutscene, event)
		cutscene:text("* It's a fridge.[wait:5] Inside are...")
		cutscene:text("* Pinecones,[wait:5] chalk,[wait:5] moss,[wait:5] jars of salsa,[wait:5]")
		cutscene:text("* Pieces of ice,[wait:5] black crumbs from the toaster,[wait:5] jawbreakers...")
		cutscene:text("* ...[wait:5] And actual food,[wait:5] too.")
    end,

	susie_shelf = function(cutscene, event)
		cutscene:text("* It's a shelf.[wait:5] A copy of the manual is still inside.")
    end,

	susie_wardrobe = function(cutscene, event)
		cutscene:text("* It's a clothes drawer full of spikey and dangerous clothing.")
		cutscene:text("* All the clothes are ripping each other up into shreds.")
    end,

	ralsei_window = function(cutscene, event)
		cutscene:text("* (The curtains are fluttering.)")
    end,
}

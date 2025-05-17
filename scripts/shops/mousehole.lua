local MouseHole, super = Class(Shop)

function MouseHole:init()
    super.init(self)
    self.encounter_text = "* But nobody came."
    self.shop_text = "* ..."
    self.leaving_text = "* ..."
    self.buy_menu_text = ""
    self.buy_confirmation_text = "Take it for\nfree?"
    self.buy_refuse_text = ""
    self.buy_text = ""
    self.buy_storage_text = ""
    self.buy_too_expensive_text = ""
    self.buy_no_space_text = ""
    self.sell_no_price_text = ""
    self.sell_menu_text = ""
    self.sell_nothing_text = ""
    self.sell_confirmation_text = ""
    self.sell_refuse_text = ""
    -- Shown when you sell something
    self.sell_text = ""
    -- Shown when you have nothing in a storage
    self.sell_no_storage_text = ""
    -- Shown when you enter the talk menu.
    self.talk_text = ""

    self.background = "ui/shop/mousehole_background"
    self.shop_music = nil
	
	self.menu_options = {
        {"Take",	"BUYMENU"		},
        {"Steal",	"STEALFROMSHOP"	},
        {"Read",	"READNOTE"		},
        {"Exit",	"LEAVE"			}
    }
	
	self.counter_money = 324
	
	self.note = {
		"* The shop is closed.",
		"* Went to try to find Wallie.",
		"* Please don't take my stuff."
	}

    self:registerItem("cheeseslice", {stock=3, price=0})
    self:registerItem("cheesepuffs", {stock=3, price=0})
    self:registerItem("mousetoken", {stock=1, price=0})
    self:registerItem("swissblade", {stock=1, price=0})
end

function MouseHole:postInit()
    super.postInit(self)
    self.background_sprite:play(5/30, true)
    -- self.shopkeeper:setLayer(SHOP_LAYERS["above_boxes"])
end

function MouseHole:startTalk(talk)
    if talk == "About Yourself" then
        self:startDialogue({"[emote:idle]* I don't know where to start...\n[wait:5]* I'm just a shopkeeper here in the ridge.", "[emote:explaining]* I mean, [wait:5]I really like seeing everything that passes through my shop.\n[wait:5]* There's always such interesting things from outsiders!", "[emote:happy]* Plus, sometimes they bring a little bit of cheese as a gift!"})
    elseif talk == "Cheese?" then
        self:startDialogue({"[emote:left]* I, [wait:5]um, [wait:5]really like cheese.\n[wait:5]* It's just the perfect food.", "[emote:explaining]* Wh-[wait:5]no, [wait:5]I'm not addicted, [wait:5]I can stop any time I want, [wait:5]alright?"})
    elseif talk == "About Wall Guardian" then
        self:setFlag("talk_2", 1)
        self:startDialogue({"[emote:left]* Wallie? [wait:5]He's a good friend of mine.\n[wait:5]* He's been here for as long as I can remember, [wait:5]even showed me around when I first got here."})
    elseif talk == "Picture Frame" then
        self:setFlag("talk_2", 2)
        self:startDialogue({"[emote:left]* Oh, [wait:5]ehehe...\n[wait:5]* I keep forgetting I put that there.", "[emote:idle]* Pay no attention to it,[wait:5] it's just..."})
    elseif talk == "Together" then
        self:startDialogue({"[emote:left]* U-us? [wait:5]No, [wait:5]we're not... [wait:5]I-I mean, [wait:5]there's not much goin' for me.", "[emote:happy]* That's all!!"})
    end
end

return MouseHole
local PartyBattler, super = Class(PartyBattler)

function PartyBattler:hurt(amount, exact, color, options)
	if self.chara.future then
		super.hurt(self, amount * Utils.random(7.2, 7.6), exact, color, options)
	else
		super.hurt(self, amount, exact, color, options)
	end
end

return PartyBattler
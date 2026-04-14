local PartyMember, super = Class(PartyMember)

function PartyMember:onTurnStart(battler)
	super.onTurnStart(self, battler)
	if battler.criticond then
		battler.crititimer = battler.crititimer - 1
		if battler.crititimer <= 0 then
			battler:succumb()
		end
	end
end

return PartyMember
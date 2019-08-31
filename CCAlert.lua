local DEBUFFS_TO_ANNOUNCE = {"Sap", "Fear", "Howl of Terror", "Freezing Trap Effect", "Polymorph", "Mind Control", "Gnomish Mind Control Cap", "Reckless Charge", "Blind", "Repentance", "Seduction", "Silence", "Counterspell", "Intimidating Shout", "Curse of Tongues", "Psychic Scream", "Tidal Charm", "Soul Burn", "Pyroclast Barrage"};

local EventHandler = function(self, event, unit)
	local spellId, spellName, spellSchool, amount, overkill, school, resisted, blocked, absorbed, critical, glancing, crushing = select(12, CombatLogGetCurrentEventInfo())
	local timestamp, type, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags = CombatLogGetCurrentEventInfo()

	if (destGUID == UnitGUID("player")) then
		if (type == "SPELL_AURA_APPLIED") then
			for k,v in pairs(DEBUFFS_TO_ANNOUNCE) do
				if (spellName == v) then
					SendChatMessage("I'm afflicted by " .. spellName .. "!", "SAY", nil);
				end
			end
		end
	end
end

local frame = CreateFrame("FRAME");
frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED");
frame:SetScript("OnEvent", EventHandler);

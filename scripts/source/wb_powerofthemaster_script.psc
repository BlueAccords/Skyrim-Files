Scriptname WB_PowerOfTheMaster_Script extends activemagiceffect  

; -----

Int Property WB_Slot Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Spell EquippedSpell = akCaster.GetEquippedSpell(WB_Slot)
	If !EquippedSpell.IsHostile()
		akCaster.DoCombatSpellApply(EquippedSpell,akTarget)
	EndIf

EndEvent

; -----
Scriptname WB_GuidedInvocation_Script extends ActiveMagicEffect  

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
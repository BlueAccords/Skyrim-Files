Scriptname WB_Backlash_Script extends ActiveMagicEffect  

; -----

ImagespaceModifier Property WB_IllusionAntimagic_Imod_Counterspell Auto
Activator Property FXEmptyActivator Auto

; -----

Spell TheSpell
ObjectReference TheBox

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.InterruptCast()
	TheBox = akTarget.PlaceAtMe(FXEmptyActivator)
	TheSpell = akTarget.GetEquippedSpell(0)
	If TheSpell
		If TheSpell.IsHostile()
			TheSpell.RemoteCast(TheBox,akCaster,akTarget)
		Else
			TheSpell.Cast(akCaster)
		EndIf
	EndIf
	TheSpell = akTarget.GetEquippedSpell(1)
	If TheSpell
		If TheSpell.IsHostile()
			TheSpell.RemoteCast(TheBox,akCaster,akTarget)
		Else
			TheSpell.Cast(akCaster)
		EndIf
	EndIf
	TheBox.Delete()

EndEvent

; -----
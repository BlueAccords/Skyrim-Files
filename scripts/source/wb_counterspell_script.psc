Scriptname WB_Counterspell_Script extends ActiveMagicEffect  

; -----

Bool Property WB_IsDualCast Auto
GlobalVariable Property WB_Illusion_Counterspell_Global_Percentage Auto
ImagespaceModifier Property WB_IllusionAntimagic_Imod_Counterspell Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	WB_IllusionAntimagic_Imod_Counterspell.Apply()
	akTarget.InterruptCast()
	Float DamageDealt = akTarget.GetAV("Magicka") * WB_Illusion_Counterspell_Global_Percentage.GetValue() / 100
	If WB_IsDualCast
		DamageDealt *= Game.GetGameSettingFloat("fMagicDualCastingEffectivenessBase")
	EndIf
	akTarget.DamageAV("Magicka",DamageDealt)

EndEvent

; -----
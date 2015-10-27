Scriptname WB_Shroudwalk_Script extends ActiveMagicEffect  

; -----

Float Property WB_UpdateRate Auto
Spell Property WB_S_I100_Shroudwalk_Spell Auto
Keyword Property MagicInvisibility Auto
GlobalVariable Property WB_Illusion_Shroudwalk_Global_BreakCount Auto

; -----

Actor TheTarget
Int NumberOfBreaks

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)
	TheTarget = akTarget
	NumberOfBreaks = 0
	CastStealth()
	RegisterForSingleUpdate(WB_UpdateRate)
EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	akTarget.DispelSpell(WB_S_I100_Shroudwalk_Spell)
EndEvent

; -----

Event OnUpdate()
	CastStealth()
	RegisterForSingleUpdate(WB_UpdateRate)
EndEvent

; -----

Function CastStealth()
	If !TheTarget.HasEffectKeyword(MagicInvisibility)
		If NumberOfBreaks <= WB_Illusion_Shroudwalk_Global_BreakCount.GetValueInt()
			WB_S_I100_Shroudwalk_Spell.Cast(TheTarget)
			NumberOfBreaks += 1
		Else
			Dispel()
		EndIf
	EndIf
EndFunction

; -----
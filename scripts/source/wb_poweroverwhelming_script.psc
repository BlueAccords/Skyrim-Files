Scriptname WB_PowerOverwhelming_Script extends activemagiceffect  

; -----

Float Property WB_ShakeStrength Auto
Float Property WB_ShakeStrengthFalloff Auto
Float Property WB_ShakeDuration Auto
ImagespaceModifier Property WB_ConjurationAtronach_Imod_PowerOverwhelmingDeath Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If WB_ShakeStrength
		akTarget.RampRumble(WB_ShakeStrength, WB_ShakeDuration, WB_ShakeStrengthFalloff)
	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	WB_ConjurationAtronach_Imod_PowerOverwhelmingDeath.Apply()
	akTarget.Kill(akCaster)

EndEvent

; -----
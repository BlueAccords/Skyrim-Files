Scriptname WB_PushAtLowHealth_Script extends ActiveMagicEffect  

; -----

Float Property WB_PushForce Auto
Bool Property WB_PushFromCaster Auto
Float Property WB_HealthThreshold Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If akTarget.GetAVPercentage("Health") <= WB_HealthThreshold
		If WB_PushFromCaster
			akCaster.PushActorAway(akTarget, WB_PushForce)
		Else
			akTarget.PushActorAway(akTarget, WB_PushForce)
		EndIf
	EndIf

EndEvent

; -----

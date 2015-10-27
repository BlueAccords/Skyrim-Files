Scriptname WB_SetToOne_Script extends ActiveMagicEffect  

; -----

Bool Property WB_Revert Auto

; -----

Float RealDamage

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	RealDamage = (akTarget.GetAV("Health") - 1)
	akTarget.DamageAV("Health", RealDamage)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	If !akTarget.IsDead() && WB_Revert
		akTarget.RestoreAV("Health",RealDamage)
	EndIf

EndEvent

; -----
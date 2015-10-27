Scriptname WB_IllusoryDPS2_Script extends activemagiceffect  

; -----

Float Property WB_Mult Auto
Float Property WB_HealFraction Auto
Float Property WB_UpdateRate Auto

; -----

Float TotalDamage
Bool DoDamage
Actor TheTarget
Actor TheCaster
Float RealDamage
Float DamageFraction

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TheTarget = akTarget
	TheCaster = akCaster

	DamageFraction = WB_Mult * WB_UpdateRate
	DoDamage = true
	TotalDamage = 0
	RegisterForUpdate(WB_UpdateRate)

EndEvent

; -----

Event OnUpdate()

	RealDamage = TheTarget.GetAV("Health") * DamageFraction
	If DoDamage
		TotalDamage += (RealDamage + 1)
		TheTarget.DamageAV("Health",RealDamage)
	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	DoDamage = false
	UnregisterForUpdate()
	Utility.Wait(0.1)
	If !akTarget.IsDead()
		akTarget.RestoreAV("Health",TotalDamage * WB_HealFraction)
	EndIf

EndEvent

; -----
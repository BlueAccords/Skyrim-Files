Scriptname WB_NoHorse_Script extends activemagiceffect  

; -----

Float Property WB_WeightDelta Auto
Float Property WB_StaminaHeal Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.ModAV("CarryWeight",WB_WeightDelta)
	RegisterForSingleUpdate(3.0)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	akTarget.ModAV("CarryWeight",-WB_WeightDelta)

EndEvent

; -----

Event OnUpdate()

	If !GetTargetActor().IsBeingRidden()
		Dispel()
	Else
		GetTargetActor().RestoreAV("Stamina",WB_StaminaHeal)
		RegisterForSingleUpdate(3.0)
	EndIf

EndEvent

; -----
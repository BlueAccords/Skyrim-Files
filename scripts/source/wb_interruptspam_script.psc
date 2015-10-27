Scriptname WB_InterruptSpam_Script extends ActiveMagicEffect  

; -----

Float Property WB_UpdateRate Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	RegisterForSingleUpdate(WB_UpdateRate)

EndEvent

; -----

Event OnUpdate()

	GetTargetActor().InterruptCast()
	RegisterForSingleUpdate(WB_UpdateRate)

EndEvent

; -----
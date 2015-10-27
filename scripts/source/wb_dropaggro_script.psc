Scriptname WB_DropAggro_Script extends ActiveMagicEffect  

; -----

Float Property WB_UpdateRate = 0.0 Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If akCaster != Game.GetPlayer()
		akCaster.StopCombat()
	EndIf
	akTarget.StopCombat()
	If WB_UpdateRate != 0.0
		RegisterForSingleUpdate(WB_UpdateRate)
	EndIf

EndEvent

; -----

Event OnUpdate()

	If GetCasterActor() != Game.GetPlayer()
		GetCasterActor().StopCombat()
	EndIf
	GetTargetActor().StopCombat()
	RegisterForSingleUpdate(WB_UpdateRate)

EndEvent

; -----
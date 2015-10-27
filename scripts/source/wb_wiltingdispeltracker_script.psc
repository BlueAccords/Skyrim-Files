Scriptname WB_WiltingDispelTracker_Script extends activemagiceffect  

; -----

Float Property WB_UpdateRate Auto
String Property WB_Stat Auto
Float Property WB_Threshold Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	RegisterForSingleUpdate(WB_UpdateRate)

EndEvent

; -----

Event OnUpdate()

	If GetTargetActor().GetAVPercentage(WB_Stat) < WB_Threshold
		Dispel()
	Else
		RegisterForSingleUpdate(WB_UpdateRate)
	EndIf

EndEvent

; -----
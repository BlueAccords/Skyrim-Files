Scriptname WB_AlmalexiasGrace_Script extends activemagiceffect  

; -----

Float Property WB_WeightDelta Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)
	akTarget.ModAV("CarryWeight",WB_WeightDelta)
EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	akTarget.ModAV("CarryWeight",-WB_WeightDelta)
EndEvent

; -----
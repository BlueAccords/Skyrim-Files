Scriptname WB_DispelAfterDelay_Script extends activemagiceffect  

; -----

Float Property WB_DelayUntilDispel Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	RegisterForSingleUpdate(WB_DelayUntilDispel)

EndEvent

; -----

Event OnUpdate()

	Dispel()

EndEvent

; -----
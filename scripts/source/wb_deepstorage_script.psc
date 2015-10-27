Scriptname WB_DeepStorage_Script extends activemagiceffect  

; -----

ObjectReference Property WB_DeepStorage Auto
Explosion Property WB_AlterationEarth_Explosion_DeepStorage Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	WB_DeepStorage.Activate(akTarget, true)
	akTarget.PlaceAtMe(WB_AlterationEarth_Explosion_DeepStorage)

EndEvent

; -----
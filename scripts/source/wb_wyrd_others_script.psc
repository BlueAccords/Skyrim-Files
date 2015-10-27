Scriptname WB_Wyrd_Others_Script extends activemagiceffect  

; -----

FormList Property WB_IllusionBlue_FormList_Wyrd Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	WB_IllusionBlue_FormList_Wyrd.AddForm(akTarget)

EndEvent

; -----
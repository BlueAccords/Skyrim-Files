Scriptname WB_Levitation_TooHigh_Script extends activemagiceffect  

; -----

Message Property WB_AlterationAlt_Message_Levitate_TooHigh Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	WB_AlterationAlt_Message_Levitate_TooHigh.Show()
	Game.ShakeCamera(akTarget, 0.5, 2.0)

EndEvent

; -----
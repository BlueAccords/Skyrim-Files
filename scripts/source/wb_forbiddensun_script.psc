Scriptname WB_ForbiddenSun_Script extends ActiveMagicEffect  

; -----

Float Property WB_Amount Auto

; -----

Float Amount

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Amount = (WB_Amount * (100 - akTarget.GetAV("FireResist"))) / 100
	If Amount > 0
		akTarget.DamageAV("FireResist",Amount)
	Else
		Dispel()
	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	If Amount > 0
		akTarget.RestoreAV("FireResist",Amount)
	EndIf

EndEvent

; -----

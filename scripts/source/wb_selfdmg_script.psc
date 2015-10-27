Scriptname WB_SelfDmg_Script extends ActiveMagicEffect  

; -----

Float Property WB_SelfDmg Auto
String Property WB_ResistType Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Float RealDmg = (WB_SelfDmg * (100 - akCaster.GetAV(WB_ResistType)))/100

	If RealDmg > 0
		akCaster.DamageAV("Health",RealDmg)
	EndIf

EndEvent

; -----
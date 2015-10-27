Scriptname WB_FrostNova_Script extends ActiveMagicEffect  

; -----

Spell Property WB_S_D050_FrostNova_Spell Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Utility.Wait(Utility.RandomFloat(0.1,0.2))
	WB_S_D050_FrostNova_Spell.Cast(akCaster)

EndEvent

; -----
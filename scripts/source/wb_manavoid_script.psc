Scriptname WB_ManaVoid_Script extends ActiveMagicEffect  

; -----

Float Property WB_KillMargin Auto
GlobalVariable Property WB_Illusion_MagickaVoid_Global_XP Auto
GlobalVariable Property WB_General_Global_XP Auto
Actor Property PlayerRef Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Float HealthPctDiff = akTarget.GetAVPercentage("Health") - akTarget.GetAVPercentage("Magicka")		; if this is positive then inflict damage
	If HealthPctDiff > 0
		Float HealthMax = akTarget.GetAV("Health") / akTarget.GetAVPercentage("Health")
		Float DamageDealt = HealthMax*HealthPctDiff
;		Debug.Notification("DAMAGE = " + DamageDealt)
		If DamageDealt >= (akTarget.GetAV("Health") - WB_KillMargin)
			akTarget.Kill(akCaster)
		Else
			akTarget.DamageAV("Health",DamageDealt)
		EndIf
		If akCaster == PlayerRef
			Game.AdvanceSkill("Illusion",DamageDealt * WB_Illusion_MagickaVoid_Global_XP.GetValue() * WB_General_Global_XP.GetValue())
		EndIf
	EndIf

EndEvent

; -----
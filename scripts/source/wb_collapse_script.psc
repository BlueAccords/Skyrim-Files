Scriptname WB_Collapse_Script extends ActiveMagicEffect  

; -----

Float Property WB_KillMargin Auto
GlobalVariable Property WB_Alteration_Collapse_Global_XP Auto
GlobalVariable Property WB_General_Global_XP Auto
Actor Property PlayerRef Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Float HealthPctDiff = akTarget.GetAVPercentage("Health") - akTarget.GetAVPercentage("Stamina")		; if this is positive then inflict damage
	If HealthPctDiff > 0
		Float HealthMax = akTarget.GetAV("Health") / akTarget.GetAVPercentage("Health")
		Float DamageDealt = HealthMax*HealthPctDiff
		If DamageDealt >= (akTarget.GetAV("Health") - WB_KillMargin)
			akTarget.Kill(akCaster)
		Else
			akTarget.DamageAV("Health",DamageDealt)
		EndIf
		If akCaster == PlayerRef
			Game.AdvanceSkill("Alteration",DamageDealt * WB_Alteration_Collapse_Global_XP.GetValue() * WB_General_Global_XP.GetValue())
		EndIf
	EndIf

EndEvent

; -----
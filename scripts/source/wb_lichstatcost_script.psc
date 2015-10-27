Scriptname WB_LichStatCost_Script extends ActiveMagicEffect  

; -----

GlobalVariable Property WB_Conjuration_ConjureLich_Global_Cost Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Float RealDamage = WB_Conjuration_ConjureLich_Global_Cost.GetValue()

	If akCaster.GetAV("LeftItemCharge") >= 1
		If akCaster.GetAV("LeftItemCharge") < RealDamage
			akCaster.DamageAV("LeftItemCharge",akCaster.GetAV("LeftItemCharge"))
		Else
			akCaster.DamageAV("LeftItemCharge",RealDamage)
		EndIf
	EndIf

	If akCaster.GetAV("RightItemCharge") >= 1		; yeah I know an else statement would have been more efficient but I want to avoid timing issues during the course of this script
		If akCaster.GetAV("RightItemCharge") < RealDamage
			akCaster.DamageAV("RightItemCharge",akCaster.GetAV("RightItemCharge"))
		Else
			akCaster.DamageAV("RightItemCharge",RealDamage)
		EndIf
	EndIf

EndEvent

; -----


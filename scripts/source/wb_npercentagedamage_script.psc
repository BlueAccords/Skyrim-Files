Scriptname WB_NPercentageDamage_Script extends ActiveMagicEffect  

; ------

String[] Property WB_TargetResistType Auto
String[] Property WB_TargetDamageType Auto
Float Property WB_DamageCap = 9999.99 Auto
Bool Property WB_IsDualCast Auto
GlobalVariable[] Property WB_DamagePct Auto
GlobalVariable Property WB_XP Auto

; ------

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Float DamageDealt
	Int i = 0
	While i < WB_DamagePct.Length
		DamageDealt = (akTarget.GetAV(WB_TargetDamageType[i])*WB_DamagePct[i].GetValue()*(100-akTarget.GetAV(WB_TargetResistType[i])))/10000
		If WB_IsDualCast
			DamageDealt *= Game.GetGameSettingFloat("fMagicDualCastingEffectivenessBase")
		EndIf
		If DamageDealt > 0
			If DamageDealt > WB_DamageCap
				DamageDealt = WB_DamageCap
			EndIf
			akTarget.DamageAV(WB_TargetDamageType[i],DamageDealt)
		EndIf
		If akCaster == Game.GetPlayer() && WB_TargetDamageType[i] == "Health"
			Game.AdvanceSkill("Destruction",DamageDealt * WB_XP.GetValue())
		EndIf
		i += 1
	EndWhile

EndEvent

; ------

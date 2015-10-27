Scriptname WB_ChaosDamage_Script extends activemagiceffect  

; -----

EffectShader Property WB_TargetHealed_FXS Auto
EffectShader Property WB_TargetDamaged_FXS Auto

Float Property WB_ShaderDuration Auto

Float Property WB_HealthFractionMin Auto
Float Property WB_HealthFractionMax Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Float TargetHealthCur = akTarget.GetAV("Health")
	Float TargetHealthMax = TargetHealthCur/akTarget.GetAVPercentage("Health")

	Float HealthDelta = (Utility.RandomFloat(WB_HealthFractionMin,WB_HealthFractionMax) * TargetHealthMax) - TargetHealthCur

	If HealthDelta >= 0
		WB_TargetHealed_FXS.Play(akTarget, WB_ShaderDuration)
		akTarget.RestoreAV("Health", HealthDelta)
	Else
		WB_TargetDamaged_FXS.Play(akTarget, WB_ShaderDuration)
		If HealthDelta > (TargetHealthCur - 1)
			HealthDelta = (TargetHealthCur - 1)
		EndIf
		akTarget.DamageAV("Health", HealthDelta)
	EndIf
EndEvent

; -----
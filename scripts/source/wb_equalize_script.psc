Scriptname WB_Equalize_Script extends ActiveMagicEffect  

; ------

ImageSpaceModifier property WB_RestorationPeace_Imod_Equalize_Red auto
ImageSpaceModifier property WB_RestorationPeace_Imod_Equalize_Green auto

EffectShader Property Apoc_FXS_Red Auto
EffectShader Property Apoc_FXS_Green Auto

Float Property WB_ImodStrength Auto

Bool Property WB_Merge Auto

; ------

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Float CasterHealthPct = akCaster.GetAVPercentage("Health")
	Float TargetHealthPct = akTarget.GetAVPercentage("Health")

	Float HealthDifferencePct = (TargetHealthPct - CasterHealthPct) / 2

	Float CasterHealthDifferenceNew = Math.Abs(((CasterHealthPct + HealthDifferencePct) * akCaster.GetAV("Health" )/ CasterHealthPct) - akCaster.GetAV("Health" ))
	Float TargetHealthDifferenceNew = Math.Abs(((TargetHealthPct - HealthDifferencePct) * akTarget.GetAV("Health") / TargetHealthPct) - akTarget.GetAV("Health"))

	If (CasterHealthPct < TargetHealthPct && WB_Merge) || (CasterHealthPct > TargetHealthPct && !WB_Merge)
		Apoc_FXS_Green.Play(akCaster,2.0)
		Apoc_FXS_Red.Play(akTarget,2.0)

		akCaster.RestoreAV("Health",CasterHealthDifferenceNew)
		akTarget.DamageAV("Health",TargetHealthDifferenceNew)

		If akCaster == Game.GetPlayer()
			WB_RestorationPeace_Imod_Equalize_Green.Apply(WB_ImodStrength)
		ElseIf akTarget == Game.GetPlayer()
			WB_RestorationPeace_Imod_Equalize_Red.Apply(WB_ImodStrength)
		EndIf
	Else
		Apoc_FXS_Red.Play(akCaster,2.0)
		Apoc_FXS_Green.Play(akTarget,2.0)

		akCaster.DamageAV("Health",CasterHealthDifferenceNew)
		akTarget.RestoreAV("Health",TargetHealthDifferenceNew)

		If akCaster == Game.GetPlayer()
			WB_RestorationPeace_Imod_Equalize_Red.Apply(WB_ImodStrength)
		ElseIf akTarget == Game.GetPlayer()
			WB_RestorationPeace_Imod_Equalize_Green.Apply(WB_ImodStrength)
		EndIf
	EndIf

EndEvent

; ------
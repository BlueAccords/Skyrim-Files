Scriptname WB_FalseLife_Script extends activemagiceffect  

; -----

Float Property WB_UpdateRate Auto
ImagespaceModifier Property WB_RestorationArcane_Imod_Circle Auto
Sound Property WB_RestorationBlood_Marker_Script_Circle_Bleeding Auto
GlobalVariable Property WB_General_Global_XP Auto
GlobalVariable Property WB_Restoration_PoetsWhim_Global_XP Auto
Float Property WB_HealthMultThreshold Auto
Actor Property PlayerRef Auto
String Property WB_StatToCheck Auto

; -----

Float TargetHealth
Actor TargetActor
Actor CasterActor

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TargetActor = akTarget
	CasterActor = akCaster
	TargetHealth = akTarget.GetAV(WB_StatToCheck)
	RegisterForSingleUpdate(WB_UpdateRate)

EndEvent

; -----

Event OnUpdate()

	If TargetActor.GetAV(WB_StatToCheck) >= TargetHealth * WB_HealthMultThreshold
		WB_RestorationBlood_Marker_Script_Circle_Bleeding.Play(TargetActor)
		WB_RestorationArcane_Imod_Circle.Apply()
		If CasterActor == PlayerRef
			Game.AdvanceSkill("Restoration", TargetActor.GetAV("Health") * WB_Restoration_PoetsWhim_Global_XP.GetValue() * WB_General_Global_XP.GetValue())
		EndIf
		TargetActor.Kill(CasterActor)
	Else
		RegisterForSingleUpdate(WB_UpdateRate)
	EndIf

EndEvent

; -----
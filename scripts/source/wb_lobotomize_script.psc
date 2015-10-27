Scriptname WB_Lobotomize_Script extends activemagiceffect  

; -----

Float Property WB_UpdateRate Auto
GlobalVariable Property WB_General_Global_XP Auto
GlobalVariable Property WB_General_Global_LoboMult Auto
String Property WB_Stat Auto
Actor Property PlayerRef Auto
String Property WB_Skill Auto
GlobalVariable Property WB_Illusion_Lobotomize_Global_XP Auto

; -----

Actor TargetActor
Float TargetMagickaPrev
Float TargetMagickaCur
Float HealthDrainedTotal
Float DrainedMult

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TargetActor = akTarget
	DrainedMult = WB_General_Global_LoboMult.GetValue() / 100
	HealthDrainedTotal = 0
	TargetMagickaPrev = akTarget.GetAV(WB_Stat)
	RegisterForUpdate(WB_UpdateRate)

EndEvent

; -----

Event OnUpdate()

	TargetMagickaCur = TargetActor.GetAV(WB_Stat)
	If TargetMagickaCur < TargetMagickaPrev
		Float DrainingNow = (TargetMagickaPrev - TargetMagickaCur) * DrainedMult
		TargetMagickaPrev = TargetMagickaCur
		TargetActor.DamageAV("Health",DrainingNow)
		HealthDrainedTotal += DrainingNow
	Else
		TargetMagickaPrev = TargetMagickaCur
	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	If akCaster == PlayerRef
		Game.AdvanceSkill(WB_Skill,HealthDrainedTotal * WB_Illusion_Lobotomize_Global_XP.GetValue() * WB_General_Global_XP.GetValue())
	EndIf

EndEvent

; -----
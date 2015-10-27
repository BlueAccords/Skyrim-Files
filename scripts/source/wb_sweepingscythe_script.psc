Scriptname WB_SweepingScythe_Script extends ActiveMagicEffect  

; -----

FormList Property WB_IllusionNightmare_FormList_SweepingScythe Auto
GlobalVariable Property WB_Illusion_Reave_Global_Percentage Auto
GlobalVariable Property WB_Illusion_SweepingScythe_Global_XP Auto
VisualEffect Property WB_IllusionNightmare_VFX_SweepingScythe Auto
ImagespaceModifier Property WB_IllusionNightmare_Imod_ReaveKill Auto

; -----

Actor ExtractedTarget
Int i
Actor TheCaster
Float DamageFraction

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TheCaster = akCaster
	DamageFraction = WB_Illusion_Reave_Global_Percentage.GetValue() / 100
	Utility.Wait(0.1)
	WB_IllusionNightmare_FormList_SweepingScythe.AddForm(akTarget)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	WB_IllusionNightmare_FormList_SweepingScythe.RemoveAddedForm(akTarget)

EndEvent

; -----

Event OnDying(Actor akKiller)

	i = 0
	While i < WB_IllusionNightmare_FormList_SweepingScythe.GetSize()
		ExtractedTarget = WB_IllusionNightmare_FormList_SweepingScythe.GetAt(i) as Actor
		WB_IllusionNightmare_VFX_SweepingScythe.Play(ExtractedTarget, 2.5)
		If TheCaster == Game.GetPlayer()
			Game.AdvanceSkill("Illusion",ExtractedTarget.GetAV("Health") * WB_Illusion_SweepingScythe_Global_XP.GetValue())
		EndIf
		ExtractedTarget.DamageAV("Health",((ExtractedTarget.GetAV("Health")/ExtractedTarget.GetAVPercentage("Health")) * DamageFraction))
		i += 1
	EndWhile

EndEvent

; -----

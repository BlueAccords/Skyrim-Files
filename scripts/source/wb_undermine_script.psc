Scriptname WB_Undermine_Script extends ActiveMagicEffect  

; -----

Spell Property WB_S_A050_Undermine_Spell_PC Auto
Spell Property WB_S_A050_Undermine_Spell_Super_PC Auto
Float Property WB_WaitAfterStart = 0.25 Auto
Float Property WB_WaitAfterEnd = 0.1 Auto
Float Property WB_SetAttackSpeed Auto
{can be left empty}
GlobalVariable Property WB_Alteration_Undermine_Global_HeavyStaggerChance Auto
GlobalVariable Property WB_Alteration_Undermine_Global_XP Auto
GlobalVariable Property WB_General_Global_XP Auto

; -----

Actor TargetActor
Actor CasterActor
Float AttackSpeedModifier = 0.0

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TargetActor = akTarget
	CasterActor = akCaster
	RegisterForAnimationEvent(TargetActor, "HitFrame")
	If WB_SetAttackSpeed
		RegisterForSingleUpdate(WB_WaitAfterStart)
	EndIf

EndEvent

; -----

Event OnAnimationEvent(ObjectReference akSource, string asEventName)

	If asEventName == "HitFrame" && akSource == TargetActor

		If Utility.RandomInt(0,99) < WB_Alteration_Undermine_Global_HeavyStaggerChance.GetValue()
			WB_S_A050_Undermine_Spell_Super_PC
		Else
			WB_S_A050_Undermine_Spell_PC.Cast(TargetActor)
		EndIf
		If CasterActor == Game.GetPlayer()
			Game.AdvanceSkill("Alteration", WB_Alteration_Undermine_Global_XP.GetValue() * WB_General_Global_XP.GetValue())
		EndIf

	EndIf

EndEvent

; -----

Event OnUpdate()

	AttackSpeedModifier = WB_SetAttackSpeed - TargetActor.GetAV("WeaponSpeedMult")
	TargetActor.ModAV("WeaponSpeedMult", AttackSpeedModifier)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	If WB_SetAttackSpeed
		Utility.Wait(WB_WaitAfterEnd)		; failsafe in case of race condition with OnUpdate
		TargetActor.ModAV("WeaponSpeedMult", -AttackSpeedModifier)
	EndIf

EndEvent

; -----
Scriptname WB_ScreamOfPain_Script extends ActiveMagicEffect  

; -----

GlobalVariable Property WB_Illusion_ScreamOfPain_Global_XP Auto

; -----

Float DamageDealt

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Utility.Wait(0.25)
	Float TargetPct = akTarget.GetAVPercentage("Health")
	Float CasterPct = akCaster.GetAVPercentage("Health")
	If TargetPct > CasterPct
		DamageDealt = akTarget.GetAV("Health") * (1 - (CasterPct / TargetPct))
		akTarget.DamageAV("Health",DamageDealt)
		If akCaster == Game.GetPlayer()
			Game.AdvanceSkill("Illusion", DamageDealt * WB_Illusion_ScreamOfPain_Global_XP.GetValue())
		EndIf
	Else
		Dispel()
	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	If !akTarget.IsDead()
		akTarget.RestoreAV("Health",DamageDealt)
	EndIf

EndEvent

; -----
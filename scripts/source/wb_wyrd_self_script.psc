Scriptname WB_Wyrd_Self_Script extends activemagiceffect  

; -----

FormList Property WB_IllusionBlue_FormList_Wyrd Auto
Float Property WB_UpdateDelay Auto
Spell Property WB_S_I100_Wyrd_Spell_PC Auto
Sound Property WB_IllusionNightmare_Marker_Script_Haunt Auto

; -----

Actor TargetActor

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	RegisterForSingleUpdate(WB_UpdateDelay)

EndEvent

; -----

Event OnUpdate()

	If WB_IllusionBlue_FormList_Wyrd.GetSize() > 0
		Int RecordNumber = Utility.RandomInt(0,WB_IllusionBlue_FormList_Wyrd.GetSize() - 1)
		TargetActor = WB_IllusionBlue_FormList_Wyrd.GetAt(RecordNumber) as Actor
		GetCasterActor().DoCombatSpellApply(WB_S_I100_Wyrd_Spell_PC, TargetActor)
		WB_IllusionNightmare_Marker_Script_Haunt.Play(TargetActor)
		Utility.Wait(1.0)
		WB_IllusionBlue_FormList_Wyrd.Revert()
	Else
		WB_IllusionBlue_FormList_Wyrd.Revert()
		Dispel()
	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	TargetActor.DispelSpell(WB_S_I100_Wyrd_Spell_PC)

EndEvent

; -----
Scriptname WB_BloodForBlood_Script extends ActiveMagicEffect  

; -----

Float Property WB_Threshold Auto
GlobalVariable Property WB_Illusion_BloodForBlood_Global_XP Auto
GlobalVariable Property WB_Restoration_AllDeathSpells_Global_XP Auto
ImagespaceModifier Property WB_IllusionEmpathy_Imod_BloodForBlood Auto
Sound Property WB_IllusionEmpathy_Marker_Script_BloodForBlood Auto
Message Property WB_IllusionEmpathy_Message_BloodForBloodFail Auto

; -----

Actor TheKiller

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TheKiller = akTarget.GetKiller()
	If TheKiller
		If TheKiller.GetAV("Health") <= WB_Threshold
			WB_IllusionEmpathy_Marker_Script_BloodForBlood.Play(TheKiller)
			WB_IllusionEmpathy_Imod_BloodForBlood.Apply()
			If akCaster == Game.GetPlayer()
				Game.AdvanceSkill("Illusion",TheKiller.GetAV("Health") * WB_Illusion_BloodForBlood_Global_XP.GetValue() * WB_Restoration_AllDeathSpells_Global_XP.GetValue())
			EndIf
			TheKiller.DamageAV("Health",(TheKiller.GetAV("Health") - 1))
		Else
			WB_IllusionEmpathy_Message_BloodForBloodFail.Show()
		EndIf
		Game.ShakeCamera(akTarget, 1, 1)
		If TheKiller.GetCombatState() == 0
			TheKiller.StartCombat(akCaster)
		EndIf
	EndIf

EndEvent

; -----
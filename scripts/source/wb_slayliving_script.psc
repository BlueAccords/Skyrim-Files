Scriptname WB_SlayLiving_Script extends ActiveMagicEffect  

; -----

ImagespaceModifier Property WB_RestorationNecro_Imod_SlayLiving Auto
Float Property WB_PushForce Auto
Int Property WB_BloodStrength Auto
GlobalVariable Property WB_Restoration_SlayLiving_Global_XP Auto
GlobalVariable Property WB_Restoration_AllDeathSpells_Global_XP Auto
Actor Property PlayerRef auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akCaster.PushActorAway(akTarget, WB_PushForce)
	If akCaster == PlayerRef
		Game.AdvanceSkill("Restoration",akTarget.GetAV("Health") * WB_Restoration_SlayLiving_Global_XP.GetValue() * WB_Restoration_AllDeathSpells_Global_XP.GetValue())
	EndIf
	akTarget.DamageAV("Health",akTarget.GetAV("Health") * 2)
	akTarget.Kill(akCaster)
	WB_RestorationNecro_Imod_SlayLiving.Apply()
	Game.TriggerScreenBlood(WB_BloodStrength)

EndEvent

; -----
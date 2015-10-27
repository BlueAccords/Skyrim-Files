Scriptname WB_FXAvengingWraith_Script extends activemagiceffect  

; -----

GlobalVariable Property WB_Conjuration_ConjureAvengingWraith_Global_Health Auto
GlobalVariable Property WB_Conjuration_ConjureAvengingWraith_Global_Magicka Auto
GlobalVariable Property WB_Conjuration_ConjureAvengingWraith_Global_Stamina Auto
GlobalVariable Property WB_Conjuration_ConjureAvengingWraith_Global_Level Auto
GlobalVariable Property WB_Conjuration_ConjureAvengingWraith_Global_Mult Auto

Float Property WB_DefaultHealth Auto
Float Property WB_DefaultMagicka Auto
Float Property WB_DefaultStamina Auto
Int Property WB_DefaultLevel Auto

VisualEffect Property WB_ConjurationUndead_VFX_EyesFemale Auto

; -----

Float StatMult

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	WB_ConjurationUndead_VFX_EyesFemale.Play(akTarget, -1)

	StatMult = WB_Conjuration_ConjureAvengingWraith_Global_Mult.GetValueInt() / 100

	akTarget.SetAV("Health",WB_Conjuration_ConjureAvengingWraith_Global_Health.GetValue())
	akTarget.SetAV("Magicka",WB_Conjuration_ConjureAvengingWraith_Global_Magicka.GetValue())
	akTarget.SetAV("Stamina",WB_Conjuration_ConjureAvengingWraith_Global_Stamina.GetValue())

	akTarget.RestoreAV("Health",9999)
	akTarget.RestoreAV("Magicka",9999)
	akTarget.RestoreAV("Stamina",9999)

EndEvent

; -----

Event OnDying(Actor akKiller)

	If akKiller
		If akKiller.GetAV("Health") > 0
			WB_Conjuration_ConjureAvengingWraith_Global_Health.SetValue((akKiller.GetAV("Health") / akKiller.GetAVPercentage("Health")) * StatMult)
		Else
			WB_Conjuration_ConjureAvengingWraith_Global_Health.SetValue(WB_DefaultHealth)
		EndIf

		If akKiller.GetAV("Magicka") > 0
			WB_Conjuration_ConjureAvengingWraith_Global_Magicka.SetValue((akKiller.GetAV("Magicka") / akKiller.GetAVPercentage("Magicka")) * StatMult)
		Else
			WB_Conjuration_ConjureAvengingWraith_Global_Magicka.SetValue(WB_DefaultMagicka)
		EndIf

		If akKiller.GetAV("Stamina") > 0
			WB_Conjuration_ConjureAvengingWraith_Global_Stamina.SetValue((akKiller.GetAV("Stamina") / akKiller.GetAVPercentage("Stamina")) * StatMult)
		Else
			WB_Conjuration_ConjureAvengingWraith_Global_Stamina.SetValue(WB_DefaultStamina)
		EndIf

		WB_Conjuration_ConjureAvengingWraith_Global_Level.SetValueInt(akKiller.GetLevel())
	Else
		WB_Conjuration_ConjureAvengingWraith_Global_Health.SetValue(WB_DefaultHealth)
		WB_Conjuration_ConjureAvengingWraith_Global_Magicka.SetValue(WB_DefaultMagicka)
		WB_Conjuration_ConjureAvengingWraith_Global_Stamina.SetValue(WB_DefaultStamina)
		WB_Conjuration_ConjureAvengingWraith_Global_Level.SetValueInt(WB_DefaultLevel)
	EndIf

	WB_ConjurationUndead_VFX_EyesFemale.Stop(GetTargetActor())

EndEvent

; -----
Scriptname WB_Empathic_Script extends ActiveMagicEffect  

; -----

Float Property WB_UpdateRate Auto
Float Property WB_FractionDamage Auto
EffectShader Property Apoc_FXS_Red Auto
GlobalVariable Property WB_Illusion_EmpathicAgony_Global_XP Auto

; -----

Actor TheTarget
Actor TheCaster

Float CasterHealthCur
Float CasterHealthOri

Float CasterHealthDelta

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TheTarget = akTarget
	TheCaster = akCaster

	CasterHealthOri = TheCaster.GetAV("Health")
	RegisterForSingleUpdate(WB_UpdateRate)

EndEvent

; -----

Event OnUpdate()

	CasterHealthCur = TheCaster.GetAV("Health")
	CasterHealthDelta = CasterHealthOri - CasterHealthCur

	If CasterHealthDelta > 0
		Apoc_FXS_Red.Play(TheTarget,WB_UpdateRate)
		TheTarget.DamageAV("Health",CasterHealthDelta * WB_FractionDamage)
		If TheCaster == Game.GetPlayer()
			Game.AdvanceSkill("Illusion",CasterHealthDelta * WB_FractionDamage * WB_Illusion_EmpathicAgony_Global_XP.GetValue())
		EndIf
	EndIf

	CasterHealthOri = CasterHealthCur
	RegisterForSingleUpdate(WB_UpdateRate)

EndEvent

; -----
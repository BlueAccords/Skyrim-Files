Scriptname WB_InvisibleManagerInCombat_Script extends activemagiceffect  

; -----

FormList Property WB_AlterationMetamagic_OcatosRecital_FormList Auto
GlobalVariable Property WB_Destruction_Crackle_Global Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Int i = 0
	Spell TheSpell

	; Ocatos Recital
	While i < WB_AlterationMetamagic_OcatosRecital_FormList.GetSize()
		TheSpell = WB_AlterationMetamagic_OcatosRecital_FormList.GetAt(i) as Spell
		TheSpell.Cast(akTarget)
		i += 1
	EndWhile

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	; Crackle
	WB_Destruction_Crackle_Global.SetValue(0.0)

EndEvent

; -----
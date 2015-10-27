Scriptname WB_DetonateDead_Script extends activemagiceffect  

; ------

Spell Property WB_S_C050_DetonateDead_Spell_PC Auto

; ------

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akCaster.DoCombatSpellApply(WB_S_C050_DetonateDead_Spell_PC, akTarget)
	akTarget.SetCriticalStage(akTarget.CritStage_DisintegrateStart)
	akTarget.SetAlpha (0.0,True)
	akTarget.AttachAshPile()
	akTarget.SetCriticalStage(akTarget.CritStage_DisintegrateEnd)

EndEvent

; ------

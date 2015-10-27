Scriptname WB_Wither_Script extends activemagiceffect  

; -----

Spell Property WB_S_A025_Wither_Spell_StackingDebuff_PC Auto
Float Property WB_UpdateRate Auto
Int Property WB_StackMax Auto

; -----

Actor TargetActor
Actor CasterActor
Int SpellCount

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TargetActor = akTarget
	CasterActor = akCaster
	SpellCount = 0
	RegisterForUpdate(WB_UpdateRate)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	akTarget.DispelSpell(WB_S_A025_Wither_Spell_StackingDebuff_PC)

EndEvent

; -----

Event OnUpdate()

	If SpellCount < WB_StackMax
		CasterActor.DoCombatSpellApply(WB_S_A025_Wither_Spell_StackingDebuff_PC,TargetActor)
		SpellCount += 1
	Else
		UnregisterForUpdate()
	EndIf

EndEvent

; -----
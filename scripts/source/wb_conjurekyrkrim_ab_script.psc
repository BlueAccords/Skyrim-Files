Scriptname WB_ConjureKyrkrim_Ab_Script extends activemagiceffect  

; -----

Spell Property WB_S_C100_ConjureKyrkrim_Spell_AbFlameTrail_PC Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	RegisterForSingleUpdate(1.5)

EndEvent

; -----

Event OnUpdate()

	If !GetTargetActor().HasSpell(WB_S_C100_ConjureKyrkrim_Spell_AbFlameTrail_PC)
		GetTargetActor().AddSpell(WB_S_C100_ConjureKyrkrim_Spell_AbFlameTrail_PC)
	EndIf

EndEvent

; -----

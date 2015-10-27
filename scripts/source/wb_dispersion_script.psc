Scriptname WB_Dispersion_Script extends activemagiceffect  

; -----

Float Property WB_UpdateRate Auto
Spell Property WB_S_R075_Dispersion_Spell Auto

; -----

Actor TheTarget
Actor TheAggressor

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TheTarget = akTarget

EndEvent

; -----

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	If akAggressor != TheTarget && akSource != TheTarget
		TheAggressor = akAggressor as Actor
		RegisterForSingleUpdate(WB_UpdateRate)
	EndIf

EndEvent

; -----

Event OnUpdate()

	TheTarget.DoCombatSpellApply(WB_S_R075_Dispersion_Spell, TheAggressor)

EndEvent

; -----

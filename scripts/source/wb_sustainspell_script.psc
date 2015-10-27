Scriptname WB_SustainSpell_Script extends ActiveMagicEffect  

; -----

Float Property WB_UpdateRate Auto
GlobalVariable Property WB_Illusion_PaleMoon_Global_Drain Auto
Spell Property WB_I050_PaleMoon_Spell Auto

; -----

Actor TheCaster
Actor TheTarget

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TheTarget = akTarget
	TheCaster = akCaster

EndEvent

; -----

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool  abHitBlocked)

	Actor TheAttacker = akAggressor as Actor
	If TheAttacker
		If TheAttacker.IsHostileToActor(TheTarget)
			RegisterForSingleUpdate(WB_UpdateRate)
		EndIf
	EndIf

EndEvent

; -----

Event OnUpdate()

	TheTarget.DamageAV("Magicka",WB_Illusion_PaleMoon_Global_Drain.GetValue())
	If TheTarget.GetAV("Magicka") <= 0
		TheTarget.DispelSpell(WB_I050_PaleMoon_Spell)
	EndIf

EndEvent

; -----
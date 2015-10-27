Scriptname WB_DeathMark_Script extends ActiveMagicEffect  

; -----

ImagespaceModifier Property WB_ConjurationAtronach_Imod_AtronachMark Auto
Sound Property WB_ConjurationDaedric_Marker_AtronachMark Auto

; -----

Float RealDamage
Actor TheTarget

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TheTarget = akTarget
	Utility.Wait(0.1)
	RealDamage = (akTarget.GetAV("Health") - 1)
	akTarget.DamageAV("Health", RealDamage)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	If !akTarget.IsDead()
		akTarget.RestoreAV("Health",RealDamage)
	EndIf

EndEvent

; -----

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	If (akAggressor as Actor) != TheTarget
		WB_ConjurationAtronach_Imod_AtronachMark.Apply()
		WB_ConjurationDaedric_Marker_AtronachMark.Play(TheTarget)
		Dispel()
	EndIf

EndEvent

; -----
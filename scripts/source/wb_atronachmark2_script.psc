Scriptname WB_AtronachMark2_Script extends ActiveMagicEffect  

; -----

Float Property WB_DamageFraction Auto
String Property WB_DamageType Auto
Float Property WB_UpdateDelay Auto

ImagespaceModifier Property WB_ConjurationAtronach_Imod_AtronachMark Auto
Sound Property WB_ConjurationDaedric_Marker_AtronachMark Auto

Keyword Property ActorTypeDaedra Auto
GlobalVariable Property WB_Conjuration_AtronachMark_Global_XP Auto

Keyword Property WB_Conjuration_AtronachMarkExclusion Auto

; -----

Actor TheTarget
Actor TheCaster
Actor TheAttacker
Bool CanBeHit

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TheTarget = akTarget
	TheCaster = akCaster
	CanBeHit = true

EndEvent

; -----

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	If (akAggressor as Actor).IsCommandedActor() && CanBeHit && !akSource.HasKeyword(WB_Conjuration_AtronachMarkExclusion)
		CanBeHit = false
		TheAttacker = akAggressor as Actor
		RegisterForSingleUpdate(WB_UpdateDelay)
	EndIf

EndEvent

; -----

Event OnUpdate()

	Float RealDamage = (TheTarget.GetAV("Health") * WB_DamageFraction * (100 - TheTarget.GetAV(WB_DamageType))) / 100
	If RealDamage > 0
		TheTarget.DamageAV("Health",RealDamage)
	EndIf
	If TheCaster == Game.GetPlayer()
		Game.AdvanceSkill("Conjuration",WB_Conjuration_AtronachMark_Global_XP.GetValue() * RealDamage)
	EndIf
	WB_ConjurationAtronach_Imod_AtronachMark.Apply()
	WB_ConjurationDaedric_Marker_AtronachMark.Play(TheTarget)
	Dispel()

EndEvent

; -----
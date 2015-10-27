Scriptname WB_Fracture_Script extends ActiveMagicEffect  

; -----

Keyword Property MagicDamageFrost Auto
Keyword Property WB_IsFracture Auto

Explosion Property WB_DestructionFrost_Explosion_Fracture Auto
Spell Property WB_S_D025_Fracture_Spell Auto

Float Property WB_UpdateDelay Auto

Activator Property FXEmptyActivator Auto

; -----

Actor TheTarget
Actor TheCaster
ObjectReference TheBox

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TheTarget = akTarget
	TheCaster = akCaster
	TheBox = akTarget.PlaceAtMe(FXEmptyActivator)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	TheBox.Delete()

EndEvent


; -----

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool  abHitBlocked)

	If akSource.HasKeyword(MagicDamageFrost) && !akSource.HasKeyword(WB_IsFracture) && akAggressor != TheTarget
		RegisterForSingleUpdate(WB_UpdateDelay)
	EndIf

EndEvent

; -----

Event OnUpdate()

	TheTarget.PlaceAtMe(WB_DestructionFrost_Explosion_Fracture)
	WB_S_D025_Fracture_Spell.RemoteCast(TheBox,TheCaster,TheTarget)
	Dispel()

EndEvent

; -----
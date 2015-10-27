Scriptname WB_Meltdown_Script extends ActiveMagicEffect  

; -----

Keyword Property MagicDamageFire Auto
Keyword Property WB_IsMeltdown_Keyword Auto
Float Property WB_DurationBase Auto
Spell Property WB_D050_Meltdown_Spell Auto

; -----

Actor TheTarget

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TheTarget = akTarget
	RegisterForSingleUpdate(WB_DurationBase)

EndEvent

; -----

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool  abHitBlocked)

	If akSource.HasKeyword(MagicDamageFire) && !akSource.HasKeyword(WB_IsMeltdown_Keyword) && akAggressor != TheTarget
		UnregisterForUpdate()
		RegisterForSingleUpdate(WB_DurationBase)
	EndIf

EndEvent

; -----

Event OnUpdate()

	TheTarget.DispelSpell(WB_D050_Meltdown_Spell)

EndEvent

; -----
Scriptname WB_WeepingDaedra_Script extends ActiveMagicEffect  

; ------

Bool Property WB_IsInvulnerable auto
Spell Property WB_C025_DaedricMind_Spell_PC Auto

; ------

Float ActorPositionX
Float ActorPositionY
Float ActorPositionZ

; ------

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.EnableAI(false)
	If WB_IsInvulnerable
		akTarget.SetGhost(true)
	EndIf
	akTarget.InterruptCast()
	ActorPositionX = akTarget.GetPositionX()
	ActorPositionY = akTarget.GetPositionY()
	ActorPositionZ = akTarget.GetPositionZ()
	akTarget.DispelSpell(WB_C025_DaedricMind_Spell_PC)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	akTarget.EnableAI(true)
	If WB_IsInvulnerable
		akTarget.SetGhost(false)
	EndIf
	akTarget.SetPosition(ActorPositionX, ActorPositionY, ActorPositionZ)

EndEvent

; -----

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	If akAggressor != GetTargetActor()
		GetTargetActor().Kill(akAggressor as Actor)	
	EndIf

EndEvent

; -----
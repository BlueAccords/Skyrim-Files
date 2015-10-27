Scriptname WB_CallLightning_Script extends ActiveMagicEffect  

; -----

Keyword Property MagicDamageShock Auto

Float Property WB_RandomDelayMin Auto
Float Property WB_RandomDelayMax Auto

Spell Property WB_S_D050_CallLightning_Spell Auto

Float Property WB_SpawnerXOffset Auto
Float Property WB_SpawnerZOffset Auto							; bomb height

Activator Property FXEmptyActivator Auto

Float Property WB_ChanceOfThunder Auto
Sound Property WB_DestructionShock_Marker_CallLightning_Thunder1 Auto
Sound Property WB_DestructionShock_Marker_CallLightning_Thunder2 Auto

Keyword Property WB_IsFingerProc Auto

Spell Property LightningCloakDmg Auto
Spell Property crAtronachCloakShockDmg Auto

; -----

Actor TheCaster
Actor TheTarget
ObjectReference StarterBox

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TheCaster = akCaster
	TheTarget = akTarget
	StarterBox = TheTarget.PlaceAtMe(FXEmptyActivator)

EndEvent

; -----

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool  abHitBlocked)

	If akSource.HasKeyword(MagicDamageShock) && akAggressor != TheTarget && !akSource.HasKeyword(WB_IsFingerProc) && akSource != LightningCloakDmg && akSource != crAtronachCloakShockDmg
		RegisterForSingleUpdate(Utility.RandomFloat(WB_RandomDelayMin, WB_RandomDelayMax))
	EndIf

EndEvent

; -----

Event OnUpdate()

	StarterBox.MoveTo(TheTarget, Utility.RandomFloat(-WB_SpawnerXOffset,WB_SpawnerXOffset), Utility.RandomFloat(-WB_SpawnerXOffset,WB_SpawnerXOffset), WB_SpawnerZOffset)
	If !TheTarget.IsInInterior()
		WB_S_D050_CallLightning_Spell.RemoteCast(StarterBox, TheCaster, TheTarget)
		If Utility.RandomInt(0,1) == 0
			WB_DestructionShock_Marker_CallLightning_Thunder1.Play(TheTarget)
		Else
			WB_DestructionShock_Marker_CallLightning_Thunder2.Play(TheTarget)
		EndIf
	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	StarterBox.Delete()

EndEvent

; -----
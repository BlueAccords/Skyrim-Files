Scriptname WB_Thunderball_Script extends ActiveMagicEffect  

; -----

Float Property WB_CollisionDistance Auto
Float Property WB_DashSpeed Auto
Float Property WB_ShakeStrength Auto
Float Property WB_UpdateRate Auto

Activator Property FXEmptyActivator Auto
Explosion Property WB_DestructionShock_Explosion_Thunderball Auto
ImagespaceModifier Property WB_DestructionShock_Imod_Thunderball Auto

Spell[] Property WB_Thunderballs Auto

Actor Property PlayerRef Auto

; -----

Actor TargetActor
Actor CasterActor

ObjectReference ForceObject
Float DistanceTraveled
Int Selector

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TargetActor = akTarget
	CasterActor = akCaster

;	DistanceTraveled = TargetActor.GetDistance(CasterActor)
;	akTarget.PushActorAway(akTarget, 4 + (DistanceTraveled / 250))
	ForceObject = akCaster.PlaceAtMe(FXEmptyActivator)
	If akCaster == PlayerRef
		Game.ForceFirstPerson()
		Game.DisablePlayerControls(abCamSwitch = true, abLooking = true, abMenu = true)
	EndIf
	WB_DestructionShock_Imod_Thunderball.Apply()

	akCaster.SplineTranslateToRef(akTarget,10,WB_DashSpeed,0)

	RegisterForUpdate(WB_UpdateRate)
	Game.ShakeCamera(afStrength = WB_ShakeStrength)
	Game.ShakeController(0.5, 0.5, 2.0)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	CasterActor.StopTranslation()
	WB_DestructionShock_Imod_Thunderball.Remove()
	Utility.Wait(0.1)
	If akCaster == PlayerRef
		Game.EnablePlayerControls()
	EndIf
	Utility.Wait(2.5)
	ForceObject.Delete()

EndEvent

; -----

Event OnUpdate()

	DistanceTraveled = TargetActor.GetDistance(CasterActor)
	If DistanceTraveled < WB_CollisionDistance
		UnregisterForUpdate()
		CasterActor.PlaceAtMe(WB_DestructionShock_Explosion_Thunderball)
		CasterActor.StopTranslation()
		DistanceTraveled = ForceObject.GetDistance(CasterActor)
		ForceObject.PushActorAway(TargetActor,10)
		If DistanceTraveled >= 2500
			DistanceTraveled = 2499
		EndIf
		Selector = (DistanceTraveled / 500) as Int
		CasterActor.DoCombatSpellApply(WB_Thunderballs[Selector],TargetActor)
		Dispel()
	Else
		CasterActor.SplineTranslateToRef(TargetActor,10,WB_DashSpeed,0)
	EndIf

EndEvent

; -----
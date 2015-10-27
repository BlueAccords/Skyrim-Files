Scriptname WB_Suspend_Script extends ActiveMagicEffect  

; -----

Activator Property FXEmptyActivator Auto

Float Property WB_Push Auto
Float Property WB_UpdateRate Auto
Float Property WB_DangleZ Auto
Float Property WB_DistanceInFront Auto

; -----

ObjectReference TheNexus
ObjectReference TheAttractor
Actor TheTarget
Actor TheCaster

Float EndLocX
Float EndLocY

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TheNexus = akTarget.PlaceAtMe(FXEmptyActivator)
	TheAttractor = akTarget.PlaceAtMe(FXEmptyActivator)
	TheAttractor.MoveTo(TheNexus,Utility.RandomFloat(-WB_DistanceInFront,WB_DistanceInFront),Utility.RandomFloat(-WB_DistanceInFront,WB_DistanceInFront),WB_DangleZ + Utility.RandomFloat(-WB_DistanceInFront,WB_DistanceInFront))

	TheCaster = akCaster
	TheTarget = akTarget

	OnUpdate()
	RegisterForUpdate(WB_UpdateRate)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	TheNexus.Delete()
	TheAttractor.Delete()

EndEvent

; -----

Event OnUpdate()

;	EndLocZ = (WB_DistanceInFront*Math.Tan(-TheCaster.GetAngleX()))

;	TheAttractor.MoveTo(TheNexus,Utility.RandomFloat(-WB_DistanceInFront,WB_DistanceInFront),Utility.RandomFloat(-WB_DistanceInFront,WB_DistanceInFront),WB_DangleZ + Utility.RandomFloat(-WB_DistanceInFront,WB_DistanceInFront))
	TheAttractor.PushActorAway(TheTarget,WB_Push)

EndEvent

; -----
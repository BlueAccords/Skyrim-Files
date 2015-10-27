Scriptname WB_IntoTheClouds_Script extends activemagiceffect  

; -----

Activator Property FXEmptyActivator Auto
Float Property WB_ForceUp Auto
Float Property WB_ForceUpInit Auto
Float Property WB_UpdateRate Auto
Float Property WB_HeightStart Auto
Static Property WB_PullObject Auto
Static Property WB_ColliderObject Auto
Float Property WB_ObjectHeight Auto
Float Property WB_ColliderScale Auto

; -----

Actor TheTarget
Actor TheCaster
ObjectReference TheBox
ObjectReference TheAttractor
ObjectReference TheCollider
Float HeightDelta
Float RealHeight

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TheTarget = akTarget

	TheBox = akTarget.PlaceAtMe(FXEmptyActivator)
	TheBox.MoveTo(TheTarget,0,0,WB_HeightStart)

	TheAttractor = akTarget.PlaceAtMe(WB_PullObject)
	TheAttractor.MoveTo(TheTarget,0,0,WB_ObjectHeight)

	TheAttractor.SetAngle(Utility.RandomInt(-180,180),Utility.RandomInt(-180,180),Utility.RandomInt(-180,180))

	TheCollider = TheAttractor.PlaceAtMe(WB_ColliderObject)

	GetTargetActor().SetAngle(180,0,0)
	HeightDelta = WB_ForceUpInit*(Math.Abs(TheTarget.GetPositionZ() - (TheBox.GetPositionZ() + 64)))/WB_HeightStart
	TheBox.PushActorAway(TheTarget,HeightDelta)

	RegisterForUpdate(WB_UpdateRate)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	TheBox.Delete()
	TheCollider.Delete()

	TheAttractor.Disable(true)
	Utility.Wait(2.5)
	TheAttractor.Delete()

EndEvent

; -----

Event OnUpdate()

	HeightDelta = WB_ForceUp*(Math.Abs(TheTarget.GetPositionZ() - (TheBox.GetPositionZ() + 64)))/WB_HeightStart
	TheBox.PushActorAway(TheTarget,HeightDelta)

EndEvent

; -----
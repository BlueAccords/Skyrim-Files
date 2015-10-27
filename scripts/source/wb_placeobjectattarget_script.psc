Scriptname WB_PlaceObjectAtTarget_Script extends activemagiceffect  

; -----

Float Property WB_ChancePerTickToBreak Auto
Static Property WB_Object Auto
Float Property WB_TickRate Auto
Float Property WB_Scale Auto
Bool Property WB_FlatOrientation Auto
Float Property WB_PullForce Auto
Activator Property FXEmptyActivator Auto

; -----

ObjectReference TheObject
ObjectReference TheBox

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)
	TheObject = akTarget.PlaceAtMe(WB_Object)
	TheObject.SetScale(WB_Scale)
	TheObject.SetAngle(0,0,0)

	If WB_FlatOrientation
		akTarget.SetAngle(0,0,0)
	EndIf
	If WB_PullForce > 0.0
		TheBox = akTarget.PlaceAtMe(FXEmptyActivator)
		TheBox.MoveTo(akTarget,0,0,150)
		TheBox.PushActorAway(akTarget, WB_PullForce)
	EndIf
	RegisterForSingleUpdate(WB_TickRate)
EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	TheObject.Disable(true)
	Utility.Wait(2.5)
	TheObject.Delete()
	TheBox.Delete()
EndEvent

; -----

Event OnUpdate()
	If Utility.RandomFloat(0,1) < WB_ChancePerTickToBreak
		Dispel()
	Else
		RegisterForSingleUpdate(WB_TickRate)
	EndIf
EndEvent

; -----
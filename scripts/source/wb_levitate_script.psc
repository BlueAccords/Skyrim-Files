Scriptname WB_Levitate_Script extends activemagiceffect  

; -----

Static Property WB_AlterationAlt_Static_Levitate Auto
Float Property WB_UpdateRate Auto
Float Property WB_Mult Auto

; -----

Actor TargetActor
ObjectReference TheBridge1
ObjectReference TheBridge2
ObjectReference TheBridge3
Int Tracker
Float TargetAngle

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TargetActor = akTarget
	TheBridge1 = akTarget.PlaceAtMe(WB_AlterationAlt_Static_Levitate)
	TheBridge2 = akTarget.PlaceAtMe(WB_AlterationAlt_Static_Levitate)
	TheBridge3 = akTarget.PlaceAtMe(WB_AlterationAlt_Static_Levitate)
	Tracker = 0
	RegisterForUpdate(WB_UpdateRate)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	Tracker = 999
	Utility.Wait(0.5)		; failsafe
	TheBridge1.SetPosition(0,0,-20000)
	TheBridge2.SetPosition(0,0,-20000)
	TheBridge3.SetPosition(0,0,-20000)
	TheBridge1.Delete()
	TheBridge2.Delete()
	TheBridge3.Delete()

EndEvent

; -----

Event OnUpdate()

	If Tracker == 0
		Tracker = 1
;		TheBridge1.MoveTo(TargetActor, 0, 0, WB_Mult * Math.Sin(-TargetActor.GetAngleX()))
		TheBridge1.MoveTo(TargetActor, 0, 0, 0)
		TheBridge1.SetAngle(0,0,0)
	ElseIf Tracker == 1
		Tracker = 2
;		TheBridge2.MoveTo(TargetActor, 0, 0, WB_Mult * Math.Sin(-TargetActor.GetAngleX()))
		TheBridge2.MoveTo(TargetActor, 0, 0, 0)
		TheBridge2.SetAngle(0,0,0)
	ElseIf Tracker == 2
		Tracker = 0
;		TheBridge3.MoveTo(TargetActor, 0, 0,  WB_Mult * Math.Sin(-TargetActor.GetAngleX()))
		TheBridge3.MoveTo(TargetActor, 0, 0, 0)
		TheBridge3.SetAngle(0,0,0)
	EndIf

EndEvent

; -----

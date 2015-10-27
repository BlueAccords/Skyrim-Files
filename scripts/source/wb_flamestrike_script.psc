Scriptname WB_Flamestrike_Script extends ActiveMagicEffect  

; ------

Float Property WB_SpawnerZOffset Auto									; bomb height

Spell Property WB_S_D100_Flamestrike_Spell Auto

Activator Property FXEmptyActivator Auto

Float Property WB_DistanceInFront Auto
Float Property WB_DistanceInFrontAdd Auto
Int Property WB_NumberOfShards Auto
Float Property WB_PositionDelta = 0.0 Auto
Float Property WB_AttackRate Auto

; ------

ObjectReference StarterBox
ObjectReference FinisherBox
Actor TheTarget
Actor TheCaster
Int ShardsCast

Float EndLocX
Float EndLocY
Float DistanceInFront
Float CasterAngle

; ------

Event OnEffectStart(Actor akTarget, Actor akCaster)

	StarterBox = akCaster.placeAtMe(FXEmptyActivator)
	FinisherBox = akCaster.placeAtMe(FXEmptyActivator)

	ShardsCast = 0

	CasterAngle = akCaster.GetAngleZ()

	DistanceInFront = WB_DistanceInFront

	TheTarget = akTarget
	TheCaster = akCaster

	RegisterForUpdate(WB_AttackRate)

EndEvent

; -----

Event OnUpdate()

	If ShardsCast < WB_NumberOfShards
		EndLocX = (DistanceInFront*Math.Sin(CasterAngle))
		EndLocY = (DistanceInFront*Math.Cos(CasterAngle))
		StarterBox.MoveTo(TheCaster, Utility.RandomFloat(-WB_PositionDelta,WB_PositionDelta) + EndLocX, Utility.RandomFloat(-WB_PositionDelta,WB_PositionDelta) + EndLocY, WB_SpawnerZOffset)
		FinisherBox.MoveTo(TheCaster, EndLocX, EndLocY, 0)
		WB_S_D100_Flamestrike_Spell.RemoteCast(StarterBox, TheCaster, FinisherBox)
		ShardsCast += 1
		DistanceInFront += WB_DistanceInFrontAdd
	Else
		UnregisterForUpdate()
		Dispel()
	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	StarterBox.Delete()
	FinisherBox.Delete()

EndEvent

; ------


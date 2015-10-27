Scriptname WB_FabricateWall_Script extends ActiveMagicEffect  

; -----

Activator Property FXEmptyActivator Auto
EffectShader Property WB_AlterationAlt_FXS_CreatedObject Auto

Float Property WB_DistanceInFront Auto
Float Property WB_DistanceZ Auto
Float Property WB_DistanceZStart Auto

Explosion Property WB_AlterationAlt_Explosion_CreateLodeOrb Auto
Activator Property WB_AlterationAlt_Activator_MinorCreation Auto

FormList Property WB_AlterationAlt_FormList_FabricateWall Auto

Float Property WB_Speed Auto

; -----

Actor CasterActor
ObjectReference CreatedObject
ObjectReference MagicalHalo
ObjectReference TargetBox

; -----

Float CasterAngle

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	CasterActor = akCaster

	TargetBox = akTarget.PlaceAtMe(FXEmptyActivator)
	CreatedObject = akTarget.PlaceAtMe(WB_AlterationAlt_FormList_FabricateWall.GetAt(0), abInitiallyDisabled = true)

	CasterAngle = akCaster.GetAngleZ()

	CreatedObject.MoveTo(akCaster,(WB_DistanceInFront*Math.Sin(CasterAngle)),(WB_DistanceInFront*Math.Cos(CasterAngle)),WB_DistanceZStart)
	CreatedObject.SetAngle(0,0,CasterAngle)

	; place halo and explosion
	TargetBox.MoveTo(akCaster,(WB_DistanceInFront*Math.Sin(CasterAngle)),(WB_DistanceInFront*Math.Cos(CasterAngle)),0)
	TargetBox.PlaceAtMe(WB_AlterationAlt_Explosion_CreateLodeOrb)
	MagicalHalo = TargetBox.PlaceAtMe(WB_AlterationAlt_Activator_MinorCreation)

	; move target box to final location
	TargetBox.MoveTo(akCaster,(WB_DistanceInFront*Math.Sin(CasterAngle)),(WB_DistanceInFront*Math.Cos(CasterAngle)),WB_DistanceZ)
	TargetBox.SetAngle(0,0,CasterAngle)

	CreatedObject.Enable()

	Utility.Wait(0.1)

	CreatedObject.TranslateToRef(TargetBox, WB_Speed)
	WB_AlterationAlt_FXS_CreatedObject.Play(CreatedObject)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	CreatedObject.Disable(true)
	MagicalHalo.Disable(true)
	Utility.Wait(5)
	CreatedObject.Delete()
	MagicalHalo.Delete()
	TargetBox.Delete()

EndEvent

; -----
Scriptname WB_AccelerationRune_Script extends activemagiceffect  

; -----

VisualEffect Property WB_AlterationTelekinesis_VFX_Strike Auto
Sound Property MAGAlterationTelekinesisThrow Auto

Float Property WB_DistanceInFront Auto
Float Property WB_StartingBoxDisplacedZ Auto
Float Property WB_FlingForce Auto

Activator Property FXEmptyActivator Auto

; -----

Event OnEffectStart (Actor akTarget, Actor akCaster)

	ObjectReference StarterBox = akTarget.placeAtMe(FXEmptyActivator)
	StarterBox.SetPosition(akTarget.GetPositionX() + (WB_DistanceInFront * Math.Sin(akTarget.GetAngleZ())), akTarget.GetPositionY() + (WB_DistanceInFront * Math.Cos(akTarget.GetAngleZ())), akTarget.GetPositionZ() + WB_StartingBoxDisplacedZ)

	StarterBox.PushActorAway(akTarget, WB_FlingForce)

	MAGAlterationTelekinesisThrow.Play(akTarget)
	WB_AlterationTelekinesis_VFX_Strike.Play(akTarget, 5.0)

	StarterBox.Delete()

EndEvent

; -----

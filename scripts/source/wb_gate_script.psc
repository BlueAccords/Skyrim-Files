Scriptname WB_Gate_Script extends activemagiceffect  

; ------

Float Property WB_Delay Auto
Float Property WB_DistanceInFront Auto
Bool Property WB_CheckLocation = false Auto
Activator Property EffectSummonBanishFX Auto
VisualEffect Property WB_ConjurationSummon_VFX Auto

; ------

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ObjectReference PlacedEffect = akTarget.PlaceAtMe(EffectSummonBanishFX)
	PlacedEffect.MoveTo(akCaster,(WB_DistanceInFront*Math.Sin(akCaster.GetAngleZ())), (WB_DistanceInFront*Math.Cos(akCaster.GetAngleZ())), 0)

	Utility.Wait(WB_Delay)

	If akTarget.getCurrentLocation().IsSameLocation(akCaster.GetCurrentLocation()) || WB_CheckLocation == false
		akTarget.MoveTo(PlacedEffect)
		WB_ConjurationSummon_VFX.Play(akTarget,4)
	EndIf

	Utility.Wait(4)

	PlacedEffect.Delete()

EndEvent

; ------
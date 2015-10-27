Scriptname WB_SenseOre_Script extends activemagiceffect  


; -----

Float Property WB_TargetSeekRange Auto
FormList Property WB_AlterationAlt_FormList_SenseOre Auto
Message Property WB_AlterationAlt_Message_SenseOre_Failure Auto
Message Property WB_AlterationAlt_Message_SenseOre_Success Auto
Explosion Property WB_AlterationAlt_Explosion_SenseOre Auto
Float Property WB_ExplosionDur Auto
Static Property WB_AlterationAlt_Static_SenseOre Auto
Light Property WB_AlterationAlt_Light_SenseOre Auto
EffectShader Property WB_AlterationAlt_FXS Auto

; -----

ObjectReference TheMarker
ObjectReference TheLight
ObjectReference FoundOre

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.PlaceAtMe(WB_AlterationAlt_Explosion_SenseOre)
	FoundOre = Game.FindClosestReferenceOfAnyTypeInListFromRef(WB_AlterationAlt_FormList_SenseOre, akTarget, WB_TargetSeekRange)
	If FoundOre
		Utility.Wait((akTarget.GetDistance(FoundOre) / WB_TargetSeekRange) * WB_ExplosionDur)
		TheMarker = FoundOre.PlaceAtMe(WB_AlterationAlt_Static_SenseOre)
		TheLight = FoundOre.PlaceAtMe(WB_AlterationAlt_Light_SenseOre,abInitiallyDisabled = true)
		WB_AlterationAlt_Message_SenseOre_Success.Show()
		Game.AdvanceSkill("Alteration",15)
		TheLight.MoveTo(FoundOre,0,0,50)
		TheLight.Enable(true)
		WB_AlterationAlt_FXS.Play(FoundOre)
	Else
		Utility.Wait(WB_ExplosionDur)
		WB_AlterationAlt_Message_SenseOre_Failure.Show()
	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	If FoundOre
		WB_AlterationAlt_FXS.Stop(FoundOre)
		TheLight.Delete()
		TheMarker.Disable(true)
		Utility.Wait(2.5)
		TheMarker.Delete()
	EndIf

EndEvent

; -----

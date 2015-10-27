Scriptname WB_AlarmProc_Script extends activemagiceffect  

; -----

Sound Property WB_AlterationDetect_Scripted_Marker_Alarm Auto
MagicEffect Property WB_A000_AlterationDetect_Alarm_EffectInitDelay Auto
Message Property WB_AlterationDetect_Alarm_Message Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)
	If !akCaster.HasMagicEffect(WB_A000_AlterationDetect_Alarm_EffectInitDelay) && akCaster == Game.GetPlayer()
		WB_AlterationDetect_Scripted_Marker_Alarm.Play(akCaster)
		WB_AlterationDetect_Alarm_Message.Show()
	EndIf
EndEvent

; -----
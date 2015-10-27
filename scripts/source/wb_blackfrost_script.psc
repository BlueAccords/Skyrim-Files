Scriptname WB_BlackFrost_Script extends activemagiceffect  

; -----

Float Property WB_CurseToSelfDmgMult Auto
String Property WB_CurseStat Auto
String Property WB_DamageStat Auto
Float Property WB_StatCurseMult Auto
Explosion Property WB_DestructionFrost_Explosion_Shivers1 Auto
Explosion Property WB_DestructionFrost_Explosion_Shivers2 Auto
Explosion Property WB_DestructionFrost_Explosion_Shivers3 Auto

; -----

Float StatCurse
Float Type

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	StatCurse = akCaster.GetAV(WB_DamageStat) * WB_StatCurseMult
	If StatCurse > 0
		akTarget.DamageAV(WB_CurseStat,StatCurse)
		akCaster.DamageAV(WB_DamageStat,StatCurse * WB_CurseToSelfDmgMult)
		If StatCurse <= 75
			akTarget.PlaceAtMe(WB_DestructionFrost_Explosion_Shivers1)
		ElseIf StatCurse <= 150
			akTarget.PlaceAtMe(WB_DestructionFrost_Explosion_Shivers2)
		Else
			akTarget.PlaceAtMe(WB_DestructionFrost_Explosion_Shivers3)
		EndIf
	Else
		Dispel()
	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	If StatCurse > 0
		akTarget.RestoreAV(WB_CurseStat,StatCurse)
	EndIf

EndEvent

; -----
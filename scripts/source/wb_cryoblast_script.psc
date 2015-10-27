Scriptname WB_Cryoblast_Script extends ObjectReference  

; -----

Float Property WB_DangerDistance Auto
Float Property WB_SelfDamageFraction Auto
Float Property WB_SelfDamageMin Auto

; -----

Event OnLoad()

	If Game.GetPlayer().GetDistance(Self) <= WB_DangerDistance
		Float SelfDamage = WB_SelfDamageFraction * Game.GetPlayer().GetAV("Health") / Game.GetPlayer().GetAVPercentage("Health")
		If SelfDamage < WB_SelfDamageMin
			SelfDamage = WB_SelfDamageMin
		EndIf
		Game.GetPlayer().DamageAV("Health", SelfDamage)
	EndIf
	Self.Delete()

EndEvent

; -----
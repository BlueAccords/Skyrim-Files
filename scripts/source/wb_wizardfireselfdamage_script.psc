Scriptname WB_WizardfireSelfDamage_Script extends ObjectReference  

; -----

Float Property WB_DangerDistance Auto
Float Property WB_SelfDamage Auto
Actor Property PlayerRef Auto

; -----

Event OnLoad()

	If PlayerRef.GetDistance(Self) <= WB_DangerDistance
		PlayerRef.DamageAV("Health", WB_SelfDamage)
	EndIf
	Self.Delete()

EndEvent

; -----
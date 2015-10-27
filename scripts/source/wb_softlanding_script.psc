Scriptname WB_SoftLanding_Script extends ObjectReference  

; ------

Hazard Property WB_AlterationTelekinesis_Hazard_SoftLanding Auto
Actor Property PlayerRef Auto

; ------

Event OnLoad()

	Self.PlaceAtMe(WB_AlterationTelekinesis_Hazard_SoftLanding)
	Self.Delete()

EndEvent

; ------
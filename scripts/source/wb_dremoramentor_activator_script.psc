Scriptname WB_DremoraMentor_Activator_Script extends ObjectReference  

; -----

Actor Property PlayerRef Auto
GlobalVariable Property WB_Conjuration_ConjureDremoraMentor_Global_WhichMentor Auto
Message Property WB_ConjurationDaedric_ConjureDremoraMentor_Message_WhichMentor Auto

; -----

Event OnLoad()

	Debug.Notification(GetActorOwner()+ " " + GetFactionOwner())
	WB_Conjuration_ConjureDremoraMentor_Global_WhichMentor.SetValueInt(WB_ConjurationDaedric_ConjureDremoraMentor_Message_WhichMentor.Show())

	Disable()
	Delete()

EndEvent

; -----
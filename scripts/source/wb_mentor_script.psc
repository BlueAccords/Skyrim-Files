Scriptname WB_Mentor_Script extends Actor  

; -----

Actor Property PlayerRef Auto

; -----

Event OnActivate(ObjectReference akActivator)

	If akActivator == PlayerRef
		Game.ShowTrainingMenu(Self)
	EndIf

EndEvent

; -----
Scriptname WB_LambOfMara_Script extends activemagiceffect  

; -----

Float Property WB_Mult Auto
Float Property WB_UpdateRate Auto
GlobalVariable Property WB_Restoration_LambOfMara_Global_XP Auto
Actor Property PlayerRef Auto
Perk Property Respite Auto

; -----

Actor TargetActor
Actor CasterActor
Float PreviousHealth

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TargetActor = akTarget
	CasterActor = akCaster
	PreviousHealth = akTarget.GetAV("Health")
	RegisterForSingleUpdate(WB_UpdateRate)

EndEvent

; -----

Event OnUpdate()

	Float CurrentHealth = TargetActor.GetAV("Health")
	Float HealthDelta = (PreviousHealth - CurrentHealth) * WB_Mult
	If HealthDelta > 0
		CasterActor.RestoreAV("Health", HealthDelta)
		If CasterActor.HasPerk(Respite)
			CasterActor.RestoreAV("Stamina", HealthDelta)
		EndIf
	EndIf
	PreviousHealth = CurrentHealth

	If TargetActor.IsDead()
		Dispel()
	Else
		RegisterForSingleUpdate(WB_UpdateRate)
	EndIf

	If CasterActor == PlayerRef
		Game.AdvanceSkill("Restoration", HealthDelta * WB_Restoration_LambOfMara_Global_XP.GetValue())
	EndIf

EndEvent

; -----
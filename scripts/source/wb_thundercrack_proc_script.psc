Scriptname WB_Thundercrack_Proc_Script extends activemagiceffect  

; -----

Sound Property WB_DestructionShock_Marker_Scripted_Thundercrack Auto
ImagespaceModifier Property WB_DestructionShock_Imod_Jolt_Electrocute Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	WB_DestructionShock_Imod_Jolt_Electrocute.Apply()
	Game.ShakeCamera(akTarget, 0.5,0.5)
	Game.ShakeController(0.5,0.5,0.5)
	Float RandomThunder = Utility.RandomFloat(0.0,20.0)
	If RandomThunder < 5.0 && RandomThunder > 1.0
		Utility.Wait(RandomThunder)
		WB_DestructionShock_Marker_Scripted_Thundercrack.Play(akTarget)
	EndIf

EndEvent

; -----
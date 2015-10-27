Scriptname WB_HiddenCobra_Script extends ActiveMagicEffect  

; -----

Sound Property WB_IllusionNightmare_Marker_Script_HiddenCobra Auto
Spell Property WB_S_I100_HiddenCobra_Spell Auto
Activator Property FXEmptyActivator Auto
Float Property WB_UpdateRate Auto
Int Property WB_TicksNotInCombat Auto
ImagespaceModifier Property WB_IllusionNightmare_Imod_HiddenCobra Auto

; -----

ObjectReference TheBox
Actor TheCaster
Actor TheTarget
Int TicksNotInCombat

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TicksNotInCombat = 0
	TheBox = akTarget.PlaceAtMe(FXEmptyActivator)
	TheCaster = akCaster
	TheTarget = akTarget
	RegisterForUpdate(WB_UpdateRate)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	Utility.Wait(2.0)
	TheBox.Delete()

EndEvent

; -----

Event OnUpdate()

	If TheTarget.GetCombatState() != 1
		TicksNotInCombat += 1
		If TicksNotInCombat >= WB_TicksNotInCombat
			UnregisterForUpdate()
			TheBox.MoveTo(TheTarget)
			WB_S_I100_HiddenCobra_Spell.RemoteCast(TheBox,TheCaster,TheTarget)
			WB_IllusionNightmare_Marker_Script_HiddenCobra.Play(TheTarget)
			WB_IllusionNightmare_Imod_HiddenCobra.Apply()
			Dispel()
		EndIf
	Else
		TicksNotInCombat = 0
	EndIf

EndEvent

; -----
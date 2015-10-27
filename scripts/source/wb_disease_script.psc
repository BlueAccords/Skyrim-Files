Scriptname WB_Disease_Script extends ActiveMagicEffect  

; -----

Activator Property FXEmptyActivator Auto
Spell Property WB_S_R025_InflictBlight_Spell Auto
Float Property WB_UpdateRate Auto

; -----

ObjectReference TheBox
Actor TheTarget
Actor TheCaster

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TheBox = akTarget.PlaceAtMe(FXEmptyActivator)
	TheTarget = akTarget
	TheCaster = akCaster
	RegisterForSingleUpdate(WB_UpdateRate)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	TheBox.Delete()

EndEvent

; -----

Event OnUpdate()

	TheBox.MoveTo(TheTarget)
	WB_S_R025_InflictBlight_Spell.RemoteCast(TheBox,TheCaster,TheTarget)
	RegisterForSingleUpdate(WB_UpdateRate)

EndEvent

; -----
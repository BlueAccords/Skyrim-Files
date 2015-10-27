Scriptname WB_Mindworm_Script extends activemagiceffect  

; -----

Float Property WB_UpdateRate Auto
Spell Property WB_S_I050_CompellingWhispers_Spell_Proc Auto
Activator Property FXEmptyActivator Auto

; -----

ObjectReference TheBox
Actor TheTarget
Actor TheCaster

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TheTarget = akTarget
	TheCaster = akCaster

	TheBox = akTarget.PlaceAtMe(FXEmptyActivator)
	RegisterForSingleUpdate(WB_UpdateRate)

EndEvent

; -----

Event OnUpdate()

	WB_S_I050_CompellingWhispers_Spell_Proc.RemoteCast(TheBox,TheCaster, TheTarget)

EndEvent

; -----

Event OnEffecFinish(Actor akTarget, Actor akCaster)

	TheBox.Delete()

EndEvent

; -----
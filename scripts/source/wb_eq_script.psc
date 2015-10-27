Scriptname WB_EQ_Script extends activemagiceffect  

; -----

Float Property WB_UpdateRate Auto
Spell Property WB_EQSpell auto
Spell Property WB_SelfSpell Auto

; -----

Actor TheTarget

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If akTarget.GetEquippedSpell(0) == WB_SelfSpell
		akTarget.EquipSpell(WB_EQSpell,0)
	EndIf

	If akTarget.GetEquippedSpell(1) == WB_SelfSpell
		akTarget.EquipSpell(WB_EQSpell,1)
	EndIf

	TheTarget = akTarget

	RegisterForUpdate(WB_UpdateRate)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	If akTarget.GetEquippedSpell(0) == WB_EQSpell
		akTarget.UnequipSpell(WB_EQSpell,0)
		akTarget.RemoveSpell(WB_EQSpell)
		akTarget.EquipSpell(WB_SelfSpell,0)
	EndIf

	If akTarget.GetEquippedSpell(1) == WB_EQSpell
		akTarget.UnequipSpell(WB_EQSpell,1)
		akTarget.RemoveSpell(WB_EQSpell)
		akTarget.EquipSpell(WB_SelfSpell,1)
	EndIf

EndEvent

; -----

Event OnUpdate()

	If TheTarget.GetEquippedSpell(0) != WB_EQSpell && TheTarget.GetEquippedSpell(1) != WB_EQSpell
		Dispel()
	EndIf

EndEvent

; -----
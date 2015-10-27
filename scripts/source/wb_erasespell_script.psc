Scriptname WB_EraseSpell_Script extends ActiveMagicEffect  

; -----

Formlist Property WB_EraseSpells_FormList_Exclusion Auto
Sound Property ITMBookClose Auto
Sound Property MAGFail Auto
Message Property WB_EraseSpell_Message Auto
Message Property WB_EraseSpell_MessageFail Auto
Keyword Property MagicShout Auto

; -----

Actor TheTarget
Spell TheSpell

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TheTarget = akTarget

EndEvent

; -----

Event OnSpellCast(Form akSpell)

	If !WB_EraseSpells_FormList_Exclusion.HasForm(akSpell) && !akSpell.HasKeyword(MagicShout)
		TheTarget.InterruptCast()
		TheSpell = akSpell as Spell
		TheTarget.DispelSpell(TheSpell)
		TheTarget.RemoveSpell(TheSpell)
		ITMBookClose.Play(TheTarget)
		WB_EraseSpell_Message.Show()
		Dispel()
	Else
		MAGFail.Play(TheTarget)
		WB_EraseSpell_MessageFail.Show()
	EndIf

EndEvent

; -----
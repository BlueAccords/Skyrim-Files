Scriptname WB_CurseOfTheSilent_Script extends ActiveMagicEffect  

; -----

Event OnSpellCast(Form akSpell)

	If (akSpell as Spell)
		Dispel()
	EndIf

EndEvent

; -----
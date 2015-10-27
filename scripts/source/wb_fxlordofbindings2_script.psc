Scriptname WB_FXLordOfBindings2_Script extends ActiveMagicEffect  

; -----

FormList Property WB_ConjurationDaedric_FormList_LordOfBindings_KeywordsIn Auto
Keyword Property WB_Conjuration_NoLordOfBindings Auto
Message Property WB_ConjurationUndead_LordOfBindings Auto
Message Property WB_ConjurationUndead_LordOfBindings_Fail Auto
Message Property WB_ConjurationUndead_LordOfBindings_NoSpell Auto

; -----

Actor ThePlayer
Actor TheLord

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	ThePlayer = Game.GetPlayer()
	TheLord = akTarget

	If akTarget.GetAV("Variable09") != 1337
		Spell SpellPlayerLeft = ThePlayer.GetEquippedSpell(0)
		If SpellPlayerLeft
			If IsValid(SpellPlayerLeft)
				TheLord.AddSpell(SpellPlayerLeft)
				WB_ConjurationUndead_LordOfBindings.Show()
			Else
				WB_ConjurationUndead_LordOfBindings_Fail.Show()
			EndIf
		Else
			WB_ConjurationUndead_LordOfBindings_NoSpell.Show()
		EndIf
		akTarget.SetAV("Variable09",1337)
	EndIf

EndEvent

; -----

Bool Function IsValid(Spell akSpell)

	Bool IsAcceptable = false
	If !akSpell.HasKeyword(WB_Conjuration_NoLordOfBindings)
		Int i = 0
		While i < WB_ConjurationDaedric_FormList_LordOfBindings_KeywordsIn.GetSize()
			If akSpell.HasKeyword(WB_ConjurationDaedric_FormList_LordOfBindings_KeywordsIn.GetAt(i) as Keyword)
				IsAcceptable = true
			EndIf
			i += 1
		EndWhile
	EndIf
	Return IsAcceptable

EndFunction

; -----
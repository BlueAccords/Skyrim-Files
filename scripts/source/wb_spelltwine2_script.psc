Scriptname WB_SpellTwine2_Script extends activemagiceffect  

; -----

FormList Property WB_AlterationMetamagic_SpellTwine_FormList Auto
FormList[] Property WB_AlterationMetamagic_SpellTwine_FormList_X Auto
Spell[] Property WB_SpellTwine_Proc Auto

Message Property WB_AlterationMetamagic_SpellTwine_Message Auto
Message Property WB_AlterationMetamagic_SpellTwine_Message_Double Auto
Message Property WB_AlterationMetamagic_SpellTwine_Message_Fail Auto
Message Property WB_AlterationMetamagic_SpellTwine_Message_TooMany Auto
Message Property WB_AlterationMetamagic_SpellTwine_Message_Select Auto
ImagespaceModifier Property WB_AlterationMetamagic_Imod_Outro Auto

Int Property WB_SpellMax Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Spell EquippedSpell = akTarget.GetEquippedSpell(0) as Spell
	If EquippedSpell
		If WB_AlterationMetamagic_SpellTwine_FormList.HasForm(EquippedSpell)
			WB_AlterationMetamagic_SpellTwine_Message_Double.Show()
		Else
			If WB_AlterationMetamagic_SpellTwine_FormList.GetSize() < WB_SpellMax
				Int i = WB_AlterationMetamagic_SpellTwine_Message_Select.Show()
				WB_AlterationMetamagic_Imod_Outro.Apply()
				WB_AlterationMetamagic_SpellTwine_FormList.AddForm(EquippedSpell)					; store spell
				WB_AlterationMetamagic_SpellTwine_FormList_X[(WB_AlterationMetamagic_SpellTwine_FormList.GetSize() - 1)].AddForm(WB_SpellTwine_Proc[i])
				WB_AlterationMetamagic_SpellTwine_Message.Show(WB_AlterationMetamagic_SpellTwine_FormList.GetSize(), WB_SpellMax)
			Else
				WB_AlterationMetamagic_SpellTwine_Message_TooMany.Show(WB_AlterationMetamagic_SpellTwine_FormList.GetSize())
			EndIf
		EndIf
	Else
		WB_AlterationMetamagic_SpellTwine_Message_Fail.Show()
	EndIf

EndEvent

; -----
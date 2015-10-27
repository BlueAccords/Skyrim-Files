Scriptname WB_KnowledgeIsPower2_Script extends ActiveMagicEffect  

; -----

FormList Property WB_AlterationMetamagic_FormList_KnowledgeIsPower Auto
Spell Property WB_S_A075_KnowledgeIsPower_Spell_Power_PC Auto
Message Property WB_AlterationMetamagic_Message_KnowledgeIsPower Auto
ImagespaceModifier Property WB_AlterationMetamagic_Imod_Outro Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Spell TheSpell = akTarget.GetEquippedSpell(0)
	If TheSpell
		WB_AlterationMetamagic_FormList_KnowledgeIsPower.Revert()
		WB_AlterationMetamagic_Imod_Outro.Apply()
		WB_AlterationMetamagic_FormList_KnowledgeIsPower.AddForm(TheSpell)
		akTarget.AddSpell(WB_S_A075_KnowledgeIsPower_Spell_Power_PC,false)
		akTarget.EquipSpell(WB_S_A075_KnowledgeIsPower_Spell_Power_PC,2)
		WB_AlterationMetamagic_Message_KnowledgeIsPower.Show()
	EndIf

EndEvent

; -----
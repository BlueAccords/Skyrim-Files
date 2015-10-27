Scriptname WB_KnowledgeIsPowerRevert_Script extends ActiveMagicEffect  

; -----

FormList Property WB_AlterationMetamagic_FormList_KnowledgeIsPower Auto
Spell Property WB_S_A075_KnowledgeIsPower_Spell_Power_PC Auto
Message Property WB_AlterationMetamagic_Message_KnowledgeIsPower_Clear Auto
ImagespaceModifier Property WB_AlterationMetamagic_Imod_Outro Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	WB_AlterationMetamagic_Imod_Outro.Apply()
	WB_AlterationMetamagic_FormList_KnowledgeIsPower.Revert()
	If akTarget.HasSpell(WB_S_A075_KnowledgeIsPower_Spell_Power_PC)
		akTarget.RemoveSpell(WB_S_A075_KnowledgeIsPower_Spell_Power_PC)
	EndIf
	WB_AlterationMetamagic_Message_KnowledgeIsPower_Clear.Show()

EndEvent

; -----
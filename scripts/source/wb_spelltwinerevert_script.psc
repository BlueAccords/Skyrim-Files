Scriptname WB_SpellTwineRevert_Script extends activemagiceffect  

; -----

FormList Property WB_AlterationMetamagic_SpellTwine_FormList Auto
FormList Property WB_AlterationMetamagic_SpellTwine_FormList_0 Auto
FormList Property WB_AlterationMetamagic_SpellTwine_FormList_1 Auto
FormList Property WB_AlterationMetamagic_SpellTwine_FormList_2 Auto
Message Property WB_AlterationMetamagic_SpellTwine_Message_Clear Auto
ImagespaceModifier Property WB_AlterationMetamagic_Imod_Outro Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	WB_AlterationMetamagic_Imod_Outro.Apply()
	WB_AlterationMetamagic_SpellTwine_FormList.Revert()
	WB_AlterationMetamagic_SpellTwine_FormList_0.Revert()
	WB_AlterationMetamagic_SpellTwine_FormList_1.Revert()
	WB_AlterationMetamagic_SpellTwine_FormList_2.Revert()
	WB_AlterationMetamagic_SpellTwine_Message_Clear.Show()

EndEvent

; -----
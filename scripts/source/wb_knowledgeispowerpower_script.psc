Scriptname WB_KnowledgeIsPowerPower_Script extends activemagiceffect  

; -----

FormList Property WB_AlterationMetamagic_FormList_KnowledgeIsPower Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	(WB_AlterationMetamagic_FormList_KnowledgeIsPower.GetAt(0) as Spell).Cast(akTarget)

EndEvent

; -----
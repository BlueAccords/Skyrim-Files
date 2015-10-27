Scriptname WB_DremoraMentor_Picker_Script extends activemagiceffect  

; -----

Keyword Property WB_Conjuration_IsMentor Auto

Spell[] Property WB_S_Mentor Auto
Message Property WB_ConjurationDaedric_ConjureDremoraMentor_Message_WhichMentor Auto

; -----

Event OnSpellCast(Form akSpell)

	If akSpell.HasKeyword(WB_Conjuration_IsMentor)
		WB_S_Mentor[WB_ConjurationDaedric_ConjureDremoraMentor_Message_WhichMentor.Show()].Cast(GetCasterActor())
	EndIf

EndEvent

; -----
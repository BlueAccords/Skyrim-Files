Scriptname WB_FXDremoraChurl_Script extends ActiveMagicEffect  

; -----

Spell Property WB_S_C025_ConjureChurl_Spell_Proc Auto
Float Property WB_Wait Auto

; -----

Event OnDying(Actor akKiller)

	If akKiller
		Utility.Wait(WB_Wait)
		WB_S_C025_ConjureChurl_Spell_Proc.Cast(akKiller)
	EndIf

EndEvent

; -----
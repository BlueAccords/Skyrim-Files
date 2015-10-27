Scriptname WB_Stormclaw_Script extends ActiveMagicEffect  

; -----

GlobalVariable Property WB_Destruction_Stormclaw_Global_TargetCount Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	WB_Destruction_Stormclaw_Global_TargetCount.Mod(1)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	WB_Destruction_Stormclaw_Global_TargetCount.Mod(-1)

EndEvent

; -----
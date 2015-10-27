Scriptname WB_PaleMoon_Script extends ActiveMagicEffect  

; -----

Float Property WB_ModifierStrength Auto
String Property AttackDamageMult auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.ModAV(AttackDamageMult,WB_ModifierStrength)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	akTarget.ModAV(AttackDamageMult,-WB_ModifierStrength)

EndEvent

; -----
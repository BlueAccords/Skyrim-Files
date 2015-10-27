Scriptname WB_DremoraBerserker_Battlefury_Script extends activemagiceffect  

; -----

String Property WB_Stat Auto
Float Property WB_Amount Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akCaster.ModAV(WB_Stat,WB_Amount)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	akCaster.ModAV(WB_Stat,-WB_Amount)

EndEvent

; -----

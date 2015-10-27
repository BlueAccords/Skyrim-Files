Scriptname WB_LootMagnetProc_Script extends activemagiceffect  

; -----

EffectShader Property WB_AlterationAlt_LootMagnet_FXS Auto
Float Property WB_PushForce Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	WB_AlterationAlt_LootMagnet_FXS.Play(akTarget,3)
	akTarget.ApplyHavokImpulse(0,0,500, WB_PushForce)
	akTarget.RemoveAllItems(akCaster, false, true)

EndEvent

; -----
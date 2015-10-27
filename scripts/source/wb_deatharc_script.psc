Scriptname WB_DeathArc_Script extends activemagiceffect  

; -----


GlobalVariable Property WB_Destruction_Crackle_Global Auto
ImagespaceModifier Property MAGShockExpMassImod Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	WB_Destruction_Crackle_Global.SetValue(1)
	MAGShockExpMassImod.Apply()

EndEvent

; -----
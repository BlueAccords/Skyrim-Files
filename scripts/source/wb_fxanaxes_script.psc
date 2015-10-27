Scriptname WB_FXAnaxes_Script extends ActiveMagicEffect  

; -----

Float Property WB_MagMult Auto
GlobalVariable Property WB_Conjuration_ConjureXivilaiLord_Global_MagickaLoss Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Utility.Wait(0.1)
	akTarget.SetAV("Magicka", WB_Conjuration_ConjureXivilaiLord_Global_MagickaLoss.GetValue() * WB_MagMult)

EndEvent

; -----
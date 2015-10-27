Scriptname WB_XivilaiLord_Self_New_Script extends ActiveMagicEffect  

; -----

GlobalVariable Property WB_Conjuration_ConjureXivilaiLord_Global_MagickaLoss Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Float TargetMagicka = akTarget.GetAV("Magicka")
	WB_Conjuration_ConjureXivilaiLord_Global_MagickaLoss.SetValue(TargetMagicka)
	akTarget.DamageAV("Magicka",TargetMagicka)

EndEvent

; -----
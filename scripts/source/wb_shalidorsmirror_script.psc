Scriptname WB_ShalidorsMirror_Script extends ActiveMagicEffect  

; -----

GlobalVariable Property WB_Alteration_ShalidorsMirror_Global_XP Auto
GlobalVariable Property WB_General_Global_XP Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Float TargetMagickaPct = akTarget.GetAVPercentage("Magicka")
	Float TargetStaminaPct = akTarget.GetAVPercentage("Stamina")

	; preventing division by zero error if magicka is completely empty
	If TargetMagickaPct == 0.0
		akTarget.RestoreAV("Magicka",1)
		TargetMagickaPct = akTarget.GetAVPercentage("Magicka")
	EndIf

	; preventing division by zero error if stamina is completely empty
	If TargetStaminaPct == 0.0
		akTarget.RestoreAV("Stamina",1)
		TargetStaminaPct = akTarget.GetAVPercentage("Stamina")
	EndIf

	Float TargetMagickaTotal = akTarget.GetAV("Magicka") / TargetMagickaPct
	Float TargetStaminaTotal = akTarget.GetAV("Stamina") / TargetStaminaPct

	Float MagickaDelta
	Float StaminaDelta

	If TargetMagickaPct < TargetStaminaPct
		; more stamina than magicka
		MagickaDelta = TargetMagickaTotal * (TargetStaminaPct - TargetMagickaPct)
		StaminaDelta = TargetStaminaTotal * (TargetStaminaPct - TargetMagickaPct)
		akTarget.RestoreAV("Magicka",MagickaDelta)
		akTarget.DamageAV("Stamina",StaminaDelta)
	Else
		; more magicka than stamina
		MagickaDelta = TargetMagickaTotal * (TargetMagickaPct - TargetStaminaPct)
		StaminaDelta = TargetStaminaTotal * (TargetMagickaPct - TargetStaminaPct)
		akTarget.DamageAV("Magicka",MagickaDelta)
		akTarget.RestoreAV("Stamina",StaminaDelta)
	EndIf

	If akCaster == Game.GetPlayer()
		Game.AdvanceSkill("Alteration", (MagickaDelta + StaminaDelta) * WB_Alteration_ShalidorsMirror_Global_XP.GetValue() * WB_General_Global_XP.GetValue())
	EndIf

EndEvent

; -----
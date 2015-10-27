Scriptname WB_BreathOfArkay2_Script extends activemagiceffect  

; -----

Sound Property WB_RestorationArkay_Marker_Scripted_BreathOfArkay_Max Auto
Spell[] Property WB_S_BreathOfArkay_Spell Auto
Float Property WB_UpdateRate Auto
Sound Property WB_RestorationArkay_Marker_Release_BreathOfArkay Auto
ImagespaceModifier Property WB_RestorationBlood_Imod_Heartstopper Auto
Explosion Property WB_RestorationBlood_Explosion_Rune Auto
ImpactDataSet PRoperty WB_ImpactSet Auto

; -----

Int StackCount
Int MaxCount
Actor TargetActor

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	StackCount = 0
	MaxCount = WB_S_BreathOfArkay_Spell.Length - 1
	TargetActor = akTarget
	RegisterForUpdate(WB_UpdateRate)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	akCaster.DoCombatSpellApply(WB_S_BreathOfArkay_Spell[StackCount], akTarget)
	WB_RestorationArkay_Marker_Release_BreathOfArkay.Play(akTarget)
	WB_RestorationBlood_Imod_Heartstopper.Apply(StackCount / 10)

	akTarget.PlaceAtMe(WB_RestorationBlood_Explosion_Rune)

	If StackCount >= MaxCount
		akCaster.PlayImpactEffect(WB_ImpactSet, "NPC R MagicNode [RMag]", 0, 0, 0, 512, true, true)
		akCaster.PlayImpactEffect(WB_ImpactSet, "NPC L MagicNode [LMag]", 0, 0, 0, 512, true, true)
	EndIf

EndEvent

; -----

Event OnUpdate()

	StackCount += 1
	If StackCount > MaxCount
		UnregisterForUpdate()
		StackCount = MaxCount
		WB_RestorationArkay_Marker_Scripted_BreathOfArkay_Max.Play(TargetActor)
	EndIf

EndEvent

; -----
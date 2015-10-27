Scriptname WB_Bloodstar_Script extends ActiveMagicEffect  

; ------

Static Property WB_RestorationBlood_Static_Bloodstar Auto

Activator Property FXEmptyActivator Auto
Float Property WB_StartHeight Auto
Float Property WB_AttackRate Auto

Explosion Property WB_RestorationBlood_Explosion Auto

Float Property WB_Speed Auto

Float Property WB_SeekRange Auto

GlobalVariable Property WB_Restoration_Bloodseeker_Global_Mult Auto

Message Property WB_RestorationBlood_Message_Bloodstar Auto
Message Property WB_RestorationBlood_Message_BloodstarHeal Auto

GlobalVariable Property WB_Restoration_AllDeathSpells_Global_XP Auto
Actor Property PlayerRef Auto

GlobalVariable Property WB_Restoration_Bloodseeker_Global_XP Auto

Bool Property WB_AllowHeals Auto

; ------

ObjectReference TheOrb
Actor TheTarget
Actor TheCaster
Float StartHealth

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TheTarget = akTarget
	TheCaster = akCaster
	StartHealth = akTarget.GetAV("Health")

	TheOrb = TheCaster.PlaceAtMe(WB_RestorationBlood_Static_Bloodstar, abInitiallyDisabled = true)
	TheOrb.SetAngle(0,0,0)
	TheOrb.MoveTo(TheCaster,0,0,WB_StartHeight)
	TheOrb.Enable()
	Utility.Wait(0.1)

	RegisterForSingleUpdate(WB_AttackRate)
	TheOrb.TranslateToRef(akTarget,WB_Speed)

EndEvent

; ------

Event OnUpdate()

	If TheOrb.GetDistance(TheTarget) <= WB_SeekRange
		UnregisterForUpdate()
		TheOrb.PlaceAtMe(WB_RestorationBlood_Explosion)
		TheOrb.Delete()
		Float CurrentHealth = TheTarget.GetAV("Health")
		If CurrentHealth < StartHealth
			Float RealDamage = (StartHealth - CurrentHealth) * WB_Restoration_Bloodseeker_Global_Mult.GetValue() / 100
			TheTarget.DamageAV("Health",RealDamage)
			WB_RestorationBlood_Message_Bloodstar.Show(RealDamage)
			If TheCaster == PlayerRef
				Game.AdvanceSkill("Restoration", WB_Restoration_AllDeathSpells_Global_XP.GetValue() * RealDamage * WB_Restoration_Bloodseeker_Global_XP.GetValue())
			EndIf
		Else
			If WB_AllowHeals
				Float RealHeal = (CurrentHealth - StartHealth) * WB_Restoration_Bloodseeker_Global_Mult.GetValue() / 100
				TheTarget.RestoreAV("Health",RealHeal)
				WB_RestorationBlood_Message_BloodstarHeal.Show(RealHeal)
				If TheCaster == PlayerRef
					Game.AdvanceSkill("Restoration", WB_Restoration_AllDeathSpells_Global_XP.GetValue() * RealHeal * WB_Restoration_Bloodseeker_Global_XP.GetValue())
				EndIf
			EndIf
		EndIf
		Dispel()
	Else
		TheOrb.TranslateToRef(TheTarget,WB_Speed)
	EndIf
	RegisterForSingleUpdate(WB_AttackRate)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	TheOrb.StopTranslation()
	TheOrb.Delete()

EndEvent

; -----
Scriptname WB_DaedricCrescent_Script extends ActiveMagicEffect  


; -----

Weapon Property WB_DaedricCrescent1h_Weapon_Enchanted Auto

; -----

Float OriginalStat

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Utility.Wait(0.1)
	akTarget.AddItem(WB_DaedricCrescent1h_Weapon_Enchanted,1,true)
	akTarget.EquipItem(WB_DaedricCrescent1h_Weapon_Enchanted, true, true)

	Float TargetSkill = akTarget.GetAV("OneHanded")
	OriginalStat = TargetSkill
	If akTarget.GetAV("TwoHanded") > TargetSkill
		TargetSkill = akTarget.GetAV("TwoHanded")
	EndIf
	If akTarget.GetAV("Destruction") > TargetSkill
		TargetSkill = akTarget.GetAV("Destruction")
	EndIf
	If akTarget.GetAV("Archery") > TargetSkill
		TargetSkill = akTarget.GetAV("Archery")
	EndIf

	akTarget.SetAV("OneHanded",TargetSkill)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	akTarget.RemoveItem(WB_DaedricCrescent1h_Weapon_Enchanted,akTarget.GetItemCount(WB_DaedricCrescent1h_Weapon_Enchanted),true)
	akTarget.SetAV("OneHanded",OriginalStat)

EndEvent

; -----
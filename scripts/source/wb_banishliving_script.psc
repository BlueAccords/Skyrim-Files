Scriptname WB_BanishLiving_Script extends ActiveMagicEffect  

; -----

Activator Property BanishTargetFXActivator Auto

Float Property SecondsBeforeKill Auto
Float Property SecondsBeforeDelete Auto

ImagespaceModifier Property MAGBanishImod Auto

Container Property WB_BanishLiving_Chest Auto

GlobalVariable Property WB_Conjuration_BanishLiving_Global_Counter Auto

Message Property WB_ConjurationBanish_Message_Realm1 Auto
Message Property WB_ConjurationBanish_Message_Realm2 Auto
Message Property WB_ConjurationBanish_Message_Realm3 Auto
Message Property WB_ConjurationBanish_Message_Realm4 Auto
Message Property WB_ConjurationBanish_Message_Realm5 Auto
Message Property WB_ConjurationBanish_Message_Realm6 Auto
Message Property WB_ConjurationBanish_Message_RealmAzura Auto
Message Property WB_ConjurationBanish_Message_RealmHermaeusMora Auto
Message Property WB_ConjurationBanish_Message_RealmMeridia Auto
Message Property WB_ConjurationBanish_Message_RealmNocturnal Auto

Keyword Property Vampire Auto

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	akTarget.SendAssaultAlarm()
	ObjectReference PlacedEffect = akTarget.PlaceAtMe(BanishTargetFXActivator)
	MAGBanishImod.Apply()

	Utility.Wait(SecondsBeforeKill)

	ObjectReference TempChest = akTarget.PlaceAtMe(WB_BanishLiving_Chest, abInitiallyDisabled = true)
	akTarget.RemoveAllItems(TempChest, true, false)
	akTarget.RemoveAllItems(akCaster, true, true)
	TempChest.Delete()

	DisplayMessage(akTarget, akCaster)
	akTarget.Kill(akCaster)
	akTarget.Delete()
	WB_Conjuration_BanishLiving_Global_Counter.Mod(1)

	Utility.Wait(SecondsBeforeDelete)

	PlacedEffect.Delete()

EndEvent

; -----

Function DisplayMessage(Actor akTarget, Actor akCaster)

	Int RandomRoll = Utility.RandomInt(0,6)
	If RandomRoll == 0
		If akTarget.HasKeyword(Vampire)
			WB_ConjurationBanish_Message_RealmMeridia.Show()
		ElseIf akTarget.GetAV("Destruction") > 75 || akTarget.GetAV("Conjuration") > 75
			WB_ConjurationBanish_Message_RealmHermaeusMora.Show()
		ElseIf akTarget.GetAV("Sneak") > 75 || akTarget.GetAV("Lockpicking") > 75
			WB_ConjurationBanish_Message_RealmNocturnal.Show()
		Else
			WB_ConjurationBanish_Message_RealmAzura.Show()
		EndIf
	ElseIf RandomRoll == 1
		WB_ConjurationBanish_Message_Realm1.Show()
	ElseIf RandomRoll == 2
		WB_ConjurationBanish_Message_Realm2.Show()
	ElseIf RandomRoll == 3
		WB_ConjurationBanish_Message_Realm3.Show()
	ElseIf RandomRoll == 4
		WB_ConjurationBanish_Message_Realm4.Show()
	ElseIf RandomRoll == 5
		WB_ConjurationBanish_Message_Realm5.Show()
	ElseIf RandomRoll == 6
		WB_ConjurationBanish_Message_Realm6.Show()
	EndIf

EndFunction

; -----
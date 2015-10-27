Scriptname WB_VolcanoController_Script extends ObjectReference  

; -----

Activator Property WB_DestructionFire_Activator_VolcanoNew_Fountain Auto
Float Property WB_TotalHeight Auto
Float Property WB_FallHeight Auto
Float Property WB_MoveSpeed Auto
Float Property WB_Duration Auto
Float Property WB_UpdateRate Auto
Spell Property WB_S_D100_VolcanoNew_Spell_PC Auto
Activator Property FXEmptyActivator Auto
Float Property WB_EndLocZ Auto
Float Property WB_FireballRadius Auto
Actor Property PlayerRef Auto
Float Property WB_RumbleStrength Auto
Float Property WB_RumbleRadius Auto
Light Property WB_DestructionFire_Light_Volcano_Fountain Auto

; ------

ObjectReference TheVolcano
ObjectReference TargetBox
ObjectReference LightBox
ObjectReference StarterBox

; ------

Event OnLoad()

	TargetBox = Self.PlaceAtMe(FXEmptyActivator)

	TheVolcano = Self.PlaceAtMe(WB_DestructionFire_Activator_VolcanoNew_Fountain)
	TheVolcano.SetAngle(0,0,0)

	StarterBox = Self.PlaceAtMe(FXEmptyActivator)
	StarterBox.MoveTo(Self, 0, 0, 32)

	LightBox = Self.PlaceAtMe(WB_DestructionFire_Light_Volcano_Fountain)
	LightBox.MoveTo(Self, 0, 0, 64)

	TheVolcano.TranslateTo(TheVolcano.GetPositionX(), TheVolcano.GetPositionY(), TheVolcano.GetPositionZ() + WB_TotalHeight, 0, 0, 0, WB_MoveSpeed)

	RegisterForUpdate(WB_UpdateRate)

	Utility.Wait(WB_Duration)

	OnUnload()

EndEvent

; -----

Event OnUnload()

	UnregisterForUpdate()
;	TheVolcano.TranslateTo(TheVolcano.GetPositionX(), TheVolcano.GetPositionY(), TheVolcano.GetPositionZ() + WB_FallHeight, 0, 0, 0, WB_MoveSpeed)
	LightBox.Delete()
	TheVolcano.Disable(true)
	TheVolcano.Delete()
	StarterBox.Delete()
	Delete()

EndEvent

; -----

Event OnUpdate()

	If !Utility.IsInMenuMode()
		TargetBox.MoveTo(Self, Utility.RandomFloat(-WB_FireballRadius, WB_FireballRadius), Utility.RandomFloat(-WB_FireballRadius, WB_FireballRadius), WB_EndLocZ)
		WB_S_D100_VolcanoNew_Spell_PC.RemoteCast(StarterBox, PlayerRef, TargetBox)
		Self.RampRumble(WB_RumbleStrength, 0.2, WB_RumbleRadius)
	EndIf

EndEvent

; ------
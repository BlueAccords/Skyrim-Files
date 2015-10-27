Scriptname WB_FrozenOrb_Script extends ObjectReference  

; ------

Spell Property WB_S_D100_FrozenOrb_Spell Auto

Activator Property FXEmptyActivator Auto
Float Property WB_StartHeight Auto
Float Property WB_AttackRate Auto

Static Property WB_DestructionFrost_Static_FrozenOrb Auto

Explosion Property WB_DestructionFrost_Explosion_FrozenOrbEnd Auto

Float Property WB_Speed Auto
Int  Property WB_StallDuration Auto

Actor Property PlayerRef Auto

; ------

ObjectReference TheOrb
ObjectReference RandomBox
Int i

; ------

Event OnLoad()

	i = 0
	RandomBox = PlayerRef.placeAtMe(FXEmptyActivator)
	TheOrb = PlayerRef.PlaceAtMe(WB_DestructionFrost_Static_FrozenOrb)
	TheOrb.SetAngle(0,0,0)
	TheOrb.MoveTo(PlayerRef,0,0,WB_StartHeight)
	TheOrb.SetActorCause(PlayerRef)
	Utility.Wait(0.1)

	RegisterForSingleUpdate(WB_AttackRate)
	TheOrb.TranslateToRef(Self,WB_Speed)

EndEvent

; ------

Event OnUpdate()

	If TheOrb != NONE
		RegisterForSingleUpdate(WB_AttackRate)
		RandomBox.MoveTo(TheOrb,Utility.RandomInt(-1000,1000),Utility.RandomInt(-1000,1000),Utility.RandomInt(-250,250))

		WB_S_D100_FrozenOrb_Spell.RemoteCast(TheOrb, PlayerRef, RandomBox)

		If TheOrb.GetDistance(Self) < 200
			i += 1
			If i == 1
				TheOrb.StopTranslation()
			EndIf
			If i >= WB_StallDuration
				UnregisterForUpdate()
				TheOrb.PlaceAtMe(WB_DestructionFrost_Explosion_FrozenOrbEnd)
				TheOrb.Delete()
				Self.Delete()
			EndIf
		EndIf
	EndIf

EndEvent

; ------
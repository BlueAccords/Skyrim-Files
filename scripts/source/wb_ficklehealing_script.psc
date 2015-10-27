Scriptname WB_FickleHealing_Script extends activemagiceffect  

; -----

Float Property WB_Range Auto
Spell Property WB_S_R000_FickleHealing_Spell_PC Auto

; -----

Actor RandomActor

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	RandomActor = Game.FindRandomActorFromRef(akTarget, WB_Range * 21.3333)
	If RandomActor
		akCaster.DoCombatSpellApply(WB_S_R000_FickleHealing_Spell_PC,RandomActor)
	EndIf

EndEvent

; -----
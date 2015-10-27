Scriptname WB_MeltdownExploder_Script extends ActiveMagicEffect  

; -----

Float Property WB_Duration Auto
Spell Property WB_S_D050_Meltdown_Spell Auto
Spell Property WB_D050_Meltdown_Spell Auto
Activator Property FXEmptyActivator Auto
Explosion Property WB_DestructionFire_Explosion_Meltdown Auto
Float Property WB_KnockupForce Auto

; -----

Actor TheCaster
Actor TheTarget
ObjectReference TheBox

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TheCaster = akCaster
	TheTarget = akTarget
	TheBox = akTarget.PlaceAtMe(FXEmptyActivator)
	RegisterForSingleUpdate(WB_Duration)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	TheBox.Delete()

EndEvent

; -----

Event OnUpdate()

	TheTarget.PushActorAway(TheTarget,WB_KnockupForce)
	WB_S_D050_Meltdown_Spell.RemoteCast(TheBox,TheCaster,TheTarget)
	TheTarget.PlaceAtMe(WB_DestructionFire_Explosion_Meltdown)
	TheTarget.DispelSpell(WB_D050_Meltdown_Spell)

EndEvent

; -----
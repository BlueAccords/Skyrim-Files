Scriptname WB_Figment_Script extends activemagiceffect  

; -----

Int Property WB_LevelMod = 0 Auto
Spell Property WB_S_I050_FigmentOfPain_Spell_Ab Auto
Float Property WB_UpdateRate Auto
Faction Property WB_IllusoryEntity_Faction Auto


; -----

Actor TheGhost
Actor TheTarget

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	TheTarget = akTarget

	; save target health
	Float TargetStartHealth = akTarget.GetAV("Health")
	Float TargetMaxHealth = TargetStartHealth / akTarget.GetAVPercentage("Health")

	; spawn ghost
	TheGhost = akTarget.PlaceActorAtMe(akTarget.GetBaseObject() as ActorBase, WB_LevelMod)
	TheGhost.AddToFaction(WB_IllusoryEntity_Faction)

	; modify ghost
	TheGhost.SetAV("Health", TargetMaxHealth)
	TheGhost.DamageAV("Health", TargetMaxHealth - TargetStartHealth)

	; stop ghost
	TheGhost.EnableAI(false)
	TheGhost.AddSpell(WB_S_I050_FigmentOfPain_Spell_Ab)
	akCaster.StartCombat(TheGhost)

	; start cycle
	RegisterForSingleUpdate(WB_UpdateRate)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	TheGhost.Delete()

EndEvent

; -----

Event OnDying(Actor akKiller)

	Dispel()

EndEvent

; -----

Event OnUpdate()

	Float GhostHealth = TheGhost.GetAV("Health")
	Float TargetHealth = TheTarget.GetAV("Health")
	Float GhostHealthDifference = GhostHealth - TargetHealth

	If GhostHealthDifference > 0
		; ghost has more health than target
		TheGhost.DamageAV("Health", GhostHealthDifference)
	Else
		; target has more health than ghost
		TheTarget.DamageAV("Health", -GhostHealthDifference)
	EndIf

	RegisterForSingleUpdate(WB_UpdateRate)

	If TheGhost.IsDead()
		TheTarget.Kill(GetCasterActor())
		Dispel()
	EndIf

EndEvent

; -----
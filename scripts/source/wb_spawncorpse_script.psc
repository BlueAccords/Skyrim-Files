Scriptname WB_SpawnCorpse_Script extends ActiveMagicEffect  

; -----

ActorBase Property WB_C100_Necrowitch_Actor Auto
Activator Property FXEmptyActivator Auto
Int Property WB_LVL = 2 Auto
Explosion Property WB_ConjurationReanimate_Explosion Auto
Spell Property WB_S_C100_Necrowitch_Spell_Ab Auto

Keyword Property MagicDamageFire Auto
Keyword Property MagicDamageFrost Auto
Keyword Property MagicDamageShock Auto
Keyword Property WB_Conjuration_NoNecrowitch Auto
Keyword Property RitualSpellEffect Auto
Spell Property LightningStorm Auto

Message Property WB_ConjurationUndead_Necrowitch_Fail Auto
Message Property WB_ConjurationUndead_Necrowitch Auto
Message Property WB_ConjurationUndead_Necrowitch_NoSpell Auto

Float Property WB_UpdateRate Auto

Actor Property PlayerRef Auto

Spell[] Property WB_SubstitutedSpell Auto
Spell[] Property WB_SubstitutingSpell Auto

; -----

Actor Skeleton
Spell TheSpell

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	Skeleton = akTarget.PlaceActorAtMe(WB_C100_Necrowitch_Actor, WB_LVL, none)
	Skeleton.Kill()
	Skeleton.AddSpell(WB_S_C100_Necrowitch_Spell_Ab)
	Skeleton.PlaceAtMe(WB_ConjurationReanimate_Explosion)

	If akCaster.GetEquippedSpell(0)
		TheSpell = akCaster.GetEquippedSpell(0)
		If (TheSpell.HasKeyword(MagicDamageFire) || TheSpell.HasKeyword(MagicDamageFrost) || TheSpell.HasKeyword(MagicDamageShock)) && !TheSpell.HasKeyword(WB_Conjuration_NoNecrowitch) &&  (!TheSpell.HasKeyword(RitualSpellEffect) || TheSpell == LightningStorm)
			Int ExistsSpell = WB_SubstitutedSpell.Find(TheSpell)
			If ExistsSpell >= 0
				TheSpell = WB_SubstitutingSpell[ExistsSpell]
			EndIf
			Skeleton.AddSpell(TheSpell)
			WB_ConjurationUndead_Necrowitch.Show()
			Skeleton.SetExpressionOverride(8, 75)
		ElseIf akCaster == PlayerRef
			WB_ConjurationUndead_Necrowitch_Fail.Show()
		EndIf
	Else
		WB_ConjurationUndead_Necrowitch_NoSpell.Show()
	EndIf

	RegisterForSingleUpdate(WB_UpdateRate)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	Skeleton.Disable(true)
	Utility.Wait(2.5)
	Skeleton.Kill()
	Skeleton.Delete()

EndEvent

; -----

Event OnUpdate()

	If Skeleton
		If !Skeleton.HasSpell(TheSpell)
			Skeleton.AddSpell(TheSpell)
		EndIf
		If !Skeleton.HasSpell(WB_S_C100_Necrowitch_Spell_Ab)
			Skeleton.AddSpell(WB_S_C100_Necrowitch_Spell_Ab)
		EndIf
		RegisterForSingleUpdate(WB_UpdateRate)
	Else
		Dispel()
	EndIf

EndEvent

; -----
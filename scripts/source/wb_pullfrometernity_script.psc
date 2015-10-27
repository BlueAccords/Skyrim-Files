Scriptname WB_PullFromEternity_Script extends activemagiceffect  

; -----

Int Property WB_LevelMod = 0 Auto
Float Property WB_DistanceInFront Auto
Faction Property MagicAllegianceFaction Auto
Float Property WB_UpdateRate Auto
Spell Property WB_S_I100_PullFromEternity_Spell_Ab_PC Auto
Faction Property WB_IllusoryEntity_Faction Auto


FormList Property WB_IllusionNightmare_FormList_PullFromEternity Auto
Message Property WB_IllusionNightmare_Message_PullFromEternity_NoCorpse Auto
Message Property WB_IllusionNightmare_Message_PullFromEternity_Saved Auto

; -----

Actor TheGhost
Actor TheTarget
Actor TheCaster
Float EndLocX
Float EndLocY

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	If !akTarget.IsDead()
		; is living
		If WB_IllusionNightmare_FormList_PullFromEternity.GetSize() > 0
			TheGhost = akTarget.PlaceActorAtMe(WB_IllusionNightmare_FormList_PullFromEternity.GetAt(0) as ActorBase, WB_LevelMod)
			TheGhost.Disable()
			WB_IllusionNightmare_FormList_PullFromEternity.Revert()

			Float TargetAngle = akTarget.GetAngleZ()
			EndLocX = (WB_DistanceInFront*Math.Sin(TargetAngle))
			EndLocY = (WB_DistanceInFront*Math.Cos(TargetAngle))
			TheGhost.MoveTo(akTarget,EndLocX,EndLocY,0)
			TheGhost.SetAngle(akTarget.GetAngleX(), akTarget.GetAngleY(), TargetAngle)

			TheGhost.AddToFaction(WB_IllusoryEntity_Faction)
			TheGhost.AddToFaction(MagicAllegianceFaction)
			TheGhost.SetPlayerTeammate(true, false)
			TheGhost.Enable()
			TheGhost.AddSpell(WB_S_I100_PullFromEternity_Spell_Ab_PC)

			TheGhost.StartCombat(akTarget)

			TheTarget = akTarget
			TheCaster = akCaster
			RegisterForUpdate(WB_UpdateRate)
		Else
			WB_IllusionNightmare_Message_PullFromEternity_NoCorpse.Show()
		EndIf
	Else
		; is dead
		WB_IllusionNightmare_FormList_PullFromEternity.Revert()
		WB_IllusionNightmare_FormList_PullFromEternity.AddForm(akTarget.GetActorBase())
		WB_IllusionNightmare_Message_PullFromEternity_Saved.Show()
		akTarget.SetCriticalStage(akTarget.CritStage_DisintegrateStart)
		akTarget.SetAlpha (0.0,True)
		akTarget.AttachAshPile()
		akTarget.SetCriticalStage(akTarget.CritStage_DisintegrateEnd)
		Dispel()
	EndIf

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	TheGhost.Delete()

EndEvent

; -----

Event OnUpdate()

	If !TheGhost || TheGhost.IsDead()
		Dispel()
	EndIf

EndEvent

; -----
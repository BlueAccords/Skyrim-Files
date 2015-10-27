Scriptname WB_MirrorEntity_Script extends ActiveMagicEffect  

; -----

Int Property WB_LevelMod = 0 Auto
Float Property WB_DistanceInFront Auto
Faction Property MagicCharmFaction Auto
Float Property WB_UpdateRate Auto
Spell Property WB_S_I100_MirrorEntity_Spell_Ab Auto
GlobalVariable Property WB_Illusion_Global_IsControlling Auto
Faction Property WB_IllusoryEntity_Faction Auto

; -----

Actor TheTarget
Actor TheGhost
Actor TheCaster
Float EndLocX
Float EndLocY

; -----

Event OnEffectStart(Actor akTarget, Actor akCaster)

	WB_Illusion_Global_IsControlling.Mod(1)
	Float CasterAngle = akCaster.GetAngleZ()
	TheGhost = akCaster.PlaceActorAtMe(akTarget.GetBaseObject() as ActorBase, WB_LevelMod)
	TheGhost.AddSpell(WB_S_I100_MirrorEntity_Spell_Ab,false)

	EndLocX = (WB_DistanceInFront*Math.Sin(CasterAngle))
	EndLocY = (WB_DistanceInFront*Math.Cos(CasterAngle))
	TheGhost.MoveTo(akCaster,EndLocX,EndLocY,0)
	TheGhost.SetAngle(akCaster.GetAngleX(), akCaster.GetAngleY(), CasterAngle)

	TheGhost.SetPlayerControls(true)
	Game.SetPlayerAIDriven(true)
	Game.SetCameraTarget(TheGhost)
	Game.ForceFirstPerson()
	Game.ForceThirdPerson()

	TheGhost.AddToFaction(WB_IllusoryEntity_Faction)
	TheGhost.AddToFaction(MagicCharmFaction)
	TheGhost.SetPlayerTeammate(true, false)

	TheGhost.EnableAI(true)
	TheGhost.StopCombat()
	TheGhost.StartCombat(akTarget)
	If akTarget.IsHostileToActor(akCaster)
		akTarget.StartCombat(TheGhost)
	EndIf

	TheTarget = akTarget
	TheCaster = akCaster
	RegisterForUpdate(WB_UpdateRate)

EndEvent

; -----

Event OnEffectFinish(Actor akTarget, Actor akCaster)

	TheGhost.Delete()
	Game.SetCameraTarget(Game.GetPlayer())
	Game.SetPlayerAIDriven(false)
	WB_Illusion_Global_IsControlling.Mod(-1)

EndEvent

; -----

Event OnUpdate()

	If !TheGhost || TheGhost.IsDead() || !TheCaster.IsWeaponDrawn()
		Dispel()
	EndIf

EndEvent

; -----
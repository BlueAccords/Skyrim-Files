Scriptname WB_EnslaveTheWeak_Ab_Script extends activemagiceffect  

; -----

Quest Property WB_EnslaveTheWeak_Quest Auto

; -----

Event OnDeath(Actor akKiller)

	Utility.Wait(2.0)
	WB_EnslaveTheWeak_Quest.Stop()

EndEvent

; -----
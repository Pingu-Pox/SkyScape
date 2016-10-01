ScriptName RS_Actor_RespawnCustom Extends Actor
{Attach directly to actor, no need to set a spawnPoint if OK with spawning at deathPoint.}
Int Property SecondsForRespawn Auto
ObjectReference Property spawnPoint Auto

Event OnDeath(Actor akKiller)
	Utility.wait(SecondsForRespawn)
	if spawnPoint == none
		self.PlaceActorAtMe(Self.GetActorBase())
	else
		spawnPoint.PlaceActorAtMe(Self.GetActorBase())
	endif
	Self.Delete()
endevent

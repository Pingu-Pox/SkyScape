Scriptname RS_Activator_MarketStall Extends ObjectReference
{Script that handles market stalls}

string property stallType auto

int property minDist auto

int property reqLVL auto

float property xp auto

int property respawnInterval auto

Leveleditem Property RS_StallLootList Auto

Actor Property guard0 Auto
Actor Property guard1 Auto
Actor Property guard2 Auto

Sound Property RS_SM_StealStall Auto

Event OnActivate(ObjectReference akActionRef)
	If akActionRef != Game.GetPlayer()
		;Some other objectreference tried activating the stall...
	Else
		;meet reqs?
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVL
			Debug.Notification("You lack the required thieving level of '" + reqLVL + "'")
		else
			if RollCaught()
				Debug.Trace("TRACE -- You were caught by the guard!")
			else
				RS_SM_StealStall.Play(self)
				Self.Disable()
				Game.GetPlayer().AddItem(RS_StallLootList, 1)
				rsFrameworkMenu.rsXPGain("thieving", xp)
				Utility.Wait(respawnInterval)
				Self.Enable()
			endif
		endif
	EndIf
EndEvent

Bool Function RollCaught()
	int distToGuard0 = Game.GetPlayer().GetDistance(guard0) as int
	int distToGuard1 = Game.GetPlayer().GetDistance(guard1) as int
	int distToGuard2 = Game.GetPlayer().GetDistance(guard2) as int
	Debug.Trace("TRACE -- The player is " + distToGuard0 + " units away from guard #0")
	Debug.Trace("TRACE -- The player is " + distToGuard1 + " units away from guard #1")
	Debug.Trace("TRACE -- The player is " + distToGuard2 + " units away from guard #2")
	if (distToGuard0 <= minDist) || (distToGuard1 <= minDist) || (distToGuard2 <= minDist)
		if catchProbability()
			;get closest guard
			int[] guardDistances = new int[3]
			guardDistances[0] = distToGuard0
			guardDistances[1] = distToGuard1
			guardDistances[2] = distToGuard2
			rsFrameworkMenu.SortArray(guardDistances)
			if guardDistances[0] == distToGuard0;guard0 is closest?
				guard0.PathToReference(Game.GetPlayer(), 1.0);latent, may halt script until succeeds/fails
				guard0.StartCombat(Game.GetPlayer());make the guard say something?
				return true
			elseif guardDistances[0] == distToGuard1;guard1 is closest?
				guard1.PathToReference(Game.GetPlayer(), 1.0);latent, may halt script until succeeds/fails
				guard1.StartCombat(Game.GetPlayer());make the guard say something?
				return true
			elseif guardDistances[0] == distToGuard2;guard2 is closest?
				guard2.PathToReference(Game.GetPlayer(), 1.0);latent, may halt script until succeeds/fails
				guard2.StartCombat(Game.GetPlayer());make the guard say something?
				return true
			else
				Debug.Trace("ERROR -- MarketStall - Couldn't compare array to distance to guard...")
				return false
			endif
		else
			return false			
		endif
	endif
EndFunction

Bool Function CatchProbability()
	If (Utility.RandomInt(1,6)) == 6
		return true
	Else
		return false
	EndIf
EndFunction

;Note: In Keldagrim, stalls often differ in respawn time and their experience given. The silver stalls respawn twice as fast, but yields half the experience. The bakery stall, however, respawns half as fast, and gives the same experience. 

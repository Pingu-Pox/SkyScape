ScriptName RS_Activator_CanoeStation Extends ObjectReference
{Script for canoe stations; 4=wildy, 3=Champion Guild, 2=Barbarian Village, 1=Edgeville, 0=Lumby}

Message Property RS_Message_CanoeStation_WhichCanoe Auto
Message Property RS_Message_CanoeStation_WhichDestination Auto
float Property canoeStationLocation Auto
ObjectReference Property WildernessCanoeStationMarker Auto
ObjectReference Property EdgevilleCanoeStationMarker Auto
ObjectReference Property BarbarianVillageCanoeStationMarker Auto
ObjectReference Property ChampionGuildCanoeStationMarker Auto
ObjectReference Property LumbyCanoeStationMarker Auto

Event OnActivate(ObjectReference akActionRef)
	bool looping = true
	while(looping == true)
		int wcLvl = rsFrameworkMenu.GetWoodcuttingLVL().GetValue() as int
		int canoeType = RS_Message_CanoeStation_WhichCanoe.Show()
		float destination = RS_Message_CanoeStation_WhichDestination.Show() as float
		float distance = 0
		if canoeType == 0;A Log
			if wcLvl < 12
				Debug.Notification("You lack the required woodcutting level of '12'")
			else
				;calculate the difference between your canoeStationLocation and the destination distance. if larger than 1, deny, auto-deny wilderness
				distance = math.abs(canoeStationLocation - destination)
				if destination == 4;You choose to go to the wilderness...
					Debug.Notification("A log will not make the journey to the wilderness.")
				elseif distance > 1
					Debug.Notification("A log will not make that far of journey.")
				else
					TravelToCanoeStation(destination, 30)
					looping = false
				endif
			endif
		elseif canoeType == 1;A Dugout
			if wcLvl < 27
				Debug.Notification("You lack the required woodcutting level of '27'")
			else
				;calculate the difference between your canoeStationLocation and the destination distance. if larger than 2, deny, auto-deny wilderness
				distance = math.abs(canoeStationLocation - destination)
				if destination == 4;You choose to go to the wilderness...
					Debug.Notification("A dugout will not make the journey to the wilderness.")
				elseif distance > 2
					Debug.Notification("A log will not make that far of journey.")
				else
					TravelToCanoeStation(destination, 60)
					looping = false
				endif
			endif
		elseif canoeType == 2;A Stable Dugout
			if wcLvl < 42
				Debug.Notification("You lack the required woodcutting level of '42'")
			else
				;calculate the difference between your canoeStationLocation and the destination distance. if larger than 3, deny, auto-deny wilderness
				distance = math.abs(canoeStationLocation - destination)
				if destination == 4;You choose to go to the wilderness...
					Debug.Notification("A stable dugout will not make the journey to the wilderness.")
				elseif distance > 3
					Debug.Notification("A log will not make that far of journey.")
				else
					TravelToCanoeStation(destination, 90)
					looping = false
				endif
			endif
		elseif canoeType == 3;A Waka
			if wcLvl < 57
				Debug.Notification("You lack the required woodcutting level of '57'")
			else
				;calculate the difference between your canoeStationLocation and the destination distance. if larger than 4, deny
				distance = math.abs(canoeStationLocation - destination)
				if distance > 4
					Debug.Notification("A waka will not make that far of journey.")
				else
					TravelToCanoeStation(destination, 150)
					looping = false
				endif
			endif
		else
			looping = false;leave loop
		endif
	endwhile
EndEvent

Function TravelToCanoeStation(float destination, float xp)
	Game.FadeOutGame(True, true, 0.0, 2.0)
	if destination == 0;
		Game.GetPlayer().MoveTo(LumbyCanoeStationMarker)
		Game.FadeOutGame(False, true, 0.0, 2.0)
		rsFrameworkMenu.rsXPGain("woodcutting", xp)
	elseif destination == 1;
		Game.GetPlayer().MoveTo(ChampionGuildCanoeStationMarker)
		Game.FadeOutGame(False, true, 0.0, 2.0)
		rsFrameworkMenu.rsXPGain("woodcutting", xp)
	elseif destination == 2;
		Game.GetPlayer().MoveTo(BarbarianVillageCanoeStationMarker)
		Game.FadeOutGame(False, true, 0.0, 2.0)
		rsFrameworkMenu.rsXPGain("woodcutting", xp)
	elseif destination == 3;
		Game.GetPlayer().MoveTo(EdgevilleCanoeStationMarker)
		Game.FadeOutGame(False, true, 0.0, 2.0)
		rsFrameworkMenu.rsXPGain("woodcutting", xp)
	elseif destination == 4;
		Game.GetPlayer().MoveTo(WildernessCanoeStationMarker)
		Game.FadeOutGame(False, true, 0.0, 2.0)
		rsFrameworkMenu.rsXPGain("woodcutting", xp)
	else
		Debug.Notification("Cannot discern destination to move player.")
	endif
EndFunction

ScriptName RS_Talisman_FindAltar extends ObjectReference
{This script takes altarType, and finds the players distance and directional relationship to the altar}

ObjectReference Property altar

;Directional Values
Float East = 0.0
Float EastNorthEast = 22.5
Float NorthEast = 45.0
Float NorthNorthEast = 65.5
Float North = 90.0
Float NorthNorthWest = 112.5
Float NorthWest = 135.0
Float WestNorthWest = 157.5
Float West = 180.0
Float WestSouthWest = 202.5
Float SouthWest = 225.0
Float SouthSouthWest = 247.5
Float South = 270.0
Float SouthSouthEast = 292.5
Float SouthEast = 315.0
Float EastSouthEast = 337.5

Event OnEquipped(Actor akActor)
	Actor player = Game.GetPlayer()
	if !player.IsInInterior()
		debug.notification("Nothing interesting happens.")
	else
		if altar.GetWorldSpace() != player.GetWorldSpace
			debug.notification("Nothing interesting happens.")
		else
			int playerX = player.GetPositionX() as int
			int playerY = player.GetPositionX() as int
		 
			int altarX = altar.GetPositionX() as int
			int altarY = altar.GetPositionX() as int
			FindOrientation(altarX,altarY)
		endif
	endif
EndEvent

Function FindOrientation(int targetX, int targetY)
	;we have real coordinates, lets get them within our context
	targetX = targetX - playerX;Gets the difference between the target and the player, sets it to the target as we want player to be at (0,0)
	targetY = targetY - playerY;Gets the difference between the target and the player, sets it to the target as we want player to be at (0,0)
	
	;now that that is done
	playerX = 0; Set player to (0,0)
	playerY = 0; Set player to (0,0)
	
	;predefine theta
	int theta; Defined later in the script
	
	;we now have player at (0,0) and target spaced by a distance.
	
	;what quadrant is the target in?
	if targetX == 0 && targetY == 0; Player and target occupy the same space
	
	elseif targetX > 0 && targetY > 0;Quadrant 1... N,NNE,NE,ENE,E
		if targetX == targetY;
			;NE
		elseif targetX > targetY
			;NE,ENE,E
			theta = (targetY/targetX * tan^-1) as int;This gives us the angle of inclination
			if theta > 22.5;ne,ene
				if (45.0-theta) < (theta-22.5)
					;ne
				elseif (45.0-theta) > (theta-22.5)
					;ene
				else
					debug.notification("Couldn't see which was closer (NE,ENE)")
				endif
			elseif theta < 22.5;e,ene
				if (67.5-theta) < (theta-45.0)
					;ene
				elseif (67.5-theta) > (theta-45.0)
					;e
				else
					debug.notification("Couldn't see which was closer (ENE,E)")
				endif
			else
			
			endif
			
		elseif targetX < targetY
			;NE,N,NNE
			theta = (targetY/targetX * tan^-1) as int;This gives us the angle of inclination
			if theta > 67.5
				if (90.0-theta) < (theta-67.5)
					;n
				elseif (90.0-theta) > (theta-67.5)
					;nne
				else
					debug.notification("Couldn't see which was closer (N,NNE)")
				endif
			elseif theta < 67.5
				if (67.5-theta) < (theta-45.0)
					;nne
				elseif (67.5-theta) > (theta-45.0)
					;ne
				else
					debug.notification("Couldn't see which was closer (NNE,NE)")
				endif
			else
			
			endif
			
		else
			debug.notification("Cannot discern target location in Q1")
		endif
	elseif targetX < 0 && targetY > 0;Quadrant 2... W,WNW,NW,NNW,N 
		if targetX == targetY;
			;nw
		elseif targetX > targetY
			;N,NNW,NW
			theta = (targetY/targetX * tan^-1) as int;This gives us the angle of inclination
			theta = (90 - theta) + 90
		elseif targetX < targetY
			;NW,WNW,W
			theta = (targetY/targetX * tan^-1) as int;This gives us the angle of inclination
		else
			debug.notification("Cannot discern target location in Q2")
		endif
	elseif targetX < 0 && targetY < 0;Quadrant 3... S,SSW,SW,WSW,W
		
	elseif targetX > 0 && targetY < 0;Quadrant 4... E,ESE,SE,SSE,S
	
	else
	
	endif
	
EndFunction

ScriptName RS_Talisman_FindAltar extends ObjectReference
{This script takes altarType, and finds the players distance and directional relationship to the altar}

ObjectReference Property altar Auto

Event OnEquipped(Actor akActor)
	Actor player = Game.GetPlayer()
	if !player.IsInInterior()
		debug.notification("Nothing interesting happens.")
	else
		if altar.GetWorldSpace() != player.GetWorldSpace()
			debug.notification("Nothing interesting happens.")
		else
			int playerX = player.GetPositionX() as int
			int playerY = player.GetPositionX() as int
		 
			int altarX = altar.GetPositionX() as int
			int altarY = altar.GetPositionX() as int
			FindOrientation(altarX,altarY,playerX,playerY)
		endif
	endif
EndEvent

Function FindOrientation(int targetX, int targetY, int playerX, int playerY)
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
			theta = (math.atan(targetY/targetX)) as int;This gives us the angle of inclination
			if theta > 22.5;ne,ene
				if (45.0 - theta) < (theta - 22.5)
					Debug.Notification("The talisman pulls towards the north-east.");ne
				elseif (45.0 - theta) > (theta - 22.5)
					Debug.Notification("The talisman pulls towards the east-north-east.");ene
				else
					debug.notification("Couldn't see which was closer (NE,ENE)")
				endif
			elseif theta < 22.5;e,ene
				if (67.5 - theta) < (theta - 45.0)
					Debug.Notification("The talisman pulls towards the east-north-east.");ene
				elseif (67.5 - theta) > (theta - 45.0)
					Debug.Notification("The talisman pulls towards the east.");e
				else
					debug.notification("Couldn't see which was closer (ENE,E)")
				endif
			else
			
			endif
			
		elseif targetX < targetY
			;NE,N,NNE
			theta = (math.atan(targetY/targetX)) as int;This gives us the angle of inclination
			if theta > 67.5
				if (90.0 - theta) < (theta - 67.5)
					Debug.Notification("The talisman pulls towards the north.");n
				elseif (90.0 - theta) > (theta - 67.5)
					Debug.Notification("The talisman pulls towards the north-north-east.");nne
				else
					debug.notification("Couldn't see which was closer (N,NNE)")
				endif
			elseif theta < 67.5
				if (67.5 - theta) < (theta - 45.0)
					Debug.Notification("The talisman pulls towards the north-north-east.");nne
				elseif (67.5 - theta) > (theta - 45.0)
					Debug.Notification("The talisman pulls towards the north-east.");ne
				else
					debug.notification("Couldn't see which was closer (NNE,NE)")
				endif
			else
				Debug.Notification("The talisman pulls towards the north-north-east.")
			endif
			
		else
			debug.notification("Cannot discern target location in Q1")
		endif
	elseif targetX < 0 && targetY > 0;Quadrant 2... W,WNW,NW,NNW,N 
		if targetX == targetY;
			;NW
		elseif targetX > targetY
			;NW,WNW,W
			theta = (math.atan(targetY/targetX)) as int;This gives us the angle of inclination
			if theta > 22.5;nw,wnw
				if (45.0 - theta) < (theta - 22.5)
					Debug.Notification("The talisman pulls towards the north-west.");nw
				elseif (45.0 - theta) > (theta - 22.5)
					Debug.Notification("The talisman pulls towards the north-north-west.");wnw
				else
					debug.notification("Couldn't see which was closer (NW,WNW)")
				endif
			elseif theta < 22.5;w,wnw
				if (67.5 - theta) < (theta - 45.0)
					Debug.Notification("The talisman pulls towards the west-north-west.");wnw
				elseif (67.5 - theta) > (theta - 45.0)
					Debug.Notification("The talisman pulls towards the west.");w
				else
					debug.notification("Couldn't see which was closer (WNW,W)")
				endif
			else
				Debug.Notification("The talisman pulls towards the west-north-west.")
			endif
			
		elseif targetX < targetY
			;NW,N,NNW
			theta = (math.atan(targetY/targetX)) as int;This gives us the angle of inclination
			if theta > 67.5
				if (90.0 - theta) < (theta - 67.5)
					Debug.Notification("The talisman pulls towards the north.");n
				elseif (90.0 - theta) > (theta - 67.5)
					Debug.Notification("The talisman pulls towards the north-north-west.");nnw
				else
					debug.notification("Couldn't see which was closer (N,NNW)")
				endif
			elseif theta < 67.5
				if (67.5 - theta) < (theta - 45.0)
					Debug.Notification("The talisman pulls towards the north-north-west.");nnw
				elseif (67.5 - theta) > (theta - 45.0)
					Debug.Notification("The talisman pulls towards the north-west.");nw
				else
					debug.notification("Couldn't see which was closer (NNW,NW)")
				endif
			else
				Debug.Notification("The talisman pulls towards the north-north-west.")
			endif
			
		else
			debug.notification("Cannot discern target location in Q2")
		endif
	elseif targetX < 0 && targetY < 0;Quadrant 3... S,SSW,SW,WSW,W
		if targetX == targetY;
			;SW
		elseif targetX > targetY
			;SW,WSW,W
			theta = (math.atan(targetY/targetX)) as int;This gives us the angle of inclination
			if theta > 22.5;sw,wsw
				if (45.0 - theta) < (theta - 22.5)
					Debug.Notification("The talisman pulls towards the south-west.");sw
				elseif (45.0 - theta) > (theta - 22.5)
					Debug.Notification("The talisman pulls towards the west-south-west.");wsw
				else
					debug.notification("Couldn't see which was closer (SW,WSW)")
				endif
			elseif theta < 22.5;w,wsw
				if (67.5 - theta) < (theta - 45.0)
					Debug.Notification("The talisman pulls towards the west-south-west.");wsw
				elseif (67.5 - theta) > (theta - 45.0)
					Debug.Notification("The talisman pulls towards the west.");w
				else
					debug.notification("Couldn't see which was closer (WSW,W)")
				endif
			else
				Debug.Notification("The talisman pulls towards the west-south-west.")
			endif
			
		elseif targetX < targetY
			;SW,S,SSW
			theta = (math.atan(targetY/targetX)) as int;This gives us the angle of inclination
			if theta > 67.5
				if (90.0 - theta) < (theta - 67.5)
					Debug.Notification("The talisman pulls towards the south.");s
				elseif (90.0 - theta) > (theta - 67.5)
					Debug.Notification("The talisman pulls towards the south-south-west.");ssw
				else
					debug.notification("Couldn't see which was closer (S,SSW)")
				endif
			elseif theta < 67.5
				if (67.5 - theta) < (theta - 45.0)
					Debug.Notification("The talisman pulls towards the south-south-west.");ssw
				elseif (67.5 - theta) > (theta - 45.0)
					;sw
				else
					debug.notification("Couldn't see which was closer (SSW,SW)")
				endif
			else
				Debug.Notification("The talisman pulls towards the south-south-west.")
			endif
			
		else
			debug.notification("Cannot discern target location in Q3")
		endif
	elseif targetX > 0 && targetY < 0;Quadrant 4... E,ESE,SE,SSE,S
		if targetX == targetY;
			;SE
		elseif targetX > targetY
			;SE,ESE,E
			theta = (math.atan(targetY/targetX)) as int;This gives us the angle of inclination
			if theta > 22.5;se,ese
				if (45.0 - theta) < (theta - 22.5)
					Debug.Notification("The talisman pulls towards the south-east.");se
				elseif (45.0 - theta) > (theta - 22.5)
					Debug.Notification("The talisman pulls towards the east-south-east.");ese
				else
					debug.notification("Couldn't see which was closer (SE,ESE)")
				endif
			elseif theta < 22.5;e,ese
				if (67.5 - theta) < (theta - 45.0)
					Debug.Notification("The talisman pulls towards the east-south-east.");ese
				elseif (67.5 - theta) > (theta - 45.0)
					Debug.Notification("The talisman pulls towards the east.");e
				else
					debug.notification("Couldn't see which was closer (ESE,E)")
				endif
			else
				Debug.Notification("The talisman pulls towards the east-south-east.")
			endif
			
		elseif targetX < targetY
			;SE,S,SSE
			theta = (math.atan(targetY/targetX)) as int;This gives us the angle of inclination
			if theta > 67.5
				if (90.0 - theta) < (theta - 67.5)
					Debug.Notification("The talisman pulls towards the south.");s
				elseif (90.0 - theta) > (theta - 67.5)
					Debug.Notification("The talisman pulls towards the south-south-east.");sse
				else
					debug.notification("Couldn't see which was closer (S,SSE)")
				endif
			elseif theta < 67.5
				if (67.5 - theta) < (theta - 45.0)
					Debug.Notification("The talisman pulls towards the south-south-east.");sse
				elseif (67.5 - theta) > (theta - 45.0)
					Debug.Notification("The talisman pulls towards the south-east.");se
				else
					debug.notification("Couldn't see which was closer (SSE,SE)")
				endif
			else
				Debug.Notification("The talisman pulls towards the south-south-east.")
			endif
			
		else
			debug.notification("Cannot discern target location in Q4")
		endif
	else
	
	endif
	
EndFunction

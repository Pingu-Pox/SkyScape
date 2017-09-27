ScriptName RS_Talisman_FindAltar extends ObjectReference
{This script takes altarType, and finds the players distance and directional relationship to the altar}

ObjectReference Property altar Auto

Event OnEquipped(Actor akActor)
	Actor player = Game.GetPlayer()
	if player.IsInInterior()
		debug.notification("Nothing interesting happens.")
		;debug.notification("Im in an interior.")
	else
		if altar.GetWorldSpace() != player.GetWorldSpace()
			debug.notification("Nothing interesting happens.")
			;debug.notification("Im not in the same worldspace.")
		else
			;debug.notification("Get locations...")
			int playerX = player.GetPositionX() as int
			int playerY = player.GetPositionY() as int
		 
			int altarX = altar.GetPositionX() as int
			int altarY = altar.GetPositionY() as int
			FindOrientation(altarX,altarY,playerX,playerY)
		endif
	endif
EndEvent

Function FindOrientation(int altarX, int altarY, int playerX, int playerY)
	;debug.notification("Im in the function.")
	;we have real coordinates, lets get them within our context
	altarX = altarX - playerX;Gets the difference between the altar and the player, sets it to the altar as we want player to be at (0,0)
	altarY = altarY - playerY;Gets the difference between the altar and the player, sets it to the altar as we want player to be at (0,0)
	
	;now that that is done
	playerX = 0; Set player to (0,0)
	playerY = 0; Set player to (0,0)
	
	;predefine theta
	float theta; Defined later in the script
	
	;we now have player at (0,0) and altar spaced by a distance.
	;Debug.Notification("Player location (" + playerX + "," + playerY + ")")
	;Debug.Notification("Altar location (" + altarX + "," + altarY + ")")
	;what quadrant is the altar in?
	if altarX == 0 && altarY == 0; Player and altar occupy the same space
		Debug.Notification("The talisman hums loudly, I must be right on top of it.")
	elseif altarX > 0 && altarY > 0;Quadrant 1... N,NNE,NE,ENE,E
		if altarX == altarY;
			Debug.Notification("The talisman pulls towards the north-east.");ne
		elseif altarX > altarY
			;NE,ENE,E
			theta = math.abs(math.atan(altarY/altarX));This gives us the angle of inclination
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
				Debug.Notification("The talisman pulls towards the east-north-east.");ene
			endif
			
		elseif altarX < altarY
			;NE,N,NNE
			theta = math.abs(math.atan(altarY/altarX));This gives us the angle of inclination
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
			debug.notification("Cannot discern altar location in Q1")
		endif
	elseif altarX < 0 && altarY > 0;Quadrant 2... W,WNW,NW,NNW,N 
		if altarX == altarY;
			Debug.Notification("The talisman pulls towards the north-west.");nw
		elseif altarX > altarY
			;NW,WNW,W
			theta = math.abs(math.atan(altarY/altarX));This gives us the angle of inclination
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
			
		elseif altarX < altarY
			;NW,N,NNW
			theta = math.abs(math.atan(altarY/altarX));This gives us the angle of inclination
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
			debug.notification("Cannot discern altar location in Q2")
		endif
	elseif altarX < 0 && altarY < 0;Quadrant 3... S,SSW,SW,WSW,W
		if altarX == altarY;
			Debug.Notification("The talisman pulls towards the south-west.");sw
		elseif altarX > altarY
			;SW,WSW,W
			theta = math.abs(math.atan(altarY/altarX));This gives us the angle of inclination
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
			
		elseif altarX < altarY
			;SW,S,SSW
			theta = math.abs(math.atan(altarY/altarX));This gives us the angle of inclination
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
			debug.notification("Cannot discern altar location in Q3")
		endif
	elseif altarX > 0 && altarY < 0;Quadrant 4... E,ESE,SE,SSE,S
		if altarX == altarY;
			Debug.Notification("The talisman pulls towards the south-east.");se
		elseif altarX > altarY
			;SE,ESE,E
			theta = math.abs(math.atan(altarY/altarX));This gives us the angle of inclination
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
			
		elseif altarX < altarY
			;SE,S,SSE
			theta = math.abs(math.atan(altarY/altarX));This gives us the angle of inclination
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
			debug.notification("Cannot discern altar location in Q4")
		endif
	else
	
	endif
	
EndFunction

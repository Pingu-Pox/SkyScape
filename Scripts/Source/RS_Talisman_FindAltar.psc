ScriptName RS_Talisman_FindAltar extends ObjectReference
{This script takes altarType, and finds the players distance and directional relationship to the altar}

ObjectReference Property altar

Event OnEquipped(Actor akActor)
	if
	Actor player = Game.GetPlayer()
	int playerX = player.GetPositionX() as int
	int playerY = player.GetPositionX() as int
 
	int altarX = altar.GetPositionX() as int
	int altarY = altar.GetPositionX() as int
	FindAltar(altarX,altarY)
EndEvent

Function FindAltar(int altarX, int altarY)
	
EndFunction

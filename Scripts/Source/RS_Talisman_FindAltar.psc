ScriptName RS_Talisman_FindAltar extends ObjectReference
{This script takes altarType, and finds the players distance and directional relationship to the altar}



Event OnEquipped(Actor akActor)
	;getbaseobject of self
	;if base object == RS_Item_Talisman_Air
	;	int playerX = player.GetPositionX() as int
	;	int playerY = player.GetPositionX() as int
	;
	;	FindAltar(,,)
	;elseif ...
EndEvent

Function FindAltar ();Find out if Y or Z are perpendicular to X
	Actor player = Game.GetPlayer()
	int playerX = player.GetPositionX() as int
	int playerY = player.GetPositionX() as int

EndFunction

ScriptName RS_Activator_RCaltarExit Extends ObjectReference
{Script to put on the portal to leave the RC altar}

ObjectReference Property rcAltarExitMarker Auto

Event OnActivate(ObjectReference akActionRef)
	if (akActionRef != Game.GetPlayer())
		;do nothing, another actor tried to activate this altar
	else
			Game.GetPlayer().MoveTo(rcAltarExitMarker)
	endif
EndEvent

ScriptName RS_Activator_RCaltar Extends ObjectReference
{Script to put on the actual ruins/door to the altar}

MiscObject Property requiredTalisman Auto
ObjectReference Property rcAltarMarker Auto

Event OnActivate(ObjectReference akActionRef)
	if (akActionRef != Game.GetPlayer())
		;do nothing, another actor tried to activate this altar
	else
		if (Game.GetPlayer().GetItemCount(requiredTalisman)) < 1
			Debug.Notification("Nothing interesting happens...")
		else
			Game.GetPlayer().MoveTo(rcAltarMarker)
		endif
	endif
EndEvent

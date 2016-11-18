ScriptName RS_Activator_RCaltarEnter Extends ObjectReference
{Script to put on the actual ruins/door to the altar}

MiscObject Property requiredTalisman Auto
ObjectReference Property rcAltarMarker Auto
Formlist Property requiredEquippedItemFormlist Auto

Event OnActivate(ObjectReference akActionRef)
	if (akActionRef != Game.GetPlayer())
		;do nothing, another actor tried to activate this altar
	else
		if (Game.GetPlayer().GetItemCount(requiredTalisman)) < 1 || (Game.GetPlayer().IsEquipped(requiredEquippedItemFormlist) == false)
			Debug.Notification("Nothing interesting happens...")
		else
			Game.GetPlayer().MoveTo(rcAltarMarker)
		endif
	endif
EndEvent

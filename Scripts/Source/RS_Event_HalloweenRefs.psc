ScriptName RS_Event_HalloweenRefs extends ObjectReference
{Enables references if it is a Halloween release, disables when it is not}

Event OnInit()
 
	If (rsFrameworkMenu.IsItHalloween() == false)
		Debug.Notification("Disabled!")
		Disable()
	Else
		Debug.Notification("Enabled!")
		Enable()
	EndIf
 
EndEvent

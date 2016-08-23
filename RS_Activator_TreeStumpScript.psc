ScriptName RS_Activator_TreeStumpScript Extends ObjectReference
{Tree stump script}

;On Player Activation
Event OnActivate(ObjectReference akActionRef)
	Debug.Notification("This tree was recently cut.")
EndEvent

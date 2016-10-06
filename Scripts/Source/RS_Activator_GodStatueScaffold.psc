ScriptName RS_Activator_GodStatueScaffold Extends ObjectReference
{OnActivate, choose to add/minus a level of scaffold, min 1, max 5}

GlobalVariable Property scaffoldStackGlobal Auto

Message Property scaffoldMessage Auto

ObjectReference Property scaffold2 Auto
ObjectReference Property scaffold3 Auto
ObjectReference Property scaffold4 Auto
ObjectReference Property scaffold5 Auto

Quest Property RS_Minigame_GodStatues Auto

Event OnActivate(ObjectReference akActionRef)
	bool looping = true
	while(looping)
		int choice = scaffoldMessage.Show()
		int status = scaffoldStackGlobal.GetValue() as int
		if choice == 0;add
			if status == 1
				scaffold2.Enable()
				scaffoldStackGlobal.SetValue(2)
				RS_Minigame_GodStatues.UpdateCurrentInstanceGlobal(scaffoldStackGlobal)
			elseif status == 2
				scaffold3.Enable()
				scaffoldStackGlobal.SetValue(3)
				RS_Minigame_GodStatues.UpdateCurrentInstanceGlobal(scaffoldStackGlobal)
			elseif status == 3
				scaffold4.Enable()
				scaffoldStackGlobal.SetValue(4)
				RS_Minigame_GodStatues.UpdateCurrentInstanceGlobal(scaffoldStackGlobal)
			elseif status == 4
				scaffold5.Enable()
				scaffoldStackGlobal.SetValue(5)
				RS_Minigame_GodStatues.UpdateCurrentInstanceGlobal(scaffoldStackGlobal)
			elseif status == 5
				Debug.Notification("You can't build it any higher!")
			else
				Debug.MessageBox("Error_Couldn't get stack height!")
			endif
		elseif choice == 1;minus
			if status == 1
				Debug.Notification("You can't build it any lower!")
			elseif status == 2
				scaffold2.Disable()
				scaffoldStackGlobal.SetValue(1)
				RS_Minigame_GodStatues.UpdateCurrentInstanceGlobal(scaffoldStackGlobal)
			elseif status == 3
				scaffold3.Disable()
				scaffoldStackGlobal.SetValue(2)
				RS_Minigame_GodStatues.UpdateCurrentInstanceGlobal(scaffoldStackGlobal)
			elseif status == 4
				scaffold4.Disable()
				scaffoldStackGlobal.SetValue(3)
				RS_Minigame_GodStatues.UpdateCurrentInstanceGlobal(scaffoldStackGlobal)
			elseif status == 5
				scaffold5.Disable()
				scaffoldStackGlobal.SetValue(4)
				RS_Minigame_GodStatues.UpdateCurrentInstanceGlobal(scaffoldStackGlobal)
			else
				Debug.MessageBox("Error_Couldn't get stack height!")
			endif
		elseif choice == 2;exit
			looping = false
		endif
	endwhile
EndEvent

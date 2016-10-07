ScriptName RS_Activator_GodStatues Extends ObjectReference
{This script is what starts the minigame, and sets it up. Hand off to other script for player input}

Globalvariable Property scaffoldAnswer1 Auto
Globalvariable Property scaffoldAnswer2 Auto
Globalvariable Property scaffoldAnswer3 Auto
Globalvariable Property scaffoldAnswer4 Auto
Globalvariable Property scaffoldAnswer5 Auto

Globalvariable Property scaffoldStackGlobal1 Auto
Globalvariable Property scaffoldStackGlobal2 Auto
Globalvariable Property scaffoldStackGlobal3 Auto
Globalvariable Property scaffoldStackGlobal4 Auto
Globalvariable Property scaffoldStackGlobal5 Auto

Globalvariable Property minigameStatusGlobal Auto

ObjectReference Property stack1 Auto
ObjectReference Property stack1_2 Auto
ObjectReference Property stack1_3 Auto
ObjectReference Property stack1_4 Auto
ObjectReference Property stack1_5 Auto
ObjectReference Property stack2 Auto
ObjectReference Property stack2_2 Auto
ObjectReference Property stack2_3 Auto
ObjectReference Property stack2_4 Auto
ObjectReference Property stack2_5 Auto
ObjectReference Property stack3 Auto
ObjectReference Property stack3_2 Auto
ObjectReference Property stack3_3 Auto
ObjectReference Property stack3_4 Auto
ObjectReference Property stack3_5 Auto
ObjectReference Property stack4 Auto
ObjectReference Property stack4_2 Auto
ObjectReference Property stack4_3 Auto
ObjectReference Property stack4_4 Auto
ObjectReference Property stack4_5 Auto
ObjectReference Property stack5 Auto
ObjectReference Property stack5_2 Auto
ObjectReference Property stack5_3 Auto
ObjectReference Property stack5_4 Auto
ObjectReference Property stack5_5 Auto
ObjectReference Property Statue Auto
ObjectReference Property startmarker Auto

Quest Property RS_Minigame_GodStatues Auto

Event OnActivate(ObjectReference akActionRef)
	int minigameStatus = minigameStatusGlobal.GetValue() as int
	If minigameStatus == 0;if you are not doing this region's god statue... and would like to start
		;Evaluate how long it has been since the first GodStatue was done, and if this particular one has been completed within the limit
		;getgametime and see if x-hours has passed since the last time god statues was done
		/---psuedo
		float gametime = Game.GetGameHours()
		if gametime - lasttime.GetValue() >= required interval time between god statues
			do minigame
		else
			can't do minigame for another (gametime - lasttime) then take that and subtract it from the required time, hours
		---/
		minigameStatusGlobal.SetValue(1)
		Game.FadeOutGame(True, true, 0.0, 2.0)
		Game.GetPlayer().MoveTo(startmarker)
		stack1.Enable()
		stack2.Enable()
		stack3.Enable()
		stack4.Enable()
		stack5.Enable()
		scaffoldStackGlobal1.SetValue(1)
		scaffoldStackGlobal2.SetValue(1)
		scaffoldStackGlobal3.SetValue(1)
		scaffoldStackGlobal4.SetValue(1)
		scaffoldStackGlobal5.SetValue(1)
		RS_Minigame_GodStatues.UpdateCurrentInstanceGlobal(scaffoldStackGlobal1)
		RS_Minigame_GodStatues.UpdateCurrentInstanceGlobal(scaffoldStackGlobal2)
		RS_Minigame_GodStatues.UpdateCurrentInstanceGlobal(scaffoldStackGlobal3)
		RS_Minigame_GodStatues.UpdateCurrentInstanceGlobal(scaffoldStackGlobal4)
		RS_Minigame_GodStatues.UpdateCurrentInstanceGlobal(scaffoldStackGlobal5)
		
		;Debug.MessageBox("Just checking... global 1= " + scaffoldStackGlobal1.GetValue())
		;Debug.MessageBox("Just checking... global 2= " + scaffoldStackGlobal2.GetValue())
		;Debug.MessageBox("Just checking... global 3= " + scaffoldStackGlobal3.GetValue())
		;Debug.MessageBox("Just checking... global 4= " + scaffoldStackGlobal4.GetValue())
		;Debug.MessageBox("Just checking... global 5= " + scaffoldStackGlobal5.GetValue())
		
		;Roll min, then max, if max is less than or equal to min, take the min and add one = max
		int min = Utility.RandomInt(2,4)
		int max = Utility.RandomInt(3,5)
		if max <= min
			max = min + 1
		endif

		;Take range, and pick a section, roll within possible totals
		int total = 0
		if min == 2
			;Debug.MessageBox("Our min was 2!")
			if max ==  3
				total = Utility.RandomInt(10,15)
			elseif max == 4
				total = Utility.RandomInt(10,20)
			elseif max == 5
				total = Utility.RandomInt(10,25)
			endif
		elseif min == 3
			;Debug.MessageBox("Our min was 3!")
			if max == 4
				total = Utility.RandomInt(15,20)
			elseif max == 5
				total = Utility.RandomInt(15,25)
			endif
		elseif min == 4
			;Debug.MessageBox("Our min was 4!")
			if max == 5
				total = Utility.RandomInt(20,25)
			endif
		endif
		;Debug.MessageBox("Our total was " + total)
		int pillar
		int p1 = min
		int p2 = min
		int p3 = min
		int p4 = min
		int p5 = min
		int permTotal = total
		total = total - (min*5)
		while(total != 0)
			pillar = Utility.RandomInt(1,5)
			if pillar == 1
				if p1 != max
					p1 = p1 + 1
					total = total - 1
				else
					;reroll
				endif
			elseif pillar == 2
				if p2 != max
					p2 = p2 + 1
					total = total - 1
				else
					;reroll
				endif
			elseif pillar == 3
				if p3 != max
					p3 = p3 + 1
					total = total - 1
				else
					;reroll
				endif
			elseif pillar == 4
				if p4 != max
					p4 = p4 + 1
					total = total - 1
				else
					;reroll
				endif
			elseif pillar == 5
				if p5 != max
					p5 = p5 + 1
					total = total - 1
				else
					;reroll
				endif	
			endif
		endwhile
		
		scaffoldAnswer1.SetValue(p1)
		scaffoldAnswer2.SetValue(p2)
		scaffoldAnswer3.SetValue(p3)
		scaffoldAnswer4.SetValue(p4)
		scaffoldAnswer5.SetValue(p5)
		
		int[] array = new int[5]
		array[0] = p1
		array[1] = p2
		array[2] = p3
		array[3] = p4
		array[4] = p5
		
		rsFrameworkMenu.SortArray(array)
		Debug.MessageBox("The lowest scaffold is " + array[0] + " high.")
		Debug.MessageBox("The highest scaffold is " + array[array.length - 1] + " high.")
		Debug.MessageBox("The total amount of scaffolding is " + permTotal + ".")
		Debug.MessageBox("Pillar1 is =" + p1 + " high. Pillar2 is =" + p2 + " high. Pillar3 is =" + p3 + " high. Pillar4 is =" + p4 + " high. Pillar5 is =" + p5 + " high.")
		Game.FadeOutGame(False, true, 0.0, 2.0)
	else;We were doing the minigame... lets turn it in now
		bool gradedScaffold01 = false
		bool gradedScaffold02 = false
		bool gradedScaffold03 = false
		bool gradedScaffold04 = false
		bool gradedScaffold05 = false
		int status1 = scaffoldStackGlobal1.GetValue() as int
		int status2 = scaffoldStackGlobal2.GetValue() as int
		int status3 = scaffoldStackGlobal3.GetValue() as int
		int status4 = scaffoldStackGlobal4.GetValue() as int
		int status5 = scaffoldStackGlobal5.GetValue() as int
		
		int answer1 = scaffoldAnswer1.GetValue() as int
		int answer2 = scaffoldAnswer2.GetValue() as int
		int answer3 = scaffoldAnswer3.GetValue() as int
		int answer4 = scaffoldAnswer4.GetValue() as int
		int answer5 = scaffoldAnswer5.GetValue() as int
		
		if (status1 == answer1)
			gradedScaffold01 = true
			if (status2 == answer2)
				gradedScaffold02 = true
				if (status3 == answer3)
					gradedScaffold03 = true
					if (status4 == answer4)
						gradedScaffold04 = true
						if (status5 == answer5)
							gradedScaffold05 = true
						elseif (status5 < answer5)
							Debug.Notification("Stack #5 is too short.")
						else
							Debug.Notification("Stack #5 is too tall.")
						endif	
					elseif (status4 < answer4)
						Debug.Notification("Stack #4 is too short.")
					else
						Debug.Notification("Stack #4 is too tall.")
					endif
				elseif (status3 < answer3)
					Debug.Notification("Stack #3 is too short.")
				else
					Debug.Notification("Stack #3 is too tall.")
				endif
			elseif (status2 < answer2)
				Debug.Notification("Stack #2 is too short.")
			else
				Debug.Notification("Stack #2 is too tall.")
			endif
		elseif (status1 < answer1)
			Debug.Notification("Stack #1 is too short.")
		else
			Debug.Notification("Stack #1 is too tall.")
		endif
		
		;Completed!
		if (gradedScaffold01 == true && gradedScaffold02 == true && gradedScaffold03 == true && gradedScaffold04 == true && gradedScaffold05 == true)
			Debug.MessageBox("You did it!")
			Self.Disable()
			minigameStatusGlobal.SetValue(0)
			Game.FadeOutGame(True, true, 0.0, 2.0)
			Game.GetPlayer().MoveTo(startmarker)
			
			Statue.Enable();come back to this and add different models for level, also include reward.
			
			stack1.Disable()
			stack1_2.Disable()
			stack1_3.Disable()
			stack1_4.Disable()
			stack1_5.Disable()
			
			stack2.Disable()
			stack2_2.Disable()
			stack2_3.Disable()
			stack2_4.Disable()
			stack2_5.Disable()
			
			stack3.Disable()
			stack3_2.Disable()
			stack3_3.Disable()
			stack3_4.Disable()
			stack3_5.Disable()
			
			stack4.Disable()
			stack4_2.Disable()
			stack4_3.Disable()
			stack4_4.Disable()
			stack4_5.Disable()
			
			stack5.Disable()
			stack5_2.Disable()
			stack5_3.Disable()
			stack5_4.Disable()
			stack5_5.Disable()
			
			;update last time done global with current gametime
			
			Game.FadeOutGame(False, true, 0.0, 2.0)
		endif
	endif
EndEvent

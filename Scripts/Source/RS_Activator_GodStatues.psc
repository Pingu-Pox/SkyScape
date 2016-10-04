ScriptName RS_Activator_GodStatues Extends ObjectReference
{This script is what starts the minigame, and sets it up. Hand off to other script for player input}

Globalvariable Property ScaffoldAnswer1 Auto
Globalvariable Property ScaffoldAnswer2 Auto
Globalvariable Property ScaffoldAnswer3 Auto
Globalvariable Property ScaffoldAnswer4 Auto
Globalvariable Property ScaffoldAnswer5 Auto

Event OnActivate(ObjectReference akActionRef)
	;Evaluate how long it has been since the first GodStatue was done, and if this particular one has been completed within the limit

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
	
	ScaffoldAnswer1.SetValue(p1)
	ScaffoldAnswer2.SetValue(p2)
	ScaffoldAnswer3.SetValue(p3)
	ScaffoldAnswer4.SetValue(p4)
	ScaffoldAnswer5.SetValue(p5)
	
	int[] array = new int[5]
	array[0] = p1
	array[1] = p2
	array[2] = p3
	array[3] = p4
	array[4] = p5
	
	rsFrameworkMenu.SortArray(array)
	Debug.MessageBox("The lowest scaffold is " + array[0] + " high.")
	Debug.MessageBox("The highest scaffold is " + array[array.length - 1] + " high.")
	Debug.MessageBox("The total amount of scaffolding is " + total + ".")
	Debug.MessageBox("Pillar #1 is =" + p1 + " high. Pillar #2 is =" + p2 + " high. Pillar #3 is =" + p3 + " high. Pillar #4 is =" + p4 + " high. Pillar #5 is =" + p5 + " high.")
EndEvent

ScriptName RS_Activator_GodStatues Extends ObjectReference
{This script handles the God Statues minigame}

Event OnActivate(ObjectReference akActionRef)
	;Add the previous code here, optionally just putting them in arrays from the beginning.
	int p1 = 5
	int p2 = 2
	int p3 = 3
	int p4 = 2
	int p5 = 4
	
	int[] array = new int[5]
	array[0] = p1
	array[1] = p2
	array[2] = p3
	array[3] = p4
	array[4] = p5
	
	SortArrayInt(array)
	Debug.MessageBox("The lowest scaffold is " + array[0] + " high.")
	Debug.MessageBox("The highest scaffold is " + array[array.length - 1] + " high.")
EndEvent

;This function needs to get put into the new API, it sorts int arrays into ascending values (i.e. {1,5,17,19,20,25})
int[] Function SortArrayInt(int[] array)
  bool sorting = true
  int index = 0
  int temp = 0
  while(sorting)
	  if (index >= array.Length - 1)
	  	index = 0
	  else
	  	if (IsSortedInt(array) == true)
	  		sorting = false
	  	elseif (array[index] <= array[index + 1])
	  		index = index + 1
	  	elseif (array[index] > array[index + 1])
	  		temp = array[index]
	   		array[index] = array[index + 1]
	  		array[index + 1] = temp
	  		index = index + 1
	  	endif
	  endif
  endwhile
endfunction

Bool Function IsSortedInt(int[] array)
	bool sorted = true
	int index = 0
	while ((index < array.Length - 1) && (sorted == true))
		if (array[index] <= array[index + 1])
			index = index + 1
		else
			sorted = false
		endif
	EndWhile
	return sorted
EndFunction

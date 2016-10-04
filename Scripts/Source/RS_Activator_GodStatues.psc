;This function needs to get put into the new API, it sorts int arrays into ascending values (i.e. {1,5,17,19,20,25})
int[] Function SortArrayInt(int[] array)
  bool sorting = true
  int index = 0
  int temp = 0
  while(sorting)
	  if (index >= array.Length - 1)
	  	index = 0
	  else
	  	if (array[0] <= array[1] && array[1] <= array[2] && array[2] <= array[3] && array[3] <= array[4] && array[4] <= array[5])
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

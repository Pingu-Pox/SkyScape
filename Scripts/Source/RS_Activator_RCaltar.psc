ScriptName RS_Activator_RCaltar Extends ObjectReference
{Script to put on the actual runecrafting altar}

Int Property reqLVL Auto
bool Property bOnlyPureEssence Auto
string Property runeType Auto

Event OnActivate(ObjectReference akActionRef)
	if (akActionRef != Game.GetPlayer())
		;do nothing, some other actor tried to activate this
	else
		if (RS_GV_RunecraftingLVL.GetValue()) < reqLVL
			Debug.Notification("You lack the required runecrafting level of '" + reqLVL + "'")
		else
			int mainLoop = true
			while(mainLoop)
				int craftType = craftRCmenu.Show()
				if craftType == 0;runes
					;tell which essType you have, act accordingly
					if (RS_Config_Runecrafting_UnpackPouch.GetValue()) == 1
						;small, medium, large, giant, massive
						;convert all essence in inventory and Pouch, zero out bag globals that are in the inventory, all in one
						;give xp
					else
						if (bOnlyPureEssence)
							int essCountPure = Game.GetPlayer().GetItemCount(RS_Item_Runecrafting_RuneEssencePure)
							rsFramework.Runecraft(runeType, pure, essCountPure)
							mainLoop = false
						else
							int essCountPure = Game.GetPlayer().GetItemCount(RS_Item_Runecrafting_RuneEssencePure)
							int essCount = Game.GetPlayer().GetItemCount(RS_Item_Runecrafting_RuneEssence)
							if essCountPure > 0;if you have pure essence...
								rsFramework.Runecraft(runeType, pure, essCountPure)
								mainLoop = false
							else
								rsFramework.Runecraft(runeType, regular, essCount)
								mainLoop = false					
							endif
						endif
					endif
				elseif craftType == 1;tiara
					;rsFramework.GetCount - can exit
					;produce item one at a time - can exit
					;give xp
				elseif craftType == 2;staff
					;rsFramework.GetCount - can exit
					;produce item one at a time - can exit
				else
					;exit
					mainLoop = false
				endif
			endwhile;mainloop
		endif
	endif
EndEvent

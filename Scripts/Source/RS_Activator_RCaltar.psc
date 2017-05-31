ScriptName RS_Activator_RCaltar Extends ObjectReference
{Script to put on the actual runecrafting altar}

Int Property reqLVL Auto; required level for crafting runes at this altar
bool Property bOnlyPureEssence Auto = false; TRUE=Requires pure ess to craft, FALSE=Use any rune essence available
string Property runeType Auto

Event OnActivate(ObjectReference akActionRef)
	if (akActionRef != Game.GetPlayer())
		;do nothing, some other actor tried to activate this
	else
		if ((rsFrameworkMenu.GetRunecraftingLVL()).GetValue()) < reqLVL
			Debug.Notification("You lack the required runecrafting level of '" + reqLVL + "'")
		else
			int mainLoop = true
			while(mainLoop)
				int craftType = craftRCmenu.Show()
				if craftType == 0;runes
					;tell which essType you have, act accordingly
					if (RS_Config_Runecrafting_UnpackPouch.GetValue()) == 1; Check if player set the config to auto-unpack pouches
						int pouchPureCount = rsFrameworkMenu.GetPouchPureCount(); //Ensure to check which pouches are carried
						int pouchEssCount = rsFrameworkMenu.GetPouchEssCount(); //Ensure to check which pouches are carried
						if (bOnlyPureEssence)
							int essCountPure = (Game.GetPlayer().GetItemCount(RS_Item_Runecrafting_RuneEssencePure)) + pouchPureCount
							rsFrameworkMenu.Runecraft(runeType, pure, essCountPure)
							mainLoop = false
						else
							int essCountTotal = (Game.GetPlayer().GetItemCount(RS_Item_Runecrafting_RuneEssencePure)) + (Game.GetPlayer().GetItemCount(RS_Item_Runecrafting_RuneEssence)) + pouchPureCount + pouchEssCount
							rsFrameworkMenu.Runecraft(runeType, either, essCountTotal)
							mainLoop = false
						endif
					else; Player will unpack pouches manually
						if (bOnlyPureEssence)
							int essCountPure = Game.GetPlayer().GetItemCount(RS_Item_Runecrafting_RuneEssencePure)
							rsFrameworkMenu.Runecraft(runeType, pure, essCountPure)
							mainLoop = false
						else
							int essCountTotal = (Game.GetPlayer().GetItemCount(RS_Item_Runecrafting_RuneEssencePure)) + (Game.GetPlayer().GetItemCount(RS_Item_Runecrafting_RuneEssence))
							rsFrameworkMenu.Runecraft(runeType, either, essCountTotal)
							mainLoop = false
						endif
					endif
				elseif craftType == 1;tiara
					rsFrameworkMenu.CraftRCTiara(runeType)
					mainLoop = false
				elseif craftType == 2;staff
					rsFrameworkMenu.CraftRCStaff(runeType); //Make sure to include dramen staff (air fire water earth) into lunar staff
					mainLoop = false
				else
					;exit
					mainLoop = false
				endif
			endwhile;
		endif
	endif
EndEvent

ScriptName RS_Activator_RCaltar Extends ObjectReference
{Script to put on the actual runecrafting altar}

Message Property RS_Message_Runecrafting_craftRCmenu Auto

Int Property reqLVL Auto; required level for crafting runes at this altar
bool Property bOnlyPureEssence = false Auto; TRUE=Requires pure ess to craft, FALSE=Use any rune essence available
string Property runeType Auto

Globalvariable Property RS_Config_Runecrafting_UnpackPouch Auto

MiscObject Property RS_Item_RunecraftingPouch_Small Auto
MiscObject Property RS_Item_RunecraftingPouch_Medium Auto
MiscObject Property RS_Item_RunecraftingPouch_Large Auto
MiscObject Property RS_Item_RunecraftingPouch_Giant Auto
MiscObject Property RS_Item_Runecrafting_RuneEssence Auto
MiscObject Property RS_Item_Runecrafting_RuneEssencePure Auto


Event OnActivate(ObjectReference akActionRef)
	if (akActionRef != Game.GetPlayer())
		;do nothing, some other actor tried to activate this
	else
		if ((rsFrameworkMenu.GetRunecraftingLVL()).GetValue()) < reqLVL
			Debug.Notification("You lack the required runecrafting level of '" + reqLVL + "'")
		else
			bool mainLoop = true
			while(mainLoop)
				int craftType = RS_Message_Runecrafting_craftRCmenu.Show()
				if craftType == 0;runes
					;tell which essType you have, act accordingly
					if (RS_Config_Runecrafting_UnpackPouch.GetValue()) == 1; Check if player set the config to auto-unpack pouches
						bool small = false
						bool medium = false
						bool large = false
						bool giant = false
						if game.getplayer().GetItemCount(RS_Item_RunecraftingPouch_Small) == 1
							small = true
						endif
						if game.getplayer().GetItemCount(RS_Item_RunecraftingPouch_Medium) == 1
							medium = true
						endif
						if game.getplayer().GetItemCount(RS_Item_RunecraftingPouch_Large) == 1
							large = true
						endif
						if game.getplayer().GetItemCount(RS_Item_RunecraftingPouch_Giant) == 1
							giant = true
						endif
						
						int pouchPureCount = rsFrameworkMenu.GetPouchPureCount(small, medium, large, giant); //Ensure to check which pouches are carried
						int pouchEssCount = rsFrameworkMenu.GetPouchEssCount(small, medium, large, giant); //Ensure to check which pouches are carried
						if (bOnlyPureEssence)
							int essCountPure = (Game.GetPlayer().GetItemCount(RS_Item_Runecrafting_RuneEssencePure)) + pouchPureCount
							rsFrameworkMenu.Runecraft(runeType, true, essCountPure)
							mainLoop = false
						else
							int essCountTotal = (Game.GetPlayer().GetItemCount(RS_Item_Runecrafting_RuneEssencePure)) + (Game.GetPlayer().GetItemCount(RS_Item_Runecrafting_RuneEssence)) + pouchPureCount + pouchEssCount
							rsFrameworkMenu.Runecraft(runeType, false, essCountTotal)
							mainLoop = false
						endif
					else; Player will unpack pouches manually
						if (bOnlyPureEssence)
							int essCountPure = Game.GetPlayer().GetItemCount(RS_Item_Runecrafting_RuneEssencePure)
							rsFrameworkMenu.Runecraft(runeType, true, essCountPure)
							mainLoop = false
						else
							int essCountTotal = (Game.GetPlayer().GetItemCount(RS_Item_Runecrafting_RuneEssencePure)) + (Game.GetPlayer().GetItemCount(RS_Item_Runecrafting_RuneEssence))
							rsFrameworkMenu.Runecraft(runeType, false, essCountTotal)
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

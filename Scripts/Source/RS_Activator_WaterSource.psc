ScriptName RS_Activator_WaterSource Extends ObjectReference
{Attach to activators that are water sources}

Message Property RS_Message_General_WaterSourceVessel Auto
Message Property RS_Message_General_MakeCount Auto

MiscObject Property RS_Item_Tool_CupEmpty Auto
MiscObject Property RS_Item_Cooking_CupWater Auto
MiscObject Property RS_Item_Tool_VialEmpty Auto
MiscObject Property RS_Item_Herblore_VialWater Auto
MiscObject Property RS_Item_Tool_WateringCanEmpty Auto
MiscObject Property RS_Item_Farming_WateringCan8 Auto
MiscObject Property RS_Item_Ore_Clay Auto
MiscObject Property RS_Item_Crafting_SoftClay Auto

Sound Property RS_SM_FillWater Auto

Event OnActivate(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		bool bLooping = true
		While(bLooping == true)
			int choice = RS_Message_General_WaterSourceVessel.Show()
			int count = rsFrameworkMenu.rsMakeCount(RS_Message_General_MakeCount)
			if choice == 0; Cups
				rsFrameworkMenu.ItemForItemLoop(RS_Item_Tool_VialEmpty, RS_Item_Herblore_VialWater, RS_SM_FillWater, Self, count, 1, 1, 1, "empty vials", false, "", 0.0, self)
				bLooping = false
			elseif choice == 1; Vials
				rsFrameworkMenu.ItemForItemLoop(RS_Item_Tool_CupEmpty, RS_Item_Cooking_CupWater, RS_SM_FillWater, Self, count, 1, 1, 1, "empty cups", false, "", 0.0, self)
				bLooping = false
			elseif choice == 2; Water can
				rsFrameworkMenu.ItemForItemLoop(RS_Item_Tool_WateringCanEmpty, RS_Item_Farming_WateringCan8, RS_SM_FillWater, Self, count, 1, 1, 1, "empty watering can", false, "", 0.0, self)
				bLooping = false
			elseif choice == 3; Clay
				rsFrameworkMenu.ItemForItemLoop(RS_Item_Ore_Clay, RS_Item_Crafting_SoftClay, RS_SM_FillWater, Self, count, 1, 1, 1, "clay", false, "", 0.0, self)
				bLooping = false
			else; Exit
			
			endif
		EndWhile
	endif
EndEvent

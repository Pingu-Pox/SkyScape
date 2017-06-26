ScriptName RS_Runecrafting_PouchScript Extends ObjectReference
{Script to handle packing and unpacking of Rune Essence Pouches}

String Property pouchSize Auto

Globalvariable Property RS_Count_Runecrafting_Ess_Small Auto
Globalvariable Property RS_Count_Runecrafting_Ess_Medium Auto
Globalvariable Property RS_Count_Runecrafting_Ess_Large Auto
Globalvariable Property RS_Count_Runecrafting_Ess_Giant Auto
Globalvariable Property RS_Count_Runecrafting_EssPure_Small Auto
Globalvariable Property RS_Count_Runecrafting_EssPure_Medium Auto
Globalvariable Property RS_Count_Runecrafting_EssPure_Large Auto
Globalvariable Property RS_Count_Runecrafting_EssPure_Giant Auto

MiscObject Property RS_Item_Runecrafting_RuneEssence Auto
MiscObject Property RS_Item_Runecrafting_RuneEssencePure Auto
Event OnEquipped(Actor akActor)
	rsFrameworkMenu.RemoveSparePouches()
	int pack = RS_Message_Runecrafting_PackUnpackPouch.Show()
	if pack == 0;Pack
		FillRemainingSpace("pouchSize")
	else pack == 1;Unpack
		EmptyPouch("pouchSize")
	endif
EndEvent

int Function FillRemainingSpace(string size)
	int capacity = 0
	int req = 0
	int rcLvl = (rsFrameworkMenu.GetRunecraftingLVL().GetValue) as int
	if size == "small"
		req = 1
		capacity = 3
		if (rcLVL < req)
			debug.notification("You require a runecrafting level of " + req + " to use this pouch.")
		else
			
		endif
		
	elseif
	
	else
	
	endif
EndFunction

Function EmptyPouch(string size)
	if size == "small"
		int regEssCount = RS_Count_Runecrafting_Ess_Small.GetValue() as int
		int pureEssCount = RS_Count_Runecrafting_EssPure_Small.GetValue() as int
		RS_Count_Runecrafting_Ess_Small.SetValue(0)
		RS_Count_Runecrafting_EssPure_Small.SetValue(0)
		Game.GetPlayer().AddItem(RS_Item_Runecrafting_RuneEssence, regEssCount)
		Game.GetPlayer().AddItem(RS_Item_Runecrafting_RuneEssencePure, pureEssCount)
	elseif size == "medium"
		int regEssCount = RS_Count_Runecrafting_Ess_Medium.GetValue() as int
		int pureEssCount = RS_Count_Runecrafting_EssPure_Medium.GetValue() as int
		RS_Count_Runecrafting_Ess_Medium.SetValue(0)
		RS_Count_Runecrafting_EssPure_Medium.SetValue(0)
		Game.GetPlayer().AddItem(RS_Item_Runecrafting_RuneEssence, regEssCount)
		Game.GetPlayer().AddItem(RS_Item_Runecrafting_RuneEssencePure, pureEssCount)
	elseif size == "large"
		int regEssCount = RS_Count_Runecrafting_Ess_large.GetValue() as int
		int pureEssCount = RS_Count_Runecrafting_EssPure_large.GetValue() as int
		RS_Count_Runecrafting_Ess_large.SetValue(0)
		RS_Count_Runecrafting_EssPure_large.SetValue(0)
		Game.GetPlayer().AddItem(RS_Item_Runecrafting_RuneEssence, regEssCount)
		Game.GetPlayer().AddItem(RS_Item_Runecrafting_RuneEssencePure, pureEssCount)
	elseif size == "giant"
		int regEssCount = RS_Count_Runecrafting_Ess_giant.GetValue() as int
		int pureEssCount = RS_Count_Runecrafting_EssPure_giant.GetValue() as int
		RS_Count_Runecrafting_Ess_giant.SetValue(0)
		RS_Count_Runecrafting_EssPure_giant.SetValue(0)
		Game.GetPlayer().AddItem(RS_Item_Runecrafting_RuneEssence, regEssCount)
		Game.GetPlayer().AddItem(RS_Item_Runecrafting_RuneEssencePure, pureEssCount)		
	else
		debug.notification("Runecrafting error 004 - Unable to discern pouchSize - in function EmptyPouch()")
	endif
EndFunction
type req capacity usesb4decay
s 1 3 none
m 25 6 45
l 50 9 29
g 75 12 10

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
	int remaining = 0
	int req = 0
	int rcLvl = (rsFrameworkMenu.GetRunecraftingLVL().GetValue) as int
	if size == "small";never degrades
		req = 1
		capacity = EvaluatePouch(size)
		if (rcLVL < req)
			debug.notification("You require a runecrafting level of " + req + " to use this pouch.")
		else
			remaining = capacity - RS_Count_Runecrafting_Ess_Small.GetValue() as int - RS_Count_Runecrafting_EssPure_Small.GetValue() as int
			if remaining == 0
				debug.notification("You cannot fit any more rune essence into this pouch")
			else
				regCount = Game.GetPlayer().GetItemCount(RS_Item_Runecrafting_RuneEssence)
				pureCount = Game.GetPlayer().GetItemCount(RS_Item_Runecrafting_RuneEssencePure)
				if regCount > 0
					if regCount >= remaining
						Game.GetPlayer().RemoveItem(RS_Item_Runecrafting_RuneEssence, remaining)
						RS_Count_Runecrafting_Ess_Small.SetValue((RS_Count_Runecrafting_Ess_Small.GetValue()) + remaining)
						DamagePouch(size)
					else
						Game.GetPlayer().RemoveItem(RS_Item_Runecrafting_RuneEssence, regCount)
						RS_Count_Runecrafting_Ess_Small.SetValue((RS_Count_Runecrafting_Ess_Small.GetValue()) + regCount)
						remaining = capacity - RS_Count_Runecrafting_Ess_Small.GetValue() as int - RS_Count_Runecrafting_EssPure_Small.GetValue() as int
						if pureCount > 0
							if pureCount >= remaining
								Game.GetPlayer().RemoveItem(RS_Item_Runecrafting_RuneEssencePure, remaining)
								RS_Count_Runecrafting_EssPure_Small.SetValue((RS_Count_Runecrafting_EssPure_Small.GetValue()) + remaining)
							else
								Game.GetPlayer().RemoveItem(RS_Item_Runecrafting_RuneEssencePure, regCount)
								RS_Count_Runecrafting_Ess_Small.SetValue((RS_Count_Runecrafting_EssPure_Small.GetValue()) + pureCount)
							endif
						endif
						DamagePouch(size)
					endif
				else
					if pureCount >= remaining
						Game.GetPlayer().RemoveItem(RS_Item_Runecrafting_RuneEssence, remaining)
						RS_Count_Runecrafting_Ess_Small.SetValue((RS_Count_Runecrafting_Ess_Small.GetValue()) + remaining)
					else
						Game.GetPlayer().RemoveItem(RS_Item_Runecrafting_RuneEssence, pureCount)
						RS_Count_Runecrafting_Ess_Small.SetValue((RS_Count_Runecrafting_Ess_Small.GetValue()) + pureCount)
					endif
				endif
			endif
		endif
		
	elseif size == "medium";45
		req = 25
		capacity = EvaluatePouch(size)
		if (rcLVL < req)
			debug.notification("You require a runecrafting level of " + req + " to use this pouch.")
		else
			remaining = capacity - RS_Count_Runecrafting_Ess_medium.GetValue() as int - RS_Count_Runecrafting_EssPure_medium.GetValue() as int
			if remaining == 0
				debug.notification("You cannot fit any more rune essence into this pouch")
			else
				regCount = Game.GetPlayer().GetItemCount(RS_Item_Runecrafting_RuneEssence)
				pureCount = Game.GetPlayer().GetItemCount(RS_Item_Runecrafting_RuneEssencePure)
				if regCount > 0
					if regCount >= remaining
						Game.GetPlayer().RemoveItem(RS_Item_Runecrafting_RuneEssence, remaining)
						RS_Count_Runecrafting_Ess_medium.SetValue((RS_Count_Runecrafting_Ess_medium.GetValue()) + remaining)
						DamagePouch(size)
					else
						Game.GetPlayer().RemoveItem(RS_Item_Runecrafting_RuneEssence, regCount)
						RS_Count_Runecrafting_Ess_medium.SetValue((RS_Count_Runecrafting_Ess_medium.GetValue()) + regCount)
						remaining = capacity - RS_Count_Runecrafting_Ess_medium.GetValue() as int - RS_Count_Runecrafting_EssPure_medium.GetValue() as int
						if pureCount > 0
							if pureCount >= remaining
								Game.GetPlayer().RemoveItem(RS_Item_Runecrafting_RuneEssencePure, remaining)
								RS_Count_Runecrafting_EssPure_medium.SetValue((RS_Count_Runecrafting_EssPure_medium.GetValue()) + remaining)
								DamagePouch(size)
							else
								Game.GetPlayer().RemoveItem(RS_Item_Runecrafting_RuneEssencePure, regCount)
								RS_Count_Runecrafting_Ess_medium.SetValue((RS_Count_Runecrafting_EssPure_medium.GetValue()) + pureCount)
								DamagePouch(size)
							endif
						endif
					endif
				else
					if pureCount >= remaining
						Game.GetPlayer().RemoveItem(RS_Item_Runecrafting_RuneEssence, remaining)
						RS_Count_Runecrafting_Ess_medium.SetValue((RS_Count_Runecrafting_Ess_medium.GetValue()) + remaining)
						DamagePouch(size)
					else
						Game.GetPlayer().RemoveItem(RS_Item_Runecrafting_RuneEssence, pureCount)
						RS_Count_Runecrafting_Ess_medium.SetValue((RS_Count_Runecrafting_Ess_medium.GetValue()) + pureCount)
						DamagePouch(size)
					endif
				endif
			endif
		endif
		
	elseif size == "large";29
		req = 50
		capacity = EvaluatePouch(size)
		if (rcLVL < req)
			debug.notification("You require a runecrafting level of " + req + " to use this pouch.")
		else
			remaining = capacity - RS_Count_Runecrafting_Ess_large.GetValue() as int - RS_Count_Runecrafting_EssPure_large.GetValue() as int
			if remaining == 0
				debug.notification("You cannot fit any more rune essence into this pouch")
			else
				regCount = Game.GetPlayer().GetItemCount(RS_Item_Runecrafting_RuneEssence)
				pureCount = Game.GetPlayer().GetItemCount(RS_Item_Runecrafting_RuneEssencePure)
				if regCount > 0
					if regCount >= remaining
						Game.GetPlayer().RemoveItem(RS_Item_Runecrafting_RuneEssence, remaining)
						RS_Count_Runecrafting_Ess_large.SetValue((RS_Count_Runecrafting_Ess_large.GetValue()) + remaining)
						DamagePouch(size)
					else
						Game.GetPlayer().RemoveItem(RS_Item_Runecrafting_RuneEssence, regCount)
						RS_Count_Runecrafting_Ess_large.SetValue((RS_Count_Runecrafting_Ess_large.GetValue()) + regCount)
						remaining = capacity - RS_Count_Runecrafting_Ess_large.GetValue() as int - RS_Count_Runecrafting_EssPure_large.GetValue() as int
						if pureCount > 0
							if pureCount >= remaining
								Game.GetPlayer().RemoveItem(RS_Item_Runecrafting_RuneEssencePure, remaining)
								RS_Count_Runecrafting_EssPure_large.SetValue((RS_Count_Runecrafting_EssPure_large.GetValue()) + remaining)
								DamagePouch(size)
							else
								Game.GetPlayer().RemoveItem(RS_Item_Runecrafting_RuneEssencePure, regCount)
								RS_Count_Runecrafting_Ess_large.SetValue((RS_Count_Runecrafting_EssPure_large.GetValue()) + pureCount)
								DamagePouch(size)
							endif
						endif
					endif
				else
					if pureCount >= remaining
						Game.GetPlayer().RemoveItem(RS_Item_Runecrafting_RuneEssence, remaining)
						RS_Count_Runecrafting_Ess_large.SetValue((RS_Count_Runecrafting_Ess_large.GetValue()) + remaining)
						DamagePouch(size)
					else
						Game.GetPlayer().RemoveItem(RS_Item_Runecrafting_RuneEssence, pureCount)
						RS_Count_Runecrafting_Ess_large.SetValue((RS_Count_Runecrafting_Ess_large.GetValue()) + pureCount)
						DamagePouch(size)
					endif
				endif
			endif
		endif
		
	elseif size == "giant";10
		req = 75
		capacity = EvaluatePouch(size)
		if (rcLVL < req)
			debug.notification("You require a runecrafting level of " + req + " to use this pouch.")
		else
			remaining = capacity - RS_Count_Runecrafting_Ess_giant.GetValue() as int - RS_Count_Runecrafting_EssPure_giant.GetValue() as int
			if remaining == 0
				debug.notification("You cannot fit any more rune essence into this pouch")
			else
				regCount = Game.GetPlayer().GetItemCount(RS_Item_Runecrafting_RuneEssence)
				pureCount = Game.GetPlayer().GetItemCount(RS_Item_Runecrafting_RuneEssencePure)
				if regCount > 0
					if regCount >= remaining
						Game.GetPlayer().RemoveItem(RS_Item_Runecrafting_RuneEssence, remaining)
						RS_Count_Runecrafting_Ess_giant.SetValue((RS_Count_Runecrafting_Ess_giant.GetValue()) + remaining)
						DamagePouch(size)
					else
						Game.GetPlayer().RemoveItem(RS_Item_Runecrafting_RuneEssence, regCount)
						RS_Count_Runecrafting_Ess_giant.SetValue((RS_Count_Runecrafting_Ess_giant.GetValue()) + regCount)
						remaining = capacity - RS_Count_Runecrafting_Ess_giant.GetValue() as int - RS_Count_Runecrafting_EssPure_giant.GetValue() as int
						if pureCount > 0
							if pureCount >= remaining
								Game.GetPlayer().RemoveItem(RS_Item_Runecrafting_RuneEssencePure, remaining)
								RS_Count_Runecrafting_EssPure_giant.SetValue((RS_Count_Runecrafting_EssPure_giant.GetValue()) + remaining)
								DamagePouch(size)
							else
								Game.GetPlayer().RemoveItem(RS_Item_Runecrafting_RuneEssencePure, regCount)
								RS_Count_Runecrafting_Ess_giant.SetValue((RS_Count_Runecrafting_EssPure_giant.GetValue()) + pureCount)
								DamagePouch(size)
							endif
						endif
					endif
				else
					if pureCount >= remaining
						Game.GetPlayer().RemoveItem(RS_Item_Runecrafting_RuneEssence, remaining)
						RS_Count_Runecrafting_Ess_giant.SetValue((RS_Count_Runecrafting_Ess_giant.GetValue()) + remaining)
						DamagePouch(size)
					else
						Game.GetPlayer().RemoveItem(RS_Item_Runecrafting_RuneEssence, pureCount)
						RS_Count_Runecrafting_Ess_giant.SetValue((RS_Count_Runecrafting_Ess_giant.GetValue()) + pureCount)
						DamagePouch(size)
					endif
				endif
			endif
		endif
		
	else
		debug.messagebox("Runecrafting error 004 - Unable to discern pouchSize - in function FillRemainingSpace()")
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
		debug.messagebox("Runecrafting error 004 - Unable to discern pouchSize - in function EmptyPouch()")
	endif
EndFunction

Int Function EvaluatePouch(string size)
	
	if size == "small"
		return 3
	elseif size == "medium"
		if (RS_Count_Runecrafting_Durability_PouchMedium.GetValue() > 0)
			return 6
		else
			return 3
		endif
	elseif size == "large"
		if (RS_Count_Runecrafting_Durability_PouchLarge.GetValue() > 0)
			return 9
		else
			return 6
		endif
	elseif size == "giant"
		if (RS_Count_Runecrafting_Durability_PouchGiant.GetValue() > 0)
			return 12
		else
			return 9
		endif
	else
		debug.messagebox("Runecrafting error 004 - Unable to discern pouchSize - in function DamagePouch()")
	endif
EndFunction

Function RepairPouches()
	RS_Count_Runecrafting_Durability_PouchMedium.SetValue(45)
	RS_Count_Runecrafting_Durability_PouchLarge.SetValue(29)
	RS_Count_Runecrafting_Durability_PouchGiant.SetValue(10)
EndFunction

Function DamagePouch(string size)
	if size == "small"
		;do nothing
	elseif size == "medium"
		RS_Count_Runecrafting_Durability_PouchMedium.SetValue((RS_Count_Runecrafting_Durability_PouchMedium.GetValue() - 1))
	elseif size == "large"
		RS_Count_Runecrafting_Durability_PouchLarge.SetValue((RS_Count_Runecrafting_Durability_PouchLarge.GetValue() - 1))
	elseif size == "giant"
		RS_Count_Runecrafting_Durability_PouchGiant.SetValue((RS_Count_Runecrafting_Durability_PouchGiant.GetValue() - 1))
	else
		debug.messagebox("Runecrafting error 004 - Unable to discern pouchSize - in function DamagePouch()")
	endif
EndFunction

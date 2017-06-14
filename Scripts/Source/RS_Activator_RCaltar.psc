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

Message Property RS_Message_General_MakeCount Auto

Sound Property RS_Sound_Runecrafting_DramenEnchant Auto

Weapon Property RS_Weapon_Staff_Dramen0 Auto
Weapon Property RS_Weapon_Staff_Dramen1 Auto
Weapon Property RS_Weapon_Staff_Dramen2 Auto
Weapon Property RS_Weapon_Staff_Dramen3 Auto
Weapon Property RS_Weapon_Staff_Lunar Auto


Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	If akAggressor == Game.GetPlayer()
		Actor player = akAggressor as Actor
		if runeType == "air"
			weapon akSourceWeapon = akSource as weapon
			if akSourceWeapon == RS_Weapon_Staff_Dramen0
				RS_Sound_Runecrafting_DramenEnchant.Play(self)
				player.UnequipItem(RS_Weapon_Staff_Dramen0, false, true)
				player.RemoveItem(RS_Weapon_Staff_Dramen0, 1)
				player.AddItem(RS_Weapon_Staff_Dramen1, 1)
				player.EquipItem(RS_Weapon_Staff_Dramen1)
			else
				debug.notification("Nothing interesting happens.")
			endif
		elseif runeType == "water"
			weapon akSourceWeapon = akSource as weapon
			if akSourceWeapon == RS_Weapon_Staff_Dramen1
				RS_Sound_Runecrafting_DramenEnchant.Play(self)
				player.UnequipItem(RS_Weapon_Staff_Dramen1, false, true)
				player.RemoveItem(RS_Weapon_Staff_Dramen1, 1)
				player.AddItem(RS_Weapon_Staff_Dramen2, 1)
				player.EquipItem(RS_Weapon_Staff_Dramen2)
			else
				debug.notification("Nothing interesting happens.")
			endif
		elseif runeType == "earth"
			weapon akSourceWeapon = akSource as weapon
			if akSourceWeapon == RS_Weapon_Staff_Dramen2
				RS_Sound_Runecrafting_DramenEnchant.Play(self)
				player.UnequipItem(RS_Weapon_Staff_Dramen2, false, true)
				player.RemoveItem(RS_Weapon_Staff_Dramen2, 1)
				player.AddItem(RS_Weapon_Staff_Dramen3, 1)
				player.EquipItem(RS_Weapon_Staff_Dramen3)
			else
				debug.notification("Nothing interesting happens.")
			endif
		elseif runeType == "fire"
			weapon akSourceWeapon = akSource as weapon
			if akSourceWeapon == RS_Weapon_Staff_Dramen3
				RS_Sound_Runecrafting_DramenEnchant.Play(self)
				player.UnequipItem(RS_Weapon_Staff_Dramen3, false, true)
				player.RemoveItem(RS_Weapon_Staff_Dramen3, 1)
				player.AddItem(RS_Weapon_Staff_Lunar, 1)
				player.EquipItem(RS_Weapon_Staff_Lunar)
			else
				debug.notification("Nothing interesting happens.")
			endif
		else
			debug.messagebox("Runecrafting Error 001 - Could not discern runeType")
		endif
	Endif
EndEvent

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
						
						int pouchPureCount = rsFrameworkMenu.GetPouchPureCount(small, medium, large, giant)
						int pouchEssCount = rsFrameworkMenu.GetPouchEssCount(small, medium, large, giant)
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
					int count = rsFrameworkMenu.rsMakeCount(RS_Message_General_MakeCount)
					rsFrameworkMenu.rsCraftRCTiara(runeType, count, self)
					mainLoop = false
				elseif craftType == 2;staff
					int count = rsFrameworkMenu.rsMakeCount(RS_Message_General_MakeCount)
					rsFrameworkMenu.rsCraftTalismanStaff(runeType, count, self)
					mainLoop = false
				else
					;exit
					mainLoop = false
				endif
			endwhile;
		endif
	endif
EndEvent

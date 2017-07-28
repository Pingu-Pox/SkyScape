ScriptName RS_Activator_MineralCluster Extends ObjectReference
{Mineral script using new rsAPI}

Activator Property RS_Rock_Depleted Auto

Armor Property RS_Item_Armor_Ring_Wealth00 Auto
Armor Property RS_Item_Armor_Ring_Wealth01 Auto
Armor Property RS_Item_Armor_Ring_Wealth02 Auto
Armor Property RS_Item_Armor_Ring_Wealth03 Auto
Armor Property RS_Item_Armor_Ring_Wealth04 Auto
Armor Property RS_Item_Armor_Amulet_Glory01 Auto
Armor Property RS_Item_Armor_Amulet_Glory02 Auto
Armor Property RS_Item_Armor_Amulet_Glory03 Auto
Armor Property RS_Item_Armor_Amulet_Glory04 Auto

Armor Property RS_Item_Armor_Head_GoldenMining Auto
Armor Property RS_Item_Armor_Chest_GoldenMining Auto
Armor Property RS_Item_Armor_Legs_GoldenMining Auto
Armor Property RS_Item_Armor_Feet_GoldenMining Auto
Armor Property RS_Item_Armor_Hands_GoldenMining Auto

GlobalVariable Property RS_GV_MiningXP Auto
GlobalVariable Property RS_GV_MiningLVL Auto
GlobalVariable Property RS_GV_Skill_Mcounter Auto

MiscObject Property oreType Auto
MiscObject Property oreType2 Auto

MiscObject Property RS_Item_Gem_UncutSapphire Auto
MiscObject Property RS_Item_Gem_UncutEmerald Auto
MiscObject Property RS_Item_Gem_UncutRuby Auto
MiscObject Property RS_Item_Gem_UncutDiamond Auto

Sound Property RS_SM_PickaxeStrike Auto
Sound Property RS_SM_HarvestOre Auto

FormList Property RS_FormList_Pickaxes Auto

Weapon Property RS_Item_Weapon_Pickaxe_SacredClay Auto
Weapon Property RS_Item_Weapon_Pickaxe_VolatileClay Auto

int Property reqLVL Auto
int Property minTimeRespawn Auto
int Property maxTimeRespawn Auto
float Property gainedXP Auto

String Property rockString Auto

;On Player Activation
Event OnActivate(ObjectReference akActionRef)
	Debug.Notification("Prospecting ore...")
	Game.DisablePlayerControls(True, True, True, false, True, True, True, false, 0)
	Utility.Wait(3)
	Game.EnablePlayerControls()
	Debug.Notification("This rock contains " + rockString + ".")
EndEvent

;On object attacked, only runs through if pickaxe is used
Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	If akAggressor == Game.GetPlayer() && RS_FormList_Pickaxes.HasForm(akSource)
		RS_SM_PickaxeStrike.Play(self)
		if ((rsFrameworkMenu.GetMiningLVL()).GetValue()) < reqLVL
			Debug.Notification("You lack the required mining level of '" + reqLVL + "'")
		else
			int respawnInterval = Utility.RandomInt(minTimeRespawn,maxTimeRespawn)
			weapon akSourceWeapon = akSource as weapon
			Float finalGainedXP = CheckForXPBonuses(gainedXP)
			int addCount = 1
			if ((rsFrameworkMenu.GetMiningLVL()).GetValue()) < 30
				rsFrameworkMenu.HarvestItemCluster(RS_GV_Skill_Mcounter, self, RS_Rock_Depleted, 1, oreType, akSourceWeapon, RS_SM_HarvestOre, none,  self, respawnInterval, addCount, true, "mining", finalGainedXP, self)
			else
				rsFrameworkMenu.HarvestItemCluster(RS_GV_Skill_Mcounter, self, RS_Rock_Depleted, 1, oreType2, akSourceWeapon, RS_SM_HarvestOre, none,  self, respawnInterval, addCount, true, "mining", finalGainedXP, self)
			endif
		endif
	Endif
EndEvent

;Checks what the player is wearing, applies bonuses
Float Function CheckForXPBonuses(Float oreXP)
	Float XPBonus = 0
	Float ModMiningXP = 0
	
	If (Game.GetPlayer().IsEquipped(RS_Item_Armor_Head_GoldenMining) || Game.GetPlayer().IsEquipped(RS_Item_Armor_Chest_GoldenMining) || \
	Game.GetPlayer().IsEquipped(RS_Item_Armor_Legs_GoldenMining) || Game.GetPlayer().IsEquipped(RS_Item_Armor_Feet_GoldenMining))
		If (Game.GetPlayer().IsEquipped(RS_Item_Armor_Head_GoldenMining))
			XPBonus = (XPBonus + 1.0)
		EndIf
		If (Game.GetPlayer().IsEquipped(RS_Item_Armor_Chest_GoldenMining))
			XPBonus = (XPBonus + 1.0)
		EndIf
		If (Game.GetPlayer().IsEquipped(RS_Item_Armor_Legs_GoldenMining))
			XPBonus = (XPBonus + 1.0)
		EndIf
		If (Game.GetPlayer().IsEquipped(RS_Item_Armor_Feet_GoldenMining))
			XPBonus = (XPBonus + 1.0)
		EndIf
		If (Game.GetPlayer().IsEquipped(RS_Item_Armor_Hands_GoldenMining))
			XPBonus = (XPBonus + 1.0)
		EndIf
		If (XPBonus == 5.0)
			XPBonus = (XPBonus + 1.0)
		EndIf
		If (Game.GetPlayer().IsEquipped(RS_Item_Weapon_Pickaxe_SacredClay))
			ModMiningXP = ((oreXP*XPBonus)*2)
		ElseIf (Game.GetPlayer().IsEquipped(RS_Item_Weapon_Pickaxe_VolatileClay))
			ModMiningXP = ((oreXP*XPBonus)*2.2)
		Else
			ModMiningXP = (oreXP*XPBonus)
		EndIf
		
	ElseIf (Game.GetPlayer().IsEquipped(RS_Item_Weapon_Pickaxe_SacredClay))
		ModMiningXP = (oreXP)*2
	ElseIf (Game.GetPlayer().IsEquipped(RS_Item_Weapon_Pickaxe_VolatileClay))
		ModMiningXP = ((oreXP)*2.2)
	Else
		ModMiningXP = (oreXP)
	EndIf
	return ModMiningXP
EndFunction

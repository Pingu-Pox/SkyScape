ScriptName RS_Tree_NonRegular Extends ObjectReference
{Tree script using new rsAPI}

Armor Property RS_Item_Armor_Amulet_LuckyRabbitFoot Auto
Armor Property RS_Item_Armor_Head_Lumberjack Auto
Armor Property RS_Item_Armor_Chest_Lumberjack Auto
Armor Property RS_Item_Armor_Legs_Lumberjack Auto
Armor Property RS_Item_Armor_Feet_Lumberjack Auto

FormList Property RS_FormList_Hatchets Auto

GlobalVariable Property RS_GV_Skill_WCcounter Auto

MiscObject Property logProperty Auto

Sound Property NPCHumanWoodChop Auto
Sound Property RS_SM_TreeChop Auto
Sound Property RS_SM_TreeTimber Auto
Activator Property RS_Activator_TreeStump Auto

Weapon Property RS_Item_Weapon_Hatchet_SacredClay Auto
Weapon Property RS_Item_Weapon_Hatchet_VolatileClay Auto

int Property reqLVL Auto
int Property minTimeRespawn Auto
int Property maxTimeRespawn Auto
float Property gainedXP Auto

;On Player Activation
Event OnActivate(ObjectReference akActionRef)
	Debug.Notification("To chop down a tree, hit it with a hatchet.")
EndEvent

;On object attacked, only runs through if woodcutting axe is used
Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	If akAggressor == Game.GetPlayer() && RS_FormList_Hatchets.HasForm(akSource)
		RS_SM_TreeChop.Play(self)
		if ((rsFrameworkMenu.GetWoodcuttingLVL()).GetValue()) < reqLVL
			Debug.Notification("You lack the required woodcutting level of '" + reqLVL + "'")
		else
			int respawnInterval = Utility.RandomInt(minTimeRespawn,maxTimeRespawn)
			weapon akSourceWeapon = akSource as weapon
			Float finalGainedXP = CheckForXPBonuses(gainedXP)
			int addCount = 1
			rsFrameworkMenu.HarvestItemCluster(RS_GV_Skill_WCcounter, self, RS_Activator_TreeStump, reqLVL, logProperty, akSourceWeapon, NPCHumanWoodChop, RS_SM_TreeTimber, self, respawnInterval, addCount, true, "woodcutting", finalGainedXP, self)
		endif
	Endif
EndEvent

;Checks what the player is wearing, applies bonuses
Float Function CheckForXPBonuses(Float woodXP)
	Float XPBonus = 0
	Float ModWoodCuttingXP = 0
	
	If (Game.GetPlayer().IsEquipped(RS_Item_Armor_Head_Lumberjack) || Game.GetPlayer().IsEquipped(RS_Item_Armor_Chest_Lumberjack) || \
	Game.GetPlayer().IsEquipped(RS_Item_Armor_Legs_Lumberjack) || Game.GetPlayer().IsEquipped(RS_Item_Armor_Feet_Lumberjack))
		If (Game.GetPlayer().IsEquipped(RS_Item_Armor_Head_Lumberjack))
			XPBonus = (XPBonus + 0.8)
		EndIf
		If (Game.GetPlayer().IsEquipped(RS_Item_Armor_Chest_Lumberjack))
			XPBonus = (XPBonus + 1.6)
		EndIf
		If (Game.GetPlayer().IsEquipped(RS_Item_Armor_Legs_Lumberjack))
			XPBonus = (XPBonus + 1.2)
		EndIf
		If (Game.GetPlayer().IsEquipped(RS_Item_Armor_Feet_Lumberjack))
			XPBonus = (XPBonus + 0.4)
		EndIf
		If (Game.GetPlayer().IsEquipped(RS_Item_Weapon_Hatchet_SacredClay))
			ModWoodCuttingXP = ((woodXP*XPBonus)*2)
		ElseIf (Game.GetPlayer().IsEquipped(RS_Item_Weapon_Hatchet_VolatileClay))
			ModWoodCuttingXP = ((woodXP*XPBonus)*2.2)
		Else
			ModWoodCuttingXP = (woodXP*XPBonus)
		EndIf
		
	ElseIf (Game.GetPlayer().IsEquipped(RS_Item_Weapon_Hatchet_SacredClay))
		ModWoodCuttingXP = (woodXP)*2
	ElseIf (Game.GetPlayer().IsEquipped(RS_Item_Weapon_Hatchet_VolatileClay))
		ModWoodCuttingXP = ((woodXP)*2.2)
	Else
		ModWoodCuttingXP = (woodXP)
	EndIf
	return ModWoodCuttingXP
EndFunction

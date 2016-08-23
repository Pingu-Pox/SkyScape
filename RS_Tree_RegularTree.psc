ScriptName RS_Tree_RegularTree Extends ObjectReference
{Script handling woodcutting skill for trees}

Armor Property RS_Item_Armor_Amulet_LuckyRabbitFoot Auto
Armor Property RS_Item_Armor_Head_Lumberjack Auto
Armor Property RS_Item_Armor_Chest_Lumberjack Auto
Armor Property RS_Item_Armor_Legs_Lumberjack Auto
Armor Property RS_Item_Armor_Feet_Lumberjack Auto
Armor Property RS_Item_Armor_Reward_SeersHeadband01 Auto
Armor Property RS_Item_Armor_Reward_SeersHeadband02 Auto
Armor Property RS_Item_Armor_Reward_SeersHeadband03 Auto

GlobalVariable Property RS_GV_WoodCuttingXP Auto
GlobalVariable Property RS_GV_WoodCuttingLVL Auto
GlobalVariable Property RS_GV_Skill_WCcounter Auto

LeveledItem Property RS_lil_BirdsNestMASTER Auto

MiscObject Property RS_Item_Logs_Logs Auto

Sound Property LevelUpSound Auto
Sound Property TreeChopSound Auto
Sound Property TreeTimberSound Auto

Static Property Stump Auto

Weapon Property RS_Item_Weapon_Hatchet_Bronze Auto
Weapon Property RS_Item_Weapon_Hatchet_Iron Auto
Weapon Property RS_Item_Weapon_Hatchet_Steel Auto
Weapon Property RS_Item_Weapon_Hatchet_Black Auto
Weapon Property RS_Item_Weapon_Hatchet_Mithril Auto
Weapon Property RS_Item_Weapon_Hatchet_Adamant Auto
Weapon Property RS_Item_Weapon_Hatchet_Rune Auto
Weapon Property RS_Item_Weapon_Hatchet_Dragon Auto
Weapon Property RS_Item_Weapon_Hatchet_SacredClay Auto
Weapon Property RS_Item_Weapon_Hatchet_VolatileClay Auto
Weapon Property RS_Item_Weapon_Special_InfernoAdze Auto

Int SkyrimMod = 1

;=================
;Exclusive
Int reqLVL = 1
Float woodXP = 25.0
;=================

Int wcProb
Float Mod
Float BronzeMod = 0.0
Float IronMod = 0.5
Float SteelMod = 1.0
Float BlackMod = 1.5
Float MithrilMod = 2.0
Float AdamantMod = 3.0
Float RuneMod = 4.0
Float DragonMod = 5.0
Float InfernoMod = 5.0

;On Player Activation
Event OnActivate(ObjectReference akActionRef)
	Debug.Notification("To chop down a tree, hit it with a hatchet.")
EndEvent

;On object attacked, only runs through if woodcutting axe is used
Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, \
  bool abBashAttack, bool abHitBlocked)
	If akAggressor == Game.GetPlayer()	
		If (akSource == RS_Item_Weapon_Hatchet_Bronze || akSource == RS_Item_Weapon_Hatchet_Iron || akSource == RS_Item_Weapon_Hatchet_Steel || \
		akSource == RS_Item_Weapon_Hatchet_Black || akSource == RS_Item_Weapon_Hatchet_Mithril || akSource == RS_Item_Weapon_Hatchet_Adamant || \
		akSource == RS_Item_Weapon_Hatchet_Rune || akSource == RS_Item_Weapon_Hatchet_Dragon || akSource == RS_Item_Weapon_Special_InfernoAdze) && akProjectile == None; if attacked with an axe...
			TreeChopSound.Play(Self)
			Float wcLVL = RS_GV_WoodCuttingLVL.GetValue()
			
			;Do we meet the required level?
			If wcLVL < reqLVL;no
				Debug.Notification("You lack the required woodcutting level of '" + reqLVL + "'")
			Else;yes
				If akSource == RS_Item_Weapon_Hatchet_Bronze
					Mod = BronzeMod
				ElseIf akSource == RS_Item_Weapon_Hatchet_Iron
					Mod = IronMod		
				ElseIf akSource == RS_Item_Weapon_Hatchet_Steel
					Mod = SteelMod
				ElseIf akSource == RS_Item_Weapon_Hatchet_Black
					Mod = BlackMod
				ElseIf akSource == RS_Item_Weapon_Hatchet_Mithril
					Mod = MithrilMod
				ElseIf akSource == RS_Item_Weapon_Hatchet_Adamant
					Mod = AdamantMod
				ElseIf akSource == RS_Item_Weapon_Hatchet_Rune || RS_Item_Weapon_Hatchet_SacredClay || RS_Item_Weapon_Hatchet_VolatileClay
					Mod = RuneMod
				ElseIf akSource == RS_Item_Weapon_Hatchet_Dragon
					Mod = DragonMod
				ElseIf akSource == RS_Item_Weapon_Special_InfernoAdze
					Mod = InfernoMod
				Else
					Debug.MessageBox("Woodcutting error 00001")
				EndIf
				
				;random events
				rollForRandomEvent()
				rollForTreeSpirit()
				rollForBirdsNest()
				
				
				;The meat and potatoes... the probability formula
				If (RS_GV_Skill_WCcounter.GetValue()) <= 0
					Float mathDelay = ((20-(wcLVL/10)) - Mod + reqLVL)
					Int intMathDelay = mathDelay as Int
					wcProb = Utility.RandomInt(0,(intMathDelay * SkyrimMod))
					RS_GV_Skill_WCcounter.SetValue(wcProb)
				Else
					wcProb = RS_GV_Skill_WCcounter.GetValue() as Int
					wcProb = (wcProb - 1)
					If (wcProb > 0)
						RS_GV_Skill_WCcounter.SetValue(wcProb)
					ElseIf (wcProb == 0)
						RS_GV_Skill_WCcounter.SetValue(0)
						ObjectReference TreeStump = Self.PlaceAtMe(Stump, 1, False, True)
						TreeTimberSound.Play(Self)
						Self.Disable()
						TreeStump.Enable()
						WoodGain()
						WoodCuttingXPGain()
						Float RespawnTime = Utility.RandomInt(30,60)
						Utility.Wait(RespawnTime)
						TreeStump.Delete()
						Self.Enable()
					Else
						Debug.MessageBox("Woodcutting error 00002")
					EndIf
				EndIf
			EndIf
		Else
			Debug.Notification("To chop down a tree, hit it with a hatchet.")
		EndIf
	EndIf
EndEvent

Function rollForRandomEvent()
	If Utility.RandomInt(1,282) == 1
		Debug.MessageBox("This would have been a random event... lucky for you there are none yet!")
	EndIf
EndFunction

Function rollForBirdsNest()
	If Game.GetPlayer().IsEquipped(RS_Item_Armor_Amulet_LuckyRabbitFoot)
		If Utility.RandomInt(1,188) == 1
			Game.GetPlayer().AddItem(RS_lil_BirdsNestMASTER, 1);Make sure to handle the lower level probabilities inside of a master LIL
		EndIf
	Else
		If Utility.RandomInt(1,282) == 1
			Game.GetPlayer().AddItem(RS_lil_BirdsNestMASTER, 1);Make sure to handle the lower level probabilities inside of a master LIL
		EndIf
	EndIf
EndFunction

Function rollForTreeSpirit()
	If Utility.RandomInt(1,282) == 1
		Int clvl = Game.GetPlayer().GetLevel()
		If clvl == 1 && clvl <= 10
			Self.PlaceActorAtMe(RS_Monster_TreeSpirit014).StartCombat(Game.GetPlayer())
		ElseIf clvl == 11 && clvl <= 20
			Self.PlaceActorAtMe(RS_Monster_TreeSpirit029).StartCombat(Game.GetPlayer())
		ElseIf clvl == 21 && clvl <= 40
			Self.PlaceActorAtMe(RS_Monster_TreeSpirit049).StartCombat(Game.GetPlayer())
		ElseIf clvl == 41 && clvl <= 60
			Self.PlaceActorAtMe(RS_Monster_TreeSpirit079).StartCombat(Game.GetPlayer())
		ElseIf clvl == 61 && clvl <= 90
			Self.PlaceActorAtMe(RS_Monster_TreeSpirit120).StartCombat(Game.GetPlayer())
		ElseIf clvl >= 91
			Self.PlaceActorAtMe(RS_Monster_TreeSpirit159).StartCombat(Game.GetPlayer())
		EndIf
	EndIf
EndFunction

Function WoodGain()
	If (Game.GetPlayer().IsEquipped(RS_Item_Armor_Reward_SeersHeadband01) \
		|| Game.GetPlayer().IsEquipped(RS_Item_Armor_Reward_SeersHeadband02) \
		|| Game.GetPlayer().IsEquipped(RS_Item_Armor_Reward_SeersHeadband03))
		Game.GetPlayer().AddItem(RS_Item_Logs_Logs, 2)			
	Else 
		Game.GetPlayer().AddItem(RS_Item_Logs_Logs, 1)
	EndIf
EndFunction

Function WoodCuttingXPGain()
	Float XPBonus = 0
	Float ModWoodCuttingXP = 0
	Float WoodCuttingXP = RS_GV_WoodCuttingXP.GetValue()
	
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
			ModWoodCuttingXP = ((WoodCuttingXP) + ((woodXP*XPBonus)*2))
		ElseIf (Game.GetPlayer().IsEquipped(RS_Item_Weapon_Hatchet_VolatileClay))
			ModWoodCuttingXP = ((WoodCuttingXP) + ((woodXP*XPBonus)*2.2))
		Else
			ModWoodCuttingXP = ((WoodCuttingXP) + (woodXP*XPBonus))
		EndIf
		
	ElseIf (Game.GetPlayer().IsEquipped(RS_Item_Weapon_Hatchet_SacredClay))
		ModWoodCuttingXP = ((WoodCuttingXP) + (woodXP)*2)
	ElseIf (Game.GetPlayer().IsEquipped(RS_Item_Weapon_Hatchet_VolatileClay))
		ModWoodCuttingXP = ((WoodCuttingXP) + (woodXP)*2.2)
	Else
		ModWoodCuttingXP = ((WoodCuttingXP) + (woodXP))
	EndIf
	RS_GV_WoodCuttingXP.SetValue(ModWoodCuttingXP)
	CheckForLevelUp()
EndFunction

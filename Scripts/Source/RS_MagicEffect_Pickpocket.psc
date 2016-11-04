;< Information
;WIP
;
;Resources:
;http://runescape.wikia.com/wiki/Thieving
;https://www.reddit.com/r/2007scape/comments/301w6d/the_laws_of_gielnor_jagex_formula_transparency/
;maybe take the probability of woodcutting (a number between 0-100) and minus 100, then get the absolute value.... 62=62%               [62-100] = 38%
;
;Knights (Req. 55) 59-60 (Analysis of data in above paragrph;
;                                       not an identical run.)
;Actual: 150/198 = 75.76%
;Avg Time per Success: 1.91 sec
;XP: 84.3 (159k/hr)
;Loot: 50 gp (94k/hr)
;
;Master Farmers (Req. 38) 61
;Actual: 108/138 = 78.26%
;Avg Time per Success: 1.77 sec
;XP: 43 (87k/hr)
;Loot: 95.7 gp (195k/hr)
;      I ignored all low-value seeds, valuing only seeds exceeding 1k each.
;      I got: 1 Rannar, 1 Snap, 2 Toadflax, 1 Watermelon - 10.3k total
;
;Warriors (Req. 25) 61
;Actual: 137/167 = 82.04% (This number may be inflated, I was interrupted
;                          by a rather rude newbie who intentionally killed my
;                          targets. I noticed a much higher success rate against
;                          warriors under attack.)
;Avg Time per Success: 1.57 sec
;XP: 26 (60k/hr)
;Loot: 18 gp (41k/hr)
;
;Farmers (Req. 10) 61
;Actual: 131/161 = 81.37%
;Avg Time per Success: 1.61 sec
;XP: 14.5(32k/hr)
;Loot: 9 gp(20k/hr)
;
;Man (Req 1) 61
;Actual: 176/191 = 92.15%
;Avg Time per Success: 1.02 sec
;XP: 8 (28k/hr)
;Loot: 3 gp (11k/hr)
;	
;	
;	Levels for stealing multiples of normal loot all follow these formulae ([level] stands for the base level required to steal from the NPC):
;
;Double Loot = [level]+10 thieving and [level] agility
;
;Triple Loot = [level]+20 thieving and [level]+10 agility
;
;Quadruple Loot = [level]+30 thieving and [level]+20 agility 
;	
;	A counter that starts when stealing from a stall, that counts down from 5 minutes after the last successful thieving (Steal cake, timer starts, steal cake again, timer resets)
;	
;	Possible prob:
;	(1% for every thieving level above the required lvl)
;
;	Reminder to make Strange Rock DnD in framework, this can be toggled off. Finding the 2nd rock in a set is 50% less likely after obtaining the first
;	xp gained = level^2 - (2 * level) + 100
;>
Scriptname rsFrameworkTest Extends ActiveMagicEffect
{Script for testing... things}
;< Properties
Formlist Property RS_PickpocketList_MenWomenQuest Auto
Formlist Property RS_PickpocketList_Farmer Auto
Formlist Property RS_PickpocketList_HamFemale Auto
Formlist Property RS_PickpocketList_HamMale Auto
Formlist Property RS_PickpocketList_HamGuard Auto
Formlist Property RS_PickpocketList_AlKharidWarriorWomen Auto
Formlist Property RS_PickpocketList_Rogue Auto
Formlist Property RS_PickpocketList_CaveGoblin Auto
Formlist Property RS_PickpocketList_MasterFarmer Auto
Formlist Property RS_PickpocketList_Guard Auto
Formlist Property RS_PickpocketList_FremennikCitizen Auto
Formlist Property RS_PickpocketList_BeardedPollnivianBandit Auto
Formlist Property RS_PickpocketList_DesertBandit Auto
Formlist Property RS_PickpocketList_KnightOfArdougne Auto
Formlist Property RS_PickpocketList_PollnivianBandit Auto
Formlist Property RS_PickpocketList_YanilleWatchman Auto
Formlist Property RS_PickpocketList_MenaphiteThug Auto
Formlist Property RS_PickpocketList_Paladin Auto
Formlist Property RS_PickpocketList_MonkeyKnifeFighter Auto
Formlist Property RS_PickpocketList_Gnome Auto
Formlist Property RS_PickpocketList_Hero Auto
Formlist Property RS_PickpocketList_Elf Auto
Formlist Property RS_PickpocketList_DwarfTrader Auto
Formlist Property RS_PickpocketList_IorwerthWorker Auto
Formlist Property RS_PickpocketList_IthellWorker Auto
Formlist Property RS_PickpocketList_CadarnWorker Auto
Formlist Property RS_PickpocketList_AmloddWorker Auto
Formlist Property RS_PickpocketList_TrahaearnWorker Auto
Formlist Property RS_PickpocketList_HefinWorker Auto
Formlist Property RS_PickpocketList_CrwysWorker Auto
Formlist Property RS_PickpocketList_MeilyrWorker Auto

LeveledItem Property RS_PickpocketLoot_MenWomenQuest Auto
LeveledItem Property RS_PickpocketLoot_Farmer Auto
LeveledItem Property RS_PickpocketLoot_HamFemale Auto
LeveledItem Property RS_PickpocketLoot_HamMale Auto
LeveledItem Property RS_PickpocketLoot_HamGuard Auto
LeveledItem Property RS_PickpocketLoot_AlKharidWarriorWomen Auto
LeveledItem Property RS_PickpocketLoot_Rogue Auto
LeveledItem Property RS_PickpocketLoot_CaveGoblin Auto
LeveledItem Property RS_PickpocketLoot_MasterFarmer Auto
LeveledItem Property RS_PickpocketLoot_Guard Auto
LeveledItem Property RS_PickpocketLoot_FremennikCitizen Auto
LeveledItem Property RS_PickpocketLoot_BeardedPollnivianBandit Auto
LeveledItem Property RS_PickpocketLoot_DesertBandit Auto
LeveledItem Property RS_PickpocketLoot_KnightOfArdougne Auto
LeveledItem Property RS_PickpocketLoot_PollnivianBandit Auto
LeveledItem Property RS_PickpocketLoot_YanilleWatchman Auto
LeveledItem Property RS_PickpocketLoot_MenaphiteThug Auto
LeveledItem Property RS_PickpocketLoot_Paladin Auto
LeveledItem Property RS_PickpocketLoot_MonkeyKnifeFighter Auto
LeveledItem Property RS_PickpocketLoot_Gnome Auto
LeveledItem Property RS_PickpocketLoot_Hero Auto
LeveledItem Property RS_PickpocketLoot_Elf Auto
LeveledItem Property RS_PickpocketLoot_DwarfTrader Auto
LeveledItem Property RS_PickpocketLoot_IorwerthWorker Auto
LeveledItem Property RS_PickpocketLoot_IthellWorker Auto
LeveledItem Property RS_PickpocketLoot_CadarnWorker Auto
LeveledItem Property RS_PickpocketLoot_AmloddWorker Auto
LeveledItem Property RS_PickpocketLoot_TrahaearnWorker Auto
LeveledItem Property RS_PickpocketLoot_HefinWorker Auto
LeveledItem Property RS_PickpocketLoot_CrwysWorker Auto
LeveledItem Property RS_PickpocketLoot_MeilyrWorker Auto

Spell Property RS_Script_ParalyzePlayer Auto
;>
Event OnEffectStart(Actor akTarget, Actor akCaster)
	Debug.Trace("TRACE -- OnEffectStart...")
	If akCaster != Game.GetPlayer()
		;Do nothing
	Else
		FindTarget(akTarget)
	EndIf
	Debug.Trace("TRACE -- ... OnEffectStart Ended")
EndEvent

Function FindTarget(Actor akTarget)
	Form akTargetForm = akTarget.GetActorBase() as Form
	Debug.Trace("TRACE -- Tried to pickpocket a " + akTargetForm.GetName() +"...")
	if RS_PickpocketList_MenWomenQuest.HasForm(akTargetForm)
		int reqLVLt = 1
		float xp = 8.0
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))));Damage the player for 3% of their current HP
				
			else
				bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_MenWomenQuest, 1)
				;grant xp and check for level up
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_Farmer.HasForm(akTargetForm)
		int reqLVLt = 10
		float xp = 14.5
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))));Damage the player for 3% of their current HP
				
			else
				bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_Farmer, 1)
				;grant xp and check for level up
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_HamFemale.HasForm(akTargetForm)
		int reqLVLt = 15
		float xp = 18.5
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))));Damage the player for 3% of their current HP
				
			else
				bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_HamFemale, 1)
				;grant xp and check for level up
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_HamMale.HasForm(akTargetForm)
		int reqLVLt = 20
		float xp = 22.5
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))));Damage the player for 3% of their current HP
				
			else
				bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_HamMale, 1)
				;grant xp and check for level up
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_HamGuard.HasForm(akTargetForm)
		int reqLVLt = 20
		float xp = 22.5
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))));Damage the player for 3% of their current HP
				
			else
				bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_HamGuard, 1)
				;grant xp and check for level up
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_AlKharidWarriorWomen.HasForm(akTargetForm)
		int reqLVLt = 25
		float xp = 26.0
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))));Damage the player for 3% of their current HP
				
			else
				bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_AlKharidWarriorWomen, 1)
				;grant xp and check for level up
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_Rogue.HasForm(akTargetForm)
		int reqLVLt = 32
		float xp = 35.5
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))));Damage the player for 3% of their current HP
				
			else
				bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_Rogue, 1)
				;grant xp and check for level up
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_CaveGoblin.HasForm(akTargetForm)
		int reqLVLt = 36
		float xp = 40.0
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))));Damage the player for 3% of their current HP
				
			else
				bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_CaveGoblin, 1)
				;grant xp and check for level up
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_MasterFarmer.HasForm(akTargetForm)
		int reqLVLt = 38
		float xp = 43.0
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))));Damage the player for 3% of their current HP
				
			else
				bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_MasterFarmer, 1)
				;grant xp and check for level up
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_Guard.HasForm(akTargetForm)
		int reqLVLt = 40
		float xp = 46.5
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))));Damage the player for 3% of their current HP
				
			else
				bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_Guard, 1)
				;grant xp and check for level up
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_FremennikCitizen.HasForm(akTargetForm)
		int reqLVLt = 45
		float xp = 65.0
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))));Damage the player for 3% of their current HP
				
			else
				bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_FremennikCitizen, 1)
				;grant xp and check for level up
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_BeardedPollnivianBandit.HasForm(akTargetForm)
		int reqLVLt = 45
		float xp = 46.5
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))));Damage the player for 3% of their current HP
				
			else
				bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_BeardedPollnivianBandit, 1)
				;grant xp and check for level up
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_DesertBandit.HasForm(akTargetForm)
		int reqLVLt = 53
		float xp = 79.5
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))));Damage the player for 3% of their current HP
				
			else
				bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_DesertBandit, 1)
				;grant xp and check for level up
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_KnightOfArdougne.HasForm(akTargetForm)
		int reqLVLt = 55
		float xp = 84.3
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))));Damage the player for 3% of their current HP
				
			else
				bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_KnightOfArdougne, 1)
				;grant xp and check for level up
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_PollnivianBandit.HasForm(akTargetForm)
		int reqLVLt = 55
		float xp = 84.3
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))));Damage the player for 3% of their current HP
				
			else
				bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_PollnivianBandit, 1)
				;grant xp and check for level up
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_YanilleWatchman.HasForm(akTargetForm)
		int reqLVLt = 65
		float xp = 137.5
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))));Damage the player for 3% of their current HP
				
			else
				bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_YanilleWatchman, 1)
				;grant xp and check for level up
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_MenaphiteThug.HasForm(akTargetForm)
		int reqLVLt = 65
		float xp = 137.5
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))));Damage the player for 3% of their current HP
				
			else
				bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_MenaphiteThug, 1)
				;grant xp and check for level up
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_Paladin.HasForm(akTargetForm)
		int reqLVLt = 70
		float xp = 151.75
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))));Damage the player for 3% of their current HP
				
			else
				bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_Paladin, 1)
				;grant xp and check for level up
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_MonkeyKnifeFighter.HasForm(akTargetForm)
		int reqLVLt = 70
		float xp = 150.0; 20 is added to this for knocking out the monkey
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))));Damage the player for 3% of their current HP
				
			else
				bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_MonkeyKnifeFighter, 1)
				;grant xp and check for level up
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_Gnome.HasForm(akTargetForm)
		int reqLVLt = 75
		float xp = 198.5
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))));Damage the player for 3% of their current HP
				
			else
				bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_Gnome, 1)
				;grant xp and check for level up
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_Hero.HasForm(akTargetForm)
		int reqLVLt = 80
		float xp = 273.3
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))));Damage the player for 3% of their current HP
				
			else
				bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_Hero, 1)
				;grant xp and check for level up
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_Elf.HasForm(akTargetForm)
		int reqLVLt = 85
		float xp = 353.3
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))));Damage the player for 3% of their current HP
				
			else
				bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_Elf, 1)
				;grant xp and check for level up
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_DwarfTrader.HasForm(akTargetForm)
		int reqLVLt = 90
		float xp = 556.5
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))));Damage the player for 3% of their current HP
				
			else
				bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_DwarfTrader, 1)
				;grant xp and check for level up
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_IorwerthWorker.HasForm(akTargetForm)
		int reqLVLt = 91
		float xp = 125.0
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))));Damage the player for 3% of their current HP
				
			else
				bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_IorwerthWorker, 1)
				;grant xp and check for level up
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_IthellWorker.HasForm(akTargetForm)
		int reqLVLt = 92
		float xp = 130.0
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))));Damage the player for 3% of their current HP
				
			else
				bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_IthellWorker, 1)
				;grant xp and check for level up
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_CadarnWorker.HasForm(akTargetForm)
		int reqLVLt = 93
		float xp = 135.0
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))));Damage the player for 3% of their current HP
				
			else
				bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_CadarnWorker, 1)
				;grant xp and check for level up
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_AmloddWorker.HasForm(akTargetForm)
		int reqLVLt = 94
		float xp = 140.0
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))));Damage the player for 3% of their current HP
				
			else
				bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_AmloddWorker, 1)
				;grant xp and check for level up
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_TrahaearnWorker.HasForm(akTargetForm)
		int reqLVLt = 95
		float xp = 145.0
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))));Damage the player for 3% of their current HP
				
			else
				bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_TrahaearnWorker, 1)
				;grant xp and check for level up
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_HefinWorker.HasForm(akTargetForm)
		int reqLVLt = 96
		float xp = 150.0
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))));Damage the player for 3% of their current HP
				
			else
				bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_HefinWorker, 1)
				;grant xp and check for level up
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_CrwysWorker.HasForm(akTargetForm)
		int reqLVLt = 97
		float xp = 155.0
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))));Damage the player for 3% of their current HP
				
			else
				bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_CrwysWorker, 1)
				;grant xp and check for level up
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_MeilyrWorker.HasForm(akTargetForm)
		int reqLVLt = 98
		float xp = 170.0
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))));Damage the player for 3% of their current HP
				
			else
				bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_MeilyrWorker, 1)
				;grant xp and check for level up
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	else
		Debug.Trace("TRACE -- You cannot pick this target's pockets.")
	endif
EndFunction

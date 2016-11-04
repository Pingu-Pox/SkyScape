WIP

Resources:
http://runescape.wikia.com/wiki/Thieving
https://www.reddit.com/r/2007scape/comments/301w6d/the_laws_of_gielnor_jagex_formula_transparency/
maybe take the probability of woodcutting (a number between 0-100) and minus 100, then get the absolute value.... 62=62%               [62-100] = 38%
Touch Spell (While crouched?)
Magic Effect Object:
	Special Effect may not be necessary
	Sound Necessary
	Script Necessary

Attach Magic Effect to Touch Spell

Pros and Cons of Touch spell
	Pros:
	100% Control over probability
	Quick repetition
	No menus
	No need to script stuns following pickpocket fail, is handled in script
	
	Cons:
	Non-standard method
	May not be able to script Target's reaction to failure
	
Pros and Cons of Skyrim Skill
	Pros:
	Extra information such as success rate
	
	Cons:
	A menu for each pickpocket attempt
	Blocky
	
	
just some data
Knights (Req. 55) 59-60 (Analysis of data in above paragrph;
                                       not an identical run.)
Actual: 150/198 = 75.76%
Avg Time per Success: 1.91 sec
XP: 84.3 (159k/hr)
Loot: 50 gp (94k/hr)

Master Farmers (Req. 38) 61
Actual: 108/138 = 78.26%
Avg Time per Success: 1.77 sec
XP: 43 (87k/hr)
Loot: 95.7 gp (195k/hr)
      I ignored all low-value seeds, valuing only seeds exceeding 1k each.
      I got: 1 Rannar, 1 Snap, 2 Toadflax, 1 Watermelon - 10.3k total

Warriors (Req. 25) 61
Actual: 137/167 = 82.04% (This number may be inflated, I was interrupted
                          by a rather rude newbie who intentionally killed my
                          targets. I noticed a much higher success rate against
                          warriors under attack.)
Avg Time per Success: 1.57 sec
XP: 26 (60k/hr)
Loot: 18 gp (41k/hr)

Farmers (Req. 10) 61
Actual: 131/161 = 81.37%
Avg Time per Success: 1.61 sec
XP: 14.5(32k/hr)
Loot: 9 gp(20k/hr)

Man (Req 1) 61
Actual: 176/191 = 92.15%
Avg Time per Success: 1.02 sec
XP: 8 (28k/hr)
Loot: 3 gp (11k/hr)
	
	
	Levels for stealing multiples of normal loot all follow these formulae ([level] stands for the base level required to steal from the NPC):

Double Loot = [level]+10 thieving and [level] agility

Triple Loot = [level]+20 thieving and [level]+10 agility

Quadruple Loot = [level]+30 thieving and [level]+20 agility 
	
	A counter that starts when stealing from a stall, that counts down from 5 minutes after the last successful thieving (Steal cake, timer starts, steal cake again, timer resets)
	
	Possible prob:
	(1% for every thieving level above the required lvl)
	
Scriptname rsFrameworkTest Extends ActiveMagicEffect
{Script for testing... things}

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
Formlist Property RS_PickpocketList_MeilyrWorker Auto

LeveledItem Property RS_PickpocketLoot_MenWomenQuest Auto

Spell Property RS_Script_ParalyzePlayer Auto

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
			bool roll = true
			;roll
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))));Damage the player for 3% of their current HP
				
			else
				;roll for loot and multi-loot
				Game.GetPlayer().AddItem(RS_PickpocketLoot_MenWomenQuest, 1)
				;grant xp and check for level up
				
			endif
		endif
	elseif RS_PickpocketList_Farmer.HasForm(akTargetForm)
	
	elseif RS_PickpocketList_HamFemale.HasForm(akTargetForm)
	
	elseif RS_PickpocketList_HamMale.HasForm(akTargetForm)
	
	elseif RS_PickpocketList_HamGuard.HasForm(akTargetForm)
	
	elseif RS_PickpocketList_AlKharidWarriorWomen.HasForm(akTargetForm)
	
	elseif RS_PickpocketList_Rogue.HasForm(akTargetForm)
	
	elseif RS_PickpocketList_CaveGoblin.HasForm(akTargetForm)
	
	elseif RS_PickpocketList_MasterFarmer.HasForm(akTargetForm)
	
	elseif RS_PickpocketList_Guard.HasForm(akTargetForm)
	
	elseif RS_PickpocketList_FremennikCitizen.HasForm(akTargetForm)
	
	elseif RS_PickpocketList_BeardedPollnivianBandit.HasForm(akTargetForm)
	
	elseif RS_PickpocketList_DesertBandit.HasForm(akTargetForm)
	
	elseif RS_PickpocketList_KnightOfArdougne.HasForm(akTargetForm)
	
	elseif RS_PickpocketList_PollnivianBandit.HasForm(akTargetForm)
	
	elseif RS_PickpocketList_YanilleWatchman.HasForm(akTargetForm)
	
	elseif RS_PickpocketList_MenaphiteThug.HasForm(akTargetForm)
	
	elseif RS_PickpocketList_Paladin.HasForm(akTargetForm)
	
	elseif RS_PickpocketList_MonkeyKnifeFighter.HasForm(akTargetForm)
	
	elseif RS_PickpocketList_Gnome.HasForm(akTargetForm)
	
	elseif RS_PickpocketList_Hero.HasForm(akTargetForm)
	
	elseif RS_PickpocketList_Elf.HasForm(akTargetForm)
	
	elseif RS_PickpocketList_DwarfTrader.HasForm(akTargetForm)
	
	elseif RS_PickpocketList_IorwerthWorker.HasForm(akTargetForm)
	
	elseif RS_PickpocketList_IthellWorker.HasForm(akTargetForm)
	
	elseif RS_PickpocketList_CadarnWorker.HasForm(akTargetForm)
	
	elseif RS_PickpocketList_AmloddWorker.HasForm(akTargetForm)
	
	elseif RS_PickpocketList_TrahaearnWorker.HasForm(akTargetForm)
	
	elseif RS_PickpocketList_HefinWorker.HasForm(akTargetForm)
	
	elseif RS_PickpocketList_MeilyrWorker.HasForm(akTargetForm)
	
	else
		Debug.Trace("TRACE -- You cannot pick this target's pockets.")
	endif
EndFunction

Scriptname RS_MagicEffect_Pickpocket Extends ActiveMagicEffect
{Script that handles pickpocketing}
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
	Debug.Trace("TRACE -- Pickpocket Started...")
	If akCaster != Game.GetPlayer()
		;Do nothing
	Else
		FindTarget(akTarget)
	EndIf
	Debug.Trace("TRACE -- ... Pickpocket Ended")
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
			ObjectReference targetRef = akTarget as ObjectReference
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt, targetRef)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))))
				
			else
				int pickpocketCount = rsFrameworkMenu.RollMultiSteal(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_MenWomenQuest, pickpocketCount)
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_Farmer.HasForm(akTargetForm)
		int reqLVLt = 10
		float xp = 14.5
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			ObjectReference targetRef = akTarget as ObjectReference
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt, targetRef)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))))
				
			else
				int pickpocketCount = rsFrameworkMenu.RollMultiSteal(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_Farmer, pickpocketCount)
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_HamFemale.HasForm(akTargetForm)
		int reqLVLt = 15
		float xp = 18.5
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			ObjectReference targetRef = akTarget as ObjectReference
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt, targetRef)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))))
				
			else
				int pickpocketCount = rsFrameworkMenu.RollMultiSteal(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_HamFemale, pickpocketCount)
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_HamMale.HasForm(akTargetForm)
		int reqLVLt = 20
		float xp = 22.5
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			ObjectReference targetRef = akTarget as ObjectReference
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt, targetRef)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))))
				
			else
				int pickpocketCount = rsFrameworkMenu.RollMultiSteal(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_HamMale, pickpocketCount)
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_HamGuard.HasForm(akTargetForm)
		int reqLVLt = 20
		float xp = 22.5
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			ObjectReference targetRef = akTarget as ObjectReference
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt, targetRef)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))))
				
			else
				int pickpocketCount = rsFrameworkMenu.RollMultiSteal(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_HamGuard, pickpocketCount)
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_AlKharidWarriorWomen.HasForm(akTargetForm)
		int reqLVLt = 25
		float xp = 26.0
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			ObjectReference targetRef = akTarget as ObjectReference
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt, targetRef)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))))
				
			else
				int pickpocketCount = rsFrameworkMenu.RollMultiSteal(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_AlKharidWarriorWomen, pickpocketCount)
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_Rogue.HasForm(akTargetForm)
		int reqLVLt = 32
		float xp = 35.5
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			ObjectReference targetRef = akTarget as ObjectReference
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt, targetRef)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))))
				
			else
				int pickpocketCount = rsFrameworkMenu.RollMultiSteal(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_Rogue, pickpocketCount)
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_CaveGoblin.HasForm(akTargetForm)
		int reqLVLt = 36
		float xp = 40.0
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			ObjectReference targetRef = akTarget as ObjectReference
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt, targetRef)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))))
				
			else
				int pickpocketCount = rsFrameworkMenu.RollMultiSteal(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_CaveGoblin, pickpocketCount)
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_MasterFarmer.HasForm(akTargetForm)
		int reqLVLt = 38
		float xp = 43.0
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			ObjectReference targetRef = akTarget as ObjectReference
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt, targetRef)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))))
				
			else
				int pickpocketCount = rsFrameworkMenu.RollMultiSteal(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_MasterFarmer, pickpocketCount)
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_Guard.HasForm(akTargetForm)
		int reqLVLt = 40
		float xp = 46.5
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			ObjectReference targetRef = akTarget as ObjectReference
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt, targetRef)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))))
				
			else
				int pickpocketCount = rsFrameworkMenu.RollMultiSteal(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_Guard, pickpocketCount)
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_FremennikCitizen.HasForm(akTargetForm)
		int reqLVLt = 45
		float xp = 65.0
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			ObjectReference targetRef = akTarget as ObjectReference
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt, targetRef)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))))
				
			else
				int pickpocketCount = rsFrameworkMenu.RollMultiSteal(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_FremennikCitizen, pickpocketCount)
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_BeardedPollnivianBandit.HasForm(akTargetForm)
		int reqLVLt = 45
		float xp = 46.5
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			ObjectReference targetRef = akTarget as ObjectReference
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt, targetRef)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))))
				
			else
				int pickpocketCount = rsFrameworkMenu.RollMultiSteal(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_BeardedPollnivianBandit, pickpocketCount)
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_DesertBandit.HasForm(akTargetForm)
		int reqLVLt = 53
		float xp = 79.5
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			ObjectReference targetRef = akTarget as ObjectReference
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt, targetRef)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))))
				
			else
				int pickpocketCount = rsFrameworkMenu.RollMultiSteal(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_DesertBandit, pickpocketCount)
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_KnightOfArdougne.HasForm(akTargetForm)
		int reqLVLt = 55
		float xp = 84.3
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			ObjectReference targetRef = akTarget as ObjectReference
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt, targetRef)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))))
				
			else
				int pickpocketCount = rsFrameworkMenu.RollMultiSteal(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_KnightOfArdougne, pickpocketCount)
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_PollnivianBandit.HasForm(akTargetForm)
		int reqLVLt = 55
		float xp = 84.3
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			ObjectReference targetRef = akTarget as ObjectReference
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt, targetRef)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))))
				
			else
				int pickpocketCount = rsFrameworkMenu.RollMultiSteal(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_PollnivianBandit, pickpocketCount)
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_YanilleWatchman.HasForm(akTargetForm)
		int reqLVLt = 65
		float xp = 137.5
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			ObjectReference targetRef = akTarget as ObjectReference
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt, targetRef)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))))
				
			else
				int pickpocketCount = rsFrameworkMenu.RollMultiSteal(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_YanilleWatchman, pickpocketCount)
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_MenaphiteThug.HasForm(akTargetForm)
		int reqLVLt = 65
		float xp = 137.5
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			ObjectReference targetRef = akTarget as ObjectReference
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt, targetRef)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))))
				
			else
				int pickpocketCount = rsFrameworkMenu.RollMultiSteal(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_MenaphiteThug, pickpocketCount)
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_Paladin.HasForm(akTargetForm)
		int reqLVLt = 70
		float xp = 151.75
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			ObjectReference targetRef = akTarget as ObjectReference
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt, targetRef)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))))
				
			else
				int pickpocketCount = rsFrameworkMenu.RollMultiSteal(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_Paladin, pickpocketCount)
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_MonkeyKnifeFighter.HasForm(akTargetForm)
		int reqLVLt = 70
		float xp = 150.0; 20 is added to this for knocking out the monkey
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			ObjectReference targetRef = akTarget as ObjectReference
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt, targetRef)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))))
				
			else
				int pickpocketCount = rsFrameworkMenu.RollMultiSteal(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_MonkeyKnifeFighter, pickpocketCount)
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_Gnome.HasForm(akTargetForm)
		int reqLVLt = 75
		float xp = 198.5
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			ObjectReference targetRef = akTarget as ObjectReference
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt, targetRef)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))))
				
			else
				int pickpocketCount = rsFrameworkMenu.RollMultiSteal(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_Gnome, pickpocketCount)
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_Hero.HasForm(akTargetForm)
		int reqLVLt = 80
		float xp = 273.3
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			ObjectReference targetRef = akTarget as ObjectReference
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt, targetRef)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))))
				
			else
				int pickpocketCount = rsFrameworkMenu.RollMultiSteal(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_Hero, pickpocketCount)
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_Elf.HasForm(akTargetForm)
		int reqLVLt = 85
		float xp = 353.3
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			ObjectReference targetRef = akTarget as ObjectReference
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt, targetRef)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))))
				
			else
				int pickpocketCount = rsFrameworkMenu.RollMultiSteal(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_Elf, pickpocketCount)
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_DwarfTrader.HasForm(akTargetForm)
		int reqLVLt = 90
		float xp = 556.5
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			ObjectReference targetRef = akTarget as ObjectReference
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt, targetRef)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))))
				
			else
				int pickpocketCount = rsFrameworkMenu.RollMultiSteal(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_DwarfTrader, pickpocketCount)
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_IorwerthWorker.HasForm(akTargetForm)
		int reqLVLt = 91
		float xp = 125.0
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			ObjectReference targetRef = akTarget as ObjectReference
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt, targetRef)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))))
				
			else
				int pickpocketCount = rsFrameworkMenu.RollMultiSteal(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_IorwerthWorker, pickpocketCount)
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_IthellWorker.HasForm(akTargetForm)
		int reqLVLt = 92
		float xp = 130.0
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			ObjectReference targetRef = akTarget as ObjectReference
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt, targetRef)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))))
				
			else
				int pickpocketCount = rsFrameworkMenu.RollMultiSteal(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_IthellWorker, pickpocketCount)
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_CadarnWorker.HasForm(akTargetForm)
		int reqLVLt = 93
		float xp = 135.0
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			ObjectReference targetRef = akTarget as ObjectReference
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt, targetRef)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))))
				
			else
				int pickpocketCount = rsFrameworkMenu.RollMultiSteal(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_CadarnWorker, pickpocketCount)
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_AmloddWorker.HasForm(akTargetForm)
		int reqLVLt = 94
		float xp = 140.0
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			ObjectReference targetRef = akTarget as ObjectReference
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt, targetRef)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))))
				
			else
				int pickpocketCount = rsFrameworkMenu.RollMultiSteal(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_AmloddWorker, pickpocketCount)
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_TrahaearnWorker.HasForm(akTargetForm)
		int reqLVLt = 95
		float xp = 145.0
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			ObjectReference targetRef = akTarget as ObjectReference
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt, targetRef)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))))
				
			else
				int pickpocketCount = rsFrameworkMenu.RollMultiSteal(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_TrahaearnWorker, pickpocketCount)
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_HefinWorker.HasForm(akTargetForm)
		int reqLVLt = 96
		float xp = 150.0
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			ObjectReference targetRef = akTarget as ObjectReference
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt, targetRef)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))))
				
			else
				int pickpocketCount = rsFrameworkMenu.RollMultiSteal(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_HefinWorker, pickpocketCount)
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_CrwysWorker.HasForm(akTargetForm)
		int reqLVLt = 97
		float xp = 155.0
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			ObjectReference targetRef = akTarget as ObjectReference
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt, targetRef)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))))
				
			else
				int pickpocketCount = rsFrameworkMenu.RollMultiSteal(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_CrwysWorker, pickpocketCount)
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	elseif RS_PickpocketList_MeilyrWorker.HasForm(akTargetForm)
		int reqLVLt = 98
		float xp = 170.0
		if ((rsFrameworkMenu.GetThievingLVL()).GetValue()) < reqLVLt
			Debug.Notification("You lack the required thieving level of '" + reqLVLt + "'")
		else
			ObjectReference targetRef = akTarget as ObjectReference
			bool roll = rsFrameworkMenu.TryToSteal_NPC(reqLVLt, targetRef)
			
			if (roll == false)
				RS_Script_ParalyzePlayer.Cast(Game.GetPlayer(), Game.GetPlayer())
				Game.GetPlayer().DamageActorValue("Health", (0.03 * (Game.GetPlayer().GetActorValue("Health"))))
				
			else
				int pickpocketCount = rsFrameworkMenu.RollMultiSteal(reqLVLt)
				Game.GetPlayer().AddItem(RS_PickpocketLoot_MeilyrWorker, pickpocketCount)
				rsFrameworkMenu.rsXPGain("thieving", xp)
			endif
		endif
	else
		Debug.Trace("TRACE -- You cannot pick this target's pockets.")
	endif
EndFunction

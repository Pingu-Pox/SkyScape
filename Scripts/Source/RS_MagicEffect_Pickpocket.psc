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
	
ScriptName RS_MagicEffect_ThievingSpell Extends ActiveMagicEffect
{Script that handles probability for pickpocketing using touch spell, see if you can squeeze the logic processing into a single second, 3 is the max}

Event OnEffectStart(Actor akCaster, Actor akTarget)
	Debug.Trace("TRACE -- OnEffectStart Event Started...")
	If akCaster == Game.GetPlayer()
		;get information on target, xp, difficulty, etc.
		if (use formlist properties to classify NPCs in groups (i.e. guards = Varrock Guards, Lumby guards, falador guards, etc))
		man/woman (quest NPCs can be put in this group most likely)
		farmer
		female ham
		male ham
		ham guard
		warrior woman/al kharid warrior
		rogue
		cave goblin
		master farmer
		guard
		fremennik citizen
		beared pollnivian bandit
		desert bandit
		knight of ardy
		pollnivian bandit
		yanille watchman
		menaphite thug
		paladin
		monkey knife fighter
		gnome
		hero
		elf
		dwarf trader
		iorwerth worker
		ithell worker
		cadarn worker
		amlodd worker
		trahaearn worker
		hefin worker
		meilyr worker
		else
		endif
		getplayer's information
		;Roll Failure Probability, pass in above formlist to classify
		
		if true
			;succeed
			;roll for loot
			;grant xp and check for level up
		else false
			;fail
			;damage and stun player
			damage = get player's current HP, multiply by 0.03... the player loses 3% of their life each failure
			
		endif
	Else
		;some other actor tried casting this touch spell...
	Endif
	Debug.Trace("TRACE -- ...OnEffectStart Event Ended")
EndEvent

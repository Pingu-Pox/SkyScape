Scriptname RS_Spell_HomeTeleport extends ActiveMagicEffect  
{On spell cast, player is teleported to their "home" portal, wherever the player has set it to}

GlobalVariable Property RS_GV_HomeLocation Auto
GlobalVariable Property RS_Check_TutorialCompleted Auto
GlobalVariable Property RS_Check_HomeTeleDelay Auto
GlobalVariable Property RS_Check_ModStatus Auto
GlobalVariable Property RS_Check_ModStartTime Auto

ObjectReference Property RS_Marker_HomeTeleport_Lumbridge Auto
ObjectReference Property RS_Marker_HomeTeleport_Edgeville Auto
ObjectReference Property RS_Marker_HomeTeleport_LunarIsle Auto

Spell Property RS_Spell_WindStrike Auto
Spell Property RS_sPrayer_RockSkin Auto
Spell Property RS_sPrayer_SteelSkin Auto
Spell Property RS_sPrayer_ThickSkin Auto


Event OnEffectStart(Actor akTarget, Actor akCaster)
	Float prevTime = RS_Check_HomeTeleDelay.GetValue();get previous home teleport cast time
	Float currTime = Game.GetRealHoursPassed(); get current time
	If (RS_Check_ModStatus.GetValue()) == 1
		If (RS_Check_TutorialCompleted.GetValue()) == 0
			RS_Check_TutorialCompleted.SetValue(1)
		EndIf
		If (Game.GetPlayer().HasSpell(RS_sPrayer_ThickSkin)) == false && (Game.GetPlayer().HasSpell(RS_sPrayer_RockSkin)) == false && (Game.GetPlayer().HasSpell(RS_sPrayer_SteelSkin)) == false
			Game.GetPlayer().AddSpell(RS_sPrayer_ThickSkin)
		EndIf
		
		If (Game.GetPlayer().HasSpell(RS_Spell_WindStrike)) == false
			Game.GetPlayer().AddSpell(RS_Spell_WindStrike)
		EndIf
		
		if (RS_Check_ModStartTime.GetValue()) == 0.0
			float skyscapeStart = (Utility.GetCurrentRealTime()); Take current game-seconds, make it game-hours
			RS_Check_ModStartTime.SetValue(skyscapeStart); Stored in seconds 
		endif
		
		If prevTime == 0.0
			RS_Check_HomeTeleDelay.SetValue(currTime)
			Game.GetPlayer().MoveTo(RS_Marker_HomeTeleport_Lumbridge)
		Else
			If currTime - prevTime >= 0.5;if it has been 30 minutes or more...
				If (RS_GV_HomeLocation.GetValue()) == 0; player's home set to lumbridge?
					RS_Check_HomeTeleDelay.SetValue(currTime)
					Game.GetPlayer().MoveTo(RS_Marker_HomeTeleport_Lumbridge)
					Game.RequestAutoSave()
				ElseIf (RS_GV_HomeLocation.GetValue()) == 1; player's home set to edgeville?
					RS_Check_HomeTeleDelay.SetValue(currTime)
					Game.GetPlayer().MoveTo(RS_Marker_HomeTeleport_Edgeville)
					Game.RequestAutoSave()
				ElseIf (RS_GV_HomeLocation.GetValue()) == 2; player's home set to the lunar isles?
					RS_Check_HomeTeleDelay.SetValue(currTime)
					Game.GetPlayer().MoveTo(RS_Marker_HomeTeleport_LunarIsle)
					Game.RequestAutoSave()
				EndIf
			Else;it has not been 30 minutes
				int mathTimeRemain = math.abs((currTime - prevTime * 60) - 30) as int
				Debug.Notification("You need to wait another " + mathTimeRemain + " minute(s) to cast this spell.")
			EndIf
		EndIf
	Else
		Debug.Notification("This spell only works in Gielinor.")
	EndIf
EndEvent

ScriptName rsEquipItem_1Req extends ObjectReference
{Handles equip requirements, also applies stats to player on equip. skillName property in the form of "an attack" or "a herblore" etc}
;Test vigourously
GlobalVariable Property RS_Check_StatLock Auto Hidden
GlobalVariable Property global1 Auto
Int Property req1 Auto

GlobalVariable Property RS_GV_pStat_AttBonus_Stab Auto Hidden
GlobalVariable Property RS_GV_pStat_AttBonus_Slash Auto Hidden
GlobalVariable Property RS_GV_pStat_AttBonus_Crush Auto Hidden
GlobalVariable Property RS_GV_pStat_AttBonus_Magic Auto Hidden
GlobalVariable Property RS_GV_pStat_AttBonus_Range Auto Hidden
GlobalVariable Property RS_GV_pStat_DefBonus_Stab Auto Hidden
GlobalVariable Property RS_GV_pStat_DefBonus_Slash Auto Hidden
GlobalVariable Property RS_GV_pStat_DefBonus_Crush Auto Hidden
GlobalVariable Property RS_GV_pStat_DefBonus_Magic Auto Hidden
GlobalVariable Property RS_GV_pStat_DefBonus_Range Auto Hidden
GlobalVariable Property RS_GV_pStat_Bonus_Strength Auto Hidden
GlobalVariable Property RS_GV_pStat_Bonus_Prayer Auto Hidden

Int Property statStabA Auto
Int Property statSlashA Auto
Int Property statCrushA Auto
Int Property statMagicA Auto
Int Property statRangeA Auto

Int Property statStabD Auto
Int Property statSlashD Auto
Int Property statCrushD Auto
Int Property statMagicD Auto
Int Property statRangeD Auto

Int Property statStrengthO Auto
Int Property statPrayerO Auto

;Weapon Property selfForm Auto
bool bCrashLock = false

Event OnEquipped(actor akActor)
	;debug.trace("Event OnEquipped fired!!")
	if akActor == Game.GetPlayer()
		Weapon leftHand = akActor.GetEquippedWeapon(true) 
		akActor.UnEquipItem(leftHand, true, true)
		if RS_Check_StatLock.GetValue() != 0
			;debug.trace("We were locked out!!")
			debug.notification("try equipping stuff slower -- see if you can get this to show up by equipping/unequipping like crazy")
		else
			if global1.GetValue() < req1 ; just add || and then another arguement to expand it out.
				bCrashLock = true
				;debug.trace("We didn't meet the level requirements!!")
				;Weapon selfForm = self as Weapon
				Weapon rightHand = akActor.GetEquippedWeapon() 
				akActor.UnEquipItem(rightHand, true, true)
				;debug.trace("You lack the required skill level(s) to equip this item.")
			else
				bCrashLock = false
				;debug.trace("We are getting stats applied!!!")
				;Utility.Wait(2.0)
				ApplyStats(true)
			endif
		endif
	endif
EndEvent

Event OnUnEquipped(actor akActor)
	if bCrashLock == true
		;do nothing
	else
		;debug.trace("Event OnUnEquipped fired!!")
		if RS_Check_StatLock.GetValue() != 0
			debug.notification("try equipping stuff slower -- see if you can get this to show up by equipping/unequipping like crazy")
		else
			;Utility.Wait(2.0)
			ApplyStats(false)
		endif
	endif
EndEvent

Function ApplyStats(bool bApply)
	RS_Check_StatLock.SetValue(1)
	;debug.trace("LOCKED!!")
	if bApply == true
		;debug.trace("Added!!")
		RS_GV_pStat_AttBonus_Stab.SetValue((RS_GV_pStat_AttBonus_Stab.GetValue() + statStabA))
		RS_GV_pStat_AttBonus_Slash.SetValue((RS_GV_pStat_AttBonus_Slash.GetValue() + statSlashA))
		RS_GV_pStat_AttBonus_Crush.SetValue((RS_GV_pStat_AttBonus_Crush.GetValue() + statCrushA))
		RS_GV_pStat_AttBonus_Magic.SetValue((RS_GV_pStat_AttBonus_Magic.GetValue() + statMagicA))
		RS_GV_pStat_AttBonus_Range.SetValue((RS_GV_pStat_AttBonus_Range.GetValue() + statRangeA))
		RS_GV_pStat_DefBonus_Stab.SetValue((RS_GV_pStat_DefBonus_Stab.GetValue() + statStabD))
		RS_GV_pStat_DefBonus_Slash.SetValue((RS_GV_pStat_DefBonus_Slash.GetValue() + statSlashD))
		RS_GV_pStat_DefBonus_Crush.SetValue((RS_GV_pStat_DefBonus_Crush.GetValue() + statCrushD))
		RS_GV_pStat_DefBonus_Magic.SetValue((RS_GV_pStat_DefBonus_Magic.GetValue() + statMagicD))
		RS_GV_pStat_DefBonus_Range.SetValue((RS_GV_pStat_DefBonus_Range.GetValue() + statRangeD))
		RS_GV_pStat_Bonus_Strength.SetValue((RS_GV_pStat_Bonus_Strength.GetValue() + statStrengthO))
		RS_GV_pStat_Bonus_Prayer.SetValue((RS_GV_pStat_Bonus_Prayer.GetValue() + statPrayerO))
	else
		;debug.trace("Subtracted!!")
		RS_GV_pStat_AttBonus_Stab.SetValue((RS_GV_pStat_AttBonus_Stab.GetValue() - statStabA))
		RS_GV_pStat_AttBonus_Slash.SetValue((RS_GV_pStat_AttBonus_Slash.GetValue() - statSlashA))
		RS_GV_pStat_AttBonus_Crush.SetValue((RS_GV_pStat_AttBonus_Crush.GetValue() - statCrushA))
		RS_GV_pStat_AttBonus_Magic.SetValue((RS_GV_pStat_AttBonus_Magic.GetValue() - statMagicA))
		RS_GV_pStat_AttBonus_Range.SetValue((RS_GV_pStat_AttBonus_Range.GetValue() - statRangeA))
		RS_GV_pStat_DefBonus_Stab.SetValue((RS_GV_pStat_DefBonus_Stab.GetValue() - statStabD))
		RS_GV_pStat_DefBonus_Slash.SetValue((RS_GV_pStat_DefBonus_Slash.GetValue() - statSlashD))
		RS_GV_pStat_DefBonus_Crush.SetValue((RS_GV_pStat_DefBonus_Crush.GetValue() - statCrushD))
		RS_GV_pStat_DefBonus_Magic.SetValue((RS_GV_pStat_DefBonus_Magic.GetValue() - statMagicD))
		RS_GV_pStat_DefBonus_Range.SetValue((RS_GV_pStat_DefBonus_Range.GetValue() - statRangeD))
		RS_GV_pStat_Bonus_Strength.SetValue((RS_GV_pStat_Bonus_Strength.GetValue() - statStrengthO))
		RS_GV_pStat_Bonus_Prayer.SetValue((RS_GV_pStat_Bonus_Prayer.GetValue() - statPrayerO))
	endif
	RS_Check_StatLock.SetValue(0)
	;debug.trace("UNLOCKED!!")
EndFunction


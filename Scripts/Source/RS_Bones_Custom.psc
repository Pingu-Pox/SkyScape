ScriptName RS_Bones_Custom Extends ObjectReference
{Bone Burial Script}

Float Property xp Auto

Event OnEquipped(Actor akActor)
	Actor player = Game.GetPlayer()
	If (akActor == player)
		RS_SM_BuryBones.Play(player)
		player.RemoveItem(Self,1)
		rsFrameworkMenu.rsXPGain("prayer", xp);add AddPrayerSpell() to framework
		rsFrameworkMenu.RollRandomEvent("prayer", playerlocation);get player location , add a menuexit statement to RollRandomEvent, add prayer random events
	Endif
EndEvent

;optimize the shit out of this... put it in the API
Function AddPrayerSpells()
	int pLVL = RS_GV_PrayerLVL.GetValue() as int
	int escape = 0
	If (RS_GV_PrayerEndCheck.GetValue()) == 1
		escape = 1
	EndIf	
	while(escape == 0)
		If pLVL < 4
			escape = 1
		Else
			If Game.GetPlayer().HasSpell(RS_sPrayer_BurstStrength) == false
				Game.GetPlayer().AddSpell(RS_sPrayer_BurstStrength)
			Else
				If pLVL < 7
					escape = 1
				Else
					If Game.GetPlayer().HasSpell(RS_sPrayer_ClarityThought) == false
						Game.GetPlayer().AddSpell(RS_sPrayer_ClarityThought)
					Else
						If pLVL < 8
							escape = 1
						Else
							If Game.GetPlayer().HasSpell(RS_sPrayer_SharpEye) == false
								Game.GetPlayer().AddSpell(RS_sPrayer_SharpEye)
							Else
								If pLVL < 9
									escape = 1
								Else
									If Game.GetPlayer().HasSpell(RS_sPrayer_MysticWill) == false
										Game.GetPlayer().AddSpell(RS_sPrayer_MysticWill)
									Else
										If pLVL < 10
											escape = 1
										Else
											If Game.GetPlayer().HasSpell(RS_sPrayer_RockSkin) == false
												Game.GetPlayer().AddSpell(RS_sPrayer_RockSkin)
											Else
												If pLVL < 13
													escape = 1
												Else
													If Game.GetPlayer().HasSpell(RS_sPrayer_SuperStrength) == false
														Game.GetPlayer().AddSpell(RS_sPrayer_SuperStrength)
													Else
														If pLVL < 16
															escape = 1
														Else
															If Game.GetPlayer().HasSpell(RS_sPrayer_ImprovedReflexes) == false
																Game.GetPlayer().AddSpell(RS_sPrayer_ImprovedReflexes)
															Else
																If pLVL < 19
																	escape = 1
																Else
																	If Game.GetPlayer().HasSpell(RS_sPrayer_RapidRestore) == false
																		Game.GetPlayer().AddSpell(RS_sPrayer_RapidRestore)
																	Else
																		If pLVL < 22
																			escape = 1
																		Else
																			If Game.GetPlayer().HasSpell(RS_sPrayer_RapidHeal) == false
																				Game.GetPlayer().AddSpell(RS_sPrayer_RapidHeal)
																			Else
																				If pLVL < 25
																					escape = 1
																				Else
																					If Game.GetPlayer().HasSpell(RS_sPrayer_ProtectItems) == false
																						Game.GetPlayer().AddSpell(RS_sPrayer_ProtectItems)
																					Else
																						If pLVL < 26
																							escape = 1
																						Else
																							If Game.GetPlayer().HasSpell(RS_sPrayer_HawkEye) == false
																								Game.GetPlayer().AddSpell(RS_sPrayer_HawkEye)
																							Else
																								If pLVL < 27
																									escape = 1
																								Else
																									If Game.GetPlayer().HasSpell(RS_sPrayer_MysticLore) == false
																										Game.GetPlayer().AddSpell(RS_sPrayer_MysticLore)
																									Else
																										If pLVL < 28
																											escape = 1
																										Else
																											If Game.GetPlayer().HasSpell(RS_sPrayer_SteelSkin) == false
																												Game.GetPlayer().AddSpell(RS_sPrayer_SteelSkin)
																											Else
																												If pLVL < 31
																													;	do nothing
																												Else
																													If Game.GetPlayer().HasSpell(RS_sPrayer_UltimateStrength) == false
																														Game.GetPlayer().AddSpell(RS_sPrayer_UltimateStrength)
																													Else
																														If pLVL < 34
																															escape = 1
																														Else
																															If Game.GetPlayer().HasSpell(RS_sPrayer_IncredibleReflexes) == false
																																Game.GetPlayer().AddSpell(RS_sPrayer_IncredibleReflexes)
																															Else
																																If pLVL < 37
																																	escape = 1
																																Else
																																	If Game.GetPlayer().HasSpell(RS_sPrayer_ProtectMagic) == false
																																		Game.GetPlayer().AddSpell(RS_sPrayer_ProtectMagic)
																																	Else
																																		If pLVL < 40
																																			escape = 1
																																		Else
																																			If Game.GetPlayer().HasSpell(RS_sPrayer_ProtectMissile) == false
																																				Game.GetPlayer().AddSpell(RS_sPrayer_ProtectMissile)
																																			Else
																																				If pLVL < 43
																																					escape = 1
																																				Else
																																					If Game.GetPlayer().HasSpell(RS_sPrayer_ProtectMelee) == false
																																						Game.GetPlayer().AddSpell(RS_sPrayer_ProtectMelee)
																																					Else
																																						If pLVL < 44
																																							escape = 1
																																						Else
																																							If Game.GetPlayer().HasSpell(RS_sPrayer_EagleEye) == false
																																								Game.GetPlayer().AddSpell(RS_sPrayer_EagleEye)
																																							Else
																																								If pLVL < 45
																																									escape = 1
																																								Else
																																									If Game.GetPlayer().HasSpell(RS_sPrayer_MysticMight) == false
																																										Game.GetPlayer().AddSpell(RS_sPrayer_MysticMight)
																																									Else
																																										If pLVL < 46
																																											escape = 1
																																										Else
																																											If Game.GetPlayer().HasSpell(RS_sPrayer_Retribution) == false
																																												Game.GetPlayer().AddSpell(RS_sPrayer_Retribution)
																																											Else
																																												If pLVL < 49
																																													escape = 1
																																												Else
																																													If Game.GetPlayer().HasSpell(RS_sPrayer_Redemption) == false
																																														Game.GetPlayer().AddSpell(RS_sPrayer_Redemption)
																																													Else
																																														If pLVL < 52
																																															escape = 1
																																														Else
																																															If Game.GetPlayer().HasSpell(RS_sPrayer_Smite) == false
																																																Game.GetPlayer().AddSpell(RS_sPrayer_Smite)
																																															Else
																																																If pLVL < 60
																																																	escape = 1
																																																Else
																																																	If Game.GetPlayer().HasSpell(RS_sPrayer_Chivalry) == false
																																																		Game.GetPlayer().AddSpell(RS_sPrayer_Chivalry)
																																																	Else
																																																		If pLVL < 70
																																																		Else
																																																			If Game.GetPlayer().HasSpell(RS_sPrayer_Piety) == false
																																																				Game.GetPlayer().AddSpell(RS_sPrayer_Piety)
																																																			Else
																																																				RS_GV_PrayerEndCheck.SetValue(1)
																																																			EndIf
																																																		EndIf
																																																	EndIf
																																																EndIf
																																															EndIf
																																														EndIf
																																													EndIf
																																												EndIf
																																											EndIf
																																										EndIf
																																									EndIf
																																								EndIf
																																							EndIf
																																						EndIf
																																					EndIf
																																				EndIf
																																			EndIf
																																		EndIf
																																	EndIf
																																EndIf
																															EndIf
																														EndIf
																													EndIf
																												EndIf
																											EndIf
																										EndIf
																									EndIf
																								EndIf
																							EndIf
																						EndIf
																					EndIf
																				EndIf
																			EndIf
																		EndIf
																	EndIf
																EndIf
															EndIf
														EndIf
													EndIf
												EndIf
											EndIf
										EndIf
									EndIf
								EndIf
							EndIf
						EndIf
					EndIf
				EndIf
			EndIf
		EndIf
	EndWhile
EndFunction

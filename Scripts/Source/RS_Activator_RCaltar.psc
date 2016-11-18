ScriptName RS_Activator_RCaltar Extends ObjectReference
{Script to put on the actual runecrafting altar}

Event OnActivate(ObjectReference akActionRef)
	;check if player activated
		;check player's rc level
			;make runes, tiara, or talisman staff?
			;runes
				;check if config setting "auto unpack inventory RC-bag" is enabled
				;yes
					;convert all essence in inventory and bags, zero out bag globals that are in the inventory, all in one
					;give xp
				;no
					;convert all essence in inventory, all in one
					;give xp
			;tiara
				;rsFramework.GetCount - can exit
				;produce item one at a time - can exit
				;give xp
			;staff
				;rsFramework.GetCount - can exit
				;produce item one at a time - can exit
			;exit
EndEvent

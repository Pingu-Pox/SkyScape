ScriptName RS_Activator_CanoeStationTree Extends ObjectReference
{Script for }

;On object attacked, only runs through if woodcutting axe is used
Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	If akAggressor == Game.GetPlayer() && RS_FormList_Hatchets.HasForm(akSource)
		RS_SM_TreeChop.Play(self)
		;get toughness of regular tree, when felled, give no wood.
		;activate tree on stand
		;wait 60 seconds, disable the tree automatically, respawn tree
	else
		;do nothing
	Endif
EndEvent

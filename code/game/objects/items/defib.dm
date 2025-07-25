//backpack item
#define HALFWAYCRITDEATH ((HEALTH_THRESHOLD_CRIT + HEALTH_THRESHOLD_DEAD) * 0.5)

/obj/item/defibrillator
	name = "defibrillator"
	desc = ""
	icon = 'icons/obj/defib.dmi'
	icon_state = "defibunit"
	item_state = "defibunit"
	lefthand_file = 'icons/mob/inhands/equipment/medical_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/medical_righthand.dmi'
	slot_flags = ITEM_SLOT_BACK
	force = 5
	throwforce = 6
	w_class = WEIGHT_CLASS_BULKY
	actions_types = list(/datum/action/item_action/toggle_paddles)
	armor = list("blunt" = 0, "slash" = 0, "stab" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 50)

	var/obj/item/twohanded/shockpaddles/paddle_type = /obj/item/twohanded/shockpaddles
	var/on = FALSE //if the paddles are equipped (1) or on the defib (0)
	var/safety = TRUE //if you can zap people with the defibs on harm mode
	var/powered = FALSE //if there's a cell in the defib with enough power for a revive, blocks paddles from reviving otherwise
	var/obj/item/twohanded/shockpaddles/paddles
	var/obj/item/stock_parts/cell/high/cell
	var/combat = FALSE //if true, revive through hardsuits, allow for combat shocking
	var/grab_ghost = FALSE // Do we pull the ghost back into their body?
	var/cooldown_duration = 5 SECONDS//how long does it take to recharge

/obj/item/defibrillator/get_cell()
	return cell

/obj/item/defibrillator/Initialize() //starts without a cell for rnd
	. = ..()
	paddles = new paddle_type(src)
	update_icon()
	return

/obj/item/defibrillator/loaded/Initialize() //starts with hicap
	. = ..()
	cell = new(src)
	update_icon()
	return

/obj/item/defibrillator/fire_act(added, maxstacks)
	. = ..()
	if(paddles?.loc == src)
		paddles.fire_act(added, maxstacks)

/obj/item/defibrillator/extinguish()
	. = ..()
	if(paddles?.loc == src)
		paddles.extinguish()

/obj/item/defibrillator/update_icon()
	update_power()
	return ..()

/obj/item/defibrillator/proc/update_power()
	if(!QDELETED(cell))
		if(QDELETED(paddles) || cell.charge < paddles.revivecost)
			powered = FALSE
		else
			powered = TRUE
	else
		powered = FALSE

/obj/item/defibrillator/update_overlays()
	. = ..()

	if(!on)
		. += "[initial(icon_state)]-paddles"
	if(powered)
		. += "[initial(icon_state)]-powered"
		if(!QDELETED(cell))
			var/ratio = cell.charge / cell.maxcharge
			ratio = CEILING(ratio*4, 1) * 25
			. += "[initial(icon_state)]-charge[ratio]"
	if(!cell)
		. += "[initial(icon_state)]-nocell"
	if(!safety)
		. += "[initial(icon_state)]-emagged"

/obj/item/defibrillator/CheckParts(list/parts_list)
	..()
	cell = locate(/obj/item/stock_parts/cell) in contents
	update_icon()

/obj/item/defibrillator/ui_action_click()
	toggle_paddles()

//ATTACK HAND IGNORING PARENT RETURN VALUE
/obj/item/defibrillator/attack_hand(mob/user)
	if(loc == user)
		if(slot_flags == ITEM_SLOT_BACK)
			if(user.get_item_by_slot(SLOT_BACK) == src)
				ui_action_click()
			else
				to_chat(user, span_warning("Put the defibrillator on your back first!"))

		else if(slot_flags == ITEM_SLOT_BELT)
			if(user.get_item_by_slot(SLOT_BELT) == src)
				ui_action_click()
			else
				to_chat(user, span_warning("Strap the defibrillator's belt on first!"))
		return
	else if(istype(loc, /obj/machinery/defibrillator_mount))
		ui_action_click() //checks for this are handled in defibrillator.mount.dm
	return ..()

/obj/item/defibrillator/MouseDrop(obj/over_object)
	. = ..()
	if(ismob(loc))
		var/mob/M = loc
		if(!M.incapacitated() && istype(over_object, /atom/movable/screen/inventory/hand))
			var/atom/movable/screen/inventory/hand/H = over_object
			M.putItemFromInventoryInHandIfPossible(src, H.held_index)

/obj/item/defibrillator/attackby(obj/item/W, mob/user, params)
	if(W == paddles)
		paddles.unwield()
		toggle_paddles()
	else if(istype(W, /obj/item/stock_parts/cell))
		var/obj/item/stock_parts/cell/C = W
		if(cell)
			to_chat(user, span_warning("[src] already has a cell!"))
		else
			if(C.maxcharge < paddles.revivecost)
				to_chat(user, span_notice("[src] requires a higher capacity cell."))
				return
			if(!user.transferItemToLoc(W, src))
				return
			cell = W
			to_chat(user, span_notice("I install a cell in [src]."))
			update_icon()

	else if(W.tool_behaviour == TOOL_SCREWDRIVER)
		if(cell)
			cell.update_icon()
			cell.forceMove(get_turf(src))
			cell = null
			to_chat(user, span_notice("I remove the cell from [src]."))
			update_icon()
	else
		return ..()

/obj/item/defibrillator/emag_act(mob/user)
	if(safety)
		safety = FALSE
		to_chat(user, span_warning("I silently disable [src]'s safety protocols with the cryptographic sequencer."))
	else
		safety = TRUE
		to_chat(user, span_notice("I silently enable [src]'s safety protocols with the cryptographic sequencer."))

/obj/item/defibrillator/emp_act(severity)
	. = ..()
	if(cell && !(. & EMP_PROTECT_CONTENTS))
		deductcharge(1000 / severity)
	if (. & EMP_PROTECT_SELF)
		return
	if(safety)
		safety = FALSE
		visible_message(span_notice("[src] beeps: Safety protocols disabled!"))
		playsound(src, 'sound/blank.ogg', 50, FALSE)
	else
		safety = TRUE
		visible_message(span_notice("[src] beeps: Safety protocols enabled!"))
		playsound(src, 'sound/blank.ogg', 50, FALSE)
	update_icon()

/obj/item/defibrillator/proc/toggle_paddles()
	set name = "Toggle Paddles"
	set hidden = 1
	on = !on

	var/mob/living/carbon/user = usr
	if(on)
		//Detach the paddles into the user's hands
		if(!usr.put_in_hands(paddles))
			on = FALSE
			to_chat(user, span_warning("I need a free hand to hold the paddles!"))
			update_icon()
			return
	else
		//Remove from their hands and back onto the defib unit
		paddles.unwield()
		remove_paddles(user)

	update_icon()
	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()


/obj/item/defibrillator/equipped(mob/user, slot)
	..()
	if((slot_flags == ITEM_SLOT_BACK && slot != SLOT_BACK) || (slot_flags == ITEM_SLOT_BELT && slot != SLOT_BELT))
		remove_paddles(user)
		update_icon()

/obj/item/defibrillator/item_action_slot_check(slot, mob/user)
	if(slot == user.getBackSlot())
		return 1

/obj/item/defibrillator/proc/remove_paddles(mob/user) //this fox the bug with the paddles when other player stole you the defib when you have the paddles equiped
	if(ismob(paddles.loc))
		var/mob/M = paddles.loc
		M.dropItemToGround(paddles, TRUE)
	return

/obj/item/defibrillator/Destroy()
	if(on)
		var/M = get(paddles, /mob)
		remove_paddles(M)
	QDEL_NULL(paddles)
	QDEL_NULL(cell)
	return ..()

/obj/item/defibrillator/proc/deductcharge(chrgdeductamt)
	if(cell)
		if(cell.charge < (paddles.revivecost+chrgdeductamt))
			powered = FALSE
			update_icon()
		if(cell.use(chrgdeductamt))
			update_icon()
			return TRUE
		else
			update_icon()
			return FALSE

/obj/item/defibrillator/proc/cooldowncheck(mob/user)
		addtimer(CALLBACK(src, PROC_REF(finish_charging)), cooldown_duration)

/obj/item/defibrillator/proc/finish_charging()
	if(cell)
		if(cell.charge >= paddles.revivecost)
			visible_message(span_notice("[src] beeps: Unit ready."))
			playsound(src, 'sound/blank.ogg', 50, FALSE)
		else
			visible_message(span_notice("[src] beeps: Charge depleted."))
			playsound(src, 'sound/blank.ogg', 50, FALSE)
	paddles.cooldown = FALSE
	paddles.update_icon()
	update_icon()

/obj/item/defibrillator/compact
	name = "compact defibrillator"
	desc = ""
	icon_state = "defibcompact"
	item_state = "defibcompact"
	w_class = WEIGHT_CLASS_NORMAL
	slot_flags = ITEM_SLOT_BELT

/obj/item/defibrillator/compact/item_action_slot_check(slot, mob/user)
	if(slot == user.getBeltSlot())
		return TRUE

/obj/item/defibrillator/compact/loaded/Initialize()
	. = ..()
	cell = new(src)
	update_icon()

/obj/item/defibrillator/compact/combat
	name = "combat defibrillator"
	desc = ""
	icon_state = "defibcombat" //needs defib inhand sprites
	item_state = "defibcombat"
	combat = TRUE
	safety = FALSE
	cooldown_duration = 2.5 SECONDS
	paddle_type = /obj/item/twohanded/shockpaddles/syndicate

/obj/item/defibrillator/compact/combat/loaded/Initialize()
	. = ..()
	cell = new /obj/item/stock_parts/cell/infinite(src)
	update_icon()

/obj/item/defibrillator/compact/combat/loaded/attackby(obj/item/W, mob/user, params)
	if(W == paddles)
		paddles.unwield()
		toggle_paddles()
		update_icon()
		return

//paddles

/obj/item/twohanded/shockpaddles
	name = "defibrillator paddles"
	desc = ""
	icon = 'icons/obj/defib.dmi'
	icon_state = "defibpaddles0"
	item_state = "defibpaddles0"
	lefthand_file = 'icons/mob/inhands/equipment/medical_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/medical_righthand.dmi'

	force = 0
	throwforce = 6
	w_class = WEIGHT_CLASS_BULKY
	resistance_flags = INDESTRUCTIBLE

	var/revivecost = 1000
	var/cooldown = FALSE
	var/busy = FALSE
	var/obj/item/defibrillator/defib
	var/req_defib = TRUE
	var/combat = FALSE //If it penetrates armor and gives additional functionality
	var/grab_ghost = FALSE
	var/tlimit = DEFIB_TIME_LIMIT * 10
	var/base_icon_state = "defibpaddles"

/obj/item/twohanded/shockpaddles/Destroy()
	defib = null
	return ..()

/obj/item/twohanded/shockpaddles/equipped(mob/user, slot)
	. = ..()
	if(!req_defib)
		return
	RegisterSignal(user, COMSIG_MOVABLE_MOVED, PROC_REF(check_range))

/obj/item/twohanded/shockpaddles/Moved()
	. = ..()
	check_range()


/obj/item/twohanded/shockpaddles/fire_act(added, maxstacks)
	. = ..()
	if((req_defib && defib) && loc != defib)
		defib.fire_act(added, maxstacks)

/obj/item/twohanded/shockpaddles/proc/check_range()
	if(!req_defib || !defib)
		return
	if(!in_range(src,defib))
		var/mob/living/L = loc
		if(istype(L))
			to_chat(L, span_warning("[defib]'s paddles overextend and come out of your hands!"))
		else
			visible_message(span_notice("[src] snap back into [defib]."))
		snap_back()

/obj/item/twohanded/shockpaddles/proc/recharge(time)
	if(req_defib || !time)
		return
	cooldown = TRUE
	update_icon()
	sleep(time)
	var/turf/T = get_turf(src)
	T.audible_message(span_notice("[src] beeps: Unit is recharged."))
	playsound(src, 'sound/blank.ogg', 50, FALSE)
	cooldown = FALSE
	update_icon()

/obj/item/twohanded/shockpaddles/New(mainunit)
	..()
	if(check_defib_exists(mainunit, src) && req_defib)
		defib = mainunit
		forceMove(defib)
		busy = FALSE
		update_icon()

/obj/item/twohanded/shockpaddles/update_icon()
	icon_state = "[base_icon_state][wielded]"
	item_state = icon_state
	if(cooldown)
		icon_state = "[base_icon_state][wielded]_cooldown"
	if(iscarbon(loc))
		var/mob/living/carbon/C = loc
		C.update_inv_hands()

/obj/item/twohanded/shockpaddles/suicide_act(mob/user)
	user.visible_message(span_danger("[user] is putting the live paddles on [user.p_their()] chest! It looks like [user.p_theyre()] trying to commit suicide!"))
	if(req_defib)
		defib.deductcharge(revivecost)
	playsound(src, 'sound/blank.ogg', 50, TRUE, -1)
	return (OXYLOSS)

/obj/item/twohanded/shockpaddles/dropped(mob/user)
	if(!req_defib)
		return ..()
	if(user)
		UnregisterSignal(user, COMSIG_MOVABLE_MOVED)
		var/obj/item/twohanded/offhand/O = user.get_inactive_held_item()
		if(istype(O))
			O.unwield()
		if(user != loc)
			to_chat(user, span_notice("The paddles snap back into the main unit."))
			snap_back()
	return unwield(user)

/obj/item/twohanded/shockpaddles/proc/snap_back()
	if(!defib)
		return
	defib.on = FALSE
	forceMove(defib)
	defib.update_icon()

/obj/item/twohanded/shockpaddles/proc/check_defib_exists(mainunit, mob/living/carbon/M, obj/O)
	if(!req_defib)
		return TRUE //If it doesn't need a defib, just say it exists
	if (!mainunit || !istype(mainunit, /obj/item/defibrillator))	//To avoid weird issues from admin spawns
		qdel(O)
		return FALSE
	else
		return TRUE

/obj/item/twohanded/shockpaddles/attack(mob/M, mob/user)

	if(busy)
		return
	if(req_defib && !defib.powered)
		user.visible_message(span_notice("[defib] beeps: Unit is unpowered."))
		playsound(src, 'sound/blank.ogg', 50, FALSE)
		return
	if(!wielded)
		if(iscyborg(user))
			to_chat(user, span_warning("I must activate the paddles in your active module before you can use them on someone!"))
		else
			to_chat(user, span_warning("I need to wield the paddles in both hands before you can use them on someone!"))
		return
	if(cooldown)
		if(req_defib)
			to_chat(user, span_warning("[defib] is recharging!"))
		else
			to_chat(user, span_warning("[src] are recharging!"))
		return

	if(user.used_intent.type == INTENT_DISARM)
		do_disarm(M, user)
		return

	if(!iscarbon(M))
		if(req_defib)
			to_chat(user, span_warning("The instructions on [defib] don't mention how to revive that..."))
		else
			to_chat(user, span_warning("I aren't sure how to revive that..."))
		return
	var/mob/living/carbon/H = M


	if(user.zone_selected != BODY_ZONE_CHEST)
		to_chat(user, span_warning("I need to target your patient's chest with [src]!"))
		return

	if(user.used_intent.type == INTENT_HARM)
		do_harm(H, user)
		return

	if((!req_defib && grab_ghost) || (req_defib && defib.grab_ghost))
		H.notify_ghost_cloning("Your heart is being defibrillated!")
		H.grab_ghost() // Shove them back in their body.
	else if(can_defib(H))
		H.notify_ghost_cloning("Your heart is being defibrillated. Re-enter your corpse if you want to be revived!", source = src)

	do_help(H, user)

/obj/item/twohanded/shockpaddles/proc/can_defib(mob/living/carbon/H)
	var/obj/item/organ/heart = H.getorgan(/obj/item/organ/heart)
	if(H.suiciding || H.hellbound || HAS_TRAIT(H, TRAIT_HUSK))
		return
	if((world.time - H.timeofdeath) > tlimit)
		return
	if((H.getBruteLoss() >= MAX_REVIVE_BRUTE_DAMAGE) || (H.getFireLoss() >= MAX_REVIVE_FIRE_DAMAGE))
		return
	if(!heart || (heart.organ_flags & ORGAN_FAILING))
		return
	var/obj/item/organ/brain/BR = H.getorgan(/obj/item/organ/brain)
	if(QDELETED(BR) || BR.brain_death || (BR.organ_flags & ORGAN_FAILING) || BR.suicided)
		return
	return TRUE

/obj/item/twohanded/shockpaddles/proc/shock_touching(dmg, mob/H)
	if(isliving(H.pulledby))		//CLEAR!
		var/mob/living/M = H.pulledby
		if(M.electrocute_act(30, H))
			M.visible_message(span_danger("[M] is electrocuted by [M.p_their()] contact with [H]!"))
			M.emote("scream")

/obj/item/twohanded/shockpaddles/proc/do_disarm(mob/living/M, mob/living/user)
	if(req_defib && defib.safety)
		return
	if(!req_defib && !combat)
		return
	busy = TRUE
	M.visible_message(span_danger("[user] has touched [M] with [src]!"), \
			span_danger("[user] has touched [M] with [src]!"))
	//M.adjustStaminaLoss(50)
	M.Paralyze(100)
	M.updatehealth() //forces health update before next life tick //isn't this done by adjustStaminaLoss anyway?
	playsound(src,  'sound/blank.ogg', 50, TRUE, -1)
	M.emote("breathgasp")
	log_combat(user, M, "stunned", src)
	if(req_defib)
		defib.deductcharge(revivecost)
		cooldown = TRUE
	busy = FALSE
	update_icon()
	if(req_defib)
		defib.cooldowncheck(user)
	else
		recharge(60)

/obj/item/twohanded/shockpaddles/proc/do_harm(mob/living/carbon/H, mob/living/user)
	if(req_defib && defib.safety)
		return
	if(!req_defib && !combat)
		return
	user.visible_message(span_warning("[user] begins to place [src] on [H]'s chest."),
		span_warning("I overcharge the paddles and begin to place them onto [H]'s chest..."))
	busy = TRUE
	update_icon()
	if(do_after(user, 30, target = H))
		user.visible_message(span_notice("[user] places [src] on [H]'s chest."),
			span_warning("I place [src] on [H]'s chest and begin to charge them."))
		var/turf/T = get_turf(defib)
		playsound(src, 'sound/blank.ogg', 50, FALSE)
		if(req_defib)
			T.audible_message(span_warning("\The [defib] lets out an urgent beep and lets out a steadily rising hum..."))
		else
			user.audible_message(span_warning("[src] let out an urgent beep."))
		if(do_after(user, 30, target = H)) //Takes longer due to overcharging
			if(!H)
				busy = FALSE
				update_icon()
				return
			if(H && H.stat == DEAD)
				to_chat(user, span_warning("[H] is dead."))
				playsound(src, 'sound/blank.ogg', 50, FALSE)
				busy = FALSE
				update_icon()
				return
			user.visible_message(span_boldannounce("<i>[user] shocks [H] with \the [src]!"), span_warning("I shock [H] with \the [src]!"))
			playsound(src, 'sound/blank.ogg', 100, TRUE, -1)
			playsound(src, 'sound/blank.ogg', 100, TRUE, -1)
			H.emote("scream")
			shock_touching(45, H)
			if(H.can_heartattack() && !H.undergoing_cardiac_arrest())
				if(!H.stat)
					H.visible_message(span_warning("[H] thrashes wildly, clutching at [H.p_their()] chest!"),
						span_danger("I feel a horrible agony in your chest!"))
				H.set_heartattack(TRUE)
			H.apply_damage(50, BURN, BODY_ZONE_CHEST)
			log_combat(user, H, "overloaded the heart of", defib)
			H.Paralyze(100)
			H.Jitter(100)
			if(req_defib)
				defib.deductcharge(revivecost)
				cooldown = TRUE
			busy = FALSE
			update_icon()
			if(!req_defib)
				recharge(60)
			if(req_defib && (defib.cooldowncheck(user)))
				return
	busy = FALSE
	update_icon()

/obj/item/twohanded/shockpaddles/proc/do_help(mob/living/carbon/H, mob/living/user)
	user.visible_message(span_warning("[user] begins to place [src] on [H]'s chest."), span_warning("I begin to place [src] on [H]'s chest..."))
	busy = TRUE
	update_icon()
	if(do_after(user, 30, target = H)) //beginning to place the paddles on patient's chest to allow some time for people to move away to stop the process
		user.visible_message(span_notice("[user] places [src] on [H]'s chest."), span_warning("I place [src] on [H]'s chest."))
		playsound(src, 'sound/blank.ogg', 75, FALSE)
		var/total_burn	= 0
		var/total_brute	= 0
		var/tplus = world.time - H.timeofdeath	//length of time spent dead
		var/obj/item/organ/heart = H.getorgan(/obj/item/organ/heart)
		if(do_after(user, 20, target = H)) //placed on chest and short delay to shock for dramatic effect, revive time is 5sec total
			for(var/obj/item/carried_item in H.contents)
				if(istype(carried_item, /obj/item/clothing/suit/space))
					if((!combat && !req_defib) || (req_defib && !defib.combat))
						user.audible_message(span_warning("[req_defib ? "[defib]" : "[src]"] buzzes: Patient's chest is obscured. Operation aborted."))
						playsound(src, 'sound/blank.ogg', 50, FALSE)
						busy = FALSE
						update_icon()
						return
			if(H.stat == DEAD)
				H.visible_message(span_warning("[H]'s body convulses a bit."))
				playsound(src, "bodyfall", 100, TRUE)
				playsound(src, 'sound/blank.ogg', 75, TRUE, -1)
				total_brute	= H.getBruteLoss()
				total_burn	= H.getFireLoss()
				shock_touching(30, H)
				var/failed

				if (H.suiciding)
					failed = span_warning("[req_defib ? "[defib]" : "[src]"] buzzes: Resuscitation failed - Recovery of patient impossible. Further attempts futile.")
				else if (H.hellbound)
					failed = span_warning("[req_defib ? "[defib]" : "[src]"] buzzes: Resuscitation failed - Patient's soul appears to be on another plane of existence. Further attempts futile.")
				else if (tplus > tlimit)
					failed = span_warning("[req_defib ? "[defib]" : "[src]"] buzzes: Resuscitation failed - Body has decayed for too long. Further attempts futile.")
				else if (!heart)
					failed = span_warning("[req_defib ? "[defib]" : "[src]"] buzzes: Resuscitation failed - Patient's heart is missing.")
				else if (heart.organ_flags & ORGAN_FAILING)
					failed = span_warning("[req_defib ? "[defib]" : "[src]"] buzzes: Resuscitation failed - Patient's heart too damaged.")
				else if(total_burn >= MAX_REVIVE_FIRE_DAMAGE || total_brute >= MAX_REVIVE_BRUTE_DAMAGE || HAS_TRAIT(H, TRAIT_HUSK))
					failed = span_warning("[req_defib ? "[defib]" : "[src]"] buzzes: Resuscitation failed - Severe tissue damage makes recovery of patient impossible via defibrillator. Further attempts futile.")
				else if(H.get_ghost())
					failed = span_warning("[req_defib ? "[defib]" : "[src]"] buzzes: Resuscitation failed - No activity in patient's brain. Further attempts may be successful.")
				else
					var/obj/item/organ/brain/BR = H.getorgan(/obj/item/organ/brain)
					if(BR)
						if(BR.organ_flags & ORGAN_FAILING)
							failed = span_warning("[req_defib ? "[defib]" : "[src]"] buzzes: Resuscitation failed - Patient's brain tissue is damaged making recovery of patient impossible via defibrillator. Further attempts futile.")
						if(BR.brain_death)
							failed = span_warning("[req_defib ? "[defib]" : "[src]"] buzzes: Resuscitation failed - Patient's brain damaged beyond point of no return. Further attempts futile.")
						if(BR.suicided || BR.brainmob?.suiciding)
							failed = span_warning("[req_defib ? "[defib]" : "[src]"] buzzes: Resuscitation failed - No intelligence pattern can be detected in patient's brain. Further attempts futile.")
					else
						failed = span_warning("[req_defib ? "[defib]" : "[src]"] buzzes: Resuscitation failed - Patient's brain is missing. Further attempts futile.")

				if(failed)
					user.visible_message(failed)
					playsound(src, 'sound/blank.ogg', 50, FALSE)
				else
					//If the body has been fixed so that they would not be in crit when defibbed, give them oxyloss to put them back into crit
					if (H.health > HALFWAYCRITDEATH)
						H.adjustOxyLoss(H.health - HALFWAYCRITDEATH, 0)
					else
						var/overall_damage = total_brute + total_burn + H.getToxLoss() + H.getOxyLoss()
						var/mobhealth = H.health
						H.adjustOxyLoss((mobhealth - HALFWAYCRITDEATH) * (H.getOxyLoss() / overall_damage), 0)
						H.adjustToxLoss((mobhealth - HALFWAYCRITDEATH) * (H.getToxLoss() / overall_damage), 0)
						H.adjustFireLoss((mobhealth - HALFWAYCRITDEATH) * (total_burn / overall_damage), 0)
						H.adjustBruteLoss((mobhealth - HALFWAYCRITDEATH) * (total_brute / overall_damage), 0)
					H.updatehealth() // Previous "adjust" procs don't update health, so we do it manually.
					user.visible_message(span_notice("[req_defib ? "[defib]" : "[src]"] pings: Resuscitation successful."))
					playsound(src, 'sound/blank.ogg', 50, FALSE)
					H.set_heartattack(FALSE)
					H.revive(full_heal = FALSE, admin_revive = FALSE)
					H.emote("breathgasp")
					H.Jitter(100)
					SEND_SIGNAL(H, COMSIG_LIVING_MINOR_SHOCK)
					log_combat(user, H, "revived", defib)
				if(req_defib)
					defib.deductcharge(revivecost)
					cooldown = 1
				update_icon()
				if(req_defib)
					defib.cooldowncheck(user)
				else
					recharge(60)
			else if (!H.getorgan(/obj/item/organ/heart))
				user.visible_message(span_warning("[req_defib ? "[defib]" : "[src]"] buzzes: Patient's heart is missing. Operation aborted."))
				playsound(src, 'sound/blank.ogg', 50, FALSE)
			else if(H.undergoing_cardiac_arrest())
				playsound(src, 'sound/blank.ogg', 50, TRUE, -1)
				if(!(heart.organ_flags & ORGAN_FAILING))
					H.set_heartattack(FALSE)
					user.visible_message(span_notice("[req_defib ? "[defib]" : "[src]"] pings: Patient's heart is now beating again."))
				else
					user.visible_message(span_warning("[req_defib ? "[defib]" : "[src]"] buzzes: Resuscitation failed, heart damage detected."))

			else
				user.visible_message(span_warning("[req_defib ? "[defib]" : "[src]"] buzzes: Patient is not in a valid state. Operation aborted."))
				playsound(src, 'sound/blank.ogg', 50, FALSE)
	busy = FALSE
	update_icon()

/obj/item/twohanded/shockpaddles/cyborg
	name = "cyborg defibrillator paddles"
	icon = 'icons/obj/defib.dmi'
	icon_state = "defibpaddles0"
	item_state = "defibpaddles0"
	req_defib = FALSE

/obj/item/twohanded/shockpaddles/cyborg/attack(mob/M, mob/user)
	if(iscyborg(user))
		var/mob/living/silicon/robot/R = user
		if(R.emagged)
			combat = TRUE
		else
			combat = FALSE
	else
		combat = FALSE

	. = ..()

/obj/item/twohanded/shockpaddles/syndicate
	name = "syndicate defibrillator paddles"
	desc = ""
	combat = TRUE
	icon = 'icons/obj/defib.dmi'
	icon_state = "syndiepaddles0"
	item_state = "syndiepaddles0"
	base_icon_state = "syndiepaddles"

/obj/item/twohanded/shockpaddles/syndicate/cyborg
	req_defib = FALSE

#undef HALFWAYCRITDEATH

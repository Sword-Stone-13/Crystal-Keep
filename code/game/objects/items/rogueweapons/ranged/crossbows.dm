
/obj/item/gun/ballistic/revolver/grenadelauncher/crossbow
	name = "crossbow"
	desc = "A deadly weapon that shoots a bolt with terrific power."
	icon = 'icons/roguetown/weapons/32.dmi'
	icon_state = "crossbow0"
	item_state = "crossbow"
	possible_item_intents = list(/datum/intent/shoot/crossbow, /datum/intent/arc/crossbow, INTENT_GENERIC)
	mag_type = /obj/item/ammo_box/magazine/internal/shot/xbow
	slot_flags = ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_BULKY
	randomspread = 1
	spread = 0
	can_parry = TRUE
	pin = /obj/item/firing_pin
	force = 10
	minstr = 5
	var/cocked = FALSE
	cartridge_wording = "bolt"
	load_sound = 'sound/foley/nockarrow.ogg'
	fire_sound = 'sound/combat/Ranged/crossbow-small-shot-02.ogg'
	associated_skill = /datum/skill/combat/crossbows
	anvilrepair = /datum/skill/craft/weaponsmithing
	smeltresult = /obj/item/ingot/steel
	damfactor = 1.0
	metalizer_result = /obj/structure/bars/pipe

/obj/item/gun/ballistic/revolver/grenadelauncher/crossbow/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.5,"sx" = -4,"sy" = -6,"nx" = 9,"ny" = -6,"wx" = -6,"wy" = -4,"ex" = 4,"ey" = -6,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 0,"sturn" = 90,"wturn" = 93,"eturn" = -12,"nflip" = 0,"sflip" = 1,"wflip" = 0,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

/datum/intent/shoot/crossbow
	chargetime = 8
	chargedrain = 0 //no drain to aim a crossbow

/datum/intent/shoot/crossbow/get_chargetime()
	if(mastermob && chargetime)
		var/newtime = 0
		var/skillmod = ((mastermob.mind.get_skill_level(/datum/skill/combat/crossbows) * 0.2) + 1)
		newtime = round(chargetime * (30 / (((mastermob.STASKL * 2) * skillmod) + ((mastermob.STASPD) * skillmod))))	//Returns original Charge Time at 10 PER, 10 SPD, 0 skill
		if(newtime > 0)
			return newtime
		else
			return 0.1
	return chargetime

/datum/intent/arc/crossbow
	chargetime = 8
	chargedrain = 0 //no drain to aim a crossbow

/datum/intent/arc/crossbow/get_chargetime()
	if(mastermob && chargetime)
		var/newtime = 0
		var/skillmod = ((mastermob.mind.get_skill_level(/datum/skill/combat/crossbows) * 0.2) + 1)
		newtime = round(chargetime * (30 / (((mastermob.STASKL * 2) * skillmod) + ((mastermob.STASPD) * skillmod))))	//Returns original Charge Time at 10 PER, 10 SPD, 0 skill
		if(newtime > 0)
			return newtime
		else
			return 1
	return chargetime

/obj/item/gun/ballistic/revolver/grenadelauncher/crossbow/shoot_with_empty_chamber()
	if(cocked)
		playsound(src.loc, 'sound/combat/Ranged/crossbow-small-shot-02.ogg', 100, FALSE)
		cocked = FALSE
		update_icon()

/obj/item/gun/ballistic/revolver/grenadelauncher/crossbow/attack_self(mob/living/user)
	if(chambered)
		..()
	else
		if(!cocked)
			to_chat(user, span_info("I step on the stirrup and use all my might..."))
			if(user.STASTR < minstr)
				if(do_after(user, 120 - (user.STASTR * 5), target = user))
					to_chat(user, span_info("I'm not strong enough..."))
					cocked = FALSE
			else
				if(do_after(user, 120 - (user.STASTR * 5), target = user))
					playsound(user, 'sound/combat/Ranged/crossbow_medium_reload-01.ogg', 100, FALSE)
					cocked = TRUE
		else
			to_chat(user, span_warning("I carefully de-cock the crossbow."))
			cocked = FALSE
	update_icon()

/obj/item/gun/ballistic/revolver/grenadelauncher/crossbow/attackby(obj/item/A, mob/user, params)
	..()
	if(istype(A, /obj/item/ammo_box) || istype(A, /obj/item/ammo_casing))
		if(cocked)
			if((loc == user) && (user.get_inactive_held_item() != src))
				return
			..()
		else
			to_chat(user, span_warning("I need to cock the bow first."))


/obj/item/gun/ballistic/revolver/grenadelauncher/crossbow/process_fire(atom/target, mob/living/user, message = TRUE, params = null, zone_override = "", bonus_spread = 0)
	if(user.client)
		if(user.client.chargedprog >= 100)
			spread = 0
		else
			spread = 90 - (90 * (user.client.chargedprog / 100))
	else
		spread = 0
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		switch(H.mind.get_skill_level(/datum/skill/combat/crossbows))
			if(0)
				spread += 35
			if(1)
				spread += 20
			if(2)
				spread += 5
			else
				spread += 0
	for(var/obj/item/ammo_casing/CB in get_ammo_list(FALSE, TRUE))
		var/obj/projectile/BB = CB.BB
		if(user.STASKL > 10)
			BB.damage = (BB.damage * (user.STASKL / 10) * damfactor)

		if(HAS_TRAIT(user, TRAIT_TINY))
			BB.damage = (BB.damage * 0.1)
	cocked = FALSE
	..()

/obj/item/gun/ballistic/revolver/grenadelauncher/crossbow/update_icon()
	. = ..()
	if(cocked)
		icon_state = "crossbow1"
	else
		icon_state = "crossbow0"
	cut_overlays()
	if(chambered)
		var/obj/item/I = chambered
		I.pixel_x = 0
		I.pixel_y = 0
		add_overlay(new /mutable_appearance(I))
	if(ismob(loc))
		var/mob/M = loc
		M.update_inv_hands()

/obj/item/ammo_box/magazine/internal/shot/xbow
	ammo_type = /obj/item/ammo_casing/caseless/rogue/bolt
	caliber = "regbolt"
	max_ammo = 1
	start_empty = TRUE

//steeeels//

///BLUESTEEL///
/obj/item/gun/ballistic/revolver/grenadelauncher/crossbow/bluesteel
	name = "dwarven crossbow"
	desc = "three slots for deadly punctures."
	possible_item_intents = list(/datum/intent/shoot/crossbow/bluesteel, /datum/intent/arc/crossbow/bluesteel, INTENT_GENERIC)
	force = 12
	minstr = 12
	anvilrepair = /datum/skill/craft/dwarfsmithing
	smeltresult = /obj/item/ingot/bluesteel
	damfactor = 1.5
	mag_type = /obj/item/ammo_box/magazine/internal/shot/xbow/bluesteel
	icon_state = "crossbowbluesteel0"
	item_state = "crossbow"

/obj/item/ammo_box/magazine/internal/shot/xbow/bluesteel
	max_ammo = 3

/datum/intent/shoot/crossbow/bluesteel
	chargetime = 6
	chargedrain = 0 //no drain to aim a crossbow

/datum/intent/arc/crossbow/bluesteel
	chargetime = 6
	chargedrain = 0 //no drain to aim a crossbow

///REDSTEEL///
/obj/item/gun/ballistic/revolver/grenadelauncher/crossbow/redsteel
	name = "kobold crossbow"
	desc = "a smaller intricate crossbow, scarlet."
	possible_item_intents = list(/datum/intent/shoot/crossbow, /datum/intent/arc/crossbow, INTENT_GENERIC)
	force = 6
	minstr = 4
	anvilrepair = /datum/skill/craft/koboldsmithing
	smeltresult = /obj/item/ingot/redsteel
	damfactor = 1.8
	slot_flags = ITEM_SLOT_BACK|ITEM_SLOT_HIP
	icon_state = "crossbowredsteel0"
	item_state = "crossbow"

/datum/intent/shoot/crossbow/bluesteel
	chargetime = 2
	chargedrain = 0 //no drain to aim a crossbow

/datum/intent/arc/crossbow/bluesteel
	chargetime = 2
	chargedrain = 0 //no drain to aim a crossbow

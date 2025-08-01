
/obj/item/gun/ballistic/revolver/grenadelauncher/bow
	name = "bow"
	desc = "A wooden weapon with a taut string."
	icon = 'icons/roguetown/weapons/32.dmi'
	icon_state = "bow"
	item_state = "bow"
	possible_item_intents = list(/datum/intent/shoot/bow, /datum/intent/arc/bow,INTENT_GENERIC)
	mag_type = /obj/item/ammo_box/magazine/internal/shot/bow
	fire_sound = 'sound/combat/Ranged/flatbow-shot-01.ogg'
	slot_flags = ITEM_SLOT_BACK|ITEM_SLOT_HIP
	w_class = WEIGHT_CLASS_BULKY
	randomspread = 0
	spread = 0
	can_parry = TRUE
	pin = /obj/item/firing_pin
	force = 10
	verbage = "nock"
	cartridge_wording = "arrow"
	load_sound = 'sound/foley/nockarrow.ogg'
	associated_skill = /datum/skill/combat/bows
	metalizer_result = /obj/item/restraints/legcuffs/beartrap/armed

/obj/item/gun/ballistic/revolver/grenadelauncher/bow/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.7,"sx" = -3,"sy" = 0,"nx" = 6,"ny" = 1,"wx" = -1,"wy" = 1,"ex" = -2,"ey" = 1,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 9,"sturn" = -100,"wturn" = -102,"eturn" = 10,"nflip" = 1,"sflip" = 8,"wflip" = 8,"eflip" = 1)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)
			if("onback")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)


/obj/item/gun/ballistic/revolver/grenadelauncher/bow/shoot_with_empty_chamber()
	return

/obj/item/gun/ballistic/revolver/grenadelauncher/bow/dropped()
	. = ..()
	if(chambered)
		chambered = null
		var/num_unloaded = 0
		for(var/obj/item/ammo_casing/CB in get_ammo_list(FALSE, TRUE))
			CB.forceMove(drop_location())
//			CB.bounce_away(FALSE, NONE)
			num_unloaded++
		if (num_unloaded)
			update_icon()

/obj/item/gun/ballistic/revolver/grenadelauncher/bow/process_fire(atom/target, mob/living/user, message = TRUE, params = null, zone_override = "", bonus_spread = 0)
	if(user.get_num_arms(FALSE) < 2)
		return FALSE
	if(user.get_inactive_held_item())
		return FALSE
	if(user.client)
		if(user.client.chargedprog >= 100)
			spread = 0
		else
			spread = 90 - (90 * (user.client.chargedprog / 100))
	else
		spread = 0
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		switch(H.mind.get_skill_level(/datum/skill/combat/bows))
			if(0)
				spread += 60
			if(1)
				spread += 30
			if(2)
				spread += 15
			if(3)
				spread += 5
			else
				spread += 0
		if(H.worn_armor_class == 3)
			spread += 10
	for(var/obj/item/ammo_casing/CB in get_ammo_list(FALSE, TRUE))
		var/obj/projectile/BB = CB.BB
		if(user.client.chargedprog < 100)
			BB.damage = BB.damage - (BB.damage * (user.client.chargedprog / 100))
			BB.embedchance = 5
		else
			BB.damage = BB.damage * (user.STASTR / 10) * damfactor
			if(user.STASKL > 10)
				BB.damage = BB.damage * (user.STASKL / 10)
			BB.embedchance = 100
		if(HAS_TRAIT(user, TRAIT_TINY))
			BB.damage = (BB.damage * 0.1)
	. = ..()

/obj/item/gun/ballistic/revolver/grenadelauncher/bow/update_icon()
	. = ..()
	cut_overlays()
	if(chambered)
		var/obj/item/I = chambered
		I.pixel_x = 0
		I.pixel_y = 0
		add_overlay(new /mutable_appearance(I))
	if(ismob(loc))
		var/mob/M = loc
		M.update_inv_hands()

/obj/item/ammo_box/magazine/internal/shot/bow
	ammo_type = /obj/item/ammo_casing/caseless/rogue/arrow
	caliber = "arrow"
	max_ammo = 1
	start_empty = TRUE

/obj/item/ammo_box/magazine/internal/shot/greatbow
	ammo_type = /obj/item/ammo_casing/caseless/rogue/greatarrow
	caliber = "great arrow"
	max_ammo = 1
	start_empty = TRUE

/datum/intent/shoot/bow
	chargetime = 15
	chargedrain = 2
	charging_slowdown = 3

/datum/intent/shoot/bow/can_charge()
	if(mastermob)
		if(mastermob.get_num_arms(FALSE) < 2)
			return FALSE
		if(mastermob.get_inactive_held_item())
			return FALSE
	return TRUE

/datum/intent/shoot/bow/prewarning()
	if(mastermob)
		mastermob.visible_message(span_warning("[mastermob] draws [masteritem]!"))
		playsound(mastermob, pick('sound/combat/Ranged/bow-draw-01.ogg'), 100, FALSE)

/datum/intent/shoot/bow/get_chargetime()
	if(mastermob && chargetime)
		var/newtime = 0
		var/chargeskillmod = ((mastermob.mind.get_skill_level(/datum/skill/combat/bows) * 0.2) + 1)
		newtime = round(chargetime * (25 / ((((mastermob.STASTR * 2) * chargeskillmod) + ((mastermob.STASKL * 0.5) * chargeskillmod)))))	//Returns original Charge Time at 10 STR, 10 PER, 0 skill
		if(newtime > 0)
			return newtime
		else
			return 0.1
	return chargetime

/datum/intent/arc/bow
	chargetime = 20
	chargedrain = 2
	charging_slowdown = 3

/datum/intent/arc/bow/can_charge()
	if(mastermob)
		if(mastermob.get_num_arms(FALSE) < 2)
			return FALSE
		if(mastermob.get_inactive_held_item())
			return FALSE
	return TRUE

/datum/intent/arc/bow/prewarning()
	if(mastermob)
		mastermob.visible_message(span_warning("[mastermob] draws [masteritem]!"))
		playsound(mastermob, pick('sound/combat/Ranged/bow-draw-01.ogg'), 100, FALSE)

/datum/intent/arc/bow/get_chargetime()
	if(mastermob && chargetime)
		var/newtime = 0
		var/chargeskillmod = (mastermob.mind.get_skill_level(/datum/skill/combat/bows) * 0.1)
		newtime = chargetime - ((mastermob.STASTR * (0.3 + chargeskillmod)) + (mastermob.STASKL * 0.1))
		if(newtime > 0)
			return newtime
		else
			return 0.1
	return chargetime

/obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve
	name = "recurve bow"
	desc = "A long but slender bow, finely crafted from horn, sinew, and wood. It has an atypical shape."
	icon_state = "bowr"
	possible_item_intents = list(/datum/intent/shoot/bow/recurve, /datum/intent/arc/bow/recurve,INTENT_GENERIC)
	randomspread = 1
	spread = 1
	force = 9
	minstr = 7
	damfactor = 0.9

/datum/intent/shoot/bow/recurve
	chargetime = 12
	chargedrain = 1.5
	charging_slowdown = 2.5

/datum/intent/arc/bow/recurve
	chargetime = 15
	chargedrain = 1.5
	charging_slowdown = 2.5

///CRYSTAL KEEP///

///ELFNUT///

/obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve/elfnut
	name = "Elfnut Bow"
	desc = "Elfnuts are usually empty inside, save for the ones who's waxy innards contort into string-like sinews."
	icon_state = "elfnutlongbow"
	icon = 'icons/roguetown/weapons/64.dmi'
	possible_item_intents = list(/datum/intent/shoot/bow/recurve/elfnut, /datum/intent/arc/bow/recurve/elfnut, INTENT_GENERIC)
	randomspread = 1
	spread = 1
	force = 9
	minstr = 7
	damfactor = 0.8
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	bigboy = TRUE

/datum/intent/shoot/bow/recurve/elfnut
	chargetime = 6
	chargedrain = 1
	charging_slowdown = 0

/datum/intent/arc/bow/recurve/elfnut
	chargetime = 6
	chargedrain = 1
	charging_slowdown = 0

/obj/item/gun/ballistic/revolver/grenadelauncher/bow/elvish
	name = "Elvish Longbow"
	desc = "An elvish warbow. Twisted steel-like threads like roots of a tree."
	icon = 'icons/roguetown/weapons/64.dmi'
	icon_state = "elfnutlongbowsilver"
	possible_item_intents = list(/datum/intent/shoot/bow/elvish, /datum/intent/arc/bow/elvish,INTENT_GENERIC)
	randomspread = 1
	spread = 1
	force = 9
	minstr = 12
	damfactor = 2

/datum/intent/shoot/bow/elvish
	chargetime = 20
	chargedrain = 1
	charging_slowdown = 3

/datum/intent/arc/bow/elvish
	chargetime = 20
	chargedrain = 1
	charging_slowdown = 3


/obj/item/gun/ballistic/revolver/grenadelauncher/bow/aasimar
	name = "Aasimar Warbow"
	desc = "Borderline club with a rope across it."
	icon_state = "bow_moth"
	possible_item_intents = list(/datum/intent/shoot/bow/aasimar, /datum/intent/arc/bow/aasimar, /datum/intent/mace/smash/wood)
	randomspread = 1
	slot_flags = ITEM_SLOT_BACK
	spread = 1
	force = 20
	minstr = 15
	damfactor = 3
	mag_type = /obj/item/ammo_box/magazine/internal/shot/greatbow

/datum/intent/shoot/bow/aasimar
	chargetime = 30
	chargedrain = 2
	charging_slowdown = 4

/datum/intent/arc/bow/aasimar
	chargetime = 30
	chargedrain = 2
	charging_slowdown = 4

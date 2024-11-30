
/obj/item/gun/magic/staff/firebolt
	name = "fire tome"
	desc = "A simple spellbook for beginners."
	icon = 'icons/roguetown/weapons/32.dmi'
	icon_state = "bow"
	item_state = "bow"
	possible_item_intents = list(/datum/intent/shoot/tome)
	ammo_type = /obj/item/ammo_casing/magic/firebolt
	fire_sound = 'sound/combat/Ranged/flatbow-shot-01.ogg'
	slot_flags = ITEM_SLOT_HIP
	w_class = WEIGHT_CLASS_NORMAL
	checks_antimagic = TRUE
	max_charges = 6
	recharge_rate = 4
	can_charge = TRUE
	randomspread = 0
	spread = 0
	damtype = BURN
	can_parry = FALSE
	pin = /obj/item/firing_pin
	force = 10
	minmag = 11
	associated_skill = /datum/skill/magic/arcane
	var/damfactor = 1

/obj/item/gun/ballistic/revolver/grenadelauncher/bow/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.7,"sx" = -3,"sy" = 0,"nx" = 6,"ny" = 1,"wx" = -1,"wy" = 1,"ex" = -2,"ey" = 1,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 9,"sturn" = -100,"wturn" = -102,"eturn" = 10,"nflip" = 1,"sflip" = 8,"wflip" = 8,"eflip" = 1)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)




/datum/intent/shoot/tome
	chargetime = 1
	chargedrain = 2
	charging_slowdown = 2

/datum/intent/shoot/bow/can_charge()
	if(mastermob)
		if(mastermob.get_num_arms(FALSE) < 2)
			return FALSE
		if(mastermob.get_inactive_held_item())
			return FALSE
	return TRUE

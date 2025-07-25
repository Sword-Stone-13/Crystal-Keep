/mob/living/carbon/slip(knockdown_amount, obj/O, lube, paralyze, force_drop)
	if(movement_type & FLYING)
		return 0
	if(!(lube&SLIDE_ICE))
		log_combat(src, (O ? O : get_turf(src)), "slipped on the", null, ((lube & SLIDE) ? "(LUBE)" : null))
	return loc.handle_slip(src, knockdown_amount, O, lube, paralyze, force_drop)

/mob/living/carbon/Process_Spacemove(movement_dir = 0)
	if(..())
		return 1
	if(!isturf(loc))
		return 0

	// Do we have a jetpack implant (and is it on)?
	var/obj/item/organ/cyberimp/chest/thrusters/T = getorganslot(ORGAN_SLOT_THRUSTERS)
	if(istype(T) && movement_dir && T.allow_thrust(0.01))
		return 1

	var/obj/item/tank/jetpack/J = get_jetpack()
	if(istype(J) && (movement_dir || J.stabilizers) && J.allow_thrust(0.01, src))
		return 1

/mob/living/carbon/Move(NewLoc, direct)
	. = ..()
	if(. && !(movement_type & FLOATING)) //floating is easy
		if(HAS_TRAIT(src, TRAIT_NOHUNGER))
			set_nutrition(NUTRITION_LEVEL_FED - 1)	//just less than feeling vigorous
			set_hydration(HYDRATION_LEVEL_START_MAX - 1)	//just less than feeling vigorous
		else if(stat != DEAD)
			adjust_nutrition(-(0.05))
			adjust_hydration(-(0.05))
			if(m_intent == MOVE_INTENT_RUN)
				adjust_nutrition(-(0.1))
				adjust_hydration(-(0.1))
		if(m_intent == MOVE_INTENT_RUN) //sprint fatigue add
			var/stamina_consumption = HAS_TRAIT(src, TRAIT_GOODRUNNER) ? 1 : 2
			if(ishuman(src))
				var/mob/living/carbon/human/H = src
				if(H.worn_armor_class > 1)
					stamina_consumption *= H.worn_armor_class
			rogfat_add(stamina_consumption)

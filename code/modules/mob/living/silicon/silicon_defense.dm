
/mob/living/silicon/grippedby(mob/living/user, instant = FALSE)
	return //can't upgrade a simple pull into a more aggressive grab.

/mob/living/silicon/get_ear_protection()//no ears
	return 2

/mob/living/silicon/attack_alien(mob/living/carbon/alien/humanoid/M)
	if(..()) //if harm or disarm intent
		var/damage = 20
		if (prob(90))
			log_combat(M, src, "attacked")
			playsound(loc, 'sound/blank.ogg', 25, TRUE, -1)
			visible_message(span_danger("[M] slashes at [src]!"), \
							span_danger("[M] slashes at you!"), null, null, M)
			to_chat(M, span_danger("I slash at [src]!"))
			if(prob(8))
				flash_act(affect_silicon = 1)
			log_combat(M, src, "attacked")
			adjustBruteLoss(damage)
			updatehealth()
		else
			playsound(loc, 'sound/blank.ogg', 25, TRUE, -1)
			visible_message(span_danger("[M]'s swipe misses [src]!"), \
							span_danger("I avoid [M]'s swipe!"), null, null, M)
			to_chat(M, span_warning("My swipe misses [src]!"))

/mob/living/silicon/attack_animal(mob/living/simple_animal/M)
	. = ..()
	if(.)
		var/damage = rand(M.melee_damage_lower, M.melee_damage_upper)
		if(prob(damage))
			for(var/mob/living/N in buckled_mobs)
				N.Paralyze(20)
				unbuckle_mob(N)
				N.visible_message(span_danger("[N] is knocked off of [src] by [M]!"), \
								span_danger("You're knocked off of [src] by [M]!"), null, null, M)
				to_chat(M, span_danger("I knock [N] off of [src]!"))
		switch(M.melee_damage_type)
			if(BRUTE)
				adjustBruteLoss(damage)
			if(BURN)
				adjustFireLoss(damage)
			if(TOX)
				adjustToxLoss(damage)
			if(OXY)
				adjustOxyLoss(damage)
			if(CLONE)
				adjustCloneLoss(damage)
			//if(STAMINA)
			//	adjustStaminaLoss(damage)

/mob/living/silicon/attack_paw(mob/living/user)
	return attack_hand(user)

/mob/living/silicon/attack_larva(mob/living/carbon/alien/larva/L)
	if(L.used_intent.type == INTENT_HELP)
		visible_message(span_notice("[L.name] rubs its head against [src]."))

/mob/living/silicon/attack_hulk(mob/living/carbon/human/user)
	. = ..()
	if(!.)
		return
	adjustBruteLoss(rand(10, 15))
	playsound(loc, "punch", 25, TRUE, -1)
	visible_message(span_danger("[user] punches [src]!"), \
					span_danger("[user] punches you!"), null, COMBAT_MESSAGE_RANGE, user)
	to_chat(user, span_danger("I punch [src]!"))

//ATTACK HAND IGNORING PARENT RETURN VALUE
/mob/living/silicon/attack_hand(mob/living/carbon/human/M)
	. = FALSE
	if(SEND_SIGNAL(src, COMSIG_ATOM_ATTACK_HAND, M) & COMPONENT_NO_ATTACK_HAND)
		. = TRUE
	switch(M.used_intent.type)
		if (INTENT_HELP)
			visible_message(span_notice("[M] pets [src]."), \
							span_notice("[M] pets you."), null, null, M)
			to_chat(M, span_notice("I pet [src]."))
			SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT_RND, "pet_borg", /datum/mood_event/pet_borg)
		if(INTENT_GRAB)
			grabbedby(M)
		else
			M.do_attack_animation(src, ATTACK_EFFECT_PUNCH)
			playsound(src.loc, 'sound/blank.ogg', 10, TRUE)
			visible_message(span_danger("[M] punches [src], but doesn't leave a dent!"), \
							span_warning("[M] punches you, but doesn't leave a dent!"), null, COMBAT_MESSAGE_RANGE, M)
			to_chat(M, span_danger("I punch [src], but don't leave a dent!"))

/mob/living/silicon/attack_drone(mob/living/simple_animal/drone/M)
	if(M.used_intent.type == INTENT_HARM)
		return
	return ..()

/mob/living/silicon/electrocute_act(shock_damage, source, siemens_coeff = 1, flags = NONE)
	if(buckled_mobs)
		for(var/mob/living/M in buckled_mobs)
			unbuckle_mob(M)
			M.electrocute_act(shock_damage/100, source, siemens_coeff, flags)	//Hard metal shell conducts!
	return 0 //So borgs they don't die trying to fix wiring

/mob/living/silicon/emp_act(severity)
	. = ..()
	to_chat(src, span_danger("Warning: Electromagnetic pulse detected."))
	if(. & EMP_PROTECT_SELF)
		return
	switch(severity)
		if(1)
			src.take_bodypart_damage(20)
		if(2)
			src.take_bodypart_damage(10)
	to_chat(src, span_danger("*BZZZT*"))
	for(var/mob/living/M in buckled_mobs)
		if(prob(severity*50))
			unbuckle_mob(M)
			M.Paralyze(40)
			M.visible_message(span_boldwarning("[M] is thrown off of [src]!"))
	flash_act(affect_silicon = 1)

/mob/living/silicon/bullet_act(obj/projectile/Proj, def_zone)
	SEND_SIGNAL(src, COMSIG_ATOM_BULLET_ACT, Proj, def_zone)
	if((Proj.damage_type == BRUTE || Proj.damage_type == BURN))
		adjustBruteLoss(Proj.damage)
		if(prob(Proj.damage*1.5))
			for(var/mob/living/M in buckled_mobs)
				M.visible_message(span_boldwarning("[M] is knocked off of [src]!"))
				unbuckle_mob(M)
				M.Paralyze(40)
	if(Proj.stun || Proj.knockdown || Proj.paralyze)
		for(var/mob/living/M in buckled_mobs)
			unbuckle_mob(M)
			M.visible_message(span_boldwarning("[M] is knocked off of [src] by the [Proj]!"))
	Proj.on_hit(src)
	return BULLET_ACT_HIT

/mob/living/silicon/flash_act(intensity = 1, override_blindness_check = 0, affect_silicon = 0, visual = 0, type = /atom/movable/screen/fullscreen/flash/static)
	if(affect_silicon)
		return ..()

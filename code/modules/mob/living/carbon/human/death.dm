/mob/living/carbon/human/gib_animation()
	new /obj/effect/temp_visual/gib_animation(loc, "gibbed-h")

/mob/living/carbon/human/dust_animation()
	new /obj/effect/temp_visual/dust_animation(loc, "dust-h")

/mob/living/carbon/human/spawn_gibs(with_bodyparts)
	if(with_bodyparts)
		new /obj/effect/gibspawner/human(drop_location(), src, get_static_viruses())
	else
		new /obj/effect/gibspawner/human/bodypartless(drop_location(), src, get_static_viruses())

/mob/living/carbon/human/spawn_dust(just_ash = FALSE)
	if(just_ash)
		for(var/i in 1 to 5)
			new /obj/item/ash(loc)
	else
		new /obj/effect/decal/remains/human(loc)

/proc/rogueviewers(range, object)
	. = list(viewers(range, object))
	if(isliving(object))
		var/mob/living/LI = object
		for(var/mob/living/L in .)
			if(!L.can_see_cone(LI))
				. -= L
			if(HAS_TRAIT(L, TRAIT_BLIND))
				. -= L

/mob/living/carbon/human/death(gibbed)
	if(stat == DEAD)
		return

	var/area/A = get_area(src)

	if(client)
		SSdroning.kill_droning(client)
		SSdroning.kill_loop(client)
		SSdroning.kill_rain(client)

	if(mind)
		if(!gibbed)
			var/datum/antagonist/vampirelord/VD = mind.has_antag_datum(/datum/antagonist/vampirelord)
			if(VD)
				dust(just_ash=TRUE,drop_items=TRUE)
				return
		var/datum/antagonist/lich/L = mind.has_antag_datum(/datum/antagonist/lich)
		if (L && !L.out_of_lives)
			if(L.consume_phylactery())
				visible_message(span_warning("[src]'s body begins to shake violently, as eldritch forces begin to whisk them away!"))
				to_chat(src, span_userdanger("Death is not the end for me. I begin to rise again."))
				playsound(src, 'sound/magic/antimagic.ogg', 100, FALSE)
				gibbed = FALSE
			else
				to_chat(src, span_userdanger("No, NO! This cannot be!"))
				L.out_of_lives = TRUE
				gib()
				return

	if(!gibbed)
		var/datum/antagonist/zombie/zomble = mind?.has_antag_datum(/datum/antagonist/zombie)
		if(zomble)
			addtimer(CALLBACK(zomble, TYPE_PROC_REF(/datum/antagonist/zombie, wake_zombie)), 5 SECONDS)
		else if(can_death_zombify(src))
			zombie_check()

	if(client || mind)
		SSticker.deaths++

	stop_sound_channel(CHANNEL_HEARTBEAT)
	var/obj/item/organ/heart/H = getorganslot(ORGAN_SLOT_HEART)
	if(H)
		H.beat = BEAT_NONE

	if(!mob_timers["deathdied"])
		mob_timers["deathdied"] = world.time
		var/tris2take = 0
		if(istype(A, /area/rogue/indoors/town/cell))
			tris2take += -2
//		else
//			if(get_triumphs() > 0)
//				tris2take += -1
		if(H in SStreasury.bank_accounts)
			for(var/obj/structure/roguemachine/camera/C in view(7, src))
				var/area_name = A.name
				var/texty = "<CENTER><B>Death of a Living Being</B><br>---<br></CENTER>"
				texty += "[real_name] perished in front of face #[C.number] ([area_name]) at [station_time_timestamp("hh:mm")]."
				SSroguemachine.death_queue += texty
				break

		var/yeae = TRUE
		if(buckled)
			if(istype(buckled, /obj/structure/fluff/psycross))
				if(real_name in GLOB.excommunicated_players)
					yeae = FALSE
					tris2take += -2
				if(real_name in GLOB.outlawed_players)
					yeae = FALSE

		if(get_triumphs() > 0)
			if(tris2take)
				adjust_triumphs(tris2take)
			else
				adjust_triumphs(-1)

		switch(job)
			if("King")
				//omen gets added separately, after a few minutes
				for(var/mob/living/carbon/human/HU in GLOB.player_list)
					if(!HU.stat && is_in_roguetown(HU))
						HU.playsound_local(get_turf(HU), 'sound/music/lorddeath.ogg', 80, FALSE, pressure_affected = FALSE)
			if("Priest")
				addomen(OMEN_NOPRIEST)
//		if(yeae)
//			if(mind)
//				if((mind.assigned_role == "Lord") || (mind.assigned_role == "Priest") || (mind.assigned_role == "Retinue Captain") || (mind.assigned_role == "Merchant"))
//					addomen(OMEN_NOBLEDEATH)

		if(!gibbed && yeae)
			for(var/mob/living/carbon/human/HU in viewers(7, src))
				if(HU.marriedto == src)
					HU.adjust_triumphs(-1)

	. = ..()

	dizziness = 0
	jitteriness = 0

	if(ismecha(loc))
		var/obj/mecha/M = loc
		if(M.occupant == src)
			M.go_out()

	dna.species.spec_death(gibbed, src)

	if(SSticker.HasRoundStarted())
		SSblackbox.ReportDeath(src)
		log_message("has died (BRUTE: [src.getBruteLoss()], BURN: [src.getFireLoss()], TOX: [src.getToxLoss()], OXY: [src.getOxyLoss()], CLONE: [src.getCloneLoss()])", LOG_ATTACK)
	if(is_devil(src))
		INVOKE_ASYNC(is_devil(src), TYPE_PROC_REF(/datum/antagonist/devil, beginResurrectionCheck), src)

/mob/living/carbon/human/revive(full_heal, admin_revive)
	. = ..()
	if(!.)
		return
	switch(job)
		if("King")
			removeomen(OMEN_NOLORD)
		if("Priest")
			removeomen(OMEN_NOPRIEST)

/mob/living/carbon/human/gib(no_brain, no_organs, no_bodyparts, safe_gib = FALSE)
	for(var/mob/living/carbon/human/CA in viewers(7, src))
		if(CA != src && !HAS_TRAIT(CA, TRAIT_BLIND))
			if(HAS_TRAIT(CA, TRAIT_STEELHEARTED))
				continue
			if(CA.marriedto == src)
				CA.adjust_triumphs(-1)
			CA.add_stress(/datum/stressevent/viewgib)
	return ..()

/mob/living/carbon/human/proc/makeSkeleton()
	ADD_TRAIT(src, TRAIT_DISFIGURED, TRAIT_GENERIC)
	set_species(/datum/species/skeleton)
	return TRUE

/mob/living/carbon/proc/Drain()
	become_husk(CHANGELING_DRAIN)
	ADD_TRAIT(src, TRAIT_BADDNA, CHANGELING_DRAIN)
	blood_volume = 0
	return TRUE

/mob/living/carbon/proc/makeUncloneable()
	ADD_TRAIT(src, TRAIT_BADDNA, MADE_UNCLONEABLE)
	blood_volume = 0
	return TRUE

/proc/can_death_zombify(mob/living/carbon/human)
	return hasomen(OMEN_NOPRIEST) || !is_in_roguetown(human)

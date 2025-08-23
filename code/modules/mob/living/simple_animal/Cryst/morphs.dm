/mob/living/horse/form/talamoon
	name = "Talamoon"
	icon = 'icons/roguetown/mob/monster/werewolf.dmi'
	icon_state = "wwolf_m"
	gender = NEUTER
	base_intents = list(/datum/intent/unarmed/help, /datum/intent/simple/bite/, /datum/intent/unarmed/grab, /datum/intent/simple/wereclaw)
	butcher_results = list(/obj/item/reagent_containers/food/snacks/rogue/meat/steak = 10,
						/obj/item/natural/hide = 10)
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	health = 350
	STASTR = 15
	STAEND = 14
	STASPD = 16
//	obj_damage = 30
//	environment_smash = ENVIRONMENT_SMASH_WALLS
//	attack_sound = BLADEWOOSH_LARGE
//	speak_emote = list("growls")
	defdrain = 20
	canparry = TRUE


/obj/effect/proc_holder/spell/invoked/crystalwyvernbreath //Keeping this here for later....
	name = "Fire Breath"
	desc = "Unleashes a searing line of flames, burning all in its path."
	overlay_state = "sacredflame"
	releasedrain = 50 
	chargedrain = 2
	chargetime = 1 SECONDS
	range = 3
	sound = 'sound/misc/bamf.ogg'
	warnie = "sydwarning"
	movement_interrupt = FALSE
	invocation_type = "none"
	antimagic_allowed = FALSE // This isn't magic, buddy
	chargedloop = /datum/looping_sound/invokefire
	charge_max = 3000
	//recharge_time = 5 MINUTES //will port recharge time later
	miracle = FALSE
	var/delay = 12
	var/strike_delay = 2
	var/damage = 30 //an arcyne bolt on a 5 min cooldown, nothing groundbreaking

/obj/effect/proc_holder/spell/invoked/crystalwyvernbreath/cast(list/targets, mob/user = usr)
	var/turf/T = get_turf(targets[1])
	var/turf/source_turf = get_turf(user)

	if(T.z != user.z)
		revert_cast()
		return FALSE

	var/list/affected_turfs = getline(source_turf, T)
	affected_turfs -= source_turf // Remove caster's turf

	if(get_dist(source_turf, T) > range)
		to_chat(user, span_danger("Too far!"))
		revert_cast()
		return FALSE

	user.visible_message(span_danger("<b>[user] breathes red-hot flame!</b>"), span_notice("<b>I breathe red-hot flame!</b>"))

	for(var/i = 1, i <= min(affected_turfs.len, range), i++) // Respect spell range
		var/turf/affected_turf = affected_turfs[i]
		if(!(affected_turf in view(source_turf)))
			continue
		var/tile_delay = strike_delay * (i - 1) + delay
		new /obj/effect/temp_visual/trap/firebreath(affected_turf, tile_delay)
		addtimer(CALLBACK(src, PROC_REF(ignite), affected_turf), tile_delay)
	return TRUE

/obj/effect/proc_holder/spell/invoked/crystalwyvernbreath/proc/ignite(turf/damage_turf)
	new /obj/effect/temp_visual/firebreath_actual(damage_turf)
	playsound(damage_turf, 'sound/magic/fireball.ogg', 50, TRUE)

	for(var/mob/living/L in damage_turf)
		if(L == usr)
			continue
		L.adjustFireLoss(damage) // Just straight damage, no firestacks or ignite
		to_chat(L, span_userdanger("You're scorched by flames!"))

	new /obj/effect/hotspot(damage_turf) // This is the actual scary part

/obj/effect/temp_visual/trap/firebreath
	icon = 'icons/effects/effects.dmi'
	icon_state = "impact_bullet"
	duration = 10 SECONDS
	layer = MASSIVE_OBJ_LAYER

/obj/effect/temp_visual/firebreath_actual
	icon = 'icons/effects/fire.dmi'
	icon_state = "2"
	light_outer_range = 2
	light_color = "#FF6A00"
	duration = 1 SECONDS

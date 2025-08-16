/datum/intent/shoot/hookclaw
	chargetime = 20 
	chargedrain = 2
	charging_slowdown = 3

/datum/intent/shoot/hookclaw/prewarning()
	if(mastermob)
		mastermob.visible_message(span_warning("[mastermob] prepares the [masteritem]!"))
		//playsound(mastermob, 'sound/weapons/chainfire.ogg', 100, FALSE) 

/datum/intent/shoot/hookclaw/get_chargetime()
	if(mastermob && chargetime)
		var/mob/living/carbon/human/H = mastermob // Assume human; adjust if needed.
		var/newtime = chargetime - (H.STASKL) - (H.STASPD)
		return max(newtime, 1) // Minimum 0.1s to prevent instant.
	return chargetime


// The hookclaw item, modeled after bows (ballistic, no ammo needed)
/obj/item/gun/ballistic/hookclaw
	name = "hookclaw"
	desc = "An ancient mechanical device that fires a chain hook, pulling targets closer or launching you toward walls—like legends of old."
	icon = 'icons/roguetown/weapons/32.dmi' // Adjust to fit your icons; perhaps reuse bow or add custom.
	icon_state = "hookclaw"
	item_state = "hookclaw"
	possible_item_intents = list(/datum/intent/shoot/hookclaw, INTENT_GENERIC)
	slot_flags = ITEM_SLOT_HIP
	w_class = WEIGHT_CLASS_BULKY
	force = 10 // Minor melee whack.
	attack_verb = list("hooked", "yanked")
	associated_skill = /datum/skill/combat/bows // Ties into bow skill for charging.
	var/charging = FALSE
	var/cooldown_time = 30 // 3 seconds; adjust for balance.
	var/range = 15 // Limited range for balance.
	casingless = TRUE // Prevents casing ejection
	rackless = TRUE // Prevents racking message

/obj/item/gun/ballistic/hookclaw/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.7,"sx" = -3,"sy" = 0,"nx" = 6,"ny" = 1,"wx" = -1,"wy" = 1,"ex" = -2,"ey" = 1,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 9,"sturn" = -100,"wturn" = -102,"eturn" = 10,"nflip" = 1,"sflip" = 8,"wflip" = 8,"eflip" = 1)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)
			if("onback")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)


// No magazine or ammo needed; override to skip chamber checks.
/obj/item/gun/ballistic/hookclaw/shoot_with_empty_chamber()
	return

/obj/item/gun/ballistic/hookclaw/process_fire(atom/target, mob/living/user, message = TRUE, params = null, zone_override = "", bonus_spread = 0)
	if(charging)
		to_chat(user, span_warning("The hookclaw is recharging!"))
		return FALSE

	charging = TRUE
	addtimer(CALLBACK(src, .proc/recharge), cooldown_time)

	var/obj/projectile/hookclaw/P = new(get_turf(user))
	P.firer = user
	P.range = range
	P.preparePixelProjectile(target, user, params)
	P.fire()

	user.visible_message(span_danger("[user] fires the hookclaw!"))
	//playsound(user, 'sound/weapons/chainfire.ogg', 50, TRUE) // Adjust sound.

	if(ismob(loc))
		var/mob/M = loc
		M.update_inv_hands()
	return TRUE

/obj/item/gun/ballistic/hookclaw/proc/recharge()
	charging = FALSE
	if(ismob(loc))
		to_chat(loc, span_notice("The hookclaw is ready again."))
		//playsound(loc, 'sound/weapons/chainreel.ogg', 50, TRUE) // Need a reel sound

/obj/projectile/hookclaw
	name = "hook chain"
	icon_state = "hookclaw"
	damage = 5 
	icon = 'icons/effects/effects.dmi'
	damage_type = BRUTE
	nodamage = FALSE
	flag = "bullet"
	range = 15 
	speed = 1
	var/obj/effect/beam/flight_chain

/obj/projectile/hookclaw/Initialize(mapload)
	. = ..()
	if(firer && isturf(firer.loc)) // Only create beam if firer is on a valid turf
		flight_chain = firer.Beam(src, icon_state = "chain", time = 50)
	else
		flight_chain = null

/obj/projectile/hookclaw/Destroy()
	if(flight_chain)
		addtimer(CALLBACK(GLOBAL_PROC, .proc/qdel, flight_chain), 5) // Delay deletion to let timer finish
		flight_chain = null
	. = ..()

/obj/projectile/hookclaw/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(!firer || firer == target || get_dist(firer, target) > range)
		if(flight_chain)
			addtimer(CALLBACK(GLOBAL_PROC, .proc/qdel, flight_chain), 5) 
			flight_chain = null
		return

	if(flight_chain)
		addtimer(CALLBACK(GLOBAL_PROC, .proc/qdel, flight_chain), 5)
		flight_chain = null

	if(ismovable(target))
		var/atom/movable/AM = target
		if(AM.anchored)
			if(isliving(AM))
				to_chat(firer, span_warning("[AM] is bound and cannot be pulled!"))
				return BULLET_ACT_BLOCK // Skip beam creation for anchored livings
			else
				// For anchored non-livings (e.g., trees), create beam and pull firer
				var/obj/effect/beam/chain = firer.Beam(target, icon_state = "chain", time = 50)
				pull_atom(firer, AM, chain)
		else
			// For non-anchored, create beam and pull based on type
			var/obj/effect/beam/chain = firer.Beam(target, icon_state = "chain", time = 50)
			if(isliving(AM))
				var/mob/living/receiver = AM
				var/pull_to_firer = TRUE
				// Check if both firer and receiver are /mob/living and have stats
				if(isliving(firer))
					var/mob/living/L = firer
					if(isturf(receiver.loc) && isturf(L.loc)) // Ensure both are on valid turfs
						if(L.STASTR && receiver.STACON && L.STASTR <= receiver.STACON)
							pull_to_firer = FALSE
				if(pull_to_firer)
					pull_atom(receiver, firer, chain)
				else
					pull_atom(firer, receiver, chain)
			else
				pull_atom(AM, firer, chain)
	else if(target.density)
		// For dense, non-movable targets (e.g., walls), pull firer to target
		var/obj/effect/beam/chain = firer.Beam(target, icon_state = "chain", time = 50)
		pull_atom(firer, target, chain)

/obj/projectile/hookclaw/proc/pull_atom(atom/movable/pulling, atom/pull_to, obj/effect/beam/chain)
	if(pulling.anchored)
		to_chat(firer, span_warning("[pulling] cannot be moved!"))
		if(chain)
			addtimer(CALLBACK(GLOBAL_PROC, .proc/qdel, chain), 5) // Delay deletion to let timer finish
		return

	var/dist = get_dist(pulling, pull_to)
	if(dist <= 1)
		if(chain)
			addtimer(CALLBACK(GLOBAL_PROC, .proc/qdel, chain), 5) // Delay deletion to let timer finish
		return

	pulling.visible_message(span_danger("[pulling] is yanked by the hook chain!"))

	var/turf/throw_target = get_turf(pull_to)
	pulling.throw_at(throw_target, dist, 2, firer, spin = FALSE)

	// Monitor throw to clean up beam when object reaches destination
	spawn()
		while(pulling.throwing && chain && !QDELETED(chain))
			sleep(1)
		if(chain)
			addtimer(CALLBACK(GLOBAL_PROC, .proc/qdel, chain), 5) // Delay deletion to let timer finish

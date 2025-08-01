/obj/projectile/magic
	name = "bolt of nothing"
	icon_state = "energy"
	damage = 0
	damage_type = OXY
	nodamage = TRUE
	armor_penetration = 100
	pass_flags = PASSTABLE | PASSGRILLE
	flag = "magic"
	var/explode_sound = list('sound/misc/explode/incendiary (1).ogg','sound/misc/explode/incendiary (2).ogg')
	var/damage_multiplier = 1  // Default multiplier for damage
	var/temperature = 310.15

/obj/projectile/magic/on_hit(atom/target, blocked = 0) //shameless copypasta from the temperature gun
	. = ..()
	if(isliving(target))
		var/mob/living/L = target
		L.adjust_bodytemperature(((100-blocked)/100)*(temperature - L.bodytemperature))

/obj/projectile/magic/death
	name = "bolt of death"
	icon_state = "pulse1_bl"

/obj/projectile/magic/death/on_hit(target)
	. = ..()
	if(ismob(target))
		var/mob/M = target
		if(M.anti_magic_check())
			M.visible_message(span_warning("[src] vanishes on contact with [target]!"))
			return BULLET_ACT_BLOCK
		if(isliving(M))
			var/mob/living/L = M
			if(L.mob_biotypes & MOB_UNDEAD) //negative energy heals the undead
				if(L.hellbound && L.stat == DEAD)
					return BULLET_ACT_BLOCK
				if(L.revive(full_heal = TRUE, admin_revive = TRUE))
					L.grab_ghost(force = TRUE) // even suicides
					to_chat(L, span_notice("I rise with a start, you're undead!!!"))
				else if(L.stat != DEAD)
					to_chat(L, span_notice("I feel great!"))
			else
				L.death(0)
		else
			M.death(0)

/obj/projectile/magic/resurrection
	name = "bolt of resurrection"
	icon_state = "ion"
	damage = 0
	damage_type = OXY
	nodamage = TRUE

/obj/projectile/magic/resurrection/on_hit(mob/living/carbon/target)
	. = ..()
	if(isliving(target))
		if(target.anti_magic_check())
			target.visible_message(span_warning("[src] vanishes on contact with [target]!"))
			return BULLET_ACT_BLOCK
		if(target.mob_biotypes & MOB_UNDEAD) //positive energy harms the undead
			target.death(0)
		else
			if(target.hellbound && target.stat == DEAD)
				return BULLET_ACT_BLOCK
			if(target.revive(full_heal = TRUE, admin_revive = TRUE))
				target.grab_ghost(force = TRUE) // even suicides
				to_chat(target, span_notice("I rise with a start, you're alive!!!"))
			else if(target.stat != DEAD)
				to_chat(target, span_notice("I feel great!"))

/obj/projectile/magic/teleport
	name = "bolt of teleportation"
	icon_state = "bluespace"
	damage = 0
	damage_type = OXY
	nodamage = TRUE
	var/inner_tele_radius = 0
	var/outer_tele_radius = 6

/obj/projectile/magic/teleport/on_hit(mob/target)
	. = ..()
	if(ismob(target))
		var/mob/M = target
		if(M.anti_magic_check())
			M.visible_message(span_warning("[src] fizzles on contact with [target]!"))
			return BULLET_ACT_BLOCK
	var/teleammount = 0
	var/teleloc = target
	if(!isturf(target))
		teleloc = target.loc
	for(var/atom/movable/stuff in teleloc)
		if(!stuff.anchored && stuff.loc && !isobserver(stuff))
			if(do_teleport(stuff, stuff, 10, channel = TELEPORT_CHANNEL_MAGIC))
				teleammount++
				var/datum/effect_system/smoke_spread/smoke = new
				smoke.set_up(max(round(4 - teleammount),0), stuff.loc) //Smoke drops off if a lot of stuff is moved for the sake of sanity
				smoke.start()

/obj/projectile/magic/safety
	name = "bolt of safety"
	icon_state = "bluespace"
	damage = 0
	damage_type = OXY
	nodamage = TRUE

/obj/projectile/magic/safety/on_hit(atom/target)
	. = ..()
	if(ismob(target))
		var/mob/M = target
		if(M.anti_magic_check())
			M.visible_message(span_warning("[src] fizzles on contact with [target]!"))
			return BULLET_ACT_BLOCK
	if(isturf(target))
		return BULLET_ACT_HIT

	var/turf/origin_turf = get_turf(target)
	var/turf/destination_turf = find_safe_turf()

	if(do_teleport(target, destination_turf, channel=TELEPORT_CHANNEL_MAGIC))
		for(var/t in list(origin_turf, destination_turf))
			var/datum/effect_system/smoke_spread/smoke = new
			smoke.set_up(0, t)
			smoke.start()

/obj/projectile/magic/door
	name = "bolt of door creation"
	icon_state = "energy"
	damage = 0
	damage_type = OXY
	nodamage = TRUE
	var/list/door_types = list(/obj/structure/mineral_door/wood, /obj/structure/mineral_door/iron, /obj/structure/mineral_door/silver, /obj/structure/mineral_door/gold, /obj/structure/mineral_door/uranium, /obj/structure/mineral_door/sandstone, /obj/structure/mineral_door/transparent/plasma, /obj/structure/mineral_door/transparent/diamond)

/obj/projectile/magic/door/on_hit(atom/target)
	. = ..()
	if(istype(target, /obj/machinery/door))
		OpenDoor(target)
	else
		var/turf/T = get_turf(target)
		if(isclosedturf(T) && !isindestructiblewall(T))
			CreateDoor(T)

/obj/projectile/magic/door/proc/CreateDoor(turf/T)
	var/door_type = pick(door_types)
	var/obj/structure/mineral_door/D = new door_type(T)
	T.ChangeTurf(/turf/open/floor/plating, flags = CHANGETURF_INHERIT_AIR)
	D.Open()

/obj/projectile/magic/door/proc/OpenDoor(obj/machinery/door/D)
	if(istype(D, /obj/machinery/door/airlock))
		var/obj/machinery/door/airlock/A = D
		A.locked = FALSE
	D.open()

/obj/projectile/magic/change
	name = "bolt of change"
	icon_state = "ice_1"
	damage = 0
	damage_type = BURN
	nodamage = TRUE

/obj/projectile/magic/change/on_hit(atom/change)
	. = ..()
	if(ismob(change))
		var/mob/M = change
		if(M.anti_magic_check())
			M.visible_message(span_warning("[src] fizzles on contact with [M]!"))
			qdel(src)
			return BULLET_ACT_BLOCK
	wabbajack(change)
	qdel(src)

/proc/wabbajack(mob/living/M)
	if(!istype(M) || M.stat == DEAD || M.notransform || (GODMODE & M.status_flags))
		return

	M.notransform = TRUE
	M.mobility_flags = NONE
	M.icon = null
	M.cut_overlays()
	M.invisibility = INVISIBILITY_ABSTRACT

	var/list/contents = M.contents.Copy()

	if(iscyborg(M))
		var/mob/living/silicon/robot/Robot = M
		if(Robot.mmi)
			qdel(Robot.mmi)
		Robot.notify_ai(NEW_BORG)
	else
		for(var/obj/item/W in contents)
			if(!M.dropItemToGround(W))
				qdel(W)

	var/mob/living/new_mob

	var/randomize = pick("monkey","robot","slime","xeno","humanoid","animal")
	switch(randomize)
		if("monkey")
			new_mob = new /mob/living/carbon/monkey(M.loc)

		if("robot")
			var/robot = pick(200;/mob/living/silicon/robot,
							/mob/living/silicon/robot/modules/syndicate,
							/mob/living/silicon/robot/modules/syndicate/medical,
							/mob/living/silicon/robot/modules/syndicate/saboteur,
							200;/mob/living/simple_animal/drone/polymorphed)
			new_mob = new robot(M.loc)
			if(issilicon(new_mob))
				new_mob.gender = M.gender
				new_mob.invisibility = 0
				new_mob.job = "Cyborg"
				var/mob/living/silicon/robot/Robot = new_mob
				Robot.lawupdate = FALSE
				Robot.connected_ai = null
				Robot.mmi.transfer_identity(M)	//Does not transfer key/client.
				Robot.clear_inherent_laws(0)
				Robot.clear_zeroth_law(0)

		if("slime")
			new_mob = new /mob/living/simple_animal/slime/random(M.loc)

		if("xeno")
			var/Xe
			if(M.ckey)
				Xe = pick(/mob/living/carbon/alien/humanoid/hunter,/mob/living/carbon/alien/humanoid/sentinel)
			else
				Xe = pick(/mob/living/carbon/alien/humanoid/hunter,/mob/living/simple_animal/hostile/alien/sentinel)
			new_mob = new Xe(M.loc)

		if("animal")
			var/path = pick(/mob/living/simple_animal/hostile/carp,
							/mob/living/simple_animal/hostile/bear,
							/mob/living/simple_animal/hostile/mushroom,
							/mob/living/simple_animal/hostile/statue,
							/mob/living/simple_animal/hostile/retaliate/bat,
							/mob/living/simple_animal/hostile/retaliate/goat,
							/mob/living/simple_animal/hostile/killertomato,
							/mob/living/simple_animal/hostile/poison/giant_spider,
							/mob/living/simple_animal/hostile/poison/giant_spider/hunter,
							/mob/living/simple_animal/hostile/blob/blobbernaut/independent,
							/mob/living/simple_animal/hostile/carp/ranged,
							/mob/living/simple_animal/hostile/carp/ranged/chaos,
							/mob/living/simple_animal/hostile/asteroid/basilisk/watcher,
							/mob/living/simple_animal/hostile/asteroid/goliath/beast,
							/mob/living/simple_animal/hostile/headcrab,
							/mob/living/simple_animal/hostile/morph,
							/mob/living/simple_animal/hostile/stickman,
							/mob/living/simple_animal/hostile/stickman/dog,
							/mob/living/simple_animal/hostile/megafauna/dragon/lesser,
							/mob/living/simple_animal/hostile/gorilla,
							/mob/living/simple_animal/parrot,
							/mob/living/simple_animal/pet/dog/corgi,
							/mob/living/simple_animal/crab,
							/mob/living/simple_animal/pet/dog/pug,
							/mob/living/simple_animal/pet/cat,
							/mob/living/simple_animal/mouse,
							/mob/living/simple_animal/chicken,
							/mob/living/simple_animal/cow,
							/mob/living/simple_animal/hostile/lizard,
							/mob/living/simple_animal/pet/fox,
							/mob/living/simple_animal/butterfly,
							/mob/living/simple_animal/pet/cat/cak,
							/mob/living/simple_animal/chick)
			new_mob = new path(M.loc)

		if("humanoid")
			new_mob = new /mob/living/carbon/human(M.loc)

			if(prob(50))
				var/list/chooseable_races = list()
				for(var/speciestype in subtypesof(/datum/species))
					var/datum/species/S = speciestype
					if(initial(S.changesource_flags) & WABBAJACK)
						chooseable_races += speciestype

				if(chooseable_races.len)
					new_mob.set_species(pick(chooseable_races))

			var/datum/preferences/A = new()	//Randomize appearance for the human
			A.copy_to(new_mob, icon_updates=0)

			var/mob/living/carbon/human/H = new_mob
			H.update_body()
			H.update_hair()
			H.update_body_parts()
			H.dna.update_dna_identity()

	if(!new_mob)
		return
	new_mob.grant_language(/datum/language/common)

	// Some forms can still wear some items
	for(var/obj/item/W in contents)
		new_mob.equip_to_appropriate_slot(W)

	M.log_message("became [new_mob.real_name]", LOG_ATTACK, color="orange")

	new_mob.a_intent = INTENT_HARM

	M.wabbajack_act(new_mob)

	to_chat(new_mob, span_warning("My form morphs into that of a [randomize]."))

	var/poly_msg = get_policy(POLICY_POLYMORPH)
	if(poly_msg)
		to_chat(new_mob, poly_msg)

	M.transfer_observers_to(new_mob)

	qdel(M)
	return new_mob

/obj/projectile/magic/animate
	name = "bolt of animation"
	icon_state = "red_1"
	damage = 0
	damage_type = BURN
	nodamage = TRUE

/obj/projectile/magic/animate/on_hit(atom/target, blocked = FALSE)
	var/mob/living/carbon/human/caster = firer
	caster.rogstam_add(-120)	//Remove even more stam for this cast, couldnt be handled by releasedrain due to fatigue crit
	target.animate_atom_living(firer)
	..()

/atom/proc/animate_atom_living(mob/living/owner = null)
	if((isitem(src) || istype(src, /obj/structure/closet/crate/chest) || istype(src, /obj/structure/handcart ) || istype(src, /obj/structure/chair/wood/rogue )) && !is_type_in_list(src, GLOB.protected_objects))
		if(istype(src, /obj/structure/statue/petrified))
			var/obj/structure/statue/petrified/P = src
			if(P.petrified_mob)
				var/mob/living/L = P.petrified_mob
				var/mob/living/simple_animal/hostile/statue/S = new(P.loc, owner)
				S.name = "statue of [L.name]"
				if(owner)
					S.faction = list("[REF(owner)]")
				S.icon = P.icon
				S.icon_state = P.icon_state
				S.copy_overlays(P, TRUE)
				S.color = P.color
				S.atom_colours = P.atom_colours.Copy()
				if(L.mind)
					L.mind.transfer_to(S)
					if(owner)
						to_chat(S, span_danger("I are an animate statue. You cannot move when monitored, but are nearly invincible and deadly when unobserved! Do not harm [owner], my creator."))
				P.forceMove(S)
				return
		else
			var/obj/O = src
			if(istype(O, /obj/item/gun))
				new /mob/living/simple_animal/hostile/mimic/copy/ranged(loc, src, owner)
			else
				new /mob/living/simple_animal/hostile/mimic/copy(loc, src, owner)

	else if(istype(src, /mob/living/simple_animal/hostile/mimic/copy))
		// Change our allegiance!
		var/mob/living/simple_animal/hostile/mimic/copy/C = src
		if(owner)
			C.ChangeOwner(owner)

/obj/projectile/magic/spellblade
	name = "blade energy"
	icon_state = "lavastaff"
	damage = 15
	damage_type = BURN
	flag = "magic"
	dismemberment = 50
	nodamage = FALSE

/obj/projectile/magic/spellblade/on_hit(target)
	if(ismob(target))
		var/mob/M = target
		if(M.anti_magic_check())
			M.visible_message(span_warning("[src] vanishes on contact with [target]!"))
			qdel(src)
			return BULLET_ACT_BLOCK
	. = ..()

/obj/projectile/magic/arcane_barrage
	name = "arcane bolt"
	icon_state = "arcane_barrage"
	damage = 20
	damage_type = BURN
	nodamage = FALSE
	armor_penetration = 0
	flag = "magic"
	hitsound = 'sound/blank.ogg'

/obj/projectile/magic/arcane_barrage/on_hit(target)
	if(ismob(target))
		var/mob/M = target
		if(M.anti_magic_check())
			M.visible_message(span_warning("[src] vanishes on contact with [target]!"))
			qdel(src)
			return BULLET_ACT_BLOCK
	. = ..()


/obj/projectile/magic/locker
	name = "locker bolt"
	icon_state = "locker"
	nodamage = TRUE
	flag = "magic"
	var/weld = TRUE
	var/created = FALSE //prevents creation of more then one locker if it has multiple hits
	var/locker_suck = TRUE
	var/obj/structure/closet/locker_temp_instance = /obj/structure/closet/decay

/obj/projectile/magic/locker/Initialize()
	. = ..()
	locker_temp_instance = new(src)

/obj/projectile/magic/locker/prehit(atom/A)
	if(isliving(A) && locker_suck)
		var/mob/living/M = A
		if(M.anti_magic_check())
			M.visible_message(span_warning("[src] vanishes on contact with [A]!"))
			qdel(src)
			return
		if(!locker_temp_instance.insertion_allowed(M))
			return ..()
		M.forceMove(src)
		return FALSE
	return ..()

/obj/projectile/magic/locker/on_hit(target)
	if(created)
		return ..()
	if(LAZYLEN(contents))
		for(var/atom/movable/AM in contents)
			locker_temp_instance.insert(AM)
		locker_temp_instance.welded = weld
		locker_temp_instance.update_icon()
	created = TRUE
	return ..()

/obj/projectile/magic/locker/Destroy()
	locker_suck = FALSE
	for(var/atom/movable/AM in contents)
		AM.forceMove(get_turf(src))
	. = ..()

/obj/structure/closet/decay
	breakout_time = 600
	icon_welded = null
	var/magic_icon = "cursed"
	var/weakened_icon = "decursed"
	var/auto_destroy = TRUE

/obj/structure/closet/decay/Initialize()
	. = ..()
	if(auto_destroy)
		addtimer(CALLBACK(src, PROC_REF(bust_open)), 5 MINUTES)
	addtimer(CALLBACK(src, PROC_REF(magicly_lock)), 5)

/obj/structure/closet/decay/proc/magicly_lock()
	if(!welded)
		return
	icon_state = magic_icon
	update_icon()

/obj/structure/closet/decay/after_weld(weld_state)
	if(weld_state)
		unmagify()

/obj/structure/closet/decay/proc/decay()
	animate(src, alpha = 0, time = 30)
	addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(qdel), src), 30)

/obj/structure/closet/decay/open(mob/living/user)
	. = ..()
	if(.)
		if(icon_state == magic_icon) //check if we used the magic icon at all before giving it the lesser magic icon
			unmagify()
		else
			addtimer(CALLBACK(src, PROC_REF(decay)), 15 SECONDS)

/obj/structure/closet/decay/proc/unmagify()
	icon_state = weakened_icon
	update_icon()
	addtimer(CALLBACK(src, PROC_REF(decay)), 15 SECONDS)
	icon_welded = "welded"

/obj/projectile/magic/flying
	name = "bolt of flying"
	icon_state = "flight"

/obj/projectile/magic/flying/on_hit(target)
	. = ..()
	if(isliving(target))
		var/mob/living/L = target
		if(L.anti_magic_check())
			L.visible_message(span_warning("[src] vanishes on contact with [target]!"))
			return BULLET_ACT_BLOCK
		var/atom/throw_target = get_edge_target_turf(L, angle2dir(Angle))
		L.throw_at(throw_target, 200, 4)

/obj/projectile/magic/bounty
	name = "bolt of bounty"
	icon_state = "bounty"

/obj/projectile/magic/bounty/on_hit(target)
	. = ..()
	if(isliving(target))
		var/mob/living/L = target
		if(L.anti_magic_check() || !firer)
			L.visible_message(span_warning("[src] vanishes on contact with [target]!"))
			return BULLET_ACT_BLOCK
		L.apply_status_effect(STATUS_EFFECT_BOUNTY, firer)

/obj/projectile/magic/antimagic
	name = "bolt of antimagic"
	icon_state = "antimagic"

/obj/projectile/magic/antimagic/on_hit(target)
	. = ..()
	if(isliving(target))
		var/mob/living/L = target
		if(L.anti_magic_check())
			L.visible_message(span_warning("[src] vanishes on contact with [target]!"))
			return BULLET_ACT_BLOCK
		L.apply_status_effect(STATUS_EFFECT_ANTIMAGIC)

/obj/projectile/magic/fetch
	name = "bolt of fetching"
	icon_state = "cursehand0"
	range = 15

/obj/projectile/magic/fetch/on_hit(target)
	. = ..()
	var/atom/throw_target = get_step(firer, get_dir(firer, target))
	if(isliving(target))
		var/mob/living/L = target
		if(L.anti_magic_check() || !firer)
			L.visible_message(span_warning("[src] vanishes on contact with [target]!"))
			return BULLET_ACT_BLOCK
		L.throw_at(throw_target, 200, 4)
	else
		if(isitem(target))
			var/obj/item/I = target
			var/mob/living/carbon/human/carbon_firer
			if (ishuman(firer))
				carbon_firer = firer
				if (carbon_firer?.can_catch_item())
					throw_target = get_turf(firer)
			I.throw_at(throw_target, 200, 4)

/obj/projectile/magic/sickness
	name = "Bolt of Sickness"
	icon_state = "xray"
	damage = 10
	damage_type = BURN
	flag = "magic"
	range = 15

/obj/projectile/magic/sickness/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(iscarbon(target))
		var/mob/living/carbon/M = target
		M.reagents.add_reagent(/datum/reagent/toxin, 3)

/obj/projectile/magic/sapping
	name = "bolt of sapping"
	icon_state = "sapping"

/obj/projectile/magic/sapping/on_hit(target)
	. = ..()
	if(ismob(target))
		var/mob/M = target
		if(M.anti_magic_check())
			M.visible_message(span_warning("[src] vanishes on contact with [target]!"))
			return BULLET_ACT_BLOCK
		SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, src, /datum/mood_event/sapped)

/obj/projectile/magic/necropotence
	name = "bolt of necropotence"
	icon_state = "necropotence"

/obj/projectile/magic/necropotence/on_hit(target)
	. = ..()
	if(isliving(target))
		var/mob/living/L = target
		if(L.anti_magic_check() || !L.mind || !L.mind.hasSoul)
			L.visible_message(span_warning("[src] vanishes on contact with [target]!"))
			return BULLET_ACT_BLOCK
		to_chat(L, span_danger("My body feels drained and there is a burning pain in my chest."))
		L.maxHealth -= 20
		L.health = min(L.health, L.maxHealth)
		if(L.maxHealth <= 0)
			to_chat(L, span_danger("My weakened soul is completely consumed by the [src]!"))
			L.mind.hasSoul = FALSE
		for(var/obj/effect/proc_holder/spell/spell in L.mind.spell_list)
			spell.charge_counter = spell.charge_max
			spell.recharging = FALSE
			spell.update_icon()

/obj/projectile/magic/wipe
	name = "bolt of possession"
	icon_state = "wipe"

/obj/projectile/magic/wipe/on_hit(target)
	. = ..()
	if(iscarbon(target))
		var/mob/living/carbon/M = target
		if(M.anti_magic_check())
			M.visible_message(span_warning("[src] vanishes on contact with [target]!"))
			return BULLET_ACT_BLOCK
		for(var/x in M.get_traumas())//checks to see if the victim is already going through possession
			if(istype(x, /datum/brain_trauma/special/imaginary_friend/trapped_owner))
				M.visible_message(span_warning("[src] vanishes on contact with [target]!"))
				return BULLET_ACT_BLOCK
		to_chat(M, span_warning("My mind has been opened to possession!"))
		possession_test(M)
		return BULLET_ACT_HIT

/obj/projectile/magic/wipe/proc/possession_test(mob/living/carbon/M)
	var/datum/brain_trauma/special/imaginary_friend/trapped_owner/trauma = M.gain_trauma(/datum/brain_trauma/special/imaginary_friend/trapped_owner)
	var/poll_message = "Do you want to play as [M.real_name]?"
	if(M.mind && M.mind.assigned_role)
		poll_message = "[poll_message] Job:[M.mind.assigned_role]."
	if(M.mind && M.mind.special_role)
		poll_message = "[poll_message] Status:[M.mind.special_role]."
	else if(M.mind)
		var/datum/antagonist/A = M.mind.has_antag_datum(/datum/antagonist/)
		if(A)
			poll_message = "[poll_message] Status:[A.name]."
	var/list/mob/dead/observer/candidates = pollCandidatesForMob(poll_message, ROLE_PAI, null, FALSE, 100, M)
	if(M.stat == DEAD)//boo.
		return
	if(LAZYLEN(candidates))
		var/mob/dead/observer/C = pick(candidates)
		to_chat(M, span_boldnotice("I have been noticed by a ghost and it has possessed you!"))
		var/oldkey = M.key
		M.ghostize(0)
		M.key = C.key
		trauma.friend.key = oldkey
		trauma.friend.reset_perspective(null)
		trauma.friend.Show()
		trauma.friend_initialized = TRUE
	else
		to_chat(M, span_notice("My mind has managed to go unnoticed in the spirit world."))
		qdel(trauma)

/obj/projectile/magic/aoe
	name = "Area Bolt"
	desc = ""
	damage = 0
	var/aoe_range = 0
	var/proxdet = TRUE

/obj/projectile/magic/aoe/Range()
	if(proxdet)
		for(var/mob/living/L in range(aoe_range, get_turf(src)))
			if(L.stat != DEAD && L != firer && !L.anti_magic_check())
				return Bump(L)
	..()

/obj/projectile/magic/aoe/lightning
	name = "lightning bolt"
	icon_state = "tesla_projectile"	//Better sprites are REALLY needed and appreciated!~
	damage = 15
	damage_type = BURN
	nodamage = FALSE
	speed = 0.3
	flag = "magic"
	light_color = "#ffffff"
	light_range = 2

	var/tesla_power = 20000
	var/tesla_range = 15
	var/tesla_flags = TESLA_MOB_DAMAGE | TESLA_MOB_STUN | TESLA_OBJ_DAMAGE
	var/chain
	var/mob/living/caster

/obj/projectile/magic/aoe/lightning/fire(setAngle)
	if(caster)
		chain = caster.Beam(src, icon_state = "lightning[rand(1, 12)]", time = INFINITY, maxdistance = INFINITY)
	..()

/obj/projectile/magic/aoe/lightning/on_hit(target)
	. = ..()
	if(ismob(target))
		var/mob/M = target
		if(M.anti_magic_check())
			visible_message(span_warning("[src] fizzles on contact with [target]!"))
			qdel(src)
			return BULLET_ACT_BLOCK
	tesla_zap(src, tesla_range, tesla_power, tesla_flags)
	qdel(src)

/obj/projectile/magic/aoe/lightning/Destroy()
	qdel(chain)
	. = ..()

/obj/projectile/magic/aoe/fireball
	name = "bolt of fireball"
	icon_state = "fireball"
	damage = 10
	damage_type = BRUTE
	nodamage = FALSE
	light_color = "#f8af07"
	light_range = 2

	//explosion values
	var/exp_devi = -1
	var/exp_heavy = 0
	var/exp_light = 2
	var/exp_flash = 3
	var/exp_fire = 2
	var/exp_hotspot = 0

/obj/projectile/magic/aoe/fireball/on_hit(target)
	. = ..()
	if(ismob(target))
		var/mob/living/M = target
		if(M.anti_magic_check())
			visible_message(span_warning("[src] vanishes into smoke on contact with [target]!"))
			return BULLET_ACT_BLOCK
		M.adjust_fire_stacks(6)
//		M.take_overall_damage(0,10) //between this 10 burn, the 10 brute, the explosion brute, and the onfire burn, my at about 65 damage if you stop drop and roll immediately
	var/turf/T
	if(isturf(target))
		if(isclosedturf(target))
			var/hitdevi = 0
			var/hitheavy = 0
			var/hitlight = 0
			if(exp_devi > 0)
				hitdevi = 1
			if(exp_heavy > 0)
				hitheavy = 1
			if(exp_light > 0)
				hitlight = 1
			explosion(get_turf(target), hitdevi, hitheavy, hitlight, 0, 0, 0, visfx = "firespark", soundin = null)
			var/datum/point/vector/previous = trajectory.return_vector_after_increments(1,-1)
			T = previous.return_turf()
			explosion(T, exp_devi, exp_heavy, exp_light, exp_flash, 0, flame_range = exp_fire, hotspot_range = exp_hotspot, soundin = explode_sound)
			return TRUE
		else
			T = target
	else
		T = get_turf(target)
	explosion(T, exp_devi, exp_heavy, exp_light, exp_flash, 0, flame_range = exp_fire, hotspot_range = exp_hotspot, soundin = explode_sound)

/obj/projectile/magic/aoe/fireball/infernal
	name = "infernal fireball"
	exp_heavy = -1
	exp_light = -1
	exp_flash = 4
	exp_fire= 5

/obj/projectile/magic/aoe/fireball/infernal/on_hit(target)
	. = ..()
	if(ismob(target))
		var/mob/living/M = target
		if(M.anti_magic_check())
			return BULLET_ACT_BLOCK
	var/turf/T = get_turf(target)
	for(var/i=0, i<50, i+=10)
		addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(explosion), T, -1, exp_heavy, exp_light, exp_flash, FALSE, FALSE, exp_fire), i)

//still magic related, but a different path

/obj/projectile/temp/chill
	name = "bolt of chills"
	icon_state = "ice_2"
	damage = 0
	damage_type = BURN
	nodamage = FALSE
	armor_penetration = 100
	temperature = 50
	flag = "magic"

/obj/projectile/magic/water
	name = "bolt of water"
	icon_state = "ice_2"
	flag = "magic"
	var/area_of_effect = 1

/obj/projectile/magic/water/on_hit(target)
	. = ..()
	var/obj/item/reagent_containers/K = new /obj/item/reagent_containers/glass/bucket/wooden/spell_water(get_turf(target))
	var/turf/T = get_turf(target)

	playsound(target, 'sound/foley/waterenter.ogg', 100, FALSE)

	if(ismob(target))	//Hit a person
		var/mob/living/mob_target = target			//Get person hit
		K.reagents.reaction(mob_target, TOUCH)		//Touch the person with water reagent (extinguish fires)
		mob_target.Slowdown(10)						//Slowdown the person
		mob_target.log_message("has been hit by a water bolt from [key_name(src)]", LOG_ATTACK)	//Log it

	else	//Hit anything else
		for(var/turf/affected_turf in view(area_of_effect, T))		//Loop through all turf tiles in 3x3 grid of hit area
			for(var/obj/effect/decal/cleanable/C in affected_turf)	//Loop through all cleanable decals in current turf examined
				qdel(C)												//Delete the cleanable object
		for(var/obj/structure/soil/affected_soil in view(area_of_effect, T))	//Loop again to check for all soil structures in 3x3 grid of hit area
			affected_soil.adjust_water(150)										//Adjust water for those soil plants
	qdel(K)		//Delete the water regeant


/obj/projectile/magic/frogprince
	name = "bolt of amphibius"
	icon_state = "frogprince"
	damage = 0
	damage_type = STAMINA
	nodamage = TRUE
	flag = "magic"

/obj/projectile/magic/frogprince/on_hit(target)
	. = ..()
	if(istype(target, /mob/living/carbon/human))	
		turn_human_into_frog(target)

/obj/projectile/magic/frogprince/proc/turn_human_into_frog(mob/living/carbon/human/H)
	if(!ishuman(H))
		return FALSE

	H.unequip_everything()
	
	var/mob/living/simple_animal/hostile/retaliate/frog/human_frog/F = new /mob/living/simple_animal/hostile/retaliate/frog/human_frog(loc = H.loc)
	
	F.original_name = H.name
	F.name = "frog"
	F.original_mind = H.mind
	F.original_ckey = H.ckey
	F.original_human = H
	
	if(H.mind)
		H.mind.transfer_to(F)
	
	H.forceMove(F)
	H.status_flags |= GODMODE
	H.alpha = 0
	
	var/datum/effect_system/spark_spread/magic = new
	magic.set_up(8, 0, F)
	magic.start()
	
	var/list/animate_targets = list()
	for(var/i in 1 to 3)
		var/obj/effect/temp_visual/dir_setting/sparkle/green/G = new(get_turf(F), pick(GLOB.alldirs))
		animate_targets += G
	for(var/obj/effect/temp_visual/dir_setting/sparkle/green/G in animate_targets)
		animate(G, pixel_y = 32, time = 10)
	
	// Notify the player
	to_chat(F, "<span class='notice'>You have been transformed into a frog! Find someone to kiss you to return to your human form.</span>")

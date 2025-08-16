/obj/projectile/magic/firebolt
	name = "bolt of fire"
	icon_state = "pulse0"
	damage_type = BURN
	damage = 10
	nodamage = FALSE
	armor_penetration = 0
	pass_flags = PASSTABLE | PASSGRILLE
	flag = "magic"
	speed = 2
	temperature = 350

/obj/projectile/magic/firebolt/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(. == BULLET_ACT_BLOCK)
		return .
	if(isliving(target))
		var/mob/living/M = target
		M.adjust_fire_stacks(2)
	return .



/obj/projectile/magic/frostbite
	name = "frostbite"
	icon_state = "energy"
	damage = 6
	stamina = 10
	damage_multiplier = 1.5
	damage_type = BURN
	nodamage = FALSE
	armor_penetration = 0
	pass_flags = PASSTABLE | PASSGRILLE
	flag = "magic"
	speed = 2
	temperature = 50

/obj/projectile/magic/frostbite/on_hit(target)
	. = ..()
	if(ismob(target))
		var/mob/M = target
		if(M.anti_magic_check())
			visible_message(span_warning("[src] fizzles on contact with [target]!"))
			playsound(get_turf(target), 'sound/magic/magic_nulled.ogg', 100)
			qdel(src)
			return BULLET_ACT_BLOCK
		if(isliving(target))
			var/mob/living/L = target
			L.apply_status_effect(/datum/status_effect/buff/frostbite)
			new /obj/effect/temp_visual/snap_freeze(get_turf(L))



/obj/projectile/magic/crystalpeep
	name = "Crystal Needle"
	icon_state = "energy"
	damage = 10
	damage_multiplier = 2
	damage_type = BRUTE
	nodamage = FALSE
	armor_penetration = 20
	pass_flags = PASSTABLE | PASSGRILLE
	flag = "magic"
	speed = 2

/obj/projectile/magic/divine_flame
	name = "Divine Flame"
	icon_state = "pulse0"
	damage = 15
	damage_type = BURN
	nodamage = FALSE
	pass_flags = PASSTABLE | PASSGRILLE
	flag = "magic"
	speed = 1.5
	temperature = 450

/obj/projectile/magic/divine_flame/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(. == BULLET_ACT_BLOCK || !isliving(target))
		return .
	var/mob/living/L = target
	if(L.stat == DEAD)
		return .
	
	var/isvampire = FALSE
	var/iszombie = FALSE
	var/prob2explode = 100 // Default probability, as in churn spell
	if(L.mind)
		var/datum/antagonist/vampirelord/lesser/V = L.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser)
		if(V && !V.disguised)
			isvampire = TRUE
		if(L.mind.has_antag_datum(/datum/antagonist/zombie))
			iszombie = TRUE
	if((L.mob_biotypes & MOB_UNDEAD) || isvampire || iszombie)
		var/vamp_prob = prob2explode
		if(isvampire)
			vamp_prob -= 20
		if(prob(vamp_prob))
			explosion(get_turf(L), light_impact_range = 1, flame_range = 1, smoke = FALSE)
			L.Stun(50)
			if(L.mob_biotypes & MOB_UNDEAD) // Apply fire stacks only for undead
				L.adjust_fire_stacks(4)
		else
			L.visible_message(span_warning("[L] resists the divine flame!"), span_userdanger("I resist the divine flame!"))
	
	return .

/obj/projectile/magic/crystalspear
	name = "Crystal Spear"
	icon_state = "energy"
	damage = 50
	damage_multiplier = 2
	damage_type = BRUTE
	nodamage = FALSE
	armor_penetration = 30
	pass_flags = PASSTABLE | PASSGRILLE
	flag = "magic"
	speed = 1.0

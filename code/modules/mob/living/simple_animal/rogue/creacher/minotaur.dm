
/mob/living/simple_animal/hostile/retaliate/rogue/minotaur
	icon = 'icons/roguetown/mob/monster/minotaur.dmi'
	name = "Minotaur"
	icon_state = "Gor"
	icon_living = "Gor"
	icon_dead = "GorD"
	gender = MALE
	STASTR = 25
	STASKL = 8
	STAMAG = 2
	STACON = 18
	STAEND = 15
	STASPD = 5
	emote_hear = null
	emote_see = null
	speak_chance = 1
	turns_per_move = 2
	see_in_dark = 10
	move_to_delay = 3
	base_intents = list(/datum/intent/axe/cut/battle, /datum/intent/axe/chop/battle)
	butcher_results = list(/obj/item/reagent_containers/food/snacks/rogue/meat/steak = 10,
						/obj/item/natural/hide = 10)
	faction = list("caves")
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	health = 400
	maxHealth = 600
	melee_damage_lower = 45
	melee_damage_upper = 70
	simpmob_attack = 45
	simpmob_defend = 40
	vision_range = 3
	aggro_vision_range = 4
	environment_smash = ENVIRONMENT_SMASH_NONE
	retreat_distance = 0
	minimum_distance = 0
	milkies = FALSE
	food_type = list(/obj/item/reagent_containers/food/snacks/rogue/meat, /obj/item/bodypart, /obj/item/organ)
	footstep_type = FOOTSTEP_MOB_HEAVY
	pooptype = null
	deaggroprob = 0
	defdrain = 10
	del_on_deaggro = 44 SECONDS
	retreat_health = 0
	food = 0
	attack_sound = list('sound/combat/wooshes/blunt/wooshhuge (1).ogg','sound/combat/wooshes/blunt/wooshhuge (2).ogg','sound/combat/wooshes/blunt/wooshhuge (3).ogg')
	candodge = FALSE
	aggressive = 1
	stat_attack = UNCONSCIOUS

/mob/living/simple_animal/hostile/retaliate/rogue/death(gibbed)
	..()
	update_icon()

/mob/living/simple_animal/hostile/retaliate/rogue/minotaur/taunted(mob/user)
	emote("aggro")
	Retaliate()
	GiveTarget(user)
	return

/mob/living/simple_animal/hostile/retaliate/rogue/minotaur/Life()
	..()
	if(pulledby)
		Retaliate()
		GiveTarget(pulledby)

/mob/living/simple_animal/hostile/retaliate/rogue/minotaur/find_food()
	. = ..()
	if(!.)
		return eat_bodies()

/mob/living/simple_animal/hostile/retaliate/rogue/minotaur/simple_limb_hit(zone)
	if(!zone)
		return ""
	switch(zone)
		if(BODY_ZONE_PRECISE_R_EYE)
			return "eye"
		if(BODY_ZONE_PRECISE_L_EYE)
			return "eye"
		if(BODY_ZONE_PRECISE_NOSE)
			return "snout"
		if(BODY_ZONE_PRECISE_MOUTH)
			return "jaw"
		if(BODY_ZONE_PRECISE_SKULL)
			return "head"
		if(BODY_ZONE_PRECISE_EARS)
			return "head"
		if(BODY_ZONE_PRECISE_NECK)
			return "neck"
		if(BODY_ZONE_PRECISE_L_HAND)
			return "hand"
		if(BODY_ZONE_PRECISE_R_HAND)
			return "hand"
		if(BODY_ZONE_PRECISE_L_FOOT)
			return "foot"
		if(BODY_ZONE_PRECISE_R_FOOT)
			return "foot"
		if(BODY_ZONE_CHEST)
			return "body"
		if(BODY_ZONE_PRECISE_STOMACH)
			return "stomach"
		if(BODY_ZONE_PRECISE_GROIN)
			return "tail"
		if(BODY_ZONE_HEAD)
			return "head"
		if(BODY_ZONE_R_LEG)
			return "leg"
		if(BODY_ZONE_L_LEG)
			return "leg"
		if(BODY_ZONE_R_ARM)
			return "arm"
		if(BODY_ZONE_L_ARM)
			return "arm"
		else
			return "body"

	return ..()


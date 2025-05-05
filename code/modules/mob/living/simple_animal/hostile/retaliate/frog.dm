/mob/living/simple_animal/hostile/retaliate/frog
	name = "frog"
	desc = ""
	icon_state = "frog"
	icon_living = "frog"
	icon_dead = "frog_dead"
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	speak = list("ribbit","croak")
	emote_see = list("hops in a circle.", "shakes.")
	speak_chance = 1
	turns_per_move = 5
	maxHealth = 15
	health = 15
	melee_damage_lower = 5
	melee_damage_upper = 5
	attack_verb_continuous = "bites"
	attack_verb_simple = "bite"
	response_help_continuous = "pets"
	response_help_simple = "pet"
	response_disarm_continuous = "pokes"
	response_disarm_simple = "poke"
	response_harm_continuous = "splats"
	response_harm_simple = "splat"
	density = FALSE
	ventcrawler = VENTCRAWLER_ALWAYS
	faction = list("hostile")
	attack_sound = 'sound/blank.ogg'
	butcher_results = list(/obj/item/reagent_containers/food/snacks/nugget = 1)
	pass_flags = PASSTABLE | PASSGRILLE | PASSMOB
	mob_size = MOB_SIZE_TINY
	gold_core_spawnable = HOSTILE_SPAWN
	var/stepped_sound = 'sound/blank.ogg'

/mob/living/simple_animal/hostile/retaliate/frog/Initialize()
	. = ..()
	if(prob(1))
		name = "rare frog"
		desc = ""
		icon_state = "rare_frog"
		icon_living = "rare_frog"
		icon_dead = "rare_frog_dead"
		butcher_results = list(/obj/item/reagent_containers/food/snacks/nugget = 5)

/mob/living/simple_animal/hostile/retaliate/frog/Crossed(AM as mob|obj)
	if(!stat && isliving(AM))
		var/mob/living/L = AM
		if(L.mob_size > MOB_SIZE_TINY)
			playsound(src, stepped_sound, 50, TRUE)


/mob/living/simple_animal/hostile/retaliate/frog/human_frog
	var/original_name
	var/datum/mind/original_mind = null
	var/original_ckey = null
	var/mob/living/carbon/human/original_human = null

/mob/living/simple_animal/hostile/retaliate/frog/human_frog/examine(mob/user)
	. = ..()
	if(user != src)
		. += "<span class='warning'>There's something oddly human about the way this frog looks at you...</span>"


/mob/living/simple_animal/hostile/retaliate/frog/human_frog/attack_hand(mob/living/carbon/human/M)
	var/mob/living/carbon/human/H = M
	if(ishuman(H))
		switch(H.used_intent.type)
			if(INTENT_HELP)
				if(H.zone_selected == BODY_ZONE_PRECISE_MOUTH)
					visible_message("<span class='notice'>[H] kisses [src] on the lips!</span>")
					kiss_by_human(H)
					return TRUE

	return ..()

/mob/living/simple_animal/hostile/retaliate/frog/human_frog/proc/kiss_by_human(mob/living/carbon/human/kisser)
	if(original_human && original_mind)
		if(kisser && istype(kisser, /mob/living/carbon/human))

			var/datum/effect_system/spark_spread/magic = new
			magic.set_up(8, 0, src)
			magic.start()
			
			var/list/animate_targets = list()
			for(var/i in 1 to 3)
				var/obj/effect/temp_visual/dir_setting/sparkle/green/G = new(get_turf(src), pick(GLOB.alldirs))
				animate_targets += G
			for(var/obj/effect/temp_visual/dir_setting/sparkle/green/G in animate_targets)
				animate(G, pixel_y = 32, time = 10)
			

			original_human.forceMove(get_turf(src))
			original_human.status_flags &= ~GODMODE
			original_human.alpha = 255
			
			if(mind)
				mind.transfer_to(original_human)
			

			to_chat(original_human, "<span class='notice'>The spell has been broken! You are human again.</span>")

			qdel(src)
			return TRUE
	return FALSE

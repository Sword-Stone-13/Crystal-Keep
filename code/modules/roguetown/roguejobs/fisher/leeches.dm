#define MAX_LEECH_EVILNESS 10

/obj/item/natural/worms/leech
	name = "leech"
	desc = "A disgusting, blood-sucking parasite."
	icon = 'icons/roguetown/items/surgery.dmi'
	icon_state = "leech"
	baitchance = 100
	fishloot = list(/obj/item/reagent_containers/food/snacks/fish/carp = 5,
					/obj/item/reagent_containers/food/snacks/fish/eel = 5,
					/obj/item/reagent_containers/food/snacks/fish/angler = 1)
	embedding = list(
		"embed_chance" = 100,
		"embedded_unsafe_removal_time" = 0,
		"embedded_pain_chance" = 0,
		"embedded_fall_chance" = 0,
		"embedded_bloodloss"= 0,
	)
	/// Consistent AKA no lore
	var/consistent = FALSE
	/// Are we giving or receiving blood?
	var/giving = FALSE
	/// How much blood we waste away on process()
	var/drainage = 1
	/// How much blood we suck on on_embed_life()
	var/blood_sucking = 2
	/// How much toxin damage we heal on on_embed_life()
	var/toxin_healing = 2
	/// Amount of blood we have stored
	var/blood_storage = 0
	/// Maximum amount of blood we can store
	var/blood_maximum = BLOOD_VOLUME_SURVIVE
	w_class = WEIGHT_CLASS_SMALL
	// Completely silent, no do_after and no visible_message
	var/completely_silent = FALSE

/obj/item/natural/worms/leech/Initialize()
	. = ..()
	//leech lore
	leech_lore()
	if(drainage)
		START_PROCESSING(SSobj, src)

/obj/item/natural/worms/leech/process()
	if(!drainage)
		return PROCESS_KILL
	blood_storage = max(blood_storage - drainage, 0)

/obj/item/natural/worms/leech/examine(mob/user)
	. = ..()
	switch(blood_storage/blood_maximum)
		if(0.8 to INFINITY)
			. += span_bloody("<B>[p_theyre(TRUE)] fat and engorged with blood.</B>")
		if(0.5 to 0.8)
			. += span_bloody("[p_theyre(TRUE)] well fed.")
		if(0.1 to 0.5)
			. += span_warning("[p_they(TRUE)] want[p_s()] a meal.")
		if(-INFINITY to 0.1)
			. += span_dead("[p_theyre(TRUE)] starved.")
	if(!giving)
		. += span_warning("[p_theyre(TRUE)] [pick("slurping", "sucking", "inhaling")].")
	else
		. += span_notice("[p_theyre(TRUE)] [pick("vomiting", "gorfing", "exhaling")].")
	if(drainage)
		START_PROCESSING(SSobj, src)

/obj/item/natural/worms/leech/attack(mob/living/M, mob/user)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		var/obj/item/bodypart/affecting = H.get_bodypart(check_zone(user.zone_selected))
		if(!affecting)
			return
		if(!get_location_accessible(H, check_zone(user.zone_selected)))
			to_chat(user, span_warning("Something in the way."))
			return
		var/used_time = (70 - (H.mind?.get_skill_level(/datum/skill/misc/treatment) * 10))/2
		if(completely_silent)
			used_time = 0
		if(!do_mob(user, H, used_time))
			return
		if(!H)
			return
		user.dropItemToGround(src)
		src.forceMove(H)
		affecting.add_embedded_object(src, silent = TRUE, crit_message = FALSE)
		if(completely_silent)
			return
		if(M == user)
			user.visible_message(span_notice("[user] places [src] on [user.p_their()] [affecting]."), span_notice("I place a leech on my [affecting]."))
		else
			user.visible_message(span_notice("[user] places [src] on [M]'s [affecting]."), span_notice("I place a leech on [M]'s [affecting]."))
		return
	return ..()

/obj/item/natural/worms/leech/on_embed_life(mob/living/user, obj/item/bodypart/bodypart)
	if(!user)
		return
	user.adjustToxLoss(-toxin_healing)
	if(giving)
		var/blood_given = min(BLOOD_VOLUME_MAXIMUM - user.blood_volume, blood_storage, blood_sucking)
		user.blood_volume += blood_given
		blood_storage = max(blood_storage - blood_given, 0)
		if((blood_storage <= 0) || (user.blood_volume >= BLOOD_VOLUME_MAXIMUM))
			if(bodypart)
				bodypart.remove_embedded_object(src)
			else
				user.simple_remove_embedded_object(src)
			return TRUE
	else
		var/blood_extracted = min(blood_maximum - blood_storage, user.blood_volume, blood_sucking)
		user.blood_volume = max(user.blood_volume - blood_extracted, 0)
		blood_storage += blood_extracted
		if((blood_storage >= blood_maximum) || (user.blood_volume <= 0))
			if(bodypart)
				bodypart.remove_embedded_object(src)
			else
				user.simple_remove_embedded_object(src)
			return TRUE
	return FALSE

/// LEECH LORE... Collect em all!
/obj/item/natural/worms/leech/proc/leech_lore()
	if(consistent)
		return FALSE
	var/static/list/all_colors = list(
		"#9860ff" = 8,
		"#bcff49" = 4,
		"#ffce49" = 2,
		"#79ddff" = 2,
		"#ff7878" = 1,
		"#ff31e4" = 1,
	)
	var/static/list/all_adjectives = list(
		"blood-sucking" = 20,
		"disgusting" = 10,
		"vile" = 8,
		"repugnant" = 4,
		"revolting" = 4,
		"grotesque" = 4,
		"hideous" = 4,
		"stupid" = 2,
		"dumb" = 2,
		"demonic" = 1,
		"graggoid" = 1,
		"zizoid" = 1,
	)
	var/static/list/all_descs = list(
		"What a disgusting creature." = 10,
		"Fucking gross." = 5,
		"Slippery..." = 3,
		"So yummy and full of blood." = 3,
		"I love this leech!" = 2,
		"It is so beautiful." = 2,
		"I wish I was a leech." = 1,
	)
	var/list/possible_adjectives = all_adjectives.Copy()
	var/list/possible_descs = all_descs.Copy()
	var/list/adjectives = list()
	var/list/descs = list()
	var/evilness_rating = rand(0, MAX_LEECH_EVILNESS)
	switch(evilness_rating)
		if(MAX_LEECH_EVILNESS to INFINITY) //maximized evilness holy shit
			color = "#ff0000"
			adjectives += pick("evil", "malevolent", "misanthropic")
			descs += span_danger("This one is bursting with hatred!")
		if(5) //this leech is painfully average, it gets no adjectives
			if(prob(3))
				adjectives += pick("average", "ordinary", "boring")
				descs += "This one is extremely boring to look at."
		if(-INFINITY to 1) //this leech is pretty terrible at being a leech
			adjectives += pick("pitiful", "pathetic", "depressing")
			descs += span_dead("This one yearns for nothing but death.")
		else
			var/adjective_amount = 1
			if(prob(5))
				adjective_amount = 3
			else if(prob(30))
				adjective_amount = 2
			for(var/i in 1 to adjective_amount)
				var/picked_adjective = pickweight(possible_adjectives)
				possible_adjectives -= picked_adjective
				adjectives += pickweight(possible_adjectives)
				var/picked_desc = pickweight(possible_descs)
				possible_descs -= picked_desc
				descs += pickweight(possible_descs)
	toxin_healing = max(round((MAX_LEECH_EVILNESS - evilness_rating)/MAX_LEECH_EVILNESS * 2 * initial(toxin_healing), 0.1), 1)
	blood_sucking = max(round(evilness_rating/MAX_LEECH_EVILNESS * 2 * initial(blood_sucking), 0.1), 1)
	if(evilness_rating < 10)
		color = pickweight(all_colors)
	if(length(adjectives))
		name = "[english_list(adjectives)] [name]"
	if(length(descs))
		desc = "[desc] [jointext(descs, " ")]"
	return TRUE

/obj/item/natural/worms/leech/cheele
	name = "cheele"
	desc = "A beautiful, blood-infusing altruistic organism made by Pestra herself."
	icon_state = "cheele"
	color = null
	consistent = TRUE
	drainage = 0
	toxin_healing = 2
	blood_storage = BLOOD_VOLUME_SURVIVE
	blood_maximum = BLOOD_VOLUME_BAD

/obj/item/natural/worms/leech/cheele/attack_self(mob/user)
	. = ..()
	giving = !giving
	if(giving)
		user.visible_message(span_notice("[user] squeezes [src]."),\
							span_notice("I squeeze [src]. It will now infuse blood."))
	else
		user.visible_message(span_notice("[user] squeezes [src]."),\
							span_notice("I squeeze [src]. It will now extract blood."))

/obj/item/natural/worms/leech/propaganda
	name = "accursed leech"
	desc = "A leech like none other."
	drainage = 0
	blood_sucking = 0
	completely_silent = TRUE
	embedding = list(
		"embed_chance" = 100,
		"embedded_unsafe_removal_time" = 0,
		"embedded_pain_chance" = 0,
		"embedded_fall_chance" = 0,
		"embedded_bloodloss"= 0,
	)

/obj/item/natural/worms/leech/propaganda/on_embed_life(mob/living/user, obj/item/bodypart/bodypart)
	. = ..()
	if(!user)
		return
	if(iscarbon(user))
		var/mob/living/carbon/V = user
		if(prob(5))
			V.say(pick("PRAISE ZIZO!", "DEATH TO THE TEN..."))
		V.add_stress(/datum/stressevent/leechcult)

#undef MAX_LEECH_EVILNESS

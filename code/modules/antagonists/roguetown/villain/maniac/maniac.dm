
/datum/antagonist/maniac
	name = "Maniac"
	roundend_category = "maniacs"
	antagpanel_category = "Maniac"
	antag_memory = "<b>Recently I've been visited by a lot of VISIONS. Madness envelops me. Little by little.</b>"
	job_rank = ROLE_MANIAC
	antag_hud_type = ANTAG_HUD_TRAITOR
	antag_hud_name = "villain"
	confess_lines = list(
		"HECKING OWCHERS.",
		"ZAMN!",
		"CRYING LAUGHING EMOJI.",
		"UUUOOOOOH!",
	)
	rogue_enabled = TRUE
	/// Traits we apply to the owner
	var/static/list/applied_traits = list(
		TRAIT_CRITICAL_RESISTANCE,
		TRAIT_DECEIVING_MEEKNESS,
		TRAIT_NOSTINK,
		TRAIT_EMPATH,
		TRAIT_NOROGSTAM,
		TRAIT_NOPAIN,
		TRAIT_NOPAINSTUN,
		TRAIT_STEELHEARTED,
		TRAIT_NOMOOD,
		TRAIT_HARDDISMEMBER,
		TRAIT_NOSLEEP,
		TRAIT_SHOCKIMMUNE,
		TRAIT_STABLEHEART,
		TRAIT_STABLELIVER,
		TRAIT_ANTIMAGIC,
		TRAIT_SCHIZO_AMBIENCE,
		TRAIT_BLOODLOSS_IMMUNE,
	)
	/// Traits that only get applied in the final sequence
	var/static/list/final_traits = list(
		TRAIT_MANIAC_AWOKEN,
		TRAIT_SCREENSHAKE,
	)
	/// Cached old stats in case we get removed
	var/STASTR
	var/STACON 
	var/STAEND
	/// Weapons we can give to the dreamer
	var/static/list/possible_weapons = list(
		/obj/item/rogueweapon/huntingknife/cleaver,
		/obj/item/rogueweapon/huntingknife/cleaver/combat,
		/obj/item/rogueweapon/huntingknife/idagger/steel/special,
	)
	/// Wonder recipes
	var/static/list/recipe_progression = list(
		/datum/crafting_recipe/roguetown/structure/wonder/first, 
		/datum/crafting_recipe/roguetown/structure/wonder/second, 
		/datum/crafting_recipe/roguetown/structure/wonder/third, 
		/datum/crafting_recipe/roguetown/structure/wonder/fourth,
	)
	/// Key number > Key text 
	var/list/num_keys = list()
	/// Key text > key number
	var/list/key_nums = list()
	/// Every heart inscryption we have seen
	var/list/hearts_seen = list()
	/// Sum of the numbers of every key
	var/sum_keys = 0
	/// Keeps track of which wonder we are gonna make next
	var/current_wonder = 1
	/// Set to TRUE when we are on the last wonder (waking up)
	var/waking_up = FALSE
	/// Set to true when we WIN and are on the ending sequence
	var/triumphed = FALSE
	/// Wonders we have made
	var/list/wonders_made = list()
	/// Hallucinations screen object
	var/atom/movable/screen/fullscreen/maniac/hallucinations

GLOBAL_VAR_INIT(maniac_highlander, 0) // THERE CAN ONLY BE ONE!

/datum/antagonist/maniac/New()
	set_keys()
	load_strings_file("maniac.json")
	return ..()

/datum/antagonist/maniac/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/datum/antagonist/maniac/on_gain()
	. = ..()
	owner.special_role = ROLE_MANIAC
	owner.special_items["Maniac"] = pick(possible_weapons)
	owner.special_items["Surgical Kit"] = /obj/item/storage/backpack/rogue/backpack/surgery
	if(owner.current)
		if(ishuman(owner.current))
			var/mob/living/carbon/human/dreamer = owner.current
			dreamer.cmode_music = 'sound/music/combat_maniac2.ogg'
			owner.adjust_skillrank(/datum/skill/combat/knives, 6, TRUE)
			owner.adjust_skillrank(/datum/skill/combat/wrestling, 5, TRUE)
			owner.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
			owner.adjust_skillrank_up_to(/datum/skill/misc/treatment, 3, TRUE) 
			STASTR = dreamer.STASTR
			STACON = dreamer.STACON
			STAEND = dreamer.STAEND
			dreamer.STASTR = 20
			dreamer.STACON = 20
			dreamer.STAEND = 20
			var/obj/item/organ/heart/heart = dreamer.getorganslot(ORGAN_SLOT_HEART)
			if(heart) // clear any inscryptions, in case of being made maniac midround
				heart.inscryptions = list()
				heart.inscryption_keys = list()
				heart.maniacs2wonder_ids = list()
				heart.maniacs = list()
			dreamer.remove_stress(/datum/stressevent/saw_wonder)
			dreamer.remove_client_colour(/datum/client_colour/maniac_marked)
		for(var/trait in applied_traits)
			ADD_TRAIT(owner.current, trait, "[type]")
		hallucinations = owner.current.overlay_fullscreen("maniac", /atom/movable/screen/fullscreen/maniac)
	LAZYINITLIST(owner.learned_recipes)
	owner.learned_recipes |= recipe_progression[1]
	forge_villain_objectives()
	if(length(objectives))
		SEND_SOUND(owner.current, 'sound/villain/dreamer_warning.ogg')
		to_chat(owner.current, span_danger("[antag_memory]"))
		owner.announce_objectives()
	START_PROCESSING(SSobj, src)

/datum/antagonist/maniac/on_removal()
	STOP_PROCESSING(SSobj, src)
	if(owner.current)
		if(!silent)
			to_chat(owner.current,span_danger("I am no longer a MANIAC!"))
		if(ishuman(owner.current))
			var/mob/living/carbon/human/dreamer = owner.current
			dreamer.STASTR = STASTR
			dreamer.STACON = STACON
			dreamer.STAEND = STAEND
			var/client/clinet = dreamer?.client
			if(clinet) //clear screenshake animation
				animate(clinet, dreamer.pixel_y)
		for(var/trait in applied_traits)
			REMOVE_TRAIT(owner.current, trait, "[type]")
		for(var/trait in final_traits)
			REMOVE_TRAIT(owner.current, trait, "[type]")
		owner.current.clear_fullscreen("maniac")
	QDEL_LIST(wonders_made)
	wonders_made = null
	owner.learned_recipes -= recipe_progression
	owner.special_role = null
	hallucinations = null
	return ..()

/datum/antagonist/maniac/proc/set_keys()
	key_nums = list()
	num_keys = list()
	//We need 4 numbers and four keys
	for(var/i in 1 to 4)
		//Make the number first
		var/randumb
		while(!randumb || (randumb in num_keys))
			randumb = "[rand(0,9)][rand(0,9)][rand(0,9)][rand(0,9)]"
		//Make the key second
		var/rantelligent
		while(!rantelligent || (rantelligent in key_nums))
			rantelligent = uppertext("[pick(GLOB.alphabet)][pick(GLOB.alphabet)][pick(GLOB.alphabet)][pick(GLOB.alphabet)]")

		//Stick then in the lists, continue the loop
		num_keys[randumb] = rantelligent
		key_nums[rantelligent] = randumb
	
	sum_keys = 0
	for(var/i in num_keys)
		sum_keys += text2num(i)

/datum/antagonist/maniac/proc/forge_villain_objectives()
	var/datum/objective/maniac/wakeup = new()
	objectives += wakeup

/datum/antagonist/maniac/proc/agony(mob/living/carbon/dreamer)
	var/sound/im_sick = sound('sound/villain/imsick.ogg', TRUE, FALSE, CHANNEL_IMSICK, 100)
	SEND_SOUND(dreamer, im_sick)
	dreamer.overlay_fullscreen("dream", /atom/movable/screen/fullscreen/dreaming)
	dreamer.overlay_fullscreen("wakeup", /atom/movable/screen/fullscreen/dreaming/waking_up)
	for(var/trait in final_traits)
		ADD_TRAIT(dreamer, trait, "[type]")
	waking_up = TRUE

/datum/antagonist/maniac/proc/spawn_trey_liam()
	var/turf/spawnturf
	var/obj/effect/landmark/treyliam/trey = locate(/obj/effect/landmark/treyliam) in GLOB.landmarks_list
	if(trey)
		spawnturf = get_turf(trey)
	if(spawnturf)
		var/mob/living/carbon/human/trey_liam = new /mob/living/carbon/human/species/human/northern(spawnturf)
		trey_liam.fully_replace_character_name(trey_liam.name, "Chet Sterling")
		trey_liam.gender = MALE
		trey_liam.skin_tone = "ffe0d1"
		trey_liam.hair_color = "999999"
		trey_liam.hairstyle = "Plain Long"
		trey_liam.facial_hair_color = "999999"
		trey_liam.facial_hairstyle = "Knowledge"
		trey_liam.age = AGE_OLD
		trey_liam.equipOutfit(/datum/outfit/treyliam)
		trey_liam.regenerate_icons()
		for(var/obj/structure/chair/chair in spawnturf)
			chair.buckle_mob(trey_liam)
			break
		return trey_liam
	return

/datum/antagonist/maniac/proc/wake_up()
	if(GLOB.maniac_highlander) // another Maniac has TRIUMPHED before we could
		if(src.owner && src.owner.current)
			var/straggler = src.owner.current
			to_chat(straggler, span_danger("JORKIN THE WHOLE PEANITZ!"))
		return
	GLOB.maniac_highlander = 1
	STOP_PROCESSING(SSobj, src)
	triumphed = TRUE
	waking_up = FALSE
	var/mob/living/carbon/dreamer = owner.current
	dreamer.log_message("prayed their sum ([sum_keys]), beginning the Maniac TRIUMPH sequence and the end of the round.", LOG_GAME)
	message_admins("[ADMIN_LOOKUPFLW(dreamer)] as Maniac TRIUMPHED[sum_keys ? " with sum [sum_keys]" : ""]. The round will end shortly.")
	// var/client/dreamer_client = dreamer.client // Trust me, we need it later
	to_chat(dreamer, "...It couldn't be.")
	dreamer.clear_fullscreen("dream")
	dreamer.clear_fullscreen("wakeup")
	var/client/clinet = dreamer?.client
	if(clinet) //clear screenshake animation
		animate(clinet, dreamer.pixel_y)
	for(var/datum/objective/objective in objectives)
		objective.completed = TRUE
	for(var/mob/connected_player in GLOB.player_list)
		if(!connected_player.client)
			continue
		SEND_SOUND(connected_player, sound(null))
		SEND_SOUND(connected_player, 'sound/villain/dreamer_win.ogg')
	var/mob/living/carbon/human/trey_liam = spawn_trey_liam()
	if(trey_liam)
		owner.transfer_to(trey_liam)
		//Explodie all our wonders
		for(var/obj/structure/wonder/wondie as anything in wonders_made)
			if(istype(wondie))
				explosion(wondie, 8, 16, 32, 64)
		var/obj/item/organ/brain/brain = dreamer.getorganslot(ORGAN_SLOT_BRAIN)
		var/obj/item/bodypart/head/head = dreamer.get_bodypart(BODY_ZONE_HEAD)
		if(head)
			head.dismember(BURN)
			if(!QDELETED(head))
				qdel(head)
		if(brain)
			qdel(brain)
		cull_competitors(trey_liam)
		trey_liam.SetSleeping(25 SECONDS)
		trey_liam.add_stress(/datum/stressevent/maniac_woke_up)
		sleep(1.5 SECONDS)
		to_chat(trey_liam, span_deadsay("<span class='reallybig'>... WHERE AM I? ...</span>"))
		sleep(1.5 SECONDS)
		var/static/list/slop_lore = list(
			span_deadsay("... Space Station 13...the... future?..."),
			span_deadsay("... Zizotec's orgy...?..."),
			span_deadsay("... Who the hell is Steve Jobs...?"),
			span_deadsay("... Encino Moth... who the hell is that...?"),
			span_deadsay("... Juan Francisco Donaldo... Catholic Knight... what? ..."),
			span_deadsay("... One day while Andy was-..."),
			span_deadsay("... GnarxPoppy fanfiction? What the fuck are you talk-..."),
			span_deadsay("... Jean the Hunted... Hero... Tabletop...What?"),
		)
		for(var/slop in slop_lore)
			to_chat(trey_liam, slop)
			sleep(3 SECONDS)
	else
		INVOKE_ASYNC(src, PROC_REF(cant_wake_up), dreamer)
		cull_competitors(dreamer)
	sleep(15 SECONDS)
	to_chat(world, span_deadsay("<span class='reallybig'>The Maniac has TRIUMPHED!</span>"))
	SSticker.declare_completion()

/datum/antagonist/maniac/proc/cant_wake_up(mob/living/dreamer)
	if(!iscarbon(dreamer))
		return
	to_chat(dreamer, span_deadsay("<span class='reallybig'>I CAN'T WAKE UP.</span>"))
	sleep(2 SECONDS)
	for(var/i in 1 to 10)
		to_chat(dreamer, span_deadsay("<span class='reallybig'>ICANTWAKEUP</span>"))
		sleep(0.5 SECONDS)
	var/obj/item/organ/brain/brain = dreamer.getorganslot(ORGAN_SLOT_BRAIN)
	var/obj/item/bodypart/head/head = dreamer.get_bodypart(BODY_ZONE_HEAD)
	if(head)
		head.dismember(BURN)
		if(!QDELETED(head))
			qdel(head)
	if(brain)
		qdel(brain)

// Culls any living maniacs in the world apart from the victor.
/datum/antagonist/maniac/proc/cull_competitors(var/mob/living/carbon/victor)
	for(var/mob/living/carbon/C in GLOB.carbon_list - victor)
		var/datum/antagonist/maniac/competitor = C.mind?.has_antag_datum(/datum/antagonist/maniac)
		if(competitor)
			STOP_PROCESSING(SSobj, competitor)
			competitor.waking_up = FALSE
			C.clear_fullscreen("dream")
			C.clear_fullscreen("wakeup")
			//clear screenshake animation. traits need to be removed in case the guy ghosts in cmode
			var/client/cnc = C?.client
			if(cnc)
				animate(cnc, C.pixel_y)
			REMOVE_TRAIT(C, TRAIT_SCREENSHAKE, "/datum/antagonist/maniac")
			REMOVE_TRAIT(C, TRAIT_SCHIZO_AMBIENCE, "/datum/antagonist/maniac")
			C.log_message("was culled by the TRIUMPH of Maniac [key_name(victor)].", LOG_GAME)
			sleep(1 SECONDS)
			to_chat(C, span_userdanger("What?! No, no, this can't be!"))
			sleep(2 SECONDS)
			to_chat(C, span_userdanger("How can I be TOO LATE-"))
			sleep(1 SECONDS)
			INVOKE_ASYNC(src, PROC_REF(cant_wake_up), C)
			QDEL_LIST(competitor.wonders_made)
			competitor.wonders_made = null

//TODO Collate
/datum/antagonist/roundend_report()
	var/traitorwin = TRUE

	printplayer(owner)

	var/count = 0
	if(objectives.len)//If the traitor had no objectives, don't need to process this.
		for(var/datum/objective/objective in objectives)
			objective.update_explanation_text()
			if(objective.check_completion())
				to_chat(world, "<B>[objective.flavor] #[count]</B>: [objective.explanation_text] <span class='greentext'>TRIUMPH!</span>")
			else
				to_chat(world, "<B>[objective.flavor] #[count]</B>: [objective.explanation_text] <span class='redtext'>Failure.</span>")
				traitorwin = FALSE
			count += objective.triumph_count

	var/special_role_text = lowertext(name)
	if(!considered_alive(owner))
		traitorwin = FALSE

	if(traitorwin)
		if(count)
			if(owner)
				owner.adjust_triumphs(count)
		to_chat(world, span_greentext("The [special_role_text] has TRIUMPHED!"))
		if(owner?.current)
			owner.current.playsound_local(get_turf(owner.current), 'sound/misc/triumph.ogg', 100, FALSE, pressure_affected = FALSE)
	else
		to_chat(world, span_redtext("The [special_role_text] has FAILED!"))
		if(owner?.current)
			owner.current.playsound_local(get_turf(owner.current), 'sound/misc/fail.ogg', 100, FALSE, pressure_affected = FALSE)

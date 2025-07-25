/datum/job
	//The name of the job , used for preferences, bans and more. Make sure you know what you're doing before changing this.
	var/title = "NOPE"
	var/f_title

	//Job access. The use of minimal_access or access is determined by a config setting: config.jobs_have_minimal_access
	var/list/minimal_access = list()		//Useful for servers which prefer to only have access given to the places a job absolutely needs (Larger server population)
	var/list/access = list()				//Useful for servers which either have fewer players, so each person needs to fill more than one role, or servers which like to give more access, so players can't hide forever in their super secure departments (I'm looking at you, chemistry!)

	//Determines who can demote this position
	var/department_head = list()

	//Tells the given channels that the given mob is the new department head. See communications.dm for valid channels.
	var/list/head_announce = null

	//Bitflags for the job
	var/flag = NONE //Deprecated
	var/department_flag = NONE //Deprecated
	var/auto_deadmin_role_flags = NONE

	//Players will be allowed to spawn in as jobs that are set to "Station"
	var/faction = "None"

	//How many players can be this job
	var/total_positions = 0

	//How many players can spawn in as this job
	var/spawn_positions = 0

	//How many players have this job
	var/current_positions = 0

	//Whether this job clears a slot when you get a rename prompt.
	var/antag_job = FALSE

	//Supervisors, who this person answers to directly
	var/supervisors = ""

	//Sellection screen color
	var/selection_color = "#dbdce3"


	//If this is set to 1, a text is printed to the player when jobs are assigned, telling him that he should let admins know that he has to disconnect.
	var/req_admin_notify

	//If you have the use_age_restriction_for_jobs config option enabled and the database set up, this option will add a requirement for players to be at least minimal_player_age days old. (meaning they first signed in at least that many days before.)
	var/minimal_player_age = 0

	var/outfit = null
	var/visuals_only_outfit = null //Handles outfits specifically for cases where you may need to prevent sensitive items from spawning. (e.g Crowns)
	var/outfit_female = null

	var/exp_requirements = 0

	var/exp_type = ""
	var/exp_type_department = ""

	//The amount of good boy points playing this role will earn you towards a higher chance to roll antagonist next round
	//can be overridden by antag_rep.txt config
	var/antag_rep = 10

	var/paycheck = PAYCHECK_MINIMAL
	var/paycheck_department = ACCOUNT_CIV

	var/list/mind_traits // Traits added to the mind of the mob assigned this job

	var/display_order = JOB_DISPLAY_ORDER_DEFAULT

	//allowed sex/race for picking
	var/list/allowed_sexes = list(MALE, FEMALE)
	var/list/allowed_races = RACES_ALL_KINDS
	var/list/allowed_patrons
	var/list/allowed_ages = ALL_AGES_LIST

	/// Innate skill levels unlocked at roundstart. Format is list(/datum/skill/foo = SKILL_EXP_NOVICE) with exp as an integer or as per code/_DEFINES/skills.dm
	var/list/skills

	var/list/spells

	var/list/jobstats
	var/list/jobstats_f

	var/job_greet_text = TRUE
	var/tutorial = null

	var/whitelist_req = FALSE

	var/bypass_lastclass = TRUE

	var/banned_leprosy = TRUE
	var/banned_lunatic = TRUE

	var/list/peopleiknow = list()
	var/list/peopleknowme = list()

	var/plevel_req = 0
	var/min_pq = 0
	var/max_pq = 0

	var/show_in_credits = TRUE

	var/announce_latejoin = TRUE
	var/give_bank_account = FALSE

	var/can_random = TRUE

	//is the job required for game progression
	var/required = FALSE

	/// Some jobs have unique combat mode music, because why not?
	var/cmode_music

	/// This job is a "wanderer" on examine
	var/wanderer_examine = FALSE

	/// This job uses adventurer classes on examine
	var/advjob_examine = FALSE

	/// This job always shows on latechoices
	var/always_show_on_latechoices = FALSE

	/// Cooldown for joining as this job again, if it was your last job
	var/same_job_respawn_delay = FALSE

	/// This job re-opens slots if someone dies as it
	var/job_reopens_slots_on_death = FALSE

	/// This job is immune to species-based swapped gender locks
	var/immune_to_genderswap = FALSE

/*
	How this works, its CTAG_DEFINE = amount_to_attempt_to_role
	EX: advclass_cat_rolls = list(CTAG_PILGRIM = 5, CTAG_ADVENTURER = 5)
	You will still need to contact the subsystem though
*/
	var/list/advclass_cat_rolls

/*
	How this works, they get one extra roll on every category per PQ amount
*/
	var/PQ_boost_divider = 0

	var/associated_squad = /datum/antagonist/squad/none// if this is set, this will override the squad the player is assigned to, and they'll be assigned to this squad


/datum/job/proc/special_job_check(mob/dead/new_player/player)
	return TRUE

/client/proc/job_greet(var/datum/job/greeting_job)
	if(mob.job == greeting_job.title)
		greeting_job.greet(mob)

/datum/job/proc/greet(mob/player)
	if(player?.mind.assigned_role != title)
		return
	if(!job_greet_text)
		return
	to_chat(player, span_notice("You are the <b>[title]</b>"))
	if(tutorial)
		if(isseelie(player))		//If player is a Seelie
			change_tutorial(player)	//Check if job flavortext needs changed (hand and maid currently)
		to_chat(player, span_notice("*-----------------*"))
		to_chat(player, span_notice(tutorial))

//Custom join messages for SEELIE ONLY, will not trigger for other races unless explicitly called to
/datum/job/proc/change_tutorial(mob/player)
	if(title == "Hand")		//Change tutorial message for Seelie Hand
		tutorial = "It wasn't easy for a fae, but your liege saw great potential in you. Once, you were just an adventuring companion- now you are one of the highest status fae within the realm itself. It's come at a cost, youve lost your more mischievous spells and nature over time, but gained ones more useful to dealing with the chaos of court."
	else if(title == "Servant")		//Change tutorial message for Seelie maids
		tutorial = "Though once you were a mischievous fae, you've now accepted the comfort and security of service in the manor instead. Your spells may come in handy, but youve allowed the more chaotic ones to fade to memory."
	else if(title == "Prisoner (Crystal Keep)" || title == "Prisoner (Bog)")
		tutorial = "Thrown in this accursed place, the colar around your neck prevents any and all magic you mightve had. You waste away here, no mischief to be made or people to assist. Your life as a caged fae is miserable indeed."
	return

//Only override this proc
//H is usually a human unless an /equip override transformed it
/datum/job/proc/after_spawn(mob/living/H, mob/M, latejoin = FALSE)
	//do actions on H but send messages to M as the key may not have been transferred_yet
	if(mind_traits)
		for(var/t in mind_traits)
			ADD_TRAIT(H.mind, t, JOB_TRAIT)

	if(!ishuman(H))
		return

	add_spells(H)

	if(H.gender == FEMALE)
		if(jobstats_f)
			for(var/S in jobstats_f)
				H.change_stat(S, jobstats_f[S])
		else
			for(var/S in jobstats)
				H.change_stat(S, jobstats[S])
	else
		for(var/S in jobstats)
			H.change_stat(S, jobstats[S])

	for(var/X in peopleknowme)
		for(var/datum/mind/MF in get_minds(X))
			H.mind.person_knows_me(MF)
	for(var/X in peopleiknow)
		for(var/datum/mind/MF in get_minds(X))
			H.mind.i_know_person(MF)

	if(H.islatejoin && show_in_credits)
		var/used_title = title
		if((H.gender == FEMALE) && f_title)
			used_title = f_title
		scom_announce("[H.real_name] the [used_title] arrives from Kingsfield.")

	if(give_bank_account)
		if(give_bank_account > 1)
			SStreasury.create_bank_account(H, give_bank_account)
		else
			SStreasury.create_bank_account(H)

	if(show_in_credits)
		SScrediticons.processing += H

	if(cmode_music)
		H.cmode_music = cmode_music

	if(GLOB.hugbox_duration)
		///FOR SOME STUPID FUCKING REASON THIS REFUSED TO WORK WITHOUT A FUCKING TIMER IT JUST FUCKED SHIT UP
		addtimer(CALLBACK(H, TYPE_PROC_REF(/mob/living/carbon/human, hugboxing_start)), 1)

/mob/living/carbon/human/proc/hugboxing_start()
	to_chat(src, span_warning("I will be in danger once I start moving."))
	status_flags |= GODMODE
	ADD_TRAIT(src, TRAIT_PACIFISM, HUGBOX_TRAIT)
	RegisterSignal(src, COMSIG_MOVABLE_MOVED, PROC_REF(hugboxing_moved))
	//Lies, it goes away even if you don't move after enough time
	if(GLOB.hugbox_duration_still)
		addtimer(CALLBACK(src, TYPE_PROC_REF(/mob/living/carbon/human, hugboxing_end)), GLOB.hugbox_duration_still)

/mob/living/carbon/human/proc/hugboxing_moved()
	UnregisterSignal(src, COMSIG_MOVABLE_MOVED)
	to_chat(src, span_danger("I have [DisplayTimeText(GLOB.hugbox_duration)] before my protection runs out!"))
	addtimer(CALLBACK(src, TYPE_PROC_REF(/mob/living/carbon/human, hugboxing_end)), GLOB.hugbox_duration)

/mob/living/carbon/human/proc/hugboxing_end()
	if(QDELETED(src))
		return
	//hugbox already ended
	if(!(status_flags & GODMODE))
		return
	status_flags &= ~GODMODE
	REMOVE_TRAIT(src, TRAIT_PACIFISM, HUGBOX_TRAIT)
	to_chat(src, span_danger("I feel no longer safe."))

/datum/job/proc/add_spells(mob/living/H)
	if(spells && H.mind)
		for(var/S in spells)
			if(H.mind.has_spell(S))
				continue
			H.mind.AddSpell(new S)

/datum/job/proc/remove_spells(mob/living/H)
	if(spells && H.mind)
		for(var/S in spells)
			if(!H.mind.has_spell(S))
				continue
			H.mind.RemoveSpell(S)

/mob/living/carbon/human/proc/add_credit()
	if(!mind || !client)
		return
	var/thename = "[real_name]"
	var/datum/job/J = SSjob.GetJob(mind.assigned_role)
	var/used_title
	if(J)
		used_title = J.title
		if(gender == FEMALE && J.f_title)
			used_title = J.f_title
	if(used_title)
		thename = "[real_name] the [used_title]"
	GLOB.credits_icons[thename] = list()
	var/client/C = client
	var/datum/preferences/P = C.prefs
	if(!P)
		return
	var/icon/I = get_flat_human_icon(null, J, P, DUMMY_HUMAN_SLOT_MANIFEST, list(SOUTH))
	if(I)
		var/icon/female_s = icon("icon"='icons/mob/clothing/under/masking_helpers.dmi', "icon_state"="credits")
		I.Blend(female_s, ICON_MULTIPLY)
		I.Scale(96,96)
		GLOB.credits_icons[thename]["icon"] = I
		GLOB.credits_icons[thename]["vc"] = voice_color

/datum/job/proc/announce(mob/living/carbon/human/H)
	if(head_announce)
		announce_head(H, head_announce)

/datum/job/proc/override_latejoin_spawn(mob/living/carbon/human/H)		//Return TRUE to force latejoining to not automatically place the person in latejoin shuttle/whatever.
	return FALSE

//Used for a special check of whether to allow a client to latejoin as this job.
/datum/job/proc/special_check_latejoin(client/C)
	return TRUE

/datum/job/proc/GetAntagRep()
	. = CONFIG_GET(keyed_list/antag_rep)[lowertext(title)]
	if(. == null)
		return antag_rep

//Proc that returns the final outfit we should equip on someone, can be overriden for special behavior
/datum/job/proc/get_outfit(mob/living/carbon/human/wearer, visualsOnly = FALSE, announce = TRUE, latejoin = FALSE, preference_source = null)
	return outfit

//Don't override this unless the job transforms into a non-human (Silicons do this for example)
/datum/job/proc/equip(mob/living/carbon/human/H, visualsOnly = FALSE, announce = TRUE, latejoin = FALSE, datum/outfit/outfit_override = null, client/preference_source)
	if(!H)
		return FALSE
	if(CONFIG_GET(flag/enforce_human_authority) && (title in GLOB.command_positions))
		if((H.dna.species.id != "human") && (H.dna.species.id != "humen"))
			H.set_species(/datum/species/human)
			H.apply_pref_name("human", preference_source)
	if(!visualsOnly)
		var/datum/bank_account/bank_account = new(H.real_name, src)
		bank_account.payday(STARTING_PAYCHECKS, TRUE)
		H.account_id = bank_account.account_id

	//Equip the rest of the gear
	H.dna.species.before_equip_job(src, H, visualsOnly)
	if(!outfit_override && visualsOnly && visuals_only_outfit)
		outfit_override = visuals_only_outfit
	if(H.gender == FEMALE)
		if(outfit_override || outfit_female)
			H.equipOutfit(outfit_override ? outfit_override : outfit_female, visualsOnly)
		else
			var/final_outfit = get_outfit(H, visualsOnly, announce, latejoin, preference_source)
			if(final_outfit)
				H.equipOutfit(final_outfit, visualsOnly)
	else
		if(outfit_override || outfit)
			H.equipOutfit(outfit_override ? outfit_override : outfit, visualsOnly)

	H.dna.species.after_equip_job(src, H, visualsOnly)

	if(!visualsOnly && announce)
		announce(H)

/datum/job/proc/get_access()
	if(!config)	//Needed for robots.
		return src.minimal_access.Copy()

	. = list()

	if(CONFIG_GET(flag/jobs_have_minimal_access))
		. = src.minimal_access.Copy()
	else
		. = src.access.Copy()

	if(CONFIG_GET(flag/everyone_has_maint_access)) //Config has global maint access set
		. |= list(ACCESS_MAINT_TUNNELS)

/datum/job/proc/announce_head(mob/living/carbon/human/H, channels) //tells the given channel that the given mob is the new department head. See communications.dm for valid channels.
	if(H && GLOB.announcement_systems.len)
		//timer because these should come after the captain announcement
		SSticker.OnRoundstart(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(addtimer), CALLBACK(pick(GLOB.announcement_systems), TYPE_PROC_REF(/obj/machinery/announcement_system, announce), "NEWHEAD", H.real_name, H.job, channels), 1))

//If the configuration option is set to require players to be logged as old enough to play certain jobs, then this proc checks that they are, otherwise it just returns 1
/datum/job/proc/player_old_enough(client/C)
	if(available_in_days(C) == 0)
		return TRUE	//Available in 0 days = available right now = player is old enough to play.
	return FALSE


/datum/job/proc/available_in_days(client/C)
	if(!C)
		return 0
	if(!CONFIG_GET(flag/use_age_restriction_for_jobs))
		return 0
	if(!SSdbcore.Connect())
		return 0 //Without a database connection we can't get a player's age so we'll assume they're old enough for all jobs
	if(!isnum(minimal_player_age))
		return 0

	return max(0, minimal_player_age - C.player_age)

/datum/job/proc/config_check()
	return TRUE

/datum/job/proc/map_check()
	return TRUE

/datum/job/proc/radio_help_message(mob/M)
	to_chat(M, "<b>Prefix your message with :h to speak on your department's radio. To see other prefixes, look closely at your headset.</b>")

/datum/outfit/job
	name = "Standard Gear"

	var/jobtype = null

	uniform = /obj/item/clothing/under/color/grey
	id = /obj/item/card/id
	ears = /obj/item/radio/headset
	belt = /obj/item/pda
	back = /obj/item/storage/backpack
	shoes = /obj/item/clothing/shoes/sneakers/black
	box = /obj/item/storage/box/survival

	var/backpack = /obj/item/storage/backpack
	var/satchel  = /obj/item/storage/backpack/satchel
	var/duffelbag = /obj/item/storage/backpack/duffelbag

	var/pda_slot = SLOT_BELT

/datum/outfit/job/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
/*	switch(H.backpack)
		if(GBACKPACK)
			back = /obj/item/storage/backpack //Grey backpack
		if(GSATCHEL)
			back = /obj/item/storage/backpack/satchel //Grey satchel
		if(GDUFFELBAG)
			back = /obj/item/storage/backpack/duffelbag //Grey Duffel bag
		if(LSATCHEL)
			back = /obj/item/storage/backpack/satchel/leather //Leather Satchel
		if(DSATCHEL)
			back = satchel //Department satchel
		if(DDUFFELBAG)
			back = duffelbag //Department duffel bag
		else
			back = backpack //Department backpack

	//converts the uniform string into the path we'll wear, whether it's the skirt or regular variant
	var/holder
	if(H.jumpsuit_style == PREF_SKIRT)
		holder = "[uniform]"
	else
		holder = "[uniform]"
	uniform = text2path(holder)*/

/datum/outfit/job/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(visualsOnly)
		return

	var/datum/job/J = SSjob.GetJobType(jobtype)
	if(!J)
		J = SSjob.GetJob(H.job)

	var/obj/item/card/id/C = H.wear_ring
	if(istype(C))
		C.access = J.get_access()
		shuffle_inplace(C.access) // Shuffle access list to make NTNet passkeys less predictable
		C.registered_name = H.real_name
		C.assignment = J.title
		C.update_label()
		for(var/A in SSeconomy.bank_accounts)
			var/datum/bank_account/B = A
			if(B.account_id == H.account_id)
				C.registered_account = B
				B.bank_cards += C
				break
		H.sec_hud_set_ID()

	var/obj/item/pda/PDA = H.get_item_by_slot(pda_slot)
	if(istype(PDA))
		PDA.owner = H.real_name
		PDA.ownjob = J.title
		PDA.update_label()

/datum/outfit/job/get_chameleon_disguise_info()
	var/list/types = ..()
	types -= /obj/item/storage/backpack //otherwise this will override the actual backpacks
	types += backpack
	types += satchel
	types += duffelbag
	return types

//Warden and regular officers add this result to their get_access()
/datum/job/proc/check_config_for_sec_maint()
	if(CONFIG_GET(flag/security_has_maint_access))
		return list(ACCESS_MAINT_TUNNELS)
	return list()

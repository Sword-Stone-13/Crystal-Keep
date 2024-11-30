/datum/antagonist/shadowwizard
	name = "Shadow Wizard"
	roundend_category = "shadow wizard money gang" //just in case
	antagpanel_category = "Swizard"
	job_rank = ROLE_SWIZARD
	antag_hud_type = ANTAG_HUD_WIZ
	antag_hud_name = "Shadowwizard"
	var/datum/team/nuclear/nuke_team
	var/always_new_team = FALSE //If not assigned a team by default ops will try to join existing ones, set this to TRUE to always create new team.
	var/shadowwizard_outfit = /datum/outfit/syndicate

/datum/antagonist/shadowwizard/examine_friendorfoe(datum/antagonist/examined_datum,mob/examiner,mob/examined)
	if(istype(examined_datum, /datum/antagonist/shadowwizard))
		return span_boldnotice("Fam.")

/datum/antagonist/shadowwizard/on_gain()
	owner.special_role = "Shadow wizard"
	owner.assigned_role = "Shadow wizard"
	owner.current.job = null
	forge_objectives()
	. = ..()
	equip_shadowwizard()
//	move_to_spawnpoint()
	finalize_shadowwizard()

/datum/antagonist/shadowwizard/proc/finalize_shadowwizard()
	owner.current.playsound_local(get_turf(owner.current), 'sound/music/traitor.ogg', 80, FALSE, pressure_affected = FALSE)
	var/mob/living/carbon/human/H = owner.current
//	ADD_TRAIT(H, TRAIT_WIZARDTOWER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NUTCRACKER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_SHOCKIMMUNE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_BLOODLOSS_IMMUNE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STUNIMMUNE, TRAIT_GENERIC)
	H.set_patron(/datum/patron/inhumen/matthios) //fixing next
	to_chat(H, span_alertsyndie("I am a Shadow Wizard!"))
	to_chat(H, span_warning(" SHADOW WIZARD MONEY GANG! WE LOVE CASTING SPELLS!"))

	
/datum/antagonist/shadowwizard/proc/forge_objectives()
	return

///datum/antagonist/shadowwizard/proc/move_to_spawnpoint()
//	owner.current.forceMove(pick(GLOB.shadowwizard_starts))

/datum/antagonist/shadowwizard/proc/equip_shadowwizard()

	owner.unknow_all_people()
	for(var/datum/mind/MF in get_minds())
		owner.become_unknown_to(MF)
	for(var/datum/mind/MF in get_minds("REAL"))
		owner.i_know_person(MF)
		owner.person_knows_me(MF)

//	H.cmode_music = 'sound/music/combat_bandit.ogg'

//	addtimer(CALLBACK(H, TYPE_PROC_REF(/mob/living/carbon/human, choose_name_popup), "EVIL"), 5 SECONDS)
//	H.equipOutfit(/datum/outfit/job/roguetown/shadowwizard)

	return TRUE


/datum/antagonist/bandit/after_name_change()
	if(owner && owner.current)
		add_bounty(owner.current.real_name, 80, TRUE, "Wizards with Attitude", "NYWD")

/datum/outfit/job/roguetown/bandit/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/carpentry, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 6, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/treatment, 4, TRUE)
	belt = /obj/item/storage/belt/rogue/leather
	pants = /obj/item/clothing/under/roguetown/trou/leather
	shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt/random
	shoes = /obj/item/clothing/shoes/roguetown/boots
	backr = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(/obj/item/needle/thorn = 1, /obj/item/natural/cloth = 1)
	mask = /obj/item/clothing/mask/rogue/facemask/steel
	neck = /obj/item/clothing/neck/roguetown/coif
	head = /obj/item/clothing/head/roguetown/helmet/leather/volfhelm
	if(prob(40))
		neck = /obj/item/clothing/neck/roguetown/chaincoif
	if(prob(23))
		gloves = /obj/item/clothing/gloves/roguetown/leather
		armor = /obj/item/clothing/suit/roguetown/armor/gambeson
	else
		wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
		armor = /obj/item/clothing/suit/roguetown/armor/leather
	var/loadoutm = rand(1,21)
	switch(loadoutm)
		if(1 to 4) // red wizard 
			beltr = /obj/item/rogueweapon/sword/iron
			H.mind.adjust_skillrank(/datum/skill/combat/tomes, 4, TRUE)
			if(prob(40))
				backl = /obj/item/rogueweapon/shield/wood
			H.change_stat("mageability", 6)
			H.change_stat("skill", 3)
		if(5 to 8) // yellow wizard
			beltr = /obj/item/rogueweapon/huntingknife/cleaver
			H.change_stat("mageability", 3)
			H.change_stat("faith", 6)
		if(9 to 12) // purple wizard
			if(prob(80))
				beltr = /obj/item/rogueweapon/flail
				backl = /obj/item/rogueweapon/shield/wood
			else
				r_hand = /obj/item/rogueweapon/flail/peasantwarflail
			H.change_stat("mageability", 4)
			H.change_stat("faith", 4)
		if(13 to 16) // blue wizard
			backl = /obj/item/gun/ballistic/revolver/grenadelauncher/bow
			H.mind.adjust_skillrank(/datum/skill/combat/bows, 4, TRUE)
			H.change_stat("mageability", 4)
			H.change_stat("skill", 4)
		if(17 to 20) // green wizard
			r_hand = /obj/item/rogueweapon/spear
			if(prob(40))
				backl = /obj/item/rogueweapon/shield/wood
			H.change_stat("strength", 4)
			H.change_stat("mageability", -2)
		if(21) // black wizard
			r_hand = /obj/item/rogueweapon/greatsword/zwei
			beltr = /obj/item/rogueweapon/sword
			beltl = /obj/item/flashlight/flare/torch/lantern
			armor = /obj/item/clothing/suit/roguetown/armor/plate/full
			gloves = /obj/item/clothing/gloves/roguetown/leather
			head = /obj/item/clothing/head/roguetown/helmet/heavy/pigface
			if(prob(30))
				neck = /obj/item/clothing/neck/roguetown/bervor
			else
				neck = /obj/item/clothing/neck/roguetown/gorget
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE) // either expert or master skill - knights start with master and templars expert sword skill
			H.change_stat("mageability", 4)
			H.change_stat("faith", 4)
			H.change_stat("skill", 4)
			ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)

	var/datum/bounty/new_bounty = new /datum/bounty
	new_bounty.amount = round(rand(200, 300))
	new_bounty.target = H
	new_bounty.banner += "The head of [new_bounty.target] is wanted by The Crown for [new_bounty.amount] mammons.<BR>"
	new_bounty.banner += "For the crime of: 'Shadow Magic'.<BR>"
	new_bounty.banner += "--------------<BR>"
	GLOB.head_bounties += new_bounty
	
	H.ambushable = FALSE

/datum/antagonist/bandit/roundend_report()
	if(owner?.current)
		var/amt = tri_amt
		var/the_name = owner.name
		if(ishuman(owner.current))
			var/mob/living/carbon/human/H = owner.current
			the_name = H.real_name
		if(!amt)
			to_chat(world, "[the_name] was a shadow wizard.")
	return

	var/traitorwin = TRUE

	var/count = 0
	if(objectives.len)//If the traitor had no objectives, don't need to process this.
		for(var/datum/objective/objective in objectives)
			objective.update_explanation_text()
			if(!objective.check_completion())
				traitorwin = FALSE
			count += objective.triumph_count

	if(!count)
		count = 1

	if(traitorwin)
		owner.adjust_triumphs(count)
		to_chat(owner.current, span_greentext("I've TRIUMPHED!"))
		if(owner.current)
			owner.current.playsound_local(get_turf(owner.current), 'sound/misc/triumph.ogg', 100, FALSE, pressure_affected = FALSE)
	else
		to_chat(owner.current, span_redtext("I've failed to satisfy my greed."))
		if(owner.current)
			owner.current.playsound_local(get_turf(owner.current), 'sound/misc/fail.ogg', 100, FALSE, pressure_affected = FALSE)

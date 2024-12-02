/datum/job/roguetown/citywatch
	title = "Watchman"
	flag = GUARDSMAN
	department_flag = GARRISON
	faction = "Station"
	total_positions = 11
	spawn_positions = 11
	selection_color = JCOLOR_SOLDIER
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_TOLERATED_UP
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED)
	tutorial = "Responsible for the safety of the town and the enforcement of the King's law, \
	you are the vanguard of the city faced with punishing those who defy His Royal Majesty. \
	Though you've many lords to obey, as both the Church and the Sheriff have great sway over your life."
	display_order = JDO_TOWNGUARD
	whitelist_req = TRUE

	outfit = /datum/outfit/job/roguetown/citywatch
	give_bank_account = 16
	min_pq = 1
	max_pq = null

	cmode_music = 'sound/music/combat_guard.ogg'


/datum/job/roguetown/citywatch/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	. = ..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		if(istype(H.cloak, /obj/item/clothing/cloak/stabard/guard))
			var/obj/item/clothing/S = H.cloak
			var/index = findtext(H.real_name, " ")
			if(index)
				index = copytext(H.real_name, 1,index)
			if(!index)
				index = H.real_name
			S.name = "watchman tabard ([index])"

/datum/outfit/job/roguetown/citywatch/pre_equip(mob/living/carbon/human/H)
	. = ..()
	head = /obj/item/clothing/head/roguetown/helmet
	pants = /obj/item/clothing/under/roguetown/chainlegs
	cloak = /obj/item/clothing/cloak/stabard/guard
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
	armor = /obj/item/clothing/suit/roguetown/armor/chainmail
	neck = /obj/item/clothing/neck/roguetown/chaincoif
	shoes = /obj/item/clothing/shoes/roguetown/boots
	beltl = /obj/item/keyring/town_watch
	belt = /obj/item/storage/belt/rogue/leather/black
	beltr = /obj/item/rogueweapon/mace/cudgel
	wrists = /obj/item/clothing/wrists/roguetown/bracers
	backr = /obj/item/storage/backpack/rogue/satchel/black
	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel = 1, /obj/item/rope/chain = 1)
	if(H.mind)
		assign_skills(H)
	H.verbs |= /mob/proc/haltyell
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)

/datum/outfit/job/roguetown/citywatch/proc/assign_skills(mob/living/carbon/human/guard)
	guard.mind.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
	guard.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	guard.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	guard.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	guard.mind.adjust_skillrank(/datum/skill/combat/polearms, pick(3,4), TRUE)
	guard.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 3, TRUE)
	guard.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	guard.mind.adjust_skillrank(/datum/skill/combat/bows, 3, TRUE)
	guard.mind.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
	guard.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	guard.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	guard.mind.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
	guard.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	guard.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	guard.mind.adjust_skillrank(/datum/skill/misc/treatment, 1, TRUE)
	guard.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
	guard.change_stat("strength", 1)
	guard.change_stat("skill", 2)
	guard.change_stat("constitution", 1)
	guard.change_stat("endurance", 1)
	guard.change_stat("speed", 1)

/mob/proc/haltyell()
	set name = "HALT!"
	set category = "Noises"
	emote("haltyell")

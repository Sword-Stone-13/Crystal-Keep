/datum/job/roguetown/druid
	title = "Druid"
	f_title = "Druidess"
	flag = DRUID
	department_flag = CHURCHMEN
	faction = "Station"
	total_positions = 2
	spawn_positions = 2

	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS_NO_SEELIE
	allowed_patrons = ALL_DIVINE_PATRONS //gets set to dendor on the outfit anyways lol
	outfit = /datum/outfit/job/roguetown/druid
	tutorial = "You have always been drawn to the wild, and the wild drawn to you. When your calling came, it was from Dendor. Your patron claims dominion over all of nature and promises bounty to those who act in his name to bring balance to His domain. The Bog is the most comfortable place for you, toiling alongside soilsons and soilbrides although sometimes what lies beyond the gates fills your soul with a feral yearning."

	display_order = JDO_DRUID
	associated_squad = /datum/antagonist/squad/none
	give_bank_account = TRUE
	min_pq = 0
	max_pq = null

/datum/outfit/job/roguetown/druid
	name = "Druid"
	jobtype = /datum/job/roguetown/druid
	allowed_patrons = list(/datum/patron/divine/dendor)

/datum/outfit/job/roguetown/druid/pre_equip(mob/living/carbon/human/H)
	..()
	belt = /obj/item/storage/belt/rogue/leather/rope
	beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
	beltr = /obj/item/flashlight/flare/torch/lantern
	backl = /obj/item/storage/backpack/rogue/satchel
	head = /obj/item/clothing/head/roguetown/dendormask
	neck = /obj/item/clothing/neck/roguetown/psicross/dendor
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/dendor
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/treatment, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/holy, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/labor/farming, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/carpentry, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/druidic, 4, TRUE) //Allows you to craft briarmasks. Otherwise this does nothing, but maybe one day it will.
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank(/datum/skill/magic/holy, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/magic/druidic, 1, TRUE)
		H.change_stat("strength", 2)
		H.change_stat("endurance", 1)
		H.change_stat("skill", -1)
		H.change_stat("faith", 4)


	ADD_TRAIT(H, TRAIT_KNEESTINGER_IMMUNITY, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_SEEDKNOW, TRAIT_GENERIC)

	var/datum/devotion/C = new /datum/devotion(H, H.patron)
	C.grant_spells(H)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)

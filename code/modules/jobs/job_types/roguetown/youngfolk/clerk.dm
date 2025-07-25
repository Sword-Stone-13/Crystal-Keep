/datum/job/roguetown/clerk
	title = "Clerk"
	flag = CLERK
	department_flag = YOUNGFOLK
	faction = "Station"
	total_positions = 1
	spawn_positions = 1

	allowed_races = RACES_SHUNNED_UP
	allowed_sexes = list(MALE, FEMALE)
	allowed_ages = list(AGE_YOUTH, AGE_ADULT)

	tutorial = "You have been granted the privilege of serving as a clerk in the Steward's office. You help the Steward with anything they need, and learn how coin keeps the town moving and prosperous."

	outfit = /datum/outfit/job/roguetown/clerk
	display_order = JDO_CLERK
	give_bank_account = TRUE
	min_pq = -10
	max_pq = null
	associated_squad = /datum/antagonist/squad/none


/datum/outfit/job/roguetown/clerk/pre_equip(mob/living/carbon/human/H)
	..()
	ADD_TRAIT(H, TRAIT_SEEPRICES, type)

	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/treatment, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
		H.change_stat("strength", -1)
		H.change_stat("mageability", 1)
		H.change_stat("fortune", 1)

	if(H.gender == MALE)
		armor = /obj/item/clothing/cloak/tabard/knight
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
		pants = /obj/item/clothing/under/roguetown/tights
	if(H.gender == FEMALE)
		shirt = /obj/item/clothing/suit/roguetown/shirt/dress/nobledress/green
		pants = /obj/item/clothing/under/roguetown/tights/stockings/white
	
	shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
	belt = /obj/item/storage/belt/rogue/leather
	beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
	beltl = /obj/item/keyring/clerk
	backr = /obj/item/storage/backpack/rogue/satchel

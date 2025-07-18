/datum/job/roguetown/redknight
	title = "Alrich Knight"
	flag = HOUSE_KNIGHT_RED
	department_flag = HOUSE_KNIGHT_RED
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	allowed_races = RACES_VERY_SHUNNED_UP
	allowed_sexes = list(MALE)
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED)
	tutorial = "A hedge knight, no land, no nobility. Once a champion for the baron in the home lands, you're a performing 'knight' for the house. For the lady."
	display_order = JDO_HOUSE_KNIGHT_RED
	whitelist_req = TRUE
	outfit = /datum/outfit/job/roguetown/redknight
	give_bank_account = 52
	min_pq = 8
	max_pq = null
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED)
	associated_squad = /datum/antagonist/squad/alrich/knight


	cmode_music = 'sound/music/combat_vaquero.ogg'

/datum/outfit/job/roguetown/redknight/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/helmet/heavy/alrich
	gloves = /obj/item/clothing/gloves/roguetown/plate/alrich
	pants = /obj/item/clothing/under/roguetown/platelegs/alrich
	neck = /obj/item/clothing/neck/roguetown/bervor/alrich
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail
	armor = /obj/item/clothing/suit/roguetown/armor/plate/full/alrich
	shoes = /obj/item/clothing/shoes/roguetown/armor/steel/alrich
	beltr = /obj/item/rogueweapon/sword/long
	beltl = /obj/item/key/alrich
	belt = /obj/item/storage/belt/rogue/leather/steel
	backr = /obj/item/storage/backpack/rogue/satchel/black
	if(prob(50))
		r_hand = /obj/item/rogueweapon/greatsword/zwei
	else
		r_hand = /obj/item/rogueweapon/sword/long/rider/messer
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, pick(3,3,3,4), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, pick(3,3,4,5), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, pick(3,3,4), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
		H.change_stat("strength", 3)
		H.change_stat("skill", 2)
		H.change_stat("constitution", 2)
		H.change_stat("endurance", 2)

	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)

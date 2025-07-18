/datum/job/roguetown/blueknight
	title = "Deleon Knight"
	flag = HOUSE_KNIGHT_BLUE
	department_flag = HOUSE_KNIGHT_BLUE
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	allowed_races = RACES_VERY_SHUNNED_UP
	allowed_sexes = list(MALE)
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED)
	tutorial = "House Deleon. You've served this house well. Your house is respected, and thusly are you. One day, maybe you will be recognized as a true noble. One never knows."
	display_order = JDO_HOUSE_KNIGHT_BLUE
	whitelist_req = TRUE
	outfit = /datum/outfit/job/roguetown/blueknight
	give_bank_account = 55
	min_pq = 8
	max_pq = null
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED)
	associated_squad = /datum/antagonist/squad/deleon/knight


	cmode_music = 'sound/music/combat_vaquero.ogg'

/datum/outfit/job/roguetown/blueknight/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/helmet/heavy/knight/deleon
	gloves = /obj/item/clothing/gloves/roguetown/leather/deleon
	pants = /obj/item/clothing/under/roguetown/trou/leather/advanced
	cloak = /obj/item/clothing/cloak/tabard/knight/guard
	neck = /obj/item/clothing/neck/roguetown/bervor
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail
	armor = /obj/item/clothing/suit/roguetown/armor/plate/full/deleon
	shoes = /obj/item/clothing/shoes/roguetown/armor/steel/deleon
	beltr = /obj/item/rogueweapon/sword/long
	beltl = /obj/item/key/deleon
	belt = /obj/item/storage/belt/rogue/leather/steel
	backr = /obj/item/storage/backpack/rogue/satchel/black
	if(prob(50))
		r_hand = /obj/item/rogueweapon/sword/gladius
	else
		r_hand = /obj/item/rogueweapon/flail
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, pick(3,3,4,5), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, pick(3,3,3,4), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, pick(3,3,4), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
		H.change_stat("strength", 3)
		H.change_stat("skill", 1)
		H.change_stat("constitution", 3)
		H.change_stat("endurance", 2)

	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)

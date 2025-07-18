/datum/job/roguetown/purpleknight
	title = "Caesar Knight"
	flag = HOUSE_KNIGHT_PURPLE
	department_flag = HOUSE_KNIGHT_PURPLE
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	allowed_races = RACES_VERY_SHUNNED_UP
	allowed_sexes = list(MALE)
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED)
	tutorial = "'House Caesar is your house now.' These words marked your fate. You were a free lance, a hedge knight, now you've a chance with real names. Viva House Caesar."
	display_order = JDO_HOUSE_KNIGHT_PURPLE
	whitelist_req = TRUE
	outfit = /datum/outfit/job/roguetown/purpleknight
	give_bank_account = 54
	min_pq = 8
	max_pq = null
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED)
	associated_squad = /datum/antagonist/squad/caesar/knight


	cmode_music = 'sound/music/combat_vaquero.ogg'

/datum/outfit/job/roguetown/purpleknight/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/helmet/heavy/caesar
	gloves = /obj/item/clothing/gloves/roguetown/plate/caesar
	pants = /obj/item/clothing/under/roguetown/platelegs/caesar
	neck = /obj/item/clothing/neck/roguetown/chaincoif
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail
	armor = /obj/item/clothing/suit/roguetown/armor/plate/full/caesar
	shoes = /obj/item/clothing/shoes/roguetown/armor/steel/caesar
	beltr = /obj/item/rogueweapon/sword/long
	beltl = /obj/item/key/caesar
	belt = /obj/item/storage/belt/rogue/leather/steel/purple
	backr = /obj/item/storage/backpack/rogue/satchel/black
	if(prob(50))
		r_hand = /obj/item/rogueweapon/glaive
	else
		r_hand = /obj/item/rogueweapon/stoneaxe/battle
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, pick(3,3,3,4), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/axes, pick(3,3,4,5), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, pick(3,3,4), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
		H.change_stat("strength", 1)
		H.change_stat("skill", 3)
		H.change_stat("constitution", 1)
		H.change_stat("endurance", 2)
		H.change_stat("speed", 2)

	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)

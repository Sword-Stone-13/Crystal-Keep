/datum/job/roguetown/yellowknight
	title = "Bravado Knight"
	flag = HOUSE_KNIGHT_YELLOW
	department_flag = HOUSE_KNIGHT_YELLOW
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	allowed_races = RACES_VERY_SHUNNED_UP
	allowed_sexes = list(MALE)
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED)
	tutorial = "One day you returned to the grand house Bravado after a pilgrimage to find the Baron lying comfortably in a gutter. Sadly, you're bound to him by honor of the house."
	display_order = JDO_HOUSE_KNIGHT_YELLOW
	whitelist_req = TRUE
	outfit = /datum/outfit/job/roguetown/yellowknight
	give_bank_account = 53
	min_pq = 8
	max_pq = null
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED)
	associated_squad = /datum/antagonist/squad/bravado/knight


	cmode_music = 'sound/music/combat_vaquero.ogg'

/datum/outfit/job/roguetown/yellowknight/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/helmet/heavy/bravado
	gloves = /obj/item/clothing/gloves/roguetown/plate/bravado
	pants = /obj/item/clothing/under/roguetown/platelegs/bravado
	cloak = /obj/item/clothing/cloak/half/bravado
	neck = /obj/item/clothing/neck/roguetown/bervor/bravado
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail
	armor = /obj/item/clothing/suit/roguetown/armor/plate/full/bravado
	shoes = /obj/item/clothing/shoes/roguetown/armor/steel/bravado
	beltr = /obj/item/rogueweapon/sword/long
	beltl = /obj/item/storage/belt/rogue/pouch/coins/rich//Bravado was once... regal.
	belt = /obj/item/storage/belt/rogue/leather/steel/yellow
	backr = /obj/item/storage/backpack/rogue/satchel/black
	if(prob(50))
		r_hand = /obj/item/rogueweapon/spear/improvisedbillhook
	else
		r_hand = /obj/item/rogueweapon/spear/bronze
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, pick(3,3,4,5), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, pick(3,3,3,4), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, pick(3,3,4), TRUE)
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

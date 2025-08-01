/datum/advclass/fisher
	name = "Fisher"
	tutorial = "You are a fisherman, with your bag of bait and your fishing rod, you are one of few who can reliably get a stable source of meat around here."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/adventurer/fisher

	category_tags = list(CTAG_PILGRIM, CTAG_TOWNER)

/datum/outfit/job/roguetown/adventurer/fisher/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, pick(0,0,1), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/axes, pick(0,1,1), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, pick(0,1,1), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, pick(2,2,3), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, pick(1,1,2), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, pick(1,1,2), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, pick(1,2,2), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, pick(2,2,3), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/hunting, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/treatment, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/carpentry, 1, TRUE)

		H.change_stat("skill", 2)
		H.change_stat("constitution", 1)
		H.change_stat("speed", 1)
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank(/datum/skill/labor/fishing, 5, TRUE)
		else
			H.mind.adjust_skillrank(/datum/skill/labor/fishing, 4, TRUE)
	if(H.gender == MALE)
		pants = /obj/item/clothing/under/roguetown/tights/random
		shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt/random
		shoes = /obj/item/clothing/shoes/roguetown/armor/leather
		neck = /obj/item/storage/belt/rogue/pouch/coins/poor
		head = /obj/item/clothing/head/roguetown/fisherhat
		mouth = /obj/item/rogueweapon/huntingknife
		armor = /obj/item/clothing/suit/roguetown/armor/workervest
		backl = /obj/item/storage/backpack/rogue/satchel
		belt = /obj/item/storage/belt/rogue/leather
		backr = /obj/item/fishingrod
		beltr = /obj/item/cooking/pan
		beltl = /obj/item/flint
		backpack_contents = list(/obj/item/natural/worms = 2,/obj/item/rogueweapon/shovel/small=1)
	else
		armor = /obj/item/clothing/suit/roguetown/shirt/dress/gen/random
		shoes = /obj/item/clothing/shoes/roguetown/armor/leather
		neck = /obj/item/storage/belt/rogue/pouch/coins/poor
		head = /obj/item/clothing/head/roguetown/fisherhat
		mouth = /obj/item/rogueweapon/huntingknife
		backl = /obj/item/storage/backpack/rogue/satchel
		belt = /obj/item/storage/belt/rogue/leather
		backr = /obj/item/fishingrod
		beltr = /obj/item/cooking/pan
		beltl = /obj/item/flint
		backpack_contents = list(/obj/item/natural/worms = 2,/obj/item/rogueweapon/shovel/small=1)

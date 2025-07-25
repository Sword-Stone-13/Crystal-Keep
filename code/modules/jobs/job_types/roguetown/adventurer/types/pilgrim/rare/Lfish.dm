//human master fisher

/datum/advclass/fishermaster
	name = "Master Fisher"
	tutorial = "You are a Master Fisher, you cast your rod with might, and are able to pull fish larger than Eoras Bosom."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/adventurer/fishermaster
	maximum_possible_slots = 1
	pickprob = 5
	category_tags = list(CTAG_PILGRIM)

/datum/outfit/job/roguetown/adventurer/fishermaster/pre_equip(mob/living/carbon/human/H)
	..()
	pants = /obj/item/clothing/under/roguetown/trou
	shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt/random
	shoes = /obj/item/clothing/shoes/roguetown/armor/leather
	neck = /obj/item/storage/belt/rogue/pouch/coins/rich
	head = /obj/item/clothing/head/roguetown/fisherhat
	backl = /obj/item/storage/backpack/rogue/backpack
	armor = /obj/item/clothing/suit/roguetown/armor/leather/vest/sailor
	belt = /obj/item/storage/belt/rogue/leather/rope
	backr = /obj/item/fishingrod
	beltr = /obj/item/cooking/pan
	mouth = /obj/item/rogueweapon/huntingknife
	beltl = /obj/item/flint
	backpack_contents = list(/obj/item/natural/worms/grubs = 12,/obj/item/rogueweapon/shovel/small=1)
	if(H.mind) //looking through this to find they powergamed legendary workers, they don't have time to fight, they're WORKING
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 6, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE) //fishing catalogue monthly
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/hunting, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/treatment, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/carpentry, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/labor/fishing, 6, TRUE)
		H.change_stat("strength", 1) // The biggest catches...
		H.change_stat("mageability", 3) //funny
		H.change_stat("faith", 3) //Christianity is the fisherman's faith
		H.change_stat("skill", 5) // In the murkiest water...
		H.change_stat("constitution", 2)
		H.change_stat("speed", 1)
		H.change_stat("fortune", 2)

		if(H.age == AGE_OLD)

			H.mind.adjust_skillrank(/datum/skill/misc/athletics, -1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/hunting, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/treatment, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/carpentry, 1, TRUE)
			H.change_stat("mageability", 2)

//human master chef

/datum/advclass/masterchef
	name = "Master Chef"
	tutorial = "A master chef, one of the best cooks to ever live. \
	With noble origins, you were taught by cooking masters in the secretive League of Fine Dining in exotic meals from all around the world \
	Now you wander, free to experiment, cook exotic dishes and gourmet meals, worthy for even the most capricious noble."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/adventurer/masterchef
	maximum_possible_slots = 1
	pickprob = 5
	category_tags = list(CTAG_PILGRIM)

/datum/outfit/job/roguetown/adventurer/masterchef/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE) 
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE) // Beating meat.
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 5, TRUE) // Ancient cookbooks.
	H.mind.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/hunting, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/cooking, 6, TRUE)
	H.mind.adjust_skillrank(/datum/skill/labor/farming, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/treatment, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE) // Someone, actually, gave them legendary knife skills... COMBAT knife skills. 
	belt = /obj/item/storage/belt/rogue/leather/rope
	pants = /obj/item/clothing/under/roguetown/tights/random
	shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt/random
	cloak = /obj/item/clothing/cloak/apron
	head = /obj/item/clothing/head/roguetown/chef
	shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
	backr = /obj/item/storage/backpack/rogue/backpack
	neck = /obj/item/storage/belt/rogue/pouch/coins/rich
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	beltr = /obj/item/cooking/pan
	beltl = /obj/item/flashlight/flare/torch/lantern
	mouth = /obj/item/rogueweapon/huntingknife/idagger/silver/elvish/drow // A simple knife for a legend? No. Never.
	backpack_contents = list(/obj/item/reagent_containers/powder/salt = 8,/obj/item/reagent_containers/food/snacks/rogue/cheddar = 2,/obj/item/bait = 4)
	H.change_stat("strength", 1) 
	H.change_stat("endurance", 1)
	H.change_stat("constitution", 2)
	H.change_stat("speed", 2)
	H.change_stat("skill", 3)

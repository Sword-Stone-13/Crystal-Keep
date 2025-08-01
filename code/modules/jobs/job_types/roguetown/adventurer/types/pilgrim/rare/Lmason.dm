//dwarf master mason

/datum/advclass/grandmastermason
	name = "Grandmaster Mason"
	tutorial = "A Grandmaster mason, you built castles and entire cities with your own hands. \
	There is nothing in this world that you can't build, your creed and hardwork has revealed all the secrets of the stone."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/adventurer/grandmastermason
	category_tags = list(CTAG_PILGRIM)
	maximum_possible_slots = 1
	pickprob = 5
	
/datum/outfit/job/roguetown/adventurer/grandmastermason/pre_equip(mob/living/carbon/human/H)
	..()
	
	H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE) // Breaking already placed walls
	H.mind.adjust_skillrank(/datum/skill/labor/lumberjacking, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/labor/mining, 3, TRUE) // No fortune, still worse than normal miner
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, 5, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/carpentry, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/masonry, 6, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/engineering, 6, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 5, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/treatment, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	head = /obj/item/clothing/head/roguetown/hatblu
	armor = /obj/item/clothing/suit/roguetown/armor/leather/vest
	cloak = /obj/item/clothing/cloak/apron/waist/bar
	pants = /obj/item/clothing/under/roguetown/trou
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/random
	shoes = /obj/item/clothing/shoes/roguetown/armor/leather
	belt = /obj/item/storage/belt/rogue/leather
	beltr = /obj/item/storage/belt/rogue/pouch/coins/rich
	beltl = /obj/item/rogueweapon/pick/steel
	backr = /obj/item/rogueweapon/mace
	backl = /obj/item/storage/backpack/rogue/backpack
	H.change_stat("strength", 4)
	H.change_stat("endurance", 5)
	H.change_stat("skill", 5)
	H.change_stat("constitution", 3) 

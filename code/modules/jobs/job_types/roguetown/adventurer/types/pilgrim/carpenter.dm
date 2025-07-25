/datum/advclass/carpenter
	name = "Carpenter"
	tutorial = "A skilled carpenter, able to manipulate wood to suit their needs \
	building forts and stores, carpenting floors, putting up crosses. You can do it all with enough logs."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/adventurer/carpenter

	category_tags = list(CTAG_PILGRIM, CTAG_TOWNER)

/datum/outfit/job/roguetown/adventurer/carpenter/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE) // They use hammers, sawes and axes all day.
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE) 
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE) 
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE) 
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE) // They work at great heights.
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/carpentry, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/masonry, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/engineering, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/labor/lumberjacking, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/treatment, 1, TRUE)
	head = /obj/item/clothing/head/roguetown/hatfur
	if(prob(50))
		head = /obj/item/clothing/head/roguetown/hatblu
	armor = /obj/item/clothing/suit/roguetown/armor/workervest
	pants = /obj/item/clothing/under/roguetown/trou
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/random
	shoes = /obj/item/clothing/shoes/roguetown/armor/leather
	belt = /obj/item/storage/belt/rogue/leather
	beltr = /obj/item/storage/belt/rogue/pouch/coins/mid
	beltl = /obj/item/rogueweapon/hammer/claw
	backl = /obj/item/storage/backpack/rogue/backpack
	backpack_contents = list(/obj/item/flint = 1, /obj/item/rogueweapon/huntingknife = 1)
	H.change_stat("strength", 1)
	H.change_stat("endurance", 2)
	H.change_stat("constitution", 1)
	H.change_stat("mageability", 1)
	H.change_stat("speed", -1)

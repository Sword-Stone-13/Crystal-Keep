/datum/advclass/dranger
	name = "Ranger"
	tutorial = "Caveborn rangers, much like their humen counterparts, \
	live outside of society and explore the far corners of the creation. They \
	protect their settlements from wild beasts and sell their notes to the cartographers."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		/datum/species/dwarf/mountain,
		/datum/species/kobold,
		)
	outfit = /datum/outfit/job/roguetown/adventurer/dranger
	traits_applied = list(TRAIT_MEDIUMARMOR)
	category_tags = list(CTAG_ADVENTURER)

/datum/outfit/job/roguetown/adventurer/dranger/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/roguehood
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	pants = /obj/item/clothing/under/roguetown/trou/leather
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/random
	shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
	belt = /obj/item/storage/belt/rogue/leather
	backr = /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow
	backl = /obj/item/storage/backpack/rogue/satchel
	beltr = /obj/item/rogueweapon/stoneaxe/woodcut
	beltl = /obj/item/ammo_holder/quiver/bolts
	armor = /obj/item/clothing/suit/roguetown/armor/leather/hide
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	backpack_contents = list(/obj/item/rogueweapon/huntingknife = 1)
	if(prob(23))
		shoes = /obj/item/clothing/shoes/roguetown/armor
	if(prob(23))
		shoes = /obj/item/clothing/shoes/roguetown/armor/leather
	cloak = /obj/item/clothing/cloak/raincloak/brown
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/hunting, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sewing, 3, TRUE)	
	H.mind.adjust_skillrank(/datum/skill/misc/treatment, 2, TRUE)
	H.change_stat("skill", 3) // Copied some stats from Ranger
	H.change_stat("constitution", 2)
	H.change_stat("endurance", 1)
	H.change_stat("speed", 1)

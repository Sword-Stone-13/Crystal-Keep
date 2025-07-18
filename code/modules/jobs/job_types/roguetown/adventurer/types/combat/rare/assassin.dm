/datum/advclass/assassin
	name = "Assassin"
	tutorial = "A deadly folk, likely from dark lands, skilled in the art of assassination. They come disguised often... "
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		/datum/species/tieberian,
		/datum/species/kobold,
		/datum/species/elf/dark,
	)
	pickprob = 25
	maximum_possible_slots = 2
	traits_applied = list(TRAIT_DODGEEXPERT, TRAIT_SILENT_FIGHTER)
	category_tags = list(CTAG_ADVENTURER)

	outfit = /datum/outfit/job/roguetown/adventurer/assassin

/datum/outfit/job/roguetown/adventurer/assassin/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/hunting, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/treatment, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/carpentry, 1, TRUE)
		H.change_stat("strength", 1)
		H.change_stat("mageability", 2)
		H.change_stat("skill", 4)
		H.change_stat("speed", 3)
		H.change_stat("faith", -3)
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
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
		backpack_contents = list(/obj/item/reagent_containers/glass/bottle/rogue/poison,/obj/item/rogueweapon/shovel/small=1, /obj/item/rogueweapon/huntingknife/idagger/silver/elvish/drow)
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
		backpack_contents = list(/obj/item/reagent_containers/glass/bottle/rogue/poison,/obj/item/rogueweapon/shovel/small=1, /obj/item/rogueweapon/huntingknife/idagger/silver/elvish/drow)

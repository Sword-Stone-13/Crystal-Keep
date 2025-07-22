//elf ranger

/datum/advclass/sentinel
	name = "Sentinel"
	tutorial = "Elvish Sentinels are reconnaissance scouts sent out by Walnut Woods to perview areas of interest and display elvish prowess foreignly; their arrows are said to contain poisons from the native trees."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		/datum/species/human/halfelf,
		/datum/species/elf/wood,
	)
	outfit = /datum/outfit/job/roguetown/adventurer/sentinal
	maximum_possible_slots = 2
	pickprob = 50
	traits_applied = list(TRAIT_MEDIUMARMOR, TRAIT_DODGEEXPERT)
	category_tags = list(CTAG_ADVENTURER)


/datum/outfit/job/roguetown/adventurer/sentinal/pre_equip(mob/living/carbon/human/H)
	..()
	shoes = /obj/item/clothing/shoes/roguetown/armor/leather
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/bows, pick(4,5,5,6), TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/hunting, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sewing, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/treatment, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/labor/fishing, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	if(H.gender == MALE)
		pants = /obj/item/clothing/under/roguetown/trou/leather
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
	else
		pants = /obj/item/clothing/under/roguetown/tights/black
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
	gloves = /obj/item/clothing/gloves/roguetown/leather
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	belt = /obj/item/storage/belt/rogue/leather
	armor = /obj/item/clothing/suit/roguetown/armor/leather/hide
	cloak = /obj/item/clothing/cloak/raincloak/green
	backr = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve/elfnut
	backl = /obj/item/storage/backpack/rogue/satchel
	beltr = /obj/item/rogueweapon/sword/short/elfnut
	id = /obj/item/clothing/ring/gold/burial
	backpack_contents = list(/obj/item/reagent_containers/glass/bottle/rogue/berrypoison, /obj/item/rogueweapon/huntingknife/idagger/silver/elvish = 1, /obj/item/flashlight/flare/torch/lantern = 1)
	beltl = /obj/item/ammo_holder/quiver/arrows/
	H.change_stat("skill", 5)
	H.change_stat("endurance", 2)
	H.change_stat("speed", 3)
	H.ambushable = FALSE
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	if(!H.has_language(/datum/language/beachbum))
		H.grant_language(/datum/language/beachbum)
		to_chat(H, span_info("I can speak deep elf with ,l before my speech."))

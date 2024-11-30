/datum/advclass/gloomstalker
	name = "gloomstalker"
	tutorial = "gloomstalkers are rangers from the deep. In most all cases, it's a dark elf's world down there."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(/datum/species/elf/dark,)
	outfit = /datum/outfit/job/roguetown/adventurer/gloomstalker
	traits_applied = list(TRAIT_MEDIUMARMOR, TRAIT_DODGEEXPERT)
	category_tags = list(CTAG_ADVENTURER)

/datum/outfit/job/roguetown/adventurer/gloomstalker/pre_equip(mob/living/carbon/human/H)
	..()
	shoes = /obj/item/clothing/shoes/roguetown/armor/leather
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	gloves = /obj/item/clothing/gloves/roguetown/leather
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	belt = /obj/item/storage/belt/rogue/leather
	armor = /obj/item/clothing/suit/roguetown/armor/leather/studded
	cloak = /obj/item/clothing/cloak/raincloak/mortus
	backr = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve
	backl = /obj/item/storage/backpack/rogue/satchel
	beltr = /obj/item/flashlight/flare/torch/lantern
	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger = 1)
	beltl = /obj/item/ammo_holder/quiver/arrows
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/bows, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/treatment, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/riding, rand(1,2), TRUE)
	H.change_stat("skill", 2)
	H.change_stat("endurance", 1)
	H.change_stat("speed", 3)
		
	if(H.gender == MALE)
		pants = /obj/item/clothing/under/roguetown/trou/leather
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
	else
		pants = /obj/item/clothing/under/roguetown/tights
		if(prob(50))
			pants = /obj/item/clothing/under/roguetown/tights/black
			gloves = /obj/item/clothing/gloves/roguetown/fingerless
	
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	if(prob(23))
		if(!H.has_language(/datum/language/elvish))
			H.grant_language(/datum/language/elvish)
			to_chat(H, span_info("I can speak Elfish with ,e before my speech."))

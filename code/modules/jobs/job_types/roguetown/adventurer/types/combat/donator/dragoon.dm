/datum/advclass/dragoon
	name = "dragoon"
	tutorial = "dragoons are the soldery born of Kobold homes to defend kobold fortresses from Dwarven scoundrils, and the first to march onto their territory."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		/datum/species/kobold,
	)
	outfit = /datum/outfit/job/roguetown/adventurer/dragoon

	traits_applied = list(TRAIT_HEAVYARMOR, TRAIT_LEAPER)
	maximum_possible_slots = 2
	category_tags = list(CTAG_ADVENTURER)

/datum/outfit/job/roguetown/adventurer/dragoon/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/helmet/sallet //
	pants = /obj/item/clothing/under/roguetown/trou/leather
	shoes = /obj/item/clothing/shoes/roguetown/armor/leather
	belt = /obj/item/storage/belt/rogue/leather
	armor = /obj/item/clothing/suit/roguetown/armor/plate/half
	neck = /obj/item/storage/belt/rogue/pouch/coins/mid
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	backr = /obj/item/rogueweapon/shield/heater
	backl = /obj/item/storage/backpack/rogue/satchel
	if(prob(25))
		gloves = /obj/item/clothing/gloves/roguetown/chain
	else
		gloves = /obj/item/clothing/gloves/roguetown/angle
	if(prob(50))
		beltl = /obj/item/rogueweapon/sword/short
	else if(prob(50))
		beltl = /obj/item/rogueweapon/sword/iron/short/chipped
	else
		r_hand = /obj/item/rogueweapon/spear/billhook
		beltl = /obj/item/rogueweapon/huntingknife
	

	H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/treatment, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 1,, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/labor/mining, 3, TRUE)

	H.change_stat("speed", 2)
	H.change_stat("strength", 2)
	H.change_stat("endurance", 2)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/secondwind)

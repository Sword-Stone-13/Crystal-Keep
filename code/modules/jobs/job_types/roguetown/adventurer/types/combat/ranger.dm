/datum/advclass/ranger
	name = "Ranger"
	tutorial = "Rangers are a mix of hunters and rogues, staying in the shadows, but often being more friendly to others than a rogue, much more in touch with nature and more skilled in the arts of survival."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/adventurer/ranger
	traits_applied = list(TRAIT_MEDIUMARMOR, TRAIT_DODGEEXPERT)
	category_tags = list(CTAG_ADVENTURER)

/datum/outfit/job/roguetown/adventurer/ranger/pre_equip(mob/living/carbon/human/H)
	..()
	to_chat(H, span_warning("Rangers are masters of nature, often hired as pathfinders, bodyguards and mercenaries in areas of wilderness untraversable to common soldiery."))
	shoes = /obj/item/clothing/shoes/roguetown/armor/leather
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	gloves = /obj/item/clothing/gloves/roguetown/leather
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	belt = /obj/item/storage/belt/rogue/leather
	armor = /obj/item/clothing/suit/roguetown/armor/leather/hide
	cloak = /obj/item/clothing/cloak/raincloak/brown
	cloak = /obj/item/clothing/cloak/raincloak/green
	backr = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve
	backl = /obj/item/storage/backpack/rogue/satchel
	beltr = /obj/item/flashlight/flare/torch/lantern
	if (prob(50))
		id = /obj/item/clothing/ring/gold/burial
	else
		id = /obj/item/clothing/ring/silver/burial
	backpack_contents = list(/obj/item/bait = 1, /obj/item/rogueweapon/huntingknife = 1)
	beltl = /obj/item/ammo_holder/quiver/arrows
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/axes, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/bows, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/hunting, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/labor/fishing, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/treatment, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
	H.change_stat("skill", 3)
	H.change_stat("endurance", 2)
	H.change_stat("speed", 2)

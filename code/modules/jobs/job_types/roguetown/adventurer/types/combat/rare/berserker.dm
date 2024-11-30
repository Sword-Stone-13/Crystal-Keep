//terrify mobs scream
/datum/advclass/berserker
	name = "Berserker"
	tutorial = "A terrifying beast who roams areas leading bands and cleaning house."
	allowed_sexes = list(FEMALE)
	allowed_races = list(
		/datum/species/lizardfolk,
	)
	outfit = /datum/outfit/job/roguetown/adventurer/berserker
	traits_applied = list(TRAIT_CRITICAL_RESISTANCE, TRAIT_NOPAINSTUN, TRAIT_STRONGBITE, TRAIT_NASTY_EATER, TRAIT_MEDIUMARMOR) //experimental, but this should be a monster
	cmode_music = 'sound/music/combat_gronn.ogg'
	category_tags = list(CTAG_ADVENTURER)

/datum/outfit/job/roguetown/adventurer/berserker
	allowed_patrons = list(/datum/patron/divine/ravox, /datum/patron/inhumen/graggar)

/datum/outfit/job/roguetown/adventurer/berserker/pre_equip(mob/living/carbon/human/H)
	..() 
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, pick(0,1), TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, pick(3,4), TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/hunting, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/labor/fishing, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/axes, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
	beltr = /obj/item/rogueweapon/stoneaxe
	belt = /obj/item/storage/belt/rogue/leather
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	beltl = /obj/item/rogueweapon/huntingknife
	backl = /obj/item/storage/backpack/rogue/satchel
	shoes = /obj/item/clothing/shoes/roguetown/armor/leather
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	if(prob(55))
		head = /obj/item/clothing/head/roguetown/helmet/horned
	if(prob(23))
		armor = /obj/item/clothing/suit/roguetown/armor/leather
	else
		armor = /obj/item/clothing/suit/roguetown/armor/leather/hide
	if(prob(40))
		cloak = /obj/item/clothing/cloak/raincloak/furcloak/brown
	H.change_stat("mageability", -3)
	H.change_stat("strength", 4)
	H.change_stat("constitution", 3)
	H.change_stat("endurance", 3)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/barbarian_rage)


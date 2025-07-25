//challenge class, spawns with no items at all
/datum/advclass/nudist
	name = "Tribal" //Frazetta men
	tutorial = "You have come to this land wholly unprepared!\nSurvival will be a true TRIUMPH."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		/datum/species/human/northern,
		/datum/species/halforc,
		/datum/species/lizardfolk,
	)
	outfit = /datum/outfit/job/roguetown/adventurer/nudist
	traits_applied = list(TRAIT_NUDIST, TRAIT_STRONGTHROW, TRAIT_NASTY_EATER, TRAIT_DODGEEXPERT)
	category_tags = list(CTAG_ADVENTURER, CTAG_PILGRIM)

/datum/outfit/job/roguetown/adventurer/nudist
	allowed_patrons = list(/datum/patron/divine/dendor)

/datum/outfit/job/roguetown/adventurer/nudist/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/carpentry, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/treatment, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
	H.change_stat("strength", 3)
	H.change_stat("endurance", 4)
	H.change_stat("constitution", 1)
	H.change_stat("mageability", -3)
	H.change_stat("skill", -3)

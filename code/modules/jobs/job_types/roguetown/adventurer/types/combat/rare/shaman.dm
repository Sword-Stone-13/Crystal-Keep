//shield
/datum/advclass/shaman
	name = "Shaman"
	tutorial = "Shamans are the closest thing to clerics or healers that primitive or god forsaken creachers can muster."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		/datum/species/halforc,
		/datum/species/tieberian,
		/datum/species/kobold,
		/datum/species/lizardfolk,
	)
	vampcompat = FALSE
	outfit = /datum/outfit/job/roguetown/adventurer/cleric
	category_tags = list(CTAG_ADVENTURER)

	cmode_music = 'sound/music/combat_clergy.ogg'

/datum/outfit/job/roguetown/adventurer/cleric
	allowed_patrons = ALL_CLERIC_PATRONS

/datum/outfit/job/roguetown/adventurer/shaman/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/roguehood/mage
	shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
	pants = /obj/item/clothing/under/roguetown/trou/leather
	shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/mage
	belt = /obj/item/storage/belt/rogue/leather/rope
	beltr = /obj/item/reagent_containers/glass/bottle/rogue/manapot
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	beltl = /obj/item/rogueweapon/huntingknife
	backl = /obj/item/storage/backpack/rogue/satchel
	r_hand = /obj/item/rogueweapon/woodstaff
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/treatment, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/holy, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/labor/farming, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/carpentry, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/druidic, 4, TRUE) //Allows you to craft briarmasks. Otherwise this does nothing, but maybe one day it will.
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank(/datum/skill/misc/treatment, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/magic/holy, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/magic/druidic, 1, TRUE)
		H.change_stat("mageability", 3)
		H.change_stat("endurance", 2)
		H.change_stat("skill", 1)
		H.change_stat("faith", 1)

		ADD_TRAIT(H, TRAIT_SEEDKNOW, TRAIT_GENERIC)

	var/datum/devotion/C = new /datum/devotion(H, H.patron)
	C.grant_spells_templar(H) //later just miracle for a spell pretty much
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)

/datum/job/roguetown/undertaker
	title = "Mortician"
	flag = GRAVEDIGGER
	department_flag = CHURCHMEN
	faction = "Station"
	total_positions = 3
	spawn_positions = 3

	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_TOLERATED_UP
	allowed_patrons = ALL_DIVINE_PATRONS //gets set to necra on the outfit anyways lol
	tutorial = "As an acolyte of Necra, you have been given the not-so-graceful task of putting the dead to rest instead of healing the living. It isn't a great job by any means, but surely Necra doesn't mind if you take a few trinkets from the dead, right?"

	outfit = /datum/outfit/job/roguetown/undertaker
	display_order = JDO_GRAVEMAN
	associated_squad = /datum/antagonist/squad/none
	give_bank_account = TRUE
	min_pq = -5
	max_pq = null

/datum/outfit/job/roguetown/undertaker
	allowed_patrons = list(/datum/patron/divine/necra)

/datum/outfit/job/roguetown/undertaker/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/necrahood
	neck = /obj/item/clothing/neck/roguetown/psicross/necra
	cloak = /obj/item/clothing/cloak/raincloak/mortus
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/necra
	shirt = /obj/item/clothing/suit/roguetown/armor/leather/vest/black
	pants = /obj/item/clothing/under/roguetown/trou/leather/mourning
	shoes = /obj/item/clothing/shoes/roguetown/armor
	belt = /obj/item/storage/belt/rogue/leather/rope
	beltl = /obj/item/keyring/gravedigger
	beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
	backr = /obj/item/rogueweapon/shovel
	backl = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(/obj/item/flashlight/flare/torch/lantern = 1, /obj/item/natural/bundle/stick = 1)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/treatment, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/holy, 3, TRUE)
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank(/datum/skill/magic/holy, 1, TRUE)
		H.change_stat("strength", 1)
		H.change_stat("constitution", 1)
		H.change_stat("mageability", -2)
		H.change_stat("endurance", 2)
		H.change_stat("speed", 1)
		H.change_stat("faith", 2)
	ADD_TRAIT(H, TRAIT_NOSTINK, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_SOUL_EXAMINE, TRAIT_GENERIC)
	var/datum/devotion/C = new /datum/devotion(H, H.patron)
	C.grant_spells(H)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)

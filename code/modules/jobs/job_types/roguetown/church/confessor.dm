/datum/job/roguetown/shepherd
	title = "Confessor"
	flag = CONFESSOR
	department_flag = CHURCHMEN
	faction = "Station"
	total_positions = 2
	spawn_positions = 2

	allowed_races = RACES_TOLERATED_UP
	allowed_patrons = list(
		/datum/patron/divine/ravox
	)
	allowed_sexes = list(MALE)

	tutorial = "Confessors are shady agents of the church hired to spy on the populace and keep them moral. \
	As the most fanatical members of the clergy, their main concern is assisting the local Inquisitor with their work. \
	Whether that be in extracting confessions of sin or hunting night beasts and cultists that hide in plain sight."

	outfit = /datum/outfit/job/roguetown/shepherd
//	spells = list(/obj/effect/proc_holder/spell/invoked/heal, /obj/effect/proc_holder/spell/invoked/shepherd)
	whitelist_req = TRUE
	display_order = JDO_SHEPHERD
	associated_squad = /datum/antagonist/squad/none
	give_bank_account = 3
	min_pq = 0
	max_pq = null

/datum/outfit/job/roguetown/shepherd
	name = "Confessor"
	jobtype = /datum/job/roguetown/shepherd
/datum/outfit/job/roguetown/shepherd/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/puritan
	cloak = /obj/item/clothing/cloak/cape/puritan
	belt = /obj/item/storage/belt/rogue/leather
	shoes = /obj/item/clothing/shoes/roguetown/armor
	neck = /obj/item/clothing/neck/roguetown/horus
	pants = /obj/item/clothing/under/roguetown/tights/black
	beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
	mask = /obj/item/clothing/mask/rogue/shepherd
	armor = /obj/item/clothing/suit/roguetown/armor/leather/vest/black
	beltl = /obj/item/rogueweapon/mace/cudgel
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	backl = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(/obj/item/keyring/shepherd = 1)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/treatment, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/stealing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
		H.change_stat("mageability", -1)
		H.change_stat("endurance", 1)
		H.change_stat("strength", 2)
		H.change_stat("speed", 2)
		H.change_stat("skill", 1)
		H.change_stat("faith", 2)

/*		if(H.mind.has_antag_datum(/datum/antagonist))
			return
		var/datum/antagonist/new_antag = new /datum/antagonist/purishep()
		H.mind.add_antag_datum(new_antag)*/
	H.verbs |= /mob/living/carbon/human/proc/faith_test

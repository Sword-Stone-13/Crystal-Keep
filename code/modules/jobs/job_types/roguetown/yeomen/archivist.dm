/datum/job/roguetown/archivist
	title = "Archivist"
	tutorial = " The Archivist meticulously preserves and organizes ancient scrolls and tomes, safeguarding the collective knowledge of the realm for generations to come. Nobles and Peasants alike often seek the Archivists expertise on matters of history and fact."
	flag = ARCHIVIST
	department_flag = YEOMEN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	spells = list(/obj/effect/proc_holder/spell/invoked/projectile/fetch)
	allowed_races = RACES_TOLERATED_UP
	allowed_ages = ALL_AGES_LIST

	outfit = /datum/outfit/job/roguetown/archivist
	display_order = JDO_ARCHIVIST
	min_pq = 0
	max_pq = null
	associated_squad = /datum/antagonist/squad/none


/datum/outfit/job/roguetown/archivist
	allowed_patrons = list(/datum/patron/divine/noc)

/datum/outfit/job/roguetown/archivist/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.gender == FEMALE)
		shirt = /obj/item/clothing/suit/roguetown/shirt/dress/gen/black
		pants = /obj/item/clothing/under/roguetown/tights/black
		head  = /obj/item/clothing/head/roguetown/roguehood/black
	else
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/puritan
		armor = /obj/item/clothing/suit/roguetown/armor/leather/vest/sailor/nightman
		pants = /obj/item/clothing/under/roguetown/tights/black
		head = /obj/item/clothing/head/roguetown/nightman
	H.virginity = TRUE
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	belt = /obj/item/storage/belt/rogue/leather/plaquesilver
	backr = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(/obj/item/storage/fancy/ifak = 1, /obj/item/reagent_containers/glass/alembic = 1, /obj/item/keyring/archivist)
	beltl = /obj/item/rogueweapon/huntingknife/idagger
	beltr = /obj/item/storage/belt/rogue/pouch/coins/mid
	mask = /obj/item/clothing/mask/rogue/spectacles


	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 6, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/treatment, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
		H.change_stat("strength", -2)
		H.change_stat("mageability", 8)
		H.change_stat("skill", 4)
		H.change_stat("faith", -1)
		H.change_stat("constitution", -2)
		H.change_stat("speed", -2)



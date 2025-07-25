/datum/job/roguetown/physician
	title = "Court Physician"
	flag = PHYSICIAN
	department_flag = NOBLEMEN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1

	allowed_races = RACES_TOLERATED_UP
	allowed_sexes = list(MALE, FEMALE)
	display_order = JDO_PHYSICIAN
	tutorial = "You were a child born into good wealth - But poor health. \
		Perhaps in another life, you would have turned out to be a powerful mage, wise archivist or a shrewd steward, \
		but leprosy took away your younger years. \
		Out of desperation, you followed the ways of Pestra and managed to be cured. \
		Now you serve in the King's court ensuring the good health of those inhabiting the keep."
	outfit = /datum/outfit/job/roguetown/physician
	whitelist_req = TRUE
	associated_squad = /datum/antagonist/squad/none
	give_bank_account = 25
	min_pq = 2
	max_pq = null

	cmode_music = 'sound/music/combat_physician.ogg'

/datum/outfit/job/roguetown/physician
	name = "Physician"
	jobtype = /datum/job/roguetown/physician
	allowed_patrons = list(/datum/patron/divine/pestra, /datum/patron/inhumen/graggar)

/datum/outfit/job/roguetown/physician/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/physician
	mask = /obj/item/clothing/mask/rogue/physician
	neck = /obj/item/clothing/neck/roguetown/psicross/pestra
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/physician
	shirt = /obj/item/clothing/suit/roguetown/shirt/tunic/red
	gloves = /obj/item/clothing/gloves/roguetown/leather
	pants = /obj/item/clothing/under/roguetown/trou/leather/mourning
	shoes = /obj/item/clothing/shoes/roguetown/armor/leather
	belt = /obj/item/storage/belt/rogue/leather/black
	beltl = /obj/item/reagent_containers/glass/bottle/waterskin
	beltr = /obj/item/keyring/physician
	id = /obj/item/clothing/ring/quartzs
	r_hand = /obj/item/rogueweapon/woodstaff
	backl = /obj/item/storage/backpack/rogue/backpack
	backpack_contents = list(/obj/item/storage/fancy/skit = 1, /obj/item/storage/fancy/ifak = 1, /obj/item/reagent_containers/glass/alembic = 1,)
	ADD_TRAIT(H, TRAIT_EMPATH, "[type]")
	ADD_TRAIT(H, TRAIT_NOSTINK, "[type]")
	ADD_TRAIT(H, TRAIT_ROT_EATER, "[type]")
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/labor/farming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/treatment, 6, TRUE)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/diagnose/secular)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/docheal)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/stable)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/purge)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/debride)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/cpr)
		H.change_stat("strength", -1)
		H.change_stat("constitution", -2)
		H.change_stat("skill", 3)
		H.change_stat("fortune", 1)
		H.change_stat("endurance", -2)
		if(H.age == AGE_OLD)
			H.change_stat("speed", -1)
			H.change_stat("skill", 1)
			H.change_stat("skill", 1)
			H.change_stat("faith", -3)


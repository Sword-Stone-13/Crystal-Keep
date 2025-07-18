/datum/job/roguetown/yellowmage
	title = "Bravado Witch"
	flag = HOUSE_WITCH_YELLOW
	department_flag = HOUSE_WITCH_YELLOW
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	allowed_sexes = list(FEMALE)
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED)

	allowed_races = RACES_VERY_SHUNNED_UP

	tutorial = "You live in the rubble you call home. Somehow you can't help but feel it was your fault."

	spells = list(/obj/effect/proc_holder/spell/invoked/learnspell) 
	outfit = /datum/outfit/job/roguetown/yellowmage
	display_order = JDO_HOUSE_WITCH_YELLOW
	give_bank_account = 57

	min_pq = 0
	max_pq = null
	associated_squad = /datum/antagonist/squad/bravado/mage


/datum/outfit/job/roguetown/yellowmage/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/wizhat/house/yellow
	shirt = /obj/item/clothing/suit/roguetown/shirt/dress/houseyellow
	belt = /obj/item/storage/belt/rogue/leather/rope
	beltr = /obj/item/reagent_containers/glass/bottle/rogue/manapot
	r_hand = /obj/item/rogueweapon/woodstaff
	gloves = /obj/item/clothing/gloves/roguetown/leather/house
	shoes = /obj/item/clothing/shoes/roguetown/armor/leather/house/yellow
	backr = /obj/item/storage/backpack/rogue/satchel
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/arcane, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/druidic, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/treatment, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
		H.mind.adjust_spellpoints(5)
	H.change_stat("strength", -1)
	H.change_stat("constitution", -1)
	H.change_stat("mageability", 4)
	H.change_stat("skill", 2)
	H.change_stat("faith", 3)

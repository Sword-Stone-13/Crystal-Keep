/datum/job/roguetown/councillor
	title = "Councillor"
	flag = COUNCILLOR
	department_flag = NOBLEMEN
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED)
	allowed_races = RACES_SHUNNED_UP
	allowed_sexes = list(MALE, FEMALE)
	display_order = JDO_COUNCILLOR
	tutorial = "You may have inherited this role, bought your way into it, or were appointed by the Marshal themselves; \
			Regardless of origin, you now serve as an assistant, planner, and juror for the Marshal. \
			You help him oversee the taxation, construction, and planning of new laws. \
			You only answer to the King, Marshal, Queen, Heir, or Heiress. However, your main focus is to assist the Marshal with their duties."
	whitelist_req = FALSE
	outfit = /datum/outfit/job/roguetown/councillor
	associated_squad = /datum/antagonist/squad/none

	give_bank_account = 40
	min_pq = 2
	max_pq = null

/datum/outfit/job/roguetown/councillor/pre_equip(mob/living/carbon/human/H)
	..()
	armor = /obj/item/clothing/suit/roguetown/armor/gambeson/councillor
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/random
	pants = /obj/item/clothing/under/roguetown/tights/random
	shoes = /obj/item/clothing/shoes/roguetown/armor
	head = /obj/item/clothing/head/roguetown/chaperon/councillor
	backl = /obj/item/storage/backpack/rogue/satchel
	belt = /obj/item/storage/belt/rogue/leather/plaquesilver
	beltl = /obj/item/keyring/councillor
	cloak = /obj/item/clothing/cloak/stabard/surcoat/councillor
	beltr = /obj/item/storage/belt/rogue/pouch/coins/rich
	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel = 1)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
		H.change_stat("skill", 3)
		H.change_stat("constitution", 1)
		H.change_stat("fortune", 2)
		H.change_stat("faith", -3)
		if(isdwarfmountain(H))
			ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
		if(iswoodelf(H))
			ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
		if(ishumannorthern(H))
			ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	


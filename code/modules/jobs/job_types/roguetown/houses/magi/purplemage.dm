/datum/job/roguetown/purplemage
	title = "Caesar Witch"
	flag = HOUSE_WITCH_PURPLE
	department_flag = HOUSE_WITCH_PURPLE
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	allowed_sexes = list(FEMALE)
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED)

	allowed_races = RACES_VERY_SHUNNED_UP

	tutorial = "The Great House Caesar has given you an opportunity to stay in on it's land. It's an honorable thing to be their house mage!"

	spells = list(/obj/effect/proc_holder/spell/invoked/learnspell) 
	outfit = /datum/outfit/job/roguetown/purplemage
	display_order = JDO_HOUSE_WITCH_PURPLE
	give_bank_account = 58

	min_pq = 0
	max_pq = null
	associated_squad = /datum/antagonist/squad/caesar/mage


/datum/outfit/job/roguetown/purplemage/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/wizhat/house/purple
	belt = /obj/item/storage/belt/rogue/leather/purplemage
	beltr = /obj/item/reagent_containers/glass/bottle/rogue/manapot
	r_hand = /obj/item/rogueweapon/woodstaff
	shoes = /obj/item/clothing/shoes/roguetown/armor/leather/house/purple
	armor = /obj/item/clothing/suit/roguetown/shirt/dress/housepurple
	backr = /obj/item/storage/backpack/rogue/satchel
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/arcane, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/treatment, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
		H.mind.adjust_spellpoints(4)
	H.change_stat("strength", -1)
	H.change_stat("constitution", -1)
	H.change_stat("endurance", 2)
	H.change_stat("mageability", 6)
	H.change_stat("speed", 3)
	H.change_stat("faith", 3)
	H.change_stat("fortune", 3)
	ADD_TRAIT(H, TRAIT_STRONGTHROW, TRAIT_GENERIC)
	H.mind.AddSpell(new  /obj/effect/proc_holder/spell/targeted/touch/prestidigitation)

/datum/job/roguetown/bluemage
	title = "Deleon Witch"
	flag = HOUSE_WITCH_BLUE
	department_flag = HOUSE_WITCH_BLUE
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	allowed_sexes = list(FEMALE)
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED)

	allowed_races = RACES_VERY_SHUNNED_UP

	tutorial = "You are the house mage for the venerable Deleon House. You were chosen among your peers at the tavern to represent the magehood of Deleon. Trained by skilled Magi, you should have picked up something or other."

	spells = list(/obj/effect/proc_holder/spell/invoked/learnspell) 
	outfit = /datum/outfit/job/roguetown/bluemage
	display_order = JDO_HOUSE_WITCH_BLUE
	give_bank_account = 59

	min_pq = 0
	max_pq = null
	associated_squad = /datum/antagonist/squad/deleon/mage


/datum/outfit/job/roguetown/bluemage/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/wizhat/house/blue
	belt = /obj/item/storage/belt/rogue/leather/rope/bluemage
	beltr = /obj/item/reagent_containers/glass/bottle/rogue/manapot
	r_hand = /obj/item/rogueweapon/woodstaff
	wrists = /obj/item/clothing/wrists/roguetown/bracers/cloth
	shoes = /obj/item/clothing/shoes/roguetown/armor/leather/house/blue
	armor = /obj/item/clothing/suit/roguetown/shirt/dress/houseblue
	backr = /obj/item/storage/backpack/rogue/satchel
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/arcane, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/treatment, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
		H.mind.adjust_spellpoints(3)
	H.change_stat("strength", -1)
	H.change_stat("mageability", 2)
	H.change_stat("speed", 3)
	H.change_stat("faith", 3)
	H.change_stat("fortune", 1)
	ADD_TRAIT(H, TRAIT_BEAUTIFUL, TRAIT_GENERIC)
	H.mind.AddSpell(new  /obj/effect/proc_holder/spell/targeted/touch/prestidigitation)


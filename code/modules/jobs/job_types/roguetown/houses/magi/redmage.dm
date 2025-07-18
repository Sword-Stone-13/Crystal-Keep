/datum/job/roguetown/redmage
	title = "Alrich Witch"
	flag = HOUSE_WITCH_RED
	department_flag = HOUSE_WITCH_RED
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	allowed_sexes = list(FEMALE)
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED)

	allowed_races = RACES_VERY_SHUNNED_UP

	tutorial = "The great lady Alrich adopted a girl once, with magical capacity. Henceforth, the Alrich Magi is a symbol of the house's charity."

	spells = list(/obj/effect/proc_holder/spell/invoked/learnspell, /obj/effect/proc_holder/spell/invoked/projectile/fireball/greater) //huehuehueuhe
	outfit = /datum/outfit/job/roguetown/redmage
	display_order = JDO_HOUSE_WITCH_RED
	give_bank_account = 56

	min_pq = 0
	max_pq = null
	associated_squad = /datum/antagonist/squad/alrich/mage


/datum/outfit/job/roguetown/redmage/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/wizhat/house/red
	cloak = /obj/item/clothing/cloak/cape/house/red
	pants = /obj/item/clothing/under/roguetown/tights/black
	gloves = /obj/item/clothing/gloves/roguetown/fingerless/house/red
	belt = /obj/item/storage/belt/rogue/leather/redmage
	beltr = /obj/item/reagent_containers/glass/bottle/rogue/manapot
	r_hand = /obj/item/rogueweapon/woodstaff
	shoes = /obj/item/clothing/shoes/roguetown/armor/leather/house/red
	armor = /obj/item/clothing/suit/roguetown/shirt/dress/housered
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
	H.change_stat("mageability", 3)
	H.change_stat("skill", 2)
	H.change_stat("faith", 3)

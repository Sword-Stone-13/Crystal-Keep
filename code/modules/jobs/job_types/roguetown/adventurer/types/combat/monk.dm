/datum/advclass/monk
	name = "Monk"
	tutorial = "Masters of hand-to-hand combat, Monks are trained in the arts of morality, \
	and try to remain nuetral to the conflict around them unless it interferes with their personal and religious beliefs."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		/datum/species/human/northern,
		/datum/species/dwarf/mountain,
		/datum/species/elf/wood,
		/datum/species/aasimar,
	)
	outfit = /datum/outfit/job/roguetown/adventurer/monk
	traits_applied = list(TRAIT_DODGEEXPERT, TRAIT_MARTIALARTIST)

	vampcompat = FALSE

	category_tags = list(CTAG_ADVENTURER)

/datum/outfit/job/roguetown/adventurer/monk/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/roguehood
	neck = /obj/item/clothing/neck/roguetown/psicross
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	cloak = /obj/item/clothing/cloak/raincloak/furcloak/brown
	armor = /obj/item/clothing/suit/roguetown/shirt/robe
	belt = /obj/item/storage/belt/rogue/leather/rope
	beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
	backl = /obj/item/storage/backpack/rogue/backpack
	r_hand = /obj/item/rogueweapon/woodstaff
	if(H.mind)
		to_chat(src, span_warning("Monks are pilgrims of powerful belief who empart the teachings of their Temple or God by their interactions with the people of the world. A good monk would seek to help travellers on the road, feed the hungry and teach the weak to become strong. A bad one however..."))
		H.mind.adjust_skillrank(/datum/skill/combat/swords, pick(0,1), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE) 
		H.mind.adjust_skillrank(/datum/skill/combat/bows, pick(0,1), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, pick(1,2), TRUE) 
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/carpentry, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, pick(1,2), TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/treatment, 2, TRUE)
		H.change_stat("strength", 3)
		H.change_stat("constitution", 1)
		H.change_stat("speed", 2)
		H.change_stat("skill", 2)
		ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)

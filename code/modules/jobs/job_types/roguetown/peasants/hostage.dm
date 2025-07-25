/datum/job/roguetown/hostage
	title = "Hostage"
	flag = HOSTAGE
	department_flag = NOBLEMEN
	faction = "Station"
	total_positions = 0
	spawn_positions = 2

	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	tutorial = "You're too valuable to outright kill yet not a free person. You either messed up really bad or got very unlucky. Either way, the crown has held you hostage until you home country pays your ransom, as if that would ever happen. Might as well start praying to whatever god you find solace in."

	outfit = /datum/outfit/job/roguetown/hostage
	banned_leprosy = FALSE
	display_order = JDO_HOSTAGE
	give_bank_account = 10
	min_pq = -14
	max_pq = null
	can_random = FALSE
	associated_squad = /datum/antagonist/squad/none


/datum/outfit/job/roguetown/hostage/pre_equip(mob/living/carbon/human/H)
	..()
	neck = /obj/item/clothing/neck/roguetown/gorget/prisoner
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	id = /obj/item/clothing/ring/gold
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/music, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
		H.change_stat("mageability", 1)
		H.change_stat("fortune", 2)
		var/datum/antagonist/new_antag = new /datum/antagonist/prisoner()
		H.mind.add_antag_datum(new_antag)
	ADD_TRAIT(H, TRAIT_BANDITCAMP, TRAIT_GENERIC)
	if(H.gender == FEMALE)
		H.change_stat("strength", -1)
		armor = /obj/item/clothing/suit/roguetown/shirt/dress/gen/purple
		head = /obj/item/clothing/head/roguetown/hatblu
	if(H.gender == MALE)
		H.change_stat("strength", -1)
		pants = /obj/item/clothing/under/roguetown/tights/purple
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
		armor = /obj/item/clothing/suit/roguetown/shirt/tunic/blue
		head = /obj/item/clothing/head/roguetown/fancyhat
	if(isdwarfmountain(H))
		ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	if(iswoodelf(H))
		ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	if(ishumannorthern(H))
		ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)

/datum/job/roguetown/goblincook
	title = "Goblin Cook"
	flag = GOBLINCOOK
	department_flag = GOBLIN
	faction = "Station"
	total_positions = 0
	spawn_positions = 0
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list()
	allowed_patrons = list(/datum/patron/inhumen/graggar)
	tutorial = "Cook, farm, butcher. Make king happy with apple pies! Don't forget about your brothers."


	outfit = /datum/outfit/job/roguetown/goblincook
	display_order = JDO_GOBLINCOOK
	min_pq = 0
	max_pq = null
	associated_squad = /datum/antagonist/squad/none

/datum/outfit/job/roguetown/goblincook/pre_equip(mob/living/carbon/human/H)
	..()
	armor = /obj/item/clothing/suit/roguetown/armor/leather/hide/goblin
	belt = /obj/item/storage/belt/rogue/leather/rope
	cloak = /obj/item/clothing/cloak/apron/cook
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/hunting, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/labor/farming, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.change_stat("mageability", 1)
		H.change_stat("fortune", 1)

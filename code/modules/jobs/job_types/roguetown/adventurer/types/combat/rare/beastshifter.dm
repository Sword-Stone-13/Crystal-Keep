/datum/advclass/beastshifter //work in progress
	name = "Shifter"
	tutorial = "Strangers to larger civilizationsm these folk have within them the ability to shift to a strange creacher through the channeling of their inner soul through a gem they carry."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		/datum/species/human/northern
	)
	outfit = /datum/outfit/job/roguetown/adventurer/beastshifter
	category_tags = list(CTAG_ADVENTURER)
	maximum_possible_slots = 2
	pickprob = 11

/datum/outfit/job/roguetown/adventurer/beastshifter
	allowed_patrons = list(/datum/patron/divine/noc, /datum/patron/divine/dendor)

/datum/outfit/job/roguetown/adventurer/beastshifter/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/roguehood/mage
	shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
	pants = /obj/item/clothing/under/roguetown/trou/leather
	shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/mage
	belt = /obj/item/storage/belt/rogue/leather/rope
	beltr = /obj/item/reagent_containers/glass/bottle/rogue/manapot
	neck = /obj/item/lagomorphstone
	beltl = /obj/item/rogueweapon/huntingknife
	backl = /obj/item/storage/backpack/rogue/satchel
	r_hand = /obj/item/rogueweapon/woodstaff
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/hunting, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/labor/fishing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/treatment, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, rand(1,2), TRUE)
		H.change_stat("constitution", -5)
		H.change_stat("endurance", -2)
		H.change_stat("speed", -1) //If I recall correctly, transforming back and forth between forms actually full heals you, so, gimped preemptively before testing.

	H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/crystalmorph/lunarbeast)

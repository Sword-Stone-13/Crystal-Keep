/datum/advclass/stonemage
	name = "stonemancer"
	tutorial = "The art of stonemancy is an art of simplicity and struggle."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		/datum/species/halforc,
		/datum/species/dwarf/mountain,
		/datum/species/lizardfolk,
	)
	traits_applied = list(TRAIT_STRONGTHROW)
	outfit = /datum/outfit/job/roguetown/adventurer/stonemage
	category_tags = list(CTAG_ADVENTURER)
	pickprob = 25
	maximum_possible_slots = 1


/datum/outfit/job/roguetown/adventurer/stonemage

/datum/outfit/job/roguetown/adventurer/stonemage/pre_equip(mob/living/carbon/human/H)
	..()
	shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
	pants = /obj/item/clothing/under/roguetown/trou/leather
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/mage
	belt = /obj/item/storage/belt/rogue/leather/rope
	backl = /obj/item/storage/backpack/rogue/satchel
	beltr = /obj/item/reagent_containers/glass/bottle/rogue/manapot
	beltl = /obj/item/rogueweapon/huntingknife
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor	
	r_hand = /obj/item/rogueweapon/woodstaff
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, pick(0,1,1), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, pick(0,1,1), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, pick(0,1), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, pick(0,1,1,2), TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, pick(0,1), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/arcane, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/treatment, 2, TRUE)
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank(/datum/skill/magic/arcane, pick(2,3,3), TRUE)
		H.change_stat("strength", 3)
		H.change_stat("constitution", 2)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/fetch)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/magicstone5e)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/mending5e)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/conjure_item) //should conjure a rock :)

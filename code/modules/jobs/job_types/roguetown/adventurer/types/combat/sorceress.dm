/datum/advclass/sorceress
	name = "Sorceress"
	tutorial = "In some places in Grimmoria, women are banned from the study of magic. Those that do even then are afforded the title Sorceress in honor of their resolve."
	allowed_sexes = list(FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/adventurer/sorceress
	allowed_ages = list(AGE_MIDDLEAGED, AGE_OLD)
	category_tags = list(CTAG_ADVENTURER)

/datum/outfit/job/roguetown/adventurer/sorceress
	allowed_patrons = list(/datum/patron/divine/noc)

/datum/outfit/job/roguetown/adventurer/sorceress/pre_equip(mob/living/carbon/human/H)
	..()
	shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
	pants = /obj/item/clothing/under/roguetown/trou/leather
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/mage
	belt = /obj/item/storage/belt/rogue/leather/rope
	backl = /obj/item/storage/backpack/rogue/satchel
	beltr = /obj/item/reagent_containers/glass/bottle/rogue/manapot
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor	
	r_hand = /obj/vehicle/ridden/scooter/skateboard/witchbroom
	if(prob(25))
		mask = /obj/item/clothing/mask/rogue/facemask
	if(prob(25))
		beltl = /obj/item/gun/magic/spellbook/lightning
	else if(prob(25))
		beltl = /obj/item/gun/magic/spellbook/firebolt
	else if(prob(25))
		beltl = /obj/item/gun/magic/spellbook/frostbite
	else if(prob(25))
		beltl = /obj/item/gun/magic/spellbook/crystalpeep
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
		H.mind.adjust_spellpoints(7)
		H.change_stat("strength", -1)
		H.change_stat("mageability", 4)
		H.change_stat("constitution", 1)
		H.change_stat("endurance", -1)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/learnspell)
		H.mind.AddSpell(new  /obj/effect/proc_holder/spell/targeted/touch/prestidigitation)

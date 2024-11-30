
/datum/advclass/reaver
	name = "Reaver"
	tutorial = "Reavers are elvish mercenaries who travel for coin, either because they couldn't amount to a greater position in the elvish military, or simply to entertain the mystique of an elvish soldier."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		/datum/species/human/halfelf,
		/datum/species/elf/wood,
	)
	outfit = /datum/outfit/job/roguetown/adventurer/reaver

	traits_applied = list(TRAIT_HEAVYARMOR, TRAIT_MEDIUMARMOR, TRAIT_DODGEEXPERT)
	maximum_possible_slots = 2
	pickprob = 50
	category_tags = list(CTAG_ADVENTURER)

/datum/outfit/job/roguetown/adventurer/reaver/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/helmet/sallet //elvish armor tbd
	pants = /obj/item/clothing/under/roguetown/trou/leather
	shoes = /obj/item/clothing/shoes/roguetown/armor/leather
	belt = /obj/item/storage/belt/rogue/leather
	armor = /obj/item/clothing/suit/roguetown/armor/plate/half
	neck = /obj/item/storage/belt/rogue/pouch/coins/mid
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	backr = /obj/item/rogueweapon/shield/heater
	backl = /obj/item/storage/backpack/rogue/satchel
	if(prob(25))
		gloves = /obj/item/clothing/gloves/roguetown/chain
	else
		gloves = /obj/item/clothing/gloves/roguetown/angle
	if(prob(50))
		/obj/item/rogueweapon/spear
		beltl = /obj/item/rogueweapon/huntingknife
	else if(prob(50))
		r_hand = /obj/item/rogueweapon/halberd
		beltl = /obj/item/rogueweapon/huntingknife/idagger/steel

	

	H.mind.adjust_skillrank(/datum/skill/combat/bows, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/polearms, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/treatment, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 1,, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
	H.change_stat("constitution", 2) // Seven points just like Warrior. They already get a debuff racial to speed. Please do not stack it God please.
	H.change_stat("strength", 3)
	H.change_stat("endurance", 2)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/secondwind)

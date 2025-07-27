/datum/advclass/firemage
	name = "Pyromancer"
	tutorial = "Mages specifically attuned to the fire. Whether by draconic blood, demonic cursings, demonic blessings, or even a morbid curiousity, the flame kindles."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		/datum/species/elf/wood,
		/datum/species/tieberian,
		/datum/species/kobold,
	)
	outfit = /datum/outfit/job/roguetown/adventurer/pyromancer
	category_tags = list(CTAG_ADVENTURER)
	pickprob = 25
	maximum_possible_slots = 1


/datum/outfit/job/roguetown/adventurer/pyromancer

/datum/outfit/job/roguetown/adventurer/pyromancer/pre_equip(mob/living/carbon/human/H)
	..()
	shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
	pants = /obj/item/clothing/under/roguetown/trou/leather
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/mage
	belt = /obj/item/storage/belt/rogue/leather/rope
	backl = /obj/item/storage/backpack/rogue/satchel
	beltr = /obj/item/gun/magic/spellbook/firebolt
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor	
	r_hand = /obj/item/rogueweapon/woodstaff
	mask = /obj/item/clothing/mask/rogue/facemask
	gloves = /obj/item/clothing/gloves/roguetown/angle
	if(prob(50))
		beltl = /obj/item/gun/magic/spellbook/fireball
	else
		beltl = /obj/item/gun/magic/spellbook/dflame
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
		H.change_stat("strength", -1)
		H.change_stat("mageability", 5)
		H.change_stat("speed", 1)
		H.change_stat("faith", -1)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/fireball)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/spitfire)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/fireball/greater)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/aoe_turf/conjure/createbonfire5e)

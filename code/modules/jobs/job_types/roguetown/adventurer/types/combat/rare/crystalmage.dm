/datum/advclass/crystalmage
	name = "Crystal Mage"
	tutorial = "Mages specialized in the specific field of crystalization. A difficult, arduous process."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		/datum/species/aasimar,
		/datum/species/human/halfelf,
		/datum/species/human/northern,
	)
	outfit = /datum/outfit/job/roguetown/adventurer/crystalmage
	category_tags = list(CTAG_ADVENTURER)
	pickprob = 25
	maximum_possible_slots = 1

/datum/outfit/job/roguetown/adventurer/crystalmage


/datum/outfit/job/roguetown/adventurer/crystalmage/pre_equip(mob/living/carbon/human/H)
	..()
	shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
	pants = /obj/item/clothing/under/roguetown/trou/leather
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/mage
	belt = /obj/item/storage/belt/rogue/leather/rope
	backl = /obj/item/storage/backpack/rogue/satchel
	beltr = /obj/item/reagent_containers/glass/bottle/rogue/manapot
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor	
	r_hand = /obj/item/rogueweapon/woodstaff
	if(prob(25))
		mask = /obj/item/clothing/mask/rogue/facemask
	if(prob(25))
		gloves = /obj/item/clothing/gloves/roguetown/leather
	else
		gloves = /obj/item/clothing/gloves/roguetown/angle
	if(prob(50))
		beltl = /obj/item/gun/magic/spellbook/crystalspear
	else if(prob(50))
		beltl = /obj/item/gun/magic/spellbook/crystalpeep
	else
		r_hand = /obj/item/rogueweapon/halberd
		beltl = /obj/item/rogueweapon/huntingknife
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
		H.mind.adjust_skillrank(/datum/skill/magic/arcane, pick(3,3,4), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/treatment, 2, TRUE)
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank(/datum/skill/magic/arcane, pick(1,1,2), TRUE)
		H.mind.adjust_spellpoints(3)
		H.change_stat("mageability", 4)
		H.change_stat("faith", 3)
		H.change_stat("constitution", 1)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/learnspell)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/eldritchblast5e)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/arcanebolt)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/forcewall_weak)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/ethereal_jaunt)

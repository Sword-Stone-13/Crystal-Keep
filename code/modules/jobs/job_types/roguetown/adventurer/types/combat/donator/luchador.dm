/datum/advclass/luchador
	name = "Wrestlers"
	tutorial = "Athletes who worship their lord with hand to hand sport, as a means for repentance, justice, or... just for show. Trained in the hearts of Crystal Keep."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		/datum/species/aasimar,
		/datum/species/tieberian
	)
	outfit = /datum/outfit/job/roguetown/adventurer/wrestler
	traits_applied = list(TRAIT_DODGEEXPERT, TRAIT_NOFALLDAMAGE1, TRAIT_STRONGTHROW, TRAIT_MARTIALARTIST,)

	vampcompat = FALSE

	category_tags = list(CTAG_ADVENTURER)
	pickprob = 5
	maximum_possible_slots = 2

/datum/outfit/job/roguetown/adventurer/wrestler/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/roguehood
	neck = /obj/item/clothing/neck/roguetown/psicross
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	cloak = /obj/item/clothing/cloak/cape
	armor = /obj/item/clothing/suit/roguetown/shirt/robe
	belt = /obj/item/storage/belt/rogue/leather/rope
	beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
	backl = /obj/item/storage/backpack/rogue/backpack
	r_hand = /obj/item/rogueweapon/woodstaff
	if(H.mind)
		to_chat(src, span_warning("wrestlers are pilgrims of powerful belief who empart the teachings of their Temple or God by their interactions with the people of the world. A good wrestler would seek to help travellers on the road, feed the hungry and teach the weak to become strong. A bad one however..."))
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, pick(4,5), TRUE) 
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, pick(5,6), TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/carpentry, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/treatment, 2, TRUE)
		H.change_stat("strength", 4)
		H.change_stat("constitution", 1)
		H.change_stat("endurance", 2)
		H.change_stat("skill", 3)
		if(ismoth(H))//The Face
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/secondwind)
			H.change_stat("faith", 3)
		if(istiefling(H))//The Heel
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/mockery)
			H.change_stat("skill", 1)


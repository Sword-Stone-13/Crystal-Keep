/datum/advclass/samurai
	name = "Samurai"
	tutorial = "You answered your lord's call when you were young, \
	travelling from the Jade Kingdom to this foreign land, \
	The oceanside was your home, and your blade was your constant companion. But now, the tides have turned, \
	As you find yourself in distand lands, far from heaven."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		/datum/species/human/northern,
		/datum/species/human/nyanderthal,
	)
	outfit = /datum/outfit/job/roguetown/adventurer/samurai
	traits_applied = list(TRAIT_DODGEEXPERT, TRAIT_GENERIC, TRAIT_BREADY, TRAIT_STEELHEARTED)
	category_tags = list(CTAG_ADVENTURER)
	pickprob = 25
	maximum_possible_slots = 2
	cmode_music = 'sound/music/combat_jade.ogg'

//	cmode_music = 'sound/music/combat_samurai.ogg' //soon

/datum/outfit/job/roguetown/adventurer/samurai
	allowed_patrons =  list(/datum/patron/divine/abyssor, /datum/patron/divine/ravox)

/datum/outfit/job/roguetown/adventurer/samurai/pre_equip(mob/living/carbon/human/H)
	..()

	head = /obj/item/clothing/head/roguetown/helmet/bandana //japanese stuff soon
	shoes = /obj/item/clothing/shoes/roguetown/armor/leather
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	pants = /obj/item/clothing/under/roguetown/trou/leather
	if(prob(50))
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/sailor/red
	gloves = /obj/item/clothing/gloves/roguetown/leather
	belt = /obj/item/storage/belt/rogue/leather
	armor = /obj/item/clothing/suit/roguetown/armor/leather/vest/sailor
	backl = /obj/item/storage/backpack/rogue/satchel
	beltr = /obj/item/rogueweapon/sword/cutlass
	beltl = /obj/item/rogueweapon/huntingknife/idagger/steel
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE) 
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE) 
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/treatment, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/labor/fishing, 3, TRUE)
	H.change_stat("strength", 1)
	H.change_stat("constitution", -1)
	H.change_stat("skill", 3)
	H.change_stat("speed", 2)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/secondwind)

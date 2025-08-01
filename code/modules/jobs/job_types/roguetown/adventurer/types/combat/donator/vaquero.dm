
/datum/advclass/vaquero
	name = "Vaquero"
	tutorial = "Vaqueros are swashbucklers who have their origins as skilled horse-tamers. It's hard to find horses these days..."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		/datum/species/aasimar,
		/datum/species/tieberian
	)
	outfit = /datum/outfit/job/roguetown/adventurer/vaquero
	horse = /mob/living/simple_animal/hostile/retaliate/rogue/saigabuck/tame/saddled
	cmode_music = 'sound/music/combat_vaquero.ogg'
	category_tags = list(CTAG_ADVENTURER)

/datum/advclass/vaquero/equipme(mob/living/carbon/human/H)
	if(H.gender == FEMALE)
		horse = /mob/living/simple_animal/hostile/retaliate/rogue/saiga/tame/saddled
	return ..()

/datum/outfit/job/roguetown/adventurer/vaquero/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/maces, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/labor/fishing, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/treatment, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/stealing, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/riding, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/music, rand(1,2), TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/treatment, 1, TRUE)
	head = /obj/item/clothing/head/roguetown/bardhat
	shoes = /obj/item/clothing/shoes/roguetown/armor
	pants = /obj/item/clothing/under/roguetown/tights/random
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
	belt = /obj/item/storage/belt/rogue/leather
	armor = /obj/item/clothing/suit/roguetown/armor/leather/vest
	cloak = /obj/item/clothing/cloak/half/red
	if(prob(33))
		cloak = /obj/item/clothing/cloak/half
	if(prob(33))
		cloak = /obj/item/clothing/cloak/half/orange
	backl = /obj/item/storage/backpack/rogue/satchel
	beltl = /obj/item/rogueweapon/whip
	backr = /obj/item/rogue/instrument/guitar
	backpack_contents = list(/obj/item/storage/belt/rogue/pouch/coins/poor = 1, /obj/item/rogueweapon/huntingknife/idagger = 1)
	H.change_stat("mageability", 2)
	H.change_stat("endurance", 2)
	H.change_stat("speed", 2)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/mockery)
	if(ismoth(H))
		H.change_stat("faith", 3)
		H.change_stat("mageability", -2)
		id = /obj/item/clothing/ring/gold/burial
	if(istiefling(H))
		H.change_stat("faith", -3)
		H.change_stat("mageability", 2)

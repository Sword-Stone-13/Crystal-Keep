/datum/advclass/blacksmith
	name = "Blacksmith"
	tutorial = "A skilled blacksmith, able to forge capable weapons or sturdy armor for warriors in the bog, \
	only after building a forge for themselves of course."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/adventurer/blacksmith

	category_tags = list(CTAG_PILGRIM, CTAG_TOWNER)

/datum/outfit/job/roguetown/adventurer/blacksmith/pre_equip(mob/living/carbon/human/H)
	..()
	belt = /obj/item/storage/belt/rogue/leather

	beltr = /obj/item/rogueweapon/hammer
	beltl = /obj/item/rogueweapon/tongs

	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	gloves = /obj/item/clothing/gloves/roguetown/leather
	cloak = /obj/item/clothing/cloak/apron/blacksmith
	mouth = /obj/item/rogueweapon/huntingknife
	pants = /obj/item/clothing/under/roguetown/trou
	r_hand = /obj/item/engraving_hammer
	backl = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(/obj/item/flint = 1, /obj/item/rogueore/coal=1, /obj/item/rogueore/iron=1)

	if(H.gender == MALE)
		shoes = /obj/item/clothing/shoes/roguetown/armor/leather
		shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt
	else
		armor = /obj/item/clothing/suit/roguetown/shirt/dress/gen/random
		shoes = /obj/item/clothing/shoes/roguetown/shortboots

	var/classes = list("Armorsmith", "Weaponsmith")
	var/classchoice = input("Choose your archetype", "Available archetypes") as anything in classes

	switch(classchoice)
		if("Armorsmith")
			to_chat(H, span_notice("Armorsmiths are masters of forging protective gear, crafting sturdy armor to shield warriors from the dangers of the bog."))
			if(H.mind)
				H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/craft/engravement, 3, TRUE)
				H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
				H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/craft/engineering, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
				H.mind.adjust_skillrank(/datum/skill/craft/blacksmithing, 3, TRUE)
				H.mind.adjust_skillrank(/datum/skill/craft/armorsmithing, 3, TRUE) // Specialized in armorsmithing
				H.mind.adjust_skillrank(/datum/skill/craft/weaponsmithing, 1, TRUE) // Reduced weaponsmithing
				H.change_stat("strength", 2)
				H.change_stat("endurance", 1)
				H.change_stat("skill", 1)
				H.change_stat("constitution", 2)
				H.change_stat("speed", -1)
				H.change_stat("fortune", 1)
			if(prob(50))
				backpack_contents += /obj/item/ingot/steel 
			cloak = /obj/item/clothing/cloak/apron/blacksmith

		if("Weaponsmith")
			to_chat(H, span_notice("Weaponsmiths are masters of forging deadly blades and tools, crafting weapons that bring swift victory to warriors."))
			if(H.mind)
				H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
				H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/craft/engineering, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
				H.mind.adjust_skillrank(/datum/skill/craft/blacksmithing, 3, TRUE)
				H.mind.adjust_skillrank(/datum/skill/craft/engravement, 3, TRUE)
				H.mind.adjust_skillrank(/datum/skill/craft/armorsmithing, 1, TRUE) // Reduced armorsmithing
				H.mind.adjust_skillrank(/datum/skill/craft/weaponsmithing, 3, TRUE) // Specialized in weaponsmithing
				H.change_stat("strength", 2)
				H.change_stat("endurance", 1)
				H.change_stat("skill", 2)
				H.change_stat("constitution", 1)
				H.change_stat("speed", -1)
				H.change_stat("fortune", 1)
			if(prob(50))
				backpack_contents += /obj/item/ingot/steel 
			cloak = /obj/item/clothing/cloak/apron/blacksmith

	if(H.skin_tone == SKIN_COLOR_AVARIKYO) //Katana smith-desu
		H.mind.adjust_skillrank(/datum/skill/craft/jadesmithing, 3, TRUE)
		H.grant_language(/datum/language/aphasia)
		to_chat(H, span_info("Your Avarikyo heritage allows you to speak Nyapanese. Use ,k before your speech to communicate in this tongue."))

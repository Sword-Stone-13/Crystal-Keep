/datum/advclass/scavenger
	name = "Scavenger"
	tutorial = "Your life has been one of simple hardship and labor, whether out of necessity or choice. As you fled from the rot, \
				you learned how to best use and gather the natural resources around you."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(/datum/species/kobold)
	category_tags = list(CTAG_PILGRIM)
	pickprob = 25
	maximum_possible_slots = 5
	outfit = /datum/outfit/job/roguetown/adventurer/scavenger

/datum/outfit/job/roguetown/adventurer/scavenger

/datum/outfit/job/roguetown/adventurer/scavenger/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_blindness(-3)
	var/classes = list("Weapon Smith", "Armor Smith", "Royal", "Merchant")
	var/classchoice = input("Choose your archetypes", "Available archetypes") as anything in classes

	switch(classchoice)
		if("Weapon Smith")
			belt = /obj/item/storage/belt/rogue/leather
			beltr = /obj/item/rogueweapon/hammer
			beltl = /obj/item/rogueweapon/tongs
			neck = /obj/item/storage/belt/rogue/pouch/coins/mid
			gloves = /obj/item/clothing/gloves/roguetown/leather
			cloak = /obj/item/clothing/cloak/apron/blacksmith
			mouth = /obj/item/rogueweapon/huntingknife
			pants = /obj/item/clothing/under/roguetown/trou
			backl = /obj/item/storage/backpack/rogue/satchel
			backpack_contents = list(/obj/item/flint = 1, /obj/item/rogueore/coal=1, , /obj/item/engraving_hammer = 1)
			shoes = /obj/item/clothing/shoes/roguetown/armor/leather
			shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt

			if(H.mind)
				H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/craft/engineering, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
				H.mind.adjust_skillrank(/datum/skill/craft/blacksmithing, 3, TRUE)
				H.mind.adjust_skillrank(/datum/skill/craft/koboldsmithing, 4, TRUE)

				H.change_stat("strength", 2)
				H.change_stat("endurance", 1)
				H.change_stat("skill", 1)
				H.change_stat("constitution", 1)
				H.change_stat("speed", -1)
				H.change_stat("fortune", 1)

		if("Armor Smith")
			belt = /obj/item/storage/belt/rogue/leather
			beltr = /obj/item/rogueweapon/hammer
			beltl = /obj/item/rogueweapon/tongs
			neck = /obj/item/storage/belt/rogue/pouch/coins/mid
			gloves = /obj/item/clothing/gloves/roguetown/leather
			cloak = /obj/item/clothing/cloak/apron/blacksmith
			mouth = /obj/item/rogueweapon/huntingknife
			pants = /obj/item/clothing/under/roguetown/trou
			backl = /obj/item/storage/backpack/rogue/satchel
			backpack_contents = list(/obj/item/flint = 1, /obj/item/rogueore/coal=1, /obj/item/riddleofsteel=1)
			shoes = /obj/item/clothing/shoes/roguetown/armor/leather
			shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt

			if(H.mind)
				H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/craft/engineering, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
				H.mind.adjust_skillrank(/datum/skill/craft/blacksmithing, 3, TRUE)
				H.mind.adjust_skillrank(/datum/skill/craft/koboldsmithing, 4, TRUE)

				H.change_stat("strength", 2)
				H.change_stat("endurance", 1)
				H.change_stat("skill", 1)
				H.change_stat("constitution", 1)
				H.change_stat("speed", -1)
				H.change_stat("fortune", 1)
		if("Royal")
			neck = /obj/item/clothing/neck/roguetown/coif
			cloak = /obj/item/clothing/cloak/raincloak/furcloak/brown
			shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt/random
			armor = /obj/item/clothing/suit/roguetown/armor/leather/vest
			gloves = /obj/item/clothing/gloves/roguetown/leather
			r_hand = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve
			belt = /obj/item/storage/belt/rogue/leather
			beltr = /obj/item/ammo_holder/quiver/arrows
			beltl = /obj/item/flashlight/flare/torch/lantern
			backr = /obj/item/storage/backpack/rogue/satchel
			backpack_contents = list(/obj/item/flint = 1, /obj/item/bait = 1, /obj/item/rogueweapon/huntingknife = 1, /obj/item/storage/belt/rogue/pouch/coins/poor = 1)
			pants = /obj/item/clothing/under/roguetown/tights/random
			shoes = /obj/item/clothing/shoes/roguetown/armor/leather

			if(H.mind)
				H.mind.adjust_skillrank(/datum/skill/craft/hunting, 3, TRUE)
				H.mind.adjust_skillrank(/datum/skill/labor/fishing, 3, TRUE)
				H.mind.adjust_skillrank(/datum/skill/combat/bows, 3, TRUE)
				H.mind.adjust_skillrank(/datum/skill/craft/crafting, 3, TRUE)
				H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/craft/cooking, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
				H.mind.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)

				H.change_stat("mageability", 1)
				H.change_stat("skill", 2)
				H.change_stat("speed", 1)

		if("Merchant")
			neck = /obj/item/clothing/neck/roguetown/coif
			pants = /obj/item/clothing/under/roguetown/tights/random
			shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
			backl = /obj/item/storage/backpack/rogue/backpack
			belt = /obj/item/storage/belt/rogue/leather
			beltl = /obj/item/flashlight/flare/torch/lantern
			beltr = /obj/item/rogueweapon/huntingknife
			backpack_contents = list(/obj/item/reagent_containers/powder/spice = 3, /obj/item/reagent_containers/glass/bottle/mercury = 1, /obj/item/reagent_containers/glass/bottle/rogue/poison = 1, /obj/item/reagent_containers/glass/bottle/rogue/healthpot = 1, /obj/item/reagent_containers/glass/bottle/rogue/manapot = 2,)

			if(H.mind)
				H.mind.adjust_skillrank(/datum/skill/misc/sewing, 3, TRUE)
				H.mind.adjust_skillrank(/datum/skill/craft/cooking, 3, TRUE)
				H.mind.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE)
				H.mind.adjust_skillrank(/datum/skill/craft/hunting, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/labor/fishing, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/misc/treatment, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
				H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
				H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
				H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
				H.mind.adjust_skillrank(/datum/skill/labor/farming, 1, TRUE)
				H.change_stat("mageability", 2)
				H.change_stat("skill", -1)
				H.change_stat("speed", 1)
				H.change_stat("endurance", 1)
				H.change_stat("strength", -1)

	H.set_blindness(0)

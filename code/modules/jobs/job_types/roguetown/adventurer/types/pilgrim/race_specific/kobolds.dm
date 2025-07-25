/datum/advclass/pilgobolds
	name = "Kobold Pilgrim"
	tutorial = "Your life has been one of simple hardship and labor, whether out of necessity or choice. As you fled from the rot, \
				you learned how to best use and gather the natural resources around you.\ "

	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(/datum/species/kobold)
	category_tags = list(CTAG_PILGRIM)

	maximum_possible_slots = 15

	outfit = /datum/outfit/job/roguetown/adventurer/pilgobolds

/datum/outfit/job/roguetown/adventurer/pilgobolds

/datum/outfit/job/roguetown/adventurer/pilgobolds/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_blindness(-3)
	var/classes = list("Miner", "Farmer", "Hunter", "Camp Follower")
	var/classchoice = input("Choose your archetypes", "Available archetypes") as anything in classes

	switch(classchoice)

		if("Miner")
			r_hand = /obj/item/rogueweapon/pick
			head = /obj/item/clothing/head/roguetown/hatfur
			neck = /obj/item/clothing/neck/roguetown/coif
			armor = /obj/item/clothing/suit/roguetown/armor/leather/vest
			pants = /obj/item/clothing/under/roguetown/trou
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/random
			shoes = /obj/item/clothing/shoes/roguetown/armor/leather
			belt = /obj/item/storage/belt/rogue/leather
			beltr = /obj/item/rogueweapon/tongs
			beltl = /obj/item/rogueweapon/hammer/wood
			backl = /obj/item/storage/backpack/rogue/backpack
			backpack_contents = list(/obj/item/flint = 1, /obj/item/rogueweapon/huntingknife = 1, /obj/item/storage/belt/rogue/pouch/coins/mid = 1)
			
			H.mind.adjust_skillrank(/datum/skill/combat/maces, 1, TRUE) //pickaxe
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/carpentry, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/masonry, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/engineering, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/labor/mining, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/blacksmithing, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE) //DF Cave water
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE) 
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/treatment, 1, TRUE)

			H.change_stat("strength", 1)
			H.change_stat("endurance", 3)
			H.change_stat("constitution", 1)
			H.change_stat("mageability", 1)
			H.change_stat("fortune", 1)

		if("Farmer")
			head = /obj/item/clothing/head/roguetown/strawhat
			armor = /obj/item/clothing/suit/roguetown/armor/leather/vest
			neck = /obj/item/clothing/neck/roguetown/coif
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/random
			wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
			r_hand = /obj/item/rogueweapon/thresher
			belt = /obj/item/storage/belt/rogue/leather/rope
			beltl = /obj/item/rogueweapon/sickle
			beltr = /obj/item/rogueweapon/stoneaxe/woodcut
			backl = /obj/item/storage/backpack/rogue/backpack
			backpack_contents = list(/obj/item/seeds/wheat = 2, /obj/item/seeds/mycelium/plumphelmet = 2, /obj/item/ash = 3)
			pants = /obj/item/clothing/under/roguetown/tights/random
			shoes = /obj/item/clothing/shoes/roguetown/simpleshoes

			H.mind.adjust_skillrank(/datum/skill/labor/farming, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/axes, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/labor/lumberjacking, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/treatment, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/carpentry, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/masonry, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)

			H.change_stat("strength", 1)
			H.change_stat("endurance", 2)
			H.change_stat("constitution", 1)
			H.change_stat("speed", 1)

		if("Hunter")
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


		if("Camp Follower")
			neck = /obj/item/clothing/neck/roguetown/coif
			pants = /obj/item/clothing/under/roguetown/tights/random
			shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/random
			backl = /obj/item/storage/backpack/rogue/backpack
			belt = /obj/item/storage/belt/rogue/leather
			beltl = /obj/item/flashlight/flare/torch/lantern
			beltr = /obj/item/rogueweapon/huntingknife
			backpack_contents = list(/obj/item/needle = 1,  /obj/item/rogueweapon/huntingknife/scissors = 1)

			H.mind.adjust_skillrank(/datum/skill/misc/sewing, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/cooking, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/hunting, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/labor/fishing, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/treatment, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/labor/farming, 1, TRUE)

			H.change_stat("mageability", -2)
			H.change_stat("skill", 2)
			H.change_stat("speed", 1)
			H.change_stat("endurance", 1)
			H.change_stat("strength", -1)

	H.set_blindness(0)

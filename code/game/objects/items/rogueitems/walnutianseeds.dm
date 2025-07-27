// Base pouch definition for Walnutian seeds
/obj/item/storage/belt/rogue/pouch/walnutian
	name = "Walnutian seed pouch"
	desc = "A pouch containing exotic seeds from Walnutian imports."
	icon = 'icons/roguetown/clothing/storage.dmi'
	icon_state = "pouch"
	item_state = "pouch"
	lefthand_file = 'icons/mob/inhands/equipment/belt_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/belt_righthand.dmi'
	slot_flags = ITEM_SLOT_HIP | ITEM_SLOT_NECK
	w_class = WEIGHT_CLASS_NORMAL
	attack_verb = list("whips", "lashes")
	max_integrity = 300
	equip_sound = 'sound/blank.ogg'
	content_overlays = FALSE
	bloody_icon_state = "bodyblood"
	fiber_salvage = FALSE

/obj/item/storage/belt/rogue/pouch/walnutian/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	if(STR)
		STR.max_combined_w_class = 6
		STR.max_w_class = WEIGHT_CLASS_SMALL
		STR.max_items = 3
		STR.not_while_equipped = FALSE
		STR.can_hold = typecacheof(list(/obj/item/seeds))

// Pouch for Walnutian Seed Surplus
/obj/item/storage/belt/rogue/pouch/walnutian/seeds
	name = "Walnutian Seed Surplus Pouch"
	desc = "A sturdy pouch filled with a random assortment of Walnutian seeds."

/obj/item/storage/belt/rogue/pouch/walnutian/seeds/PopulateContents()
	var/list/seed_weights = list(
		/obj/item/seeds/elfnut = 20,
		/obj/item/seeds/elfnut/henneseed = 15,
		/obj/item/seeds/elfnut/henneseed/gourd = 15,
		/obj/item/seeds/elfnut/henneseed/faeport = 15,
		/obj/item/seeds/elfnut/ironwood/armor = 10,
		/obj/item/seeds/elfnut/ironwood/armor/halfplate = 8,
		/obj/item/seeds/elfnut/ironwood/armor/fullplate = 6,
		/obj/item/seeds/elfnut/ironwood/armor/helmet = 8,
		/obj/item/seeds/elfnut/ironwood/armor/halfhelm = 8,
		/obj/item/seeds/elfnut/ironwood/armor/bracers = 8,
		/obj/item/seeds/elfnut/ironwood/armor/bervor = 8,
		/obj/item/seeds/elfnut/ironwood/armor/greaves = 8,
		/obj/item/seeds/elfnut/ironwood/armor/boots = 8,
		/obj/item/seeds/elfnut/ironwood/armor/gauntlets = 8,
		/obj/item/seeds/elfnut/ironwood/weapons/dagger = 10,
		/obj/item/seeds/elfnut/ironwood/weapons/shortsword = 8,
		/obj/item/seeds/elfnut/ironwood/weapons/sword = 6,
		/obj/item/seeds/elfnut/ironwood/weapons/sabre = 6,
		/obj/item/seeds/elfnut/ironwood/weapons/buckler = 6,
		/obj/item/seeds/elfnut/ironwood/weapons/bow = 5,
		/obj/item/seeds/elfnut/ironwood/weapons/glaive = 5,
		/obj/item/seeds/elfnut/silverwood/armor/halfhelm = 4,
		/obj/item/seeds/elfnut/silverwood/armor/fullplate/upper = 3,
		/obj/item/seeds/elfnut/silverwood/armor/fullplate/extremities = 3,
		/obj/item/seeds/elfnut/silverwood/weapons/dagger = 4,
		/obj/item/seeds/elfnut/silverwood/weapons/shortsword = 3,
		/obj/item/seeds/elfnut/silverwood/weapons/sword = 2,
		/obj/item/seeds/elfnut/silverwood/weapons/sabre = 2,
		/obj/item/seeds/elfnut/silverwood/weapons/glaive = 2,
		/obj/item/seeds/elfnut/silverwood/weapons/shield = 2,
		/obj/item/seeds/elfnut/silverwood/weapons/bow = 2,
		/obj/item/seeds/elfnut/ironwood/armor/complete = 1,
		/obj/item/seeds/elfnut/silverwood/armor/complete = 1
	)
	for(var/i in 1 to 3)
		var/chosen_seed = pickweight(seed_weights)
		new chosen_seed(src)

// Pouch for Walnutian Weapon Seed Surplus
/obj/item/storage/belt/rogue/pouch/walnutian/seeds/weapons
	name = "Walnutian Weapon Seed Pouch"
	desc = "A sturdy pouch filled with a random assortment of Walnutian weapon seeds."

/obj/item/storage/belt/rogue/pouch/walnutian/seeds/weapons/PopulateContents()
	var/list/seed_weights = list(
		/obj/item/seeds/elfnut/ironwood/weapons/dagger = 20,
		/obj/item/seeds/elfnut/ironwood/weapons/shortsword = 15,
		/obj/item/seeds/elfnut/ironwood/weapons/sword = 10,
		/obj/item/seeds/elfnut/ironwood/weapons/sabre = 10,
		/obj/item/seeds/elfnut/ironwood/weapons/buckler = 10,
		/obj/item/seeds/elfnut/ironwood/weapons/bow = 8,
		/obj/item/seeds/elfnut/ironwood/weapons/glaive = 8,
		/obj/item/seeds/elfnut/silverwood/weapons/dagger = 5,
		/obj/item/seeds/elfnut/silverwood/weapons/shortsword = 4,
		/obj/item/seeds/elfnut/silverwood/weapons/sword = 3,
		/obj/item/seeds/elfnut/silverwood/weapons/sabre = 3,
		/obj/item/seeds/elfnut/silverwood/weapons/glaive = 3,
		/obj/item/seeds/elfnut/silverwood/weapons/shield = 3,
		/obj/item/seeds/elfnut/silverwood/weapons/bow = 3
	)
	for(var/i in 1 to 3)
		var/chosen_seed = pickweight(seed_weights)
		new chosen_seed(src)

// Pouch for Walnutian Armor Seed Surplus
/obj/item/storage/belt/rogue/pouch/walnutian/seeds/armor
	name = "Walnutian Armor Seed Pouch"
	desc = "A sturdy pouch filled with a random assortment of Walnutian armor seeds."

/obj/item/storage/belt/rogue/pouch/walnutian/seeds/armor/PopulateContents()
	var/list/seed_weights = list(
		/obj/item/seeds/elfnut/ironwood/armor = 20,
		/obj/item/seeds/elfnut/ironwood/armor/halfplate = 15,
		/obj/item/seeds/elfnut/ironwood/armor/fullplate = 10,
		/obj/item/seeds/elfnut/ironwood/armor/helmet = 15,
		/obj/item/seeds/elfnut/ironwood/armor/halfhelm = 15,
		/obj/item/seeds/elfnut/ironwood/armor/bracers = 15,
		/obj/item/seeds/elfnut/ironwood/armor/bervor = 15,
		/obj/item/seeds/elfnut/ironwood/armor/greaves = 15,
		/obj/item/seeds/elfnut/ironwood/armor/boots = 15,
		/obj/item/seeds/elfnut/ironwood/armor/gauntlets = 15,
		/obj/item/seeds/elfnut/silverwood/armor/halfhelm = 5,
		/obj/item/seeds/elfnut/silverwood/armor/fullplate/upper = 3,
		/obj/item/seeds/elfnut/silverwood/armor/fullplate/extremities = 3,
		/obj/item/seeds/elfnut/ironwood/armor/complete = 1,
		/obj/item/seeds/elfnut/silverwood/armor/complete = 1
	)
	for(var/i in 1 to 3)
		var/chosen_seed = pickweight(seed_weights)
		new chosen_seed(src)

// Pouch for Walnutian Premium Seed Assortment
/obj/item/storage/belt/rogue/pouch/walnutian/seeds/high_quality
	name = "Walnutian Premium Seed Pouch"
	desc = "A finely crafted pouch containing a premium assortment of rare Walnutian seeds."

/obj/item/storage/belt/rogue/pouch/walnutian/seeds/high_quality/PopulateContents()
	var/list/seed_weights = list(
		/obj/item/seeds/elfnut/henneseed = 20,
		/obj/item/seeds/elfnut/henneseed/faeport = 20,
		/obj/item/seeds/elfnut/silverwood/armor/halfhelm = 5,
		/obj/item/seeds/elfnut/silverwood/weapons/dagger = 5,
		/obj/item/seeds/elfnut/ironwood/armor/complete = 5,
		/obj/item/seeds/elfnut/silverwood/armor/complete = 1
	)
	for(var/i in 1 to 3)
		var/chosen_seed = pickweight(seed_weights)
		new chosen_seed(src)

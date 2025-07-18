
/datum/supply_pack/rogue/apparel/walnutian
	group = "Walnutian Imports"
	crate_name = "merchant guild's crate"
	crate_type = /obj/structure/closet/crate/chest/merchant


/datum/supply_pack/rogue/apparel/walnutian/seeds/random
	name = "Walnutian Seed Surplus"
	cost = 100
	contains = list() // Populated dynamically

/datum/supply_pack/rogue/apparel/walnutian/seeds/random/fill(obj/structure/closet/crate/C)
	var/seed_count = rand(3, 6) // Random number of seeds per crate
	var/list/weighted_seeds = list()
	// Populate weighted list based on rarity
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
		/obj/item/seeds/elfnut/silverwood/armor/complete = 1 // Adjusted to 1 for simplicity; decimals not supported
	)
	for(var/seed in seed_weights)
		for(var/i in 1 to seed_weights[seed])
			weighted_seeds += seed
	for(var/i in 1 to seed_count)
		if(weighted_seeds.len)
			var/chosen_seed = pick(weighted_seeds)
			new chosen_seed(C)

/datum/supply_pack/rogue/apparel/walnutian/seeds/weapons
	name = "Walnutian Weapon Seed Surplus"
	cost = 150
	group = "Walnutian Imports"
	crate_name = "merchant guild's weapon seed crate"
	crate_type = /obj/structure/closet/crate/chest/merchant
	contains = list() // Populated dynamically

/datum/supply_pack/rogue/apparel/walnutian/seeds/weapons/fill(obj/structure/closet/crate/C)
	var/seed_count = rand(2, 4) // Fewer seeds due to specialization
	var/list/weighted_seeds = list()
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
		/obj/item/seeds/elfnut/silverwood/weapons/bow = 3,
	)
	for(var/seed in seed_weights)
		for(var/i in 1 to seed_weights[seed])
			weighted_seeds += seed
	for(var/i in 1 to seed_count)
		if(weighted_seeds.len)
			var/chosen_seed = pick(weighted_seeds)
			new chosen_seed(C)

/datum/supply_pack/rogue/apparel/walnutian/seeds/armor
	name = "Walnutian Armor Seed Surplus"
	cost = 150
	group = "Walnutian Imports"
	crate_name = "merchant guild's armor seed crate"
	crate_type = /obj/structure/closet/crate/chest/merchant
	contains = list() // Populated dynamically

/datum/supply_pack/rogue/apparel/walnutian/seeds/armor/fill(obj/structure/closet/crate/C)
	var/seed_count = rand(2, 4) // Fewer seeds due to specialization
	var/list/weighted_seeds = list()
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
		/obj/item/seeds/elfnut/silverwood/armor/complete = 1 // Adjusted to 1 for simplicity
	)
	for(var/seed in seed_weights)
		for(var/i in 1 to seed_weights[seed])
			weighted_seeds += seed
	for(var/i in 1 to seed_count)
		if(weighted_seeds.len)
			var/chosen_seed = pick(weighted_seeds)
			new chosen_seed(C)

/datum/supply_pack/rogue/apparel/walnutian/seeds/high_quality
	name = "Walnutian Premium Seed Assortment"
	cost = 300
	group = "Walnutian Imports"
	crate_name = "merchant guild's premium seed crate"
	crate_type = /obj/structure/closet/crate/chest/merchant
	contains = list() // Populated dynamically

/datum/supply_pack/rogue/apparel/walnutian/seeds/high_quality/fill(obj/structure/closet/crate/C)
	var/seed_count = rand(1, 3) // Fewer seeds due to high value
	var/list/weighted_seeds = list()
	var/list/seed_weights = list(
		/obj/item/seeds/elfnut/henneseed = 20,
		/obj/item/seeds/elfnut/henneseed/faeport = 20,
		/obj/item/seeds/elfnut/silverwood/armor/halfhelm = 5,
		/obj/item/seeds/elfnut/silverwood/weapons/dagger = 5,
		/obj/item/seeds/elfnut/ironwood/armor/complete = 5,
		/obj/item/seeds/elfnut/silverwood/armor/complete = 1
	)
	for(var/seed in seed_weights)
		for(var/i in 1 to seed_weights[seed])
			weighted_seeds += seed
	for(var/i in 1 to seed_count)
		if(weighted_seeds.len)
			var/chosen_seed = pick(weighted_seeds)
			new chosen_seed(C)


/datum/supply_pack/rogue/apparel/walnutian/travelboots
	name = "Durable Travel Boots - Female Fit"
	cost = 70
	contains = list(
					/obj/item/clothing/shoes/roguetown/armor/nobleboot/angel,
					/obj/item/clothing/shoes/roguetown/armor/nobleboot/angel,
				)

/datum/supply_pack/rogue/apparel/walnutian/boots
	name = "Common Walnutian Boots - Two Female Two Male"
	cost = 70
	contains = list(
					/obj/item/clothing/shoes/roguetown/armor/leather/villager,
					/obj/item/clothing/shoes/roguetown/armor/leather/villager,
					/obj/item/clothing/shoes/roguetown/armor/leather/villager/women,
					/obj/item/clothing/shoes/roguetown/armor/leather/villager/women,
				)

/datum/supply_pack/rogue/apparel/walnutian/uggs
	name = "Fur Lined Boots"
	cost = 50
	contains = list(
					/obj/item/clothing/shoes/roguetown/armor/leather/villager/orphan,
					/obj/item/clothing/shoes/roguetown/armor/leather/villager/orphan,
					/obj/item/clothing/shoes/roguetown/armor/leather/villager/orphan,
					/obj/item/clothing/shoes/roguetown/armor/leather/villager/orphan,
					/obj/item/clothing/shoes/roguetown/armor/leather/villager/orphan,
					/obj/item/clothing/shoes/roguetown/armor/leather/villager/orphan,
				)

/datum/supply_pack/rogue/apparel/walnutian/shawl
	name = "Women fit shawl"
	cost = 20
	contains = list(
					/obj/item/clothing/cloak/shawl/,
					/obj/item/clothing/cloak/shawl/,
					/obj/item/clothing/cloak/shawl/,
				)

/datum/supply_pack/rogue/apparel/walnutian/shawl
	name = "Ponchos"
	cost = 20
	contains = list(
					/obj/item/clothing/cloak/half/orphan,
					/obj/item/clothing/cloak/half/orphan,
					/obj/item/clothing/cloak/half/orphan,
				)

/datum/supply_pack/rogue/apparel/walnutian/gloves/fur
	name = "Leather Walnutian Gloves Fits All"
	cost = 25
	contains = list(
					/obj/item/clothing/gloves/roguetown/leather/villager,
					/obj/item/clothing/gloves/roguetown/leather/villager,
					/obj/item/clothing/gloves/roguetown/leather/villager,
				)

/datum/supply_pack/rogue/apparel/walnutian/gloves/fur
	name = "Fur Walnutian Gloves - Women Fit"
	cost = 50
	contains = list(
					/obj/item/clothing/gloves/roguetown/angel/long,
					/obj/item/clothing/gloves/roguetown/angel/long,
				)

/datum/supply_pack/rogue/apparel/walnutian/dress
	name = "Walnutian Dresses"
	cost = 80
	contains = list(
					/obj/item/clothing/suit/roguetown/shirt/dress/villager,
					/obj/item/clothing/suit/roguetown/shirt/dress/villager,
					/obj/item/clothing/suit/roguetown/shirt/dress/villager,
				)

/datum/supply_pack/rogue/apparel/walnutian/tunic
	name = "Walnutian Tunics"
	cost = 30
	contains = list(
					/obj/item/clothing/suit/roguetown/shirt/tunic/villager,
					/obj/item/clothing/suit/roguetown/shirt/tunic/villager,
					/obj/item/clothing/suit/roguetown/shirt/tunic/villager,
				)

/datum/supply_pack/rogue/apparel/walnutian/jeans
	name = "Walnutian Trousers"
	cost = 30
	contains = list(
					/obj/item/clothing/under/roguetown/jeans,
					/obj/item/clothing/under/roguetown/jeans,
					/obj/item/clothing/under/roguetown/jeans,
				)

/datum/supply_pack/rogue/apparel/walnutian/nun
	name = "Aasimar Thread Nun Robe"
	cost = 40
	contains = list(
					/obj/item/clothing/suit/roguetown/shirt/robe/nun/alt,
					/obj/item/clothing/suit/roguetown/shirt/robe/nun/alt,
					/obj/item/clothing/suit/roguetown/shirt/robe/nun/alt,
				)

/datum/supply_pack/rogue/apparel/walnutian/toga
	name = "Aasimarian Toga"
	cost = 40
	contains = list(
					/obj/item/clothing/cloak/black_cloak/toga,
					/obj/item/clothing/cloak/black_cloak/toga,
					/obj/item/clothing/cloak/black_cloak/toga,
				)

/datum/supply_pack/rogue/apparel/walnutian/fannypack
	name = "Hip Belts"
	cost = 40
	contains = list(
					/obj/item/storage/belt/rogue/pouch/hipbelt,
					/obj/item/storage/belt/rogue/pouch/hipbelt,
					/obj/item/storage/belt/rogue/pouch/hipbelt,
				)



//luxuries

/datum/supply_pack/rogue/apparel/walnutian/necklace
	name = "Golden Necklace"
	cost = 320
	contains = list(/obj/item/clothing/neck/roguetown/walnutian)



/datum/supply_pack/rogue/apparel/walnutian/crosses/psicross
	name = "Wooden Psydonic Amulets"
	cost = 20
	contains = list(/obj/item/clothing/neck/roguetown/psicross/wood,
					/obj/item/clothing/neck/roguetown/psicross/wood,
					/obj/item/clothing/neck/roguetown/psicross/wood,

)

/datum/supply_pack/rogue/apparel/walnutian/crosses/iron
	name = "Iron Psydon Amulet"
	cost = 50
	contains = list(/obj/item/clothing/neck/roguetown/psicross)

/datum/supply_pack/rogue/apparel/walnutian/crosses/silver
	name = "Silver Psycross"
	cost = 120
	contains = list(/obj/item/clothing/neck/roguetown/psicross/silver)



/datum/supply_pack/rogue/apparel/walnutian/crosses/gold
	name = "Golden Psycross"
	cost = 200
	contains = list(/obj/item/clothing/neck/roguetown/psicross/gold)



//Aasimarian
/datum/supply_pack/rogue/apparel/walnutian/crosses/psicross
	name = "Aasimarian Psydonic Amulets"
	cost = 20
	contains = list(/obj/item/clothing/neck/roguetown/psicross/wood/aasimar,
					/obj/item/clothing/neck/roguetown/psicross/wood/aasimar,
					/obj/item/clothing/neck/roguetown/psicross/wood/aasimar,
)
/datum/supply_pack/rogue/apparel/walnutian/crosses/silver/alt
	name = "Silver Aasimarian Psycross"
	cost = 120
	contains = list(/obj/item/clothing/neck/roguetown/psicross/silver/aasimar)

/datum/supply_pack/rogue/apparel/walnutian/crosses/gold/alt
	name = "Golden Aasimarian Psycross"
	cost = 200
	contains = list(/obj/item/clothing/neck/roguetown/psicross/silver/gold/aasimar)

//extras
/datum/supply_pack/rogue/apparel/walnutian/quiver
	name = "Elvish Quiver"
	cost = 200
	contains = list(
					/obj/item/ammo_holder/quiver/greatquiver,
				)

/datum/supply_pack/rogue/apparel/walnutian/quiver/aasimar
	name = "Aasimarian Quiver"
	cost = 100
	contains = list(
					/obj/item/ammo_holder/quiver/giantsquiver,
				)

/datum/supply_pack/rogue/apparel/walnutian/bow/aasimar
	name = "Aasimarian Warbow"
	cost = 300
	contains = list(
					/obj/item/gun/ballistic/revolver/grenadelauncher/bow/aasimar,
				)

/datum/supply_pack/rogue/apparel/walnutian/aasimar/arrow
	name = "Great Arrow"
	cost = 35
	contains = list(
					/obj/item/ammo_casing/caseless/rogue/greatarrow,
				)

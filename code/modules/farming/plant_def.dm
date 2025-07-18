/datum/plant_def
	abstract_type = /datum/plant_def
	/// Name of the plant
	var/name = "Some plant"
	/// Description of the plant
	var/desc = "Sure is a plant."
	var/icon
	var/icon_state
	/// Loot the plant will yield for uprooting it
	var/list/uproot_loot
	/// Time in ticks the plant will require to mature, before starting to make produce
	var/maturation_time = 6 MINUTES
	/// Time in ticks the plant will require to make produce
	var/produce_time = 3 MINUTES
	/// Typepath of produce to make on harvest
	var/produce_type
	/// Amount of minimum produce to make on harvest
	var/produce_amount_min = 2
	/// Amount of maximum produce to make on harvest
	var/produce_amount_max = 3
	/// How much nutrition will the plant require to mature fully
	var/maturation_nutrition = 30
	/// How much nutrition will the plant require to make produce
	var/produce_nutrition = 20
	/// If not perennial, the plant will uproot itself upon harvesting first produce
	var/perennial = FALSE
	/// Whether the plant is immune to weeds and will naturally deal with them
	var/weed_immune = FALSE
	/// The rate at which the plant drains water, if zero then it'll be able to live without water
	var/water_drain_rate = 2 / (1 MINUTES)
	/// Color all seeds of this plant def will have, randomised on init
	var/seed_color
	/// Whether the plant can grow underground
	var/can_grow_underground = FALSE

/datum/plant_def/New()
	. = ..()
	var/static/list/random_colors = list("#fffbf7", "#f3c877", "#5e533e", "#db7f62", "#f39945")
	seed_color = pick(random_colors)

/datum/plant_def/wheat
	name = "wheat stalks"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "wheat"
	produce_type = /obj/item/natural/chaff/wheat
	produce_amount_min = 3
	produce_amount_max = 4
	uproot_loot = list(/obj/item/natural/fibers, /obj/item/natural/fibers)
	maturation_nutrition = 30
	produce_nutrition = 20
	maturation_time = 5 MINUTES
	produce_time = 2 MINUTES

/datum/plant_def/oat
	name = "oat stalks"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "oat"
	produce_type = /obj/item/natural/chaff/oat
	produce_amount_min = 3
	produce_amount_max = 4
	uproot_loot = list(/obj/item/natural/fibers, /obj/item/natural/fibers)
	maturation_nutrition = 30
	produce_nutrition = 20
	maturation_time = 5 MINUTES
	produce_time = 2 MINUTES

/datum/plant_def/rice
	name = "rice stalks"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "rice"
	produce_type = /obj/item/natural/chaff/rice
	produce_amount_min = 3
	produce_amount_max = 4
	uproot_loot = list(/obj/item/natural/fibers, /obj/item/natural/fibers)
	maturation_nutrition = 30
	produce_nutrition = 20
	maturation_time = 5 MINUTES
	produce_time = 2 MINUTES

/datum/plant_def/apple
	name = "apple tree"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "apple"
	produce_type = /obj/item/reagent_containers/food/snacks/grown/apple
	uproot_loot = list(/obj/item/grown/log/tree/small)
	perennial = TRUE
	produce_amount_min = 2
	produce_amount_max = 3
	maturation_nutrition = 60
	produce_nutrition =  30
	maturation_time = 6 MINUTES
	produce_time = 3 MINUTES

/datum/plant_def/pipeweed
	name = "westleach leaf"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "tobacco"
	produce_type = /obj/item/reagent_containers/food/snacks/grown/rogue/pipeweed

/datum/plant_def/sweetleaf
	name = "swampweed"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "weed"
	produce_type = /obj/item/reagent_containers/food/snacks/grown/rogue/sweetleaf

/datum/plant_def/berry
	name = "berry bush"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "berry"
	produce_type = /obj/item/reagent_containers/food/snacks/grown/berries/rogue
	uproot_loot = list(/obj/item/grown/log/tree/small)
	perennial = TRUE
	produce_amount_min = 2
	produce_amount_max = 3
	maturation_nutrition = 60
	produce_nutrition =  30
	maturation_time = 6 MINUTES
	produce_time = 3 MINUTES

/datum/plant_def/berry_poison
	name = "berry bush"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "berry"
	produce_type = /obj/item/reagent_containers/food/snacks/grown/berries/rogue/poison
	uproot_loot = list(/obj/item/grown/log/tree/small)
	perennial = TRUE


/datum/plant_def/cabbage
	name = "cabbage patch"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "cabbage"
	produce_type = /obj/item/reagent_containers/food/snacks/grown/cabbage/rogue
	produce_amount_min = 2
	produce_amount_max = 4
	maturation_nutrition = 25
	produce_nutrition =  15
	maturation_time = 4 MINUTES
	produce_time = 2 MINUTES

/datum/plant_def/pear
	name = "pear tree"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "pear"
	produce_type = /obj/item/reagent_containers/food/snacks/grown/pear
	uproot_loot = list(/obj/item/grown/log/tree/small)
	perennial = TRUE
	maturation_nutrition = 60
	produce_nutrition =  30
	maturation_time = 6 MINUTES
	produce_time = 3 MINUTES

/datum/plant_def/cherry
	name = "cherry tree"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "cherry"
	produce_type = /obj/item/reagent_containers/food/snacks/grown/cherry
	uproot_loot = list(/obj/item/grown/log/tree/small)
	perennial = TRUE
	maturation_nutrition = 60
	produce_nutrition =  30
	maturation_time = 6 MINUTES
	produce_time = 3 MINUTES

/datum/plant_def/olive
	name = "olive tree"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "olive"
	produce_type = /obj/item/reagent_containers/food/snacks/grown/olive
	uproot_loot = list(/obj/item/grown/log/tree/small)
	perennial = TRUE
	maturation_nutrition = 60
	produce_nutrition =  30
	maturation_time = 6 MINUTES
	produce_time = 3 MINUTES

/datum/plant_def/nut
	name = "rocknut tree"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "nuts"
	produce_type = /obj/item/reagent_containers/food/snacks/grown/nut
	uproot_loot = list(/obj/item/grown/log/tree/small)
	perennial = TRUE
	produce_amount_max = 3
	maturation_nutrition = 60
	produce_nutrition =  35
	maturation_time = 6 MINUTES
	produce_time = 3 MINUTES
	water_drain_rate = 1 / (2 MINUTES)

/datum/plant_def/tomato
	name = "tomato bush"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "tomato"
	produce_type = /obj/item/reagent_containers/food/snacks/grown/tomato
	perennial = TRUE
	maturation_nutrition = 60
	produce_nutrition =  30
	maturation_time = 6 MINUTES
	produce_time = 3 MINUTES

/datum/plant_def/onion
	name = "onion patch"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "onion"
	produce_type = /obj/item/reagent_containers/food/snacks/grown/onion/rogue
	produce_amount_min = 2
	produce_amount_max = 4
	maturation_nutrition = 25
	produce_nutrition =  15
	maturation_time = 4 MINUTES
	produce_time = 2 MINUTES

/datum/plant_def/garlic
	name = "garlic patch"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "garlic"
	produce_type = /obj/item/reagent_containers/food/snacks/grown/garlic
	maturation_nutrition = 25
	produce_nutrition =  15
	maturation_time = 4 MINUTES
	produce_time = 2 MINUTES

/datum/plant_def/carrot
	name = "carrot patch"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "carrot"
	produce_type = /obj/item/reagent_containers/food/snacks/grown/carrot
	produce_amount_min = 2
	produce_amount_max = 4
	maturation_nutrition = 25
	produce_nutrition =  15
	maturation_time = 4 MINUTES
	produce_time = 2 MINUTES

/datum/plant_def/carrot/evil
	name = "evil carrot patch"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "carrot"
	produce_type = /obj/item/reagent_containers/food/snacks/grown/carrot/evil
	produce_amount_min = 1
	produce_amount_max = 2
	maturation_nutrition = 35
	produce_nutrition = 20
	maturation_time = 5 MINUTES
	produce_time = 3 MINUTES
	weed_immune = TRUE

/datum/plant_def/potato
	name = "potato plant"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "potato"
	produce_type = /obj/item/reagent_containers/food/snacks/grown/potato/rogue
	produce_amount_min = 2
	produce_amount_max = 4
	maturation_nutrition = 25
	produce_nutrition =  15
	maturation_time = 4 MINUTES
	produce_time = 2 MINUTES

/datum/plant_def/eggplant
	name = "aubergine shrub"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "eggplant"
	produce_type = /obj/item/reagent_containers/food/snacks/grown/eggplant
	perennial = TRUE
	maturation_nutrition = 60
	produce_nutrition =  30
	maturation_time = 6 MINUTES
	produce_time = 3 MINUTES

/datum/plant_def/bean
	name = "bean bush"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "bean"
	produce_type = /obj/item/reagent_containers/food/snacks/grown/bean
	maturation_nutrition = 40
	produce_nutrition =  20
	maturation_time = 5 MINUTES
	produce_time = 2.5 MINUTES

/datum/plant_def/radish
	name = "radish patch"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "radish"
	produce_type = /obj/item/reagent_containers/food/snacks/grown/radish
	produce_amount_min = 2
	produce_amount_max = 4
	maturation_nutrition = 25
	produce_nutrition =  15
	maturation_time = 4 MINUTES
	produce_time = 2 MINUTES

/datum/plant_def/beet
	name = "sugarbeet patch"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "beet"
	produce_type = /obj/item/reagent_containers/food/snacks/grown/beet
	produce_amount_min = 2
	produce_amount_max = 4
	maturation_nutrition = 25
	produce_nutrition =  15
	maturation_time = 4 MINUTES
	produce_time = 2 MINUTES

/datum/plant_def/bellpepper
	name = "tiefling's egg bush"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "bellpepper"
	produce_type = /obj/item/reagent_containers/food/snacks/grown/bellpepper
	perennial = TRUE
	maturation_nutrition = 60
	produce_nutrition =  30
	maturation_time = 6 MINUTES
	produce_time = 3 MINUTES

/datum/plant_def/peas
	name = "pea plant"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "peas"
	produce_type = /obj/item/reagent_containers/food/snacks/grown/peas
	maturation_nutrition = 40
	produce_nutrition =  20
	maturation_time = 5 MINUTES
	produce_time = 2.5 MINUTES

/datum/plant_def/cucumber
	name = "cucumber vine"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "cucumber"
	produce_type = /obj/item/reagent_containers/food/snacks/grown/cucumber
	perennial = TRUE
	maturation_nutrition = 60
	produce_nutrition =  30
	maturation_time = 6 MINUTES
	produce_time = 3 MINUTES

/datum/plant_def/tea
	name = "tea shrub"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "tea"
	produce_type = /obj/item/reagent_containers/food/snacks/grown/tea
	perennial = TRUE
	maturation_nutrition = 60
	produce_nutrition =  30
	maturation_time = 6 MINUTES
	produce_time = 3 MINUTES

/datum/plant_def/plumphelmet
	name = "plump helmet patch"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "plump"
	produce_type = /obj/item/reagent_containers/food/snacks/grown/plumphelmet
	produce_amount_min = 2
	produce_amount_max = 4
	maturation_nutrition = 25
	produce_nutrition =  15
	maturation_time = 4 MINUTES
	produce_time = 2 MINUTES
	weed_immune = TRUE
	can_grow_underground = TRUE

/datum/plant_def/trippy
	name = "strange blue mushroom patch"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "trippy"
	produce_type = /obj/item/reagent_containers/food/snacks/grown/trippy
	produce_amount_min = 2
	produce_amount_max = 4
	maturation_nutrition = 25
	produce_nutrition =  15
	maturation_time = 4 MINUTES
	produce_time = 2 MINUTES
	weed_immune = TRUE
	can_grow_underground = TRUE

/datum/plant_def/amanita
	name = "strange red mushroom patch"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "amanita"
	produce_type = /obj/item/reagent_containers/food/snacks/grown/amanita
	produce_amount_min = 2
	produce_amount_max = 4
	maturation_nutrition = 25
	produce_nutrition =  15
	maturation_time = 4 MINUTES
	produce_time = 2 MINUTES
	weed_immune = TRUE
	can_grow_underground = TRUE


//crystal keep elf nuts
//armors
/datum/plant_def/elfnut
	name = "elfnut tree"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "elfnut"
	produce_type = /obj/item/clothing/suit/roguetown/armor/plate/elfnut
	uproot_loot = list(/obj/item/ingot/iron)
	produce_amount_min = 1
	produce_amount_max = 2
	maturation_nutrition = 100
	maturation_time = 6 MINUTES
	produce_time = 6 MINUTES

/datum/plant_def/elfnut/ironwood/armor/ //produces chainmail
	produce_type = /obj/item/clothing/suit/roguetown/armor/chainmail/elfnut
	uproot_loot = list(/obj/item/ingot/iron)
	produce_amount_min = 1
	produce_amount_max = 2
	maturation_nutrition = 100
	maturation_time = 6 MINUTES
	produce_time = 6 MINUTES

/datum/plant_def/elfnut/ironwood/armor/halfplate
	produce_type = /obj/item/clothing/suit/roguetown/armor/plate/elfnut
	uproot_loot = list(/obj/item/ingot/iron)
	produce_amount_min = 1
	produce_amount_max = 2
	maturation_nutrition = 200
	maturation_time = 6 MINUTES
	produce_time = 6 MINUTES

/datum/plant_def/elfnut/ironwood/armor/fullplate
	produce_type = /obj/item/clothing/suit/roguetown/armor/plate/full/elfnut
	uproot_loot = list(/obj/item/clothing/cloak/cape/elvish)
	produce_amount_min = 1
	produce_amount_max = 1
	maturation_nutrition = 300
	maturation_time = 6 MINUTES
	produce_time = 6 MINUTES

/datum/plant_def/elfnut/ironwood/armor/helmet
	produce_type = /obj/item/clothing/head/roguetown/helmet/heavy/elfnut
	uproot_loot = list(/obj/item/ingot/iron)
	produce_amount_min = 1
	produce_amount_max = 2
	maturation_nutrition = 70
	maturation_time = 3 MINUTES
	produce_time = 6 MINUTES

/datum/plant_def/elfnut/ironwood/armor/halfhelm
	produce_type = /obj/item/clothing/head/roguetown/helmet/bascinet/elfnut
	uproot_loot = list(/obj/item/ingot/iron)
	produce_amount_min = 2
	produce_amount_max = 3
	maturation_nutrition = 70
	maturation_time = 3 MINUTES
	produce_time = 6 MINUTES

/datum/plant_def/elfnut/ironwood/armor/bracers
	produce_type = /obj/item/clothing/wrists/roguetown/bracers/elfnut
	uproot_loot = list(/obj/item/ingot/iron)
	produce_amount_min = 2
	produce_amount_max = 3
	maturation_nutrition = 70
	maturation_time = 3 MINUTES
	produce_time = 6 MINUTES

/datum/plant_def/elfnut/ironwood/armor/bervor
	produce_type = /obj/item/clothing/neck/roguetown/bervor/elfnut/
	uproot_loot = list(/obj/item/ingot/iron)
	produce_amount_min = 2
	produce_amount_max = 3
	maturation_nutrition = 70
	maturation_time = 3 MINUTES
	produce_time = 6 MINUTES

/datum/plant_def/elfnut/ironwood/armor/greaves
	produce_type = /obj/item/clothing/under/roguetown/platelegs/elfnut
	uproot_loot = list(/obj/item/ingot/iron)
	produce_amount_min = 2
	produce_amount_max = 3
	maturation_nutrition = 70
	maturation_time = 3 MINUTES
	produce_time = 6 MINUTES

/datum/plant_def/elfnut/ironwood/armor/boots
	produce_type = /obj/item/clothing/shoes/roguetown/armor/elfnut
	uproot_loot = list(/obj/item/ingot/iron)
	produce_amount_min = 3
	produce_amount_max = 4
	maturation_nutrition = 70
	maturation_time = 3 MINUTES
	produce_time = 6 MINUTES

/datum/plant_def/elfnut/ironwood/armor/gauntlets
	produce_type = /obj/item/clothing/gloves/roguetown/chain/elfnut
	uproot_loot = list(/obj/item/ingot/iron)
	produce_amount_min = 2
	produce_amount_max = 3
	maturation_nutrition = 70
	maturation_time = 3 MINUTES
	produce_time = 6 MINUTES

///SILVERWOOD///
/datum/plant_def/elfnut/silverwood/armor/halfhelm
	produce_type = /obj/item/clothing/head/roguetown/helmet/bascinet/elfnut/silver
	uproot_loot = list(/obj/item/ingot/silver)
	produce_amount_min = 2
	produce_amount_max = 3
	maturation_nutrition = 70
	maturation_time = 3 MINUTES
	produce_time = 6 MINUTES

/datum/plant_def/elfnut/silverwood/fullplate/upper
	produce_type = list(/obj/item/clothing/head/roguetown/helmet/heavy/elfnut/silverwood, 
	/obj/item/clothing/neck/roguetown/bervor/elfnut/silverwood,
/obj/item/clothing/shoes/roguetown/armor/elfnut/silverwood)
	uproot_loot = list(/obj/item/clothing/cloak/cape/elvish/royal)
	produce_amount_min = 1
	produce_amount_max = 1
	maturation_nutrition = 300
	maturation_time = 6 MINUTES
	produce_time = 6 MINUTES

/datum/plant_def/elfnut/ironwood/armor/fullplate/extremities
	produce_type = list(/obj/item/clothing/gloves/roguetown/chain/elfnut/silverwood, 
	/obj/item/clothing/suit/roguetown/armor/plate/full/elfnut/silverwood,
	/obj/item/clothing/under/roguetown/platelegs/elfnut/silverwood)
	uproot_loot = list(/obj/item/clothing/wrists/roguetown/bracers/elfnut/silverwood)
	produce_amount_min = 1
	produce_amount_max = 1
	maturation_nutrition = 300
	maturation_time = 6 MINUTES
	produce_time = 6 MINUTES
///////////WEAPONS/////////////

/datum/plant_def/elfnut/ironwood/dagger
	produce_type = /obj/item/rogueweapon/huntingknife/elfnut
	uproot_loot = list(/obj/item/ingot/iron)
	produce_amount_min = 1
	produce_amount_max = 2
	maturation_nutrition = 100
	maturation_time = 6 MINUTES
	produce_time = 6 MINUTES

/datum/plant_def/elfnut/ironwood/shortsword
	name = "elf nut tree"
	produce_type = /obj/item/rogueweapon/sword/short/elfnut
	uproot_loot = list(/obj/item/ingot/iron)
	produce_amount_min = 2
	produce_amount_max = 3
	maturation_nutrition = 100
	maturation_time = 3 MINUTES
	produce_time = 3 MINUTES

/datum/plant_def/elfnut/ironwood/sword
	name = "elf nut tree"
	produce_type = /obj/item/rogueweapon/sword/elfnut
	uproot_loot = list(/obj/item/ingot/iron)
	produce_amount_min = 1
	produce_amount_max = 2
	maturation_nutrition = 100
	maturation_time = 6 MINUTES
	produce_time = 3 MINUTES

/datum/plant_def/elfnut/ironwood/sabre
	name = "elf nut tree"
	produce_type = /obj/item/rogueweapon/sword/sabre/elfnut
	uproot_loot = list(/obj/item/ingot/iron)
	produce_amount_min = 1
	produce_amount_max = 2
	maturation_nutrition = 100
	maturation_time = 6 MINUTES
	produce_time = 6 MINUTES

/datum/plant_def/elfnut/ironwood/buckler

	produce_type = /obj/item/rogueweapon/shield/buckler/elfnut
	uproot_loot = list(/obj/item/ingot/iron)
	produce_amount_min = 1
	produce_amount_max = 2
	maturation_nutrition = 100
	maturation_time = 6 MINUTES
	produce_time = 6 MINUTES

/datum/plant_def/elfnut/ironwood/bow
	name = "elf vine tree"
	produce_type = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve/elfnut
	uproot_loot = list(/obj/item/ingot/iron)
	produce_amount_min = 1
	produce_amount_max = 2
	maturation_nutrition = 100
	maturation_time = 6 MINUTES
	produce_time = 6 MINUTES

/datum/plant_def/elfnut/ironwood/glaive
	name = "elf nut tree"
	produce_type = /obj/item/rogueweapon/glaive/elfnut
	uproot_loot = list(/obj/item/ingot/iron)
	produce_amount_min = 1
	produce_amount_max = 2
	maturation_nutrition = 100
	maturation_time = 6 MINUTES
	produce_time = 6 MINUTES


//silver 

/datum/plant_def/elfnut/silverwood/dagger
	name = "elf nut tree"
	produce_type = /obj/item/rogueweapon/huntingknife/idagger/silver/elvish
	uproot_loot = list(/obj/item/ingot/silver)
	produce_amount_min = 1
	produce_amount_max = 2
	maturation_nutrition = 100
	maturation_time = 6 MINUTES
	produce_time = 6 MINUTES

/datum/plant_def/elfnut/silverwood/shortsword
	name = "elf nut tree"
	produce_type = /obj/item/rogueweapon/sword/short/elfnut
	uproot_loot = list(/obj/item/ingot/steel)
	produce_amount_min = 2
	produce_amount_max = 3
	maturation_nutrition = 100
	maturation_time = 3 MINUTES
	produce_time = 3 MINUTES

/datum/plant_def/elfnut/silverwood/sword
	name = "elf nut tree"
	produce_type = /obj/item/rogueweapon/sword/elfnut
	uproot_loot = list(/obj/item/ingot/steel)
	produce_amount_min = 1
	produce_amount_max = 2
	maturation_nutrition = 100
	maturation_time = 6 MINUTES
	produce_time = 3 MINUTES


/datum/plant_def/elfnut/silverwood/sabre
	name = "elf nut tree"
	produce_type = /obj/item/rogueweapon/sword/silver/sabre/elf
	uproot_loot = list(/obj/item/ingot/steel)
	produce_amount_min = 1
	produce_amount_max = 2
	maturation_nutrition = 100
	maturation_time = 6 MINUTES
	produce_time = 6 MINUTES

/datum/plant_def/elfnut/silverwood/glaive
	name = "elf nut tree"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "elfnutsilver"
	produce_type = /obj/item/rogueweapon/glaive/elfnut/silverwood
	uproot_loot = list(/obj/item/ingot/iron)
	produce_amount_min = 1
	produce_amount_max = 2
	maturation_nutrition = 100
	maturation_time = 6 MINUTES
	produce_time = 6 MINUTES

/datum/plant_def/elfnut/silverwood/shield
	name = "elfnut tree"
	produce_type = /obj/item/rogueweapon/shield/buckler/elfnut/silverwood
	uproot_loot = list(/obj/item/ingot/iron)
	produce_amount_min = 1
	produce_amount_max = 2
	maturation_nutrition = 100
	maturation_time = 6 MINUTES
	produce_time = 6 MINUTES

/datum/plant_def/elfnut/silverwood/bow
	name = "elf vine tree"
	produce_type = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/elvish
	uproot_loot = list(/obj/item/ingot/iron)
	produce_amount_min = 1
	produce_amount_max = 2
	maturation_nutrition = 100
	maturation_time = 6 MINUTES
	produce_time = 6 MINUTES

//shouldn't be obtainable for now//
/datum/plant_def/elfnut/silverwood/weapons/elfmastersword
	name = "elf nut tree"
	produce_type = /obj/item/rogueweapon/sword/long/masterelf
	uproot_loot = list(/obj/item/ingot/iron)
	produce_amount_min = 1
	produce_amount_max = 1
	maturation_nutrition = 200
	maturation_time = 6 MINUTES
	produce_time = 6 MINUTES

/datum/plant_def/elfnut/silverwood/armor/plate
	name = "elfnut tree"
	produce_type = /obj/item/clothing/suit/roguetown/armor/plate/elfnut
	uproot_loot = list(/obj/item/ingot/iron)
	produce_amount_min = 1
	produce_amount_max = 2
	maturation_nutrition = 100
	maturation_time = 6 MINUTES
	produce_time = 6 MINUTES

//HIGH QUALITY SEEDS//

/datum/plant_def/elfnut/ironwood/armor/complete
	produce_type = list(
		/obj/item/clothing/head/roguetown/helmet/heavy/elfnut/,
		/obj/item/clothing/suit/roguetown/armor/plate/full/elfnut/,
		/obj/item/clothing/suit/roguetown/armor/chainmail/elfnut,
		/obj/item/clothing/neck/roguetown/bervor/elfnut/,
		/obj/item/clothing/shoes/roguetown/armor/elfnut/,
		/obj/item/clothing/under/roguetown/platelegs/elfnut/,
		/obj/item/clothing/gloves/roguetown/chain/elfnut/
	)
	uproot_loot = list(/obj/item/clothing/cloak/cape/elvish/)
	produce_amount_min = 1
	produce_amount_max = 1
	maturation_nutrition = 300
	maturation_time = 6 MINUTES
	produce_time = 6 MINUTES

/datum/plant_def/elfnut/silverwood/armor/complete
	produce_type = list(
		/obj/item/clothing/head/roguetown/helmet/heavy/elfnut/silverwood,
		/obj/item/clothing/suit/roguetown/armor/plate/full/elfnut/silverwood,
		/obj/item/clothing/suit/roguetown/armor/chainmail/elfnut/silverwood,
		/obj/item/clothing/neck/roguetown/bervor/elfnut/silverwood,
		/obj/item/clothing/shoes/roguetown/armor/elfnut/silverwood,
		/obj/item/clothing/under/roguetown/platelegs/elfnut/silverwood,
		/obj/item/clothing/gloves/roguetown/chain/elfnut/silverwood
	)
	uproot_loot = list(/obj/item/clothing/cloak/cape/elvish/)
	produce_amount_min = 1
	produce_amount_max = 1
	maturation_nutrition = 300
	maturation_time = 6 MINUTES
	produce_time = 6 MINUTES

//gourd plants 

/datum/plant_def/elfnut/gourds
	name = "gourd patch"
	produce_type = /obj/item/clothing/suit/roguetown/armor/plate/elfnut
	uproot_loot = list(/obj/item/ingot/iron)
	produce_amount_min = 1
	produce_amount_max = 2
	maturation_nutrition = 100
	maturation_time = 6 MINUTES
	produce_time = 6 MINUTES

//premium

/datum/plant_def/elfnut/ironwood/armor/complete
	//produce_type = list out all the armor pieces
	uproot_loot = list(/obj/item/ingot/iron)
	produce_amount_min = 2
	produce_amount_max = 3
	maturation_nutrition = 500
	maturation_time = 8 MINUTES
	produce_time = 8 MINUTES


///HENNESEED///

/datum/plant_def/henneseed
	name = "a gathering of golden roses"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "eggplant"
	produce_type = /obj/item/reagent_containers/glass/bottle/gourd/booze
	produce_amount_min = 1
	produce_amount_max = 3
	maturation_nutrition = 69
	maturation_time = 6 MINUTES
	produce_time = 3 MINUTES


/datum/plant_def/henneseed/faeport
	name = "a refreshing tangle of mint."
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "eggplant"
	produce_type = /obj/item/storage/fancy/cigarettes/faeports
	produce_amount_min = 1
	produce_amount_max = 3
	maturation_nutrition = 100
	maturation_time = 6 MINUTES
	produce_time = 3 MINUTES

/datum/plant_def/henneseed/gourd
	name = "a gathering of roses."
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "eggplant"
	produce_type = /obj/item/reagent_containers/glass/bottle/gourd
	perennial = TRUE
	maturation_nutrition = 60
	produce_nutrition =  30
	maturation_time = 6 MINUTES
	produce_time = 3 MINUTES


//poison oak shenanigans
/datum/plant_def/poison_oak
	name = "poison oak patch"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "poison_oak" // placeholder
	produce_type = /obj/item/reagent_containers/food/snacks/grown/poison_oak
	produce_amount_min = 2
	produce_amount_max = 4
	maturation_nutrition = 25
	produce_nutrition = 15
	maturation_time = 4 MINUTES
	produce_time = 2 MINUTES
	weed_immune = TRUE

/datum/plant_def/poison_ivy
	name = "poison ivy patch"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "tea" // placeholder
	produce_type = /obj/item/reagent_containers/food/snacks/grown/poison_ivy
	produce_amount_min = 2
	produce_amount_max = 4
	maturation_nutrition = 25
	produce_nutrition = 15
	maturation_time = 4 MINUTES
	produce_time = 2 MINUTES
	weed_immune = TRUE

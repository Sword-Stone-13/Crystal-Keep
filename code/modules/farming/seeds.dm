/obj/item/seeds
	name = "seeds"
	icon = 'icons/obj/hydroponics/seeds.dmi'
	icon_state = "seed"
	w_class = WEIGHT_CLASS_TINY
	resistance_flags = FLAMMABLE
	possible_item_intents = list(/datum/intent/use)
	var/plant_def_type
	var/seed_identity = "some seed"

// WARNING!! Some seeds were removed from soilsons because their produce wasn't being used in New Cooking! Please give them the seeds back if this changes!!

/obj/item/seeds/Initialize()
	. = ..()
	if(plant_def_type)
		var/datum/plant_def/def = GLOB.plant_defs[plant_def_type]
		color = def.seed_color

/obj/item/seeds/Crossed(mob/living/L)
	. = ..()
	// Chance to destroy the seed as it's being stepped on
	if(prob(35) && istype(L))
		qdel(src)

/obj/item/seeds/examine(mob/user)
	. = ..()
	var/show_real_identity = FALSE
	if(isliving(user))
		var/mob/living/living = user
		// Seed knowers, know the seeds (druids and such)
		if(HAS_TRAIT(living, TRAIT_SEEDKNOW))
			show_real_identity = TRUE
		// Journeyman farmers know them too
		else if(living.mind.get_skill_level(/datum/skill/labor/farming) >= 2)
			show_real_identity = TRUE
	else
		show_real_identity = TRUE
	if(show_real_identity)
		. += span_info("I can tell these are [seed_identity]")

/obj/item/seeds/attack_turf(turf/T, mob/living/user)
	var/obj/structure/soil/soil = get_soil_on_turf(T)
	if(soil)
		try_plant_seed(user, soil)
		return
	else if(istype(T, /turf/open/floor/rogue/dirt))
		to_chat(user, span_notice("I begin making a mound for the seeds..."))
		if(do_after(user, get_farming_do_time(user, 10 SECONDS), target = src))
			apply_farming_fatigue(user, 30)
			soil = get_soil_on_turf(T)
			if(!soil)
				soil = new /obj/structure/soil(T)
		return
	. = ..()

/obj/item/seeds/proc/try_plant_seed(mob/living/user, obj/structure/soil/soil)
	if(soil.plant)
		to_chat(user, span_warning("There is already something planted in \the [soil]!"))
		return
	if(!plant_def_type)
		return
	to_chat(user, span_notice("I plant \the [src] in \the [soil]."))
	soil.insert_plant(GLOB.plant_defs[plant_def_type])
	qdel(src)

/obj/item/seeds/wheat
	seed_identity = "wheat seeds"
	plant_def_type = /datum/plant_def/wheat

/obj/item/seeds/wheat/oat
	seed_identity = "oat seeds"
	plant_def_type = /datum/plant_def/oat

/obj/item/seeds/apple
	seed_identity = "apple seeds"
	plant_def_type = /datum/plant_def/apple

/obj/item/seeds/pipeweed
	seed_identity = "westleach leaf seeds"
	plant_def_type = /datum/plant_def/pipeweed

/obj/item/seeds/sweetleaf
	seed_identity = "swampweed seeds"
	plant_def_type = /datum/plant_def/sweetleaf

/obj/item/seeds/berryrogue
	seed_identity = "berry seeds"
	plant_def_type = /datum/plant_def/berry

/obj/item/seeds/berryrogue/poison
	seed_identity = "berry seeds"
	plant_def_type = /datum/plant_def/berry_poison

/obj/item/seeds/cabbage
	seed_identity = "cabbage seeds"
	plant_def_type = /datum/plant_def/cabbage

/obj/item/seeds/pear
	seed_identity = "pear seeds"
	plant_def_type = /datum/plant_def/pear

/obj/item/seeds/cherry
	seed_identity = "cherry seeds"
	plant_def_type = /datum/plant_def/cherry

/obj/item/seeds/olive
	seed_identity = "olive seeds"
	plant_def_type = /datum/plant_def/olive

/obj/item/seeds/nut
	seed_identity = "rocknut seeds"
	plant_def_type = /datum/plant_def/nut

/obj/item/seeds/tomato
	seed_identity = "tomato seeds"
	plant_def_type = /datum/plant_def/tomato

/obj/item/seeds/onion
	seed_identity = "onion seeds"
	plant_def_type = /datum/plant_def/onion

/obj/item/seeds/garlic
	seed_identity = "garlic seeds"
	plant_def_type = /datum/plant_def/garlic

/obj/item/seeds/carrot
	seed_identity = "carrot seeds"
	plant_def_type = /datum/plant_def/carrot

/obj/item/seeds/carrot/evil
	seed_identity = "evil carrot seeds"
	plant_def_type = /datum/plant_def/carrot/evil

/obj/item/seeds/potato
	seed_identity = "potato eyes"
	plant_def_type = /datum/plant_def/potato

/obj/item/seeds/eggplant
	seed_identity = "eggplant seeds"
	plant_def_type = /datum/plant_def/eggplant

/obj/item/seeds/bean
	seed_identity = "bean seeds"
	plant_def_type = /datum/plant_def/bean

/obj/item/seeds/radish
	seed_identity = "radish seeds"
	plant_def_type = /datum/plant_def/radish

/obj/item/seeds/beet
	seed_identity = "sugarbeet seeds"
	plant_def_type = /datum/plant_def/beet

/obj/item/seeds/bellpepper
	seed_identity = "little tiefling eggs"
	plant_def_type = /datum/plant_def/bellpepper

/obj/item/seeds/peas
	seed_identity = "pea seeds"
	plant_def_type = /datum/plant_def/peas

/obj/item/seeds/rice
	seed_identity = "rice seeds"
	plant_def_type = /datum/plant_def/rice

/obj/item/seeds/cucumber
	seed_identity = "cucumber seeds"
	plant_def_type = /datum/plant_def/cucumber

/obj/item/seeds/tea
	seed_identity = "tea seeds"
	plant_def_type = /datum/plant_def/tea

/obj/item/seeds/mycelium
	name = "spores"
	icon_state = "mycelium"

/obj/item/seeds/mycelium/plumphelmet
	seed_identity = "plump helmet spores"
	plant_def_type = /datum/plant_def/plumphelmet

/obj/item/seeds/mycelium/trippy
	seed_identity = "blue mushroom spores"
	plant_def_type = /datum/plant_def/trippy

/obj/item/seeds/mycelium/amanita
	seed_identity = "red mushroom spores"
	plant_def_type = /datum/plant_def/amanita


//Crystal Keep Seeds

/obj/item/seeds/elfnut/ //Elves grow their arms. Something to do with all that spare time, I suppose.
	name = "elfnut"
	resistance_flags = FIRE_PROOF

//ironwood armors
/obj/item/seeds/elfnut/ironwood/armor/ //produces chainmail
	seed_identity = "elfnut seed"
	plant_def_type = /datum/plant_def/elfnut/ironwood/armor/

/obj/item/seeds/elfnut/ironwood/armor/halfplate
	plant_def_type = /datum/plant_def/elfnut/ironwood/armor/halfplate

/obj/item/seeds/elfnut/ironwood/armor/fullplate/
	plant_def_type = /datum/plant_def/elfnut/ironwood/armor/fullplate

/obj/item/seeds/elfnut/ironwood/armor/helmet
	plant_def_type = /datum/plant_def/elfnut/ironwood/armor/helmet

/obj/item/seeds/elfnut/ironwood/armor/halfhelm
	plant_def_type = /datum/plant_def/elfnut/ironwood/armor/halfhelm

/obj/item/seeds/elfnut/ironwood/armor/bracers/
	plant_def_type = /datum/plant_def/elfnut/ironwood/armor/bracers

/obj/item/seeds/elfnut/ironwood/armor/bervor/
	plant_def_type = /datum/plant_def/elfnut/ironwood/armor/bervor

/obj/item/seeds/elfnut/ironwood/armor/greaves/
	plant_def_type = /datum/plant_def/elfnut/ironwood/armor/greaves

/obj/item/seeds/elfnut/ironwood/armor/boots/
	plant_def_type = /datum/plant_def/elfnut/ironwood/armor/boots

/obj/item/seeds/elfnut/ironwood/armor/gauntlets/
	plant_def_type = /datum/plant_def/elfnut/ironwood/armor/gauntlets


///Silverwood Armor///
//	seed_identity = "intricate elfnut seed"//keeping the original names on the side, made all names uniform so merchants don't game the system by getting a farmer to help them identify nuts
/obj/item/seeds/elfnut/silverwood/armor/halfhelm
	plant_def_type = /datum/plant_def/elfnut/silverwood/armor/halfhelm

/obj/item/seeds/elfnut/silverwood/armor/fullplate/upper//code was uppity with me, see if this woorks
	plant_def_type = /datum/plant_def/elfnut/silverwood/fullplate/upper

/obj/item/seeds/elfnut/silverwood/armor/fullplate/extremities
	plant_def_type = /datum/plant_def/elfnut/ironwood/armor/fullplate/extremities

//ironwood weapons
//	seed_identity = "thorny elfnut seed"
/obj/item/seeds/elfnut/ironwood/weapons/dagger
	plant_def_type = /datum/plant_def/elfnut/ironwood/dagger

/obj/item/seeds/elfnut/ironwood/weapons/shortsword
	plant_def_type = /datum/plant_def/elfnut/ironwood/shortsword

/obj/item/seeds/elfnut/ironwood/weapons/sword
	plant_def_type = /datum/plant_def/elfnut/ironwood/sword

/obj/item/seeds/elfnut/ironwood/weapons/sabre
	plant_def_type = /datum/plant_def/elfnut/ironwood/sabre

/obj/item/seeds/elfnut/ironwood/weapons/buckler //had a real difficult time deciding if this would be an arm or an armor. Decided on arm because of repair and skill code.
	plant_def_type = /datum/plant_def/elfnut/ironwood/buckler

/obj/item/seeds/elfnut/ironwood/weapons/bow
	plant_def_type = /datum/plant_def/elfnut/ironwood/bow

/obj/item/seeds/elfnut/ironwood/weapons/glaive
	plant_def_type = /datum/plant_def/elfnut/ironwood/glaive


/* maybe later
/obj/item/seeds/elfnut/ironwood/weapons/longleaf
	seed_identity = "thorny elfnut seed"
	plant_def_type = /datum/plant_def/elfnut/ironwood/weapons/2handsabre
*/

//silverwood weapons
//	seed_identity = "heavy elfnut seed"
/obj/item/seeds/elfnut/silverwood/weapons/dagger //lorewise these are elfnut seeds planted then collected over a silver deposit, artificial or natural (ergo, a pile of silver under dirt) Usually artificial because... silver deposits aren't everywhere
	plant_def_type = /datum/plant_def/elfnut/silverwood/dagger

/obj/item/seeds/elfnut/silverwood/weapons/shortsword
	plant_def_type = /datum/plant_def/elfnut/silverwood/shortsword

/obj/item/seeds/elfnut/silverwood/weapons/sword
	plant_def_type = /datum/plant_def/elfnut/silverwood/sword

/obj/item/seeds/elfnut/silverwood/weapons/sabre
	plant_def_type = /datum/plant_def/elfnut/silverwood/sabre


/obj/item/seeds/elfnut/silverwood/weapons/glaive
	plant_def_type = /datum/plant_def/elfnut/silverwood/glaive

/obj/item/seeds/elfnut/silverwood/weapons/shield
	plant_def_type = /datum/plant_def/elfnut/silverwood/shield

/obj/item/seeds/elfnut/silverwood/weapons/bow
	plant_def_type = /datum/plant_def/elfnut/silverwood/bow

/obj/item/seeds/elfnut/silverwood/weapons/mastersword
	seed_identity = "glowing elfnut seed"
	plant_def_type = /datum/plant_def/elfnut/silverwood/weapons/elfmastersword

//high quality seeds

//	seed_identity = "complete elfnut seed"
/obj/item/seeds/elfnut/ironwood/armor/complete/ //spawns the entire iron elfnut armor, should be rare.
	plant_def_type = /datum/plant_def/elfnut/ironwood/armor/complete

//	seed_identity = "perfect elfnut seed"
/obj/item/seeds/elfnut/silverwood/armor/complete/ //spawns the entire SILVER elfnut armor. Should be extraordinarily rare.
	plant_def_type = /datum/plant_def/elfnut/silverwood/armor/complete


//henneseed
//	seed_identity = "condensed courage"
/obj/item/seeds/elfnut/henneseed //a bottle of cognac GOT DAMN
	plant_def_type = /datum/plant_def/henneseed


/obj/item/seeds/elfnut/henneseed/gourd //a "natural" bottle of "elf wine" in case a glass bottle of alcohol is too "immersion breaking"
	plant_def_type = /datum/plant_def/henneseed/gourd

/obj/item/seeds/elfnut/henneseed/faeport //a pack of sick zigs baby
	plant_def_type = /datum/plant_def/henneseed/faeport

//poison oak shenanigans
/obj/item/seeds/poison_oak
	seed_identity = "poison oak seeds"
	plant_def_type = /datum/plant_def/poison_oak

/obj/item/seeds/poison_ivy
	seed_identity = "poison ivy seeds" 
	plant_def_type = /datum/plant_def/poison_ivy

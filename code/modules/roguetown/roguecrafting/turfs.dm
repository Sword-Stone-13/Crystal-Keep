
/// WOOD

/datum/crafting_recipe/roguetown/turfs/woodfloor
	name = "wooden floor"
	result = /turf/open/floor/rogue/ruinedwood
	reqs = list(/obj/item/grown/log/tree/small = 1)
	skillcraft = /datum/skill/craft/carpentry
	verbage_simple = "construct"
	verbage = "constructs"
	craftdiff = 0

/datum/crafting_recipe/roguetown/turfs/woodfloor/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue))
		return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/woodplatform
	name = "wooden platform"
	result = /turf/open/floor/rogue/ruinedwood/platform
	reqs = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/natural/fibers = 1)
	skillcraft = /datum/skill/craft/carpentry
	verbage_simple = "construct"
	verbage = "constructs"
	craftdiff = 1

/datum/crafting_recipe/roguetown/turfs/woodplatform/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/transparent/openspace))
		if(!istype(T, /turf/open/water))
			return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/woodwall
	name = "wooden wall"
	result = /turf/closed/wall/mineral/rogue/wood
	reqs = list(/obj/item/grown/log/tree/small = 2)
	skillcraft = /datum/skill/craft/carpentry
	verbage_simple = "construct"
	verbage = "constructs"
	craftdiff = 2

/datum/crafting_recipe/roguetown/turfs/woodwall/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue))
		return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/fancywwall
	name = "fancy wooden wall"
	result = /turf/closed/wall/mineral/rogue/decowood
	reqs = list(/obj/item/grown/log/tree/small = 2)
	skillcraft = /datum/skill/craft/carpentry
	verbage_simple = "construct"
	verbage = "constructs"
	craftdiff = 3

/datum/crafting_recipe/roguetown/turfs/fancywwall/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue))
		return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/woodwindow
	name = "wooden murder hole"
	result = /turf/closed/wall/mineral/rogue/wood/window
	reqs = list(/obj/item/grown/log/tree/small = 2)
	skillcraft = /datum/skill/craft/carpentry
	verbage_simple = "construct"
	verbage = "constructs"
	craftdiff = 2

/datum/crafting_recipe/roguetown/turfs/woodwindow/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue))
		return
	return TRUE


/datum/crafting_recipe/roguetown/turfs/woodwall/dark
	name = "dark wooden wall"
	result = /turf/closed/wall/mineral/rogue/wood/dark
	reqs = list(/obj/item/grown/log/tree/small = 2, /obj/item/natural/dirtclod = 1)
	skillcraft = /datum/skill/craft/carpentry
	verbage_simple = "construct"
	verbage = "constructs"
	craftdiff = 2

/datum/crafting_recipe/roguetown/turfs/woodwall/light
	name = "light wooden wall"
	result = /turf/closed/wall/mineral/rogue/wood/light
	reqs = list(/obj/item/grown/log/tree/small = 2, /obj/item/natural/sandpile = 1)
	skillcraft = /datum/skill/craft/carpentry
	verbage_simple = "construct"
	verbage = "constructs"
	craftdiff = 2

/datum/crafting_recipe/roguetown/turfs/woodwall/log
	name = "log wall"
	result = /turf/closed/wall/mineral/rogue/wood/log
	reqs = list(/obj/item/grown/log/tree = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/turfs/woodwindow/dark
	name = "dark wooden murder hole"
	result = /turf/closed/wall/mineral/rogue/wood/dark/window
	reqs = list(/obj/item/grown/log/tree/small = 2, /obj/item/natural/dirtclod = 1)
	skillcraft = /datum/skill/craft/carpentry
	verbage_simple = "construct"
	verbage = "constructs"
	craftdiff = 2

/datum/crafting_recipe/roguetown/turfs/woodwindow/light
	name = "light wooden murder hole"
	result = /turf/closed/wall/mineral/rogue/wood/light/window
	reqs = list(/obj/item/grown/log/tree/small = 2, /obj/item/natural/sandpile = 1)
	skillcraft = /datum/skill/craft/carpentry
	verbage_simple = "construct"
	verbage = "constructs"
	craftdiff = 2

/datum/crafting_recipe/roguetown/turfs/woodwindow/log
	name = "wooden log murder hole"
	result = /turf/closed/wall/mineral/rogue/wood/log/window
	reqs = list(/obj/item/grown/log/tree = 1)
	skillcraft = /datum/skill/craft/carpentry
	verbage_simple = "construct"
	verbage = "constructs"
	craftdiff = 3

/// STONE

/datum/crafting_recipe/roguetown/turfs/stonefloor
	name = "stone floor"
	result = /turf/open/floor/rogue/blocks
	reqs = list(/obj/item/natural/stone = 1)
	skillcraft = /datum/skill/craft/masonry
	verbage_simple = "build"
	verbage = "builds"
	craftdiff = 0

/datum/crafting_recipe/roguetown/turfs/stonefloor/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue))
		return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/stoneplatform
	name = "stone platform"
	result = /turf/open/floor/rogue/blocks/platform
	reqs = list(/obj/item/natural/stone = 1,
				/obj/item/natural/fibers = 1)
	skillcraft = /datum/skill/craft/masonry
	verbage_simple = "build"
	verbage = "builds"
	craftdiff = 1

/datum/crafting_recipe/roguetown/turfs/stoneplatform/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/transparent/openspace))
		if(!istype(T, /turf/open/water))
			return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/stonewall
	name = "stone wall"
	result = /turf/closed/wall/mineral/rogue/stone
	reqs = list(/obj/item/natural/stone = 2)
	skillcraft = /datum/skill/craft/masonry
	verbage_simple = "build"
	verbage = "builds"
	craftdiff = 2

/datum/crafting_recipe/roguetown/turfs/stonewall/light
	name = "whitestone wall"
	result = /turf/closed/wall/mineral/rogue/stone/light
	reqs = list(/obj/item/natural/stone = 1, /obj/item/natural/sandpile = 1)
	result = /turf/closed/wall/mineral/rogue/stone/light

/datum/crafting_recipe/roguetown/turfs/stonewall/carved
	name = "carved wall"
	result = /turf/closed/wall/mineral/rogue/stone/carved
	reqs = list(/obj/item/natural/stone = 3)
	result = /turf/closed/wall/mineral/rogue/stone/carved
	craftdiff = 4

/datum/crafting_recipe/roguetown/turfs/stonebrick
	name = "Brick wall"
	result = /turf/closed/wall/mineral/rogue/stonebrick
	reqs = list(/obj/item/natural/stone = 4)
	skillcraft = /datum/skill/craft/masonry
	verbage_simple = "build"
	verbage = "builds"
	craftdiff = 3

/datum/crafting_recipe/roguetown/turfs/stonebrick/red
	name = "Red brick wall"
	reqs = list(/obj/item/natural/stone = 1, /obj/item/natural/dirtclod = 1) //stand in for clay
	result = /turf/closed/wall/mineral/rogue/stonebrick/red


/datum/crafting_recipe/roguetown/turfs/stonebrick/light
	name = "White brick wall"
	reqs = list(/obj/item/natural/stone = 3, /obj/item/natural/sandpile = 1)
	result = /turf/closed/wall/mineral/rogue/stonebrick/light


/datum/crafting_recipe/roguetown/turfs/stonewall/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue))
		return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/fancyswall
	name = "fancy stone wall"
	result = /turf/closed/wall/mineral/rogue/decostone
	reqs = list(/obj/item/natural/stone = 2)
	skillcraft = /datum/skill/craft/masonry
	verbage_simple = "build"
	verbage = "builds"
	craftdiff = 3

/datum/crafting_recipe/roguetown/turfs/fancyswall/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue))
		return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/craftstone
	name = "craftstone wall"
	result = /turf/closed/wall/mineral/rogue/craftstone
	reqs = list(/obj/item/natural/stone = 3)
	skillcraft = /datum/skill/craft/masonry
	verbage_simple = "build"
	verbage = "builds"
	craftdiff = 4

/datum/crafting_recipe/roguetown/turfs/fancyswall/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue))
		return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/stonewindow
	name = "stone murder hole"
	result = /turf/closed/wall/mineral/rogue/stone/window
	reqs = list(/obj/item/natural/stone = 2)
	skillcraft = /datum/skill/craft/masonry
	verbage_simple = "build"
	verbage = "builds"
	craftdiff = 2

/datum/crafting_recipe/roguetown/turfs/stonewindow/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue))
		return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/stonewindow/light
	name = "stone murder hole"
	result = /turf/closed/wall/mineral/rogue/stone/window/light
	reqs = list(/obj/item/natural/stone = 2)
	skillcraft = /datum/skill/craft/masonry
	verbage_simple = "build"
	verbage = "builds"
	craftdiff = 2

/datum/crafting_recipe/roguetown/turfs/stonewindow/light/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue))
		return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/stonewindow
	name = "carved murder hole"
	result = /turf/closed/wall/mineral/rogue/stone/window
	reqs = list(/obj/item/natural/stone = 3)
	skillcraft = /datum/skill/craft/masonry
	verbage_simple = "build"
	verbage = "builds"
	craftdiff = 4

/datum/crafting_recipe/roguetown/turfs/stonewindow/carved/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue))
		return
	return TRUE

/// TWIG AND TENT

/datum/crafting_recipe/roguetown/turfs/twig
	name = "twig floor"
	result = /turf/open/floor/rogue/twig
	reqs = list(/obj/item/grown/log/tree/stick = 2)
	skillcraft = /datum/skill/craft/crafting
	verbage_simple = "assemble"
	verbage = "assembles"
	craftdiff = 0

/datum/crafting_recipe/roguetown/turfs/twig/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue/dirt))
		if(!istype(T, /turf/open/floor/rogue/grass))
			return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/twigplatform
	name = "twig platform"
	result = /turf/open/floor/rogue/twig/platform
	reqs = list(/obj/item/grown/log/tree/stick = 3)
	skillcraft = /datum/skill/craft/crafting
	verbage_simple = "assemble"
	verbage = "assembles"
	craftdiff = 1

/datum/crafting_recipe/roguetown/turfs/twigplatform/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/transparent/openspace))
		if(!istype(T, /turf/open/water))
			return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/tentwall
	name = "tent wall"
	result = /turf/closed/wall/mineral/rogue/tent
	reqs = list(/obj/item/grown/log/tree/stick = 1,
				/obj/item/natural/cloth = 1)
	skillcraft = /datum/skill/craft/crafting
	verbage_simple = "set up"	
	verbage = "sets up"
	craftdiff = 1

/datum/crafting_recipe/roguetown/turfs/tentwall/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue))
		return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/tentdoor
	name = "tent door"
	result = /obj/structure/roguetent
	reqs = list(/obj/item/grown/log/tree/stick = 1,
				/obj/item/natural/cloth = 1)
	skillcraft = /datum/skill/craft/crafting
	verbage_simple = "set up"
	verbage = "sets up"
	craftdiff = 1

/datum/crafting_recipe/roguetown/turfs/tentdoor/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue))
		return
	return ..()


/// DURT
/datum/crafting_recipe/roguetown/turfs/nrich
	name = "soil plot"
	result = /turf/open/floor/rogue/dirt/nrich
	reqs = list(/obj/item/ash = 1,
				/obj/item/natural/fibers = 1,
				/obj/item/natural/dirtclod = 2)
	skillcraft = /datum/skill/labor/farming
	verbage_simple = "set up"
	verbage = "sets up"
	craftdiff = 2

/datum/crafting_recipe/roguetown/turfs/nrich/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue))
		return
	return TRUE


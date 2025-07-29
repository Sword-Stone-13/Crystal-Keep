/turf/open/floor/rogue
	desc = ""
	canSmoothWith = null
	smooth = SMOOTH_FALSE
	var/smooth_icon = null
	var/prettifyturf = FALSE
	icon = 'icons/turf/roguefloor.dmi'
	baseturfs = list(/turf/open/transparent/openspace)
	neighborlay = ""

/turf/open/floor/rogue/break_tile()
	return //unbreakable

/turf/open/floor/rogue/burn_tile()
	return //unburnable

/turf/open/floor/rogue/Initialize()
	if(smooth_icon)
		icon = smooth_icon
	. = ..()

/turf/open/floor/rogue/turf_destruction(damage_flag)
	return //Ignores destruction if not set

/turf/open/floor/rogue/ruinedwood
	icon_state = "wooden_floor"
	footstep = FOOTSTEP_WOOD
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_WOOD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE
	landsound = 'sound/foley/jumpland/woodland.wav'
//	smooth = SMOOTH_MORE
//	canSmoothWith = list(/turf/closed/mineral/rogue, /turf/closed/mineral, /turf/closed/wall/mineral/rogue/stonebrick, /turf/closed/wall/mineral/rogue/wood, /turf/closed/wall/mineral/rogue/wooddark, /turf/closed/wall/mineral/rogue/decowood, /turf/closed/wall/mineral/rogue/decostone, /turf/closed/wall/mineral/rogue/stone, /turf/closed/wall/mineral/rogue/stone/moss, /turf/open/floor/rogue/cobble, /turf/open/floor/rogue/dirt, /turf/open/floor/rogue/grass)
	neighborlay = "dirtedge"
	damage_deflection = 8
	max_integrity = 1000
	break_sound = 'sound/combat/hits/onwood/destroywalldoor.ogg'
	attacked_sound = list('sound/combat/hits/onwood/fence_hit1.ogg','sound/combat/hits/onwood/fence_hit2.ogg','sound/combat/hits/onwood/fence_hit3.ogg')

/turf/open/floor/rogue/ruinedwood/Initialize()
	dir = pick(GLOB.cardinals)
	. = ..()

/turf/open/floor/rogue/ruinedwood/turned
	icon_state = "wooden_floort"

/turf/open/floor/rogue/ruinedwood/spiral
	icon_state = "weird1"

/turf/open/floor/rogue/ruinedwood/chevron
	icon_state = "weird2"

/turf/open/floor/rogue/ruinedwood/oak
	icon_state = "weird3"

/turf/open/floor/rogue/ruinedwood/walnut
	icon_state = "weird4"

/turf/open/floor/rogue/ruinedwood/platform
	name = "platform"
	desc = "A destructible platform."
	damage_deflection = 8
	max_integrity = 600

/turf/open/floor/rogue/ruinedwood/turf_destruction(damage_flag)
	. = ..()
	ScrapeAway(flags = CHANGETURF_INHERIT_AIR)

/turf/open/floor/rogue/twig
	icon_state = "twig"
	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_SOFT_BAREFOOT
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE
	landsound = 'sound/foley/jumpland/grassland.wav'
	slowdown = 0
	damage_deflection = 6
	max_integrity = 300
	break_sound = 'sound/combat/hits/onwood/destroywalldoor.ogg'
	attacked_sound = list('sound/combat/hits/onwood/fence_hit1.ogg','sound/combat/hits/onwood/fence_hit2.ogg','sound/combat/hits/onwood/fence_hit3.ogg')

/turf/open/floor/rogue/twig/Initialize()
	dir = pick(GLOB.cardinals)
	. = ..()

/turf/open/floor/rogue/twig/platform
	name = "platform"
	desc = "A destructible platform."
	damage_deflection = 6
	max_integrity = 200

/turf/open/floor/rogue/twig/turf_destruction(damage_flag)
	. = ..()
	ScrapeAway(flags = CHANGETURF_INHERIT_AIR)

/turf/open/floor/rogue/wood
	smooth_icon = 'icons/turf/floors/wood.dmi'
	icon_state = "wooden_floor2"
	footstep = FOOTSTEP_WOOD
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_WOOD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE
	smooth = SMOOTH_MORE
	landsound = 'sound/foley/jumpland/woodland.wav'
	canSmoothWith = list(/turf/open/floor/rogue/wood,/turf/open/floor/carpet)
	damage_deflection = 8
	max_integrity = 600
	break_sound = 'sound/combat/hits/onwood/destroywalldoor.ogg'
	attacked_sound = list('sound/combat/hits/onwood/fence_hit1.ogg','sound/combat/hits/onwood/fence_hit2.ogg','sound/combat/hits/onwood/fence_hit3.ogg')

/turf/open/floor/rogue/wood/nosmooth //these are here so we can put wood floors next to each other but not have them smooth
	icon_state = "wooden_floor"
	smooth = SMOOTH_MORE
	canSmoothWith = list(/turf/open/floor/rogue/wood/nosmooth,/turf/open/floor/carpet)

/turf/open/floor/rogue/wood/turf_destruction(damage_flag)
	. = ..()
	ScrapeAway(flags = CHANGETURF_INHERIT_AIR)

/turf/open/floor/rogue/woodturned
	smooth_icon = 'icons/turf/floors/wood_turned.dmi'
	icon_state = "wooden_floor2t"
	smooth = SMOOTH_MORE
	canSmoothWith = list(/turf/open/floor/rogue/woodturned,/turf/open/floor/carpet)
	footstep = FOOTSTEP_WOOD
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_WOOD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	damage_deflection = 8
	max_integrity = 600
	break_sound = 'sound/combat/hits/onwood/destroywalldoor.ogg'
	attacked_sound = list('sound/combat/hits/onwood/fence_hit1.ogg','sound/combat/hits/onwood/fence_hit2.ogg','sound/combat/hits/onwood/fence_hit3.ogg')

/turf/open/floor/rogue/woodturned/nosmooth
	icon_state = "wooden_floort"
	smooth = SMOOTH_MORE
	canSmoothWith = list(/turf/open/floor/rogue/woodturned/nosmooth,/turf/open/floor/carpet)

/turf/open/floor/rogue/woodturned/turf_destruction(damage_flag)
	. = ..()
	ScrapeAway(flags = CHANGETURF_INHERIT_AIR)

/turf/open/floor/rogue/woodturned/hickory
	icon_state = "wooden_floor3"

/turf/open/floor/rogue/woodturned/hickory/turned
	icon_state = "wooden_floor3t"

/turf/open/floor/rogue/woodturned/walnut
	icon_state = "wooden_floor4"

/turf/open/floor/rogue/woodturned/walnut/turned
	icon_state = "wooden_floor4t"

/turf/open/floor/rogue/woodturned/pine
	icon_state = "wooden_floor5"

/turf/open/floor/rogue/woodturned/pine/turned
	icon_state = "wooden_floor5t"

/turf/open/floor/rogue/woodturned/spruce
	icon_state = "wooden_floor6"

/turf/open/floor/rogue/woodturned/spruce/turned
	icon_state = "wooden_floor6t"

/turf/open/floor/rogue/rooftop
	name = "roof"
	icon_state = "roof-arw"
	footstep = FOOTSTEP_WOOD
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_WOOD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE
	damage_deflection = 8
	max_integrity = 800
	break_sound = 'sound/combat/hits/onwood/destroywalldoor.ogg'
	attacked_sound = list('sound/combat/hits/onwood/fence_hit1.ogg','sound/combat/hits/onwood/fence_hit2.ogg','sound/combat/hits/onwood/fence_hit3.ogg')

/turf/open/floor/rogue/rooftop/Initialize()
	. = ..()
	icon_state = "roof"

/turf/open/floor/rogue/rooftop/turf_destruction(damage_flag)
	. = ..()
	ScrapeAway(flags = CHANGETURF_INHERIT_AIR)

/turf/open/floor/rogue/rooftop/green
	icon_state = "roofg-arw"

/turf/open/floor/rogue/rooftop/green/Initialize()
	. = ..()
	icon_state = "roofg"

/turf/open/floor/rogue/rooftop/green/corner1
	icon_state = "roofgc1-arw"

/turf/open/floor/rogue/rooftop/green/corner1/Initialize()
	. = ..()
	icon_state = "roofgc1"

/turf/open/floor/rogue/rooftop/red
	icon_state = "roofred-arw"

/turf/open/floor/rogue/rooftop/red/Initialize()
	. = ..()
	icon_state = "roofred"

/turf/open/floor/rogue/rooftop/red/corner1
	icon_state = "roofc1red-arw"

/turf/open/floor/rogue/rooftop/red/corner1/Initialize()
	. = ..()
	icon_state = "roofc1red"

/turf/open/floor/rogue/rooftop/dark
	icon_state = "roofdark-arw"

/turf/open/floor/rogue/rooftop/dark/Initialize()
	. = ..()
	icon_state = "roofdark"

/turf/open/floor/rogue/rooftop/dark/corner1
	icon_state = "roofc1dark-arw"

/turf/open/floor/rogue/rooftop/dark/corner1/Initialize()
	. = ..()
	icon_state = "roofc1dark"


/turf/open/floor/rogue/grass
	name = "grass"
	desc = "Grass, sodden with mud and bogwater."
	icon_state = "grass"
	layer = MID_TURF_LAYER
	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_SOFT_BAREFOOT
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE
	landsound = 'sound/foley/jumpland/grassland.wav'
	slowdown = 0
	smooth = SMOOTH_TRUE
	neighborlay = "grassedge"
	max_integrity = 1200
	canSmoothWith = list(
		/turf/open/floor/rogue/grass,
		/turf/open/floor/rogue/grass/evil,
		/turf/open/floor/rogue/grass/evil2,)

/turf/open/floor/rogue/grass/Initialize()
	dir = pick(GLOB.cardinals)
	// GLOB.dirt_list += src
	. = ..()

/turf/open/floor/rogue/grass/cardinal_smooth(adjacencies)
	roguesmooth(adjacencies)

/turf/open/floor/rogue/grass/turf_destruction(damage_flag)
	. = ..()
	src.ChangeTurf(/turf/open/floor/rogue/dirt, flags = CHANGETURF_INHERIT_AIR)

/turf/open/floor/rogue/grass/evil
	icon_state = "grassevil"
	name = "corrupted grass"
	desc = "Grim and dark grass."
	neighborlay = "grassedgeevil"
	canSmoothWith = list(
		/turf/open/floor/rogue/grass,
		/turf/open/floor/rogue/grass/evil,
		/turf/open/floor/rogue/grass/evil2,)

/turf/open/floor/rogue/grass/evil/Initialize()
	dir = pick(GLOB.cardinals)
	. = ..()

/turf/open/floor/rogue/grass/evil/cardinal_smooth(adjacencies)
	roguesmooth(adjacencies)

/turf/open/floor/rogue/grass/evil2
	icon_state = "grass2evil"
	name = "deeply corrupted grass"
	desc = "sinister rouge grass."
	neighborlay = "grassedgeevil"
	canSmoothWith = list(
		/turf/open/floor/rogue/grass,
		/turf/open/floor/rogue/grass/evil,
		/turf/open/floor/rogue/grass/evil2,)

/turf/open/floor/rogue/grass/evil2/Initialize()
	dir = pick(GLOB.cardinals)
	. = ..()

/turf/open/floor/rogue/grass/evil2/cardinal_smooth(adjacencies)
	roguesmooth(adjacencies)

/turf/open/floor/rogue/dirt/ambush
	name = "dirt"
	desc = "The dirt is pocked with the scars of countless wars."
	icon_state = "dirt"
	layer = MID_TURF_LAYER
	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_SOFT_BAREFOOT
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE
	landsound = 'sound/foley/jumpland/dirtland.wav'
	slowdown = 2
	smooth = SMOOTH_TRUE
	canSmoothWith = list(
		/turf/open/floor/rogue/grass,
		/turf/open/floor/rogue/grass/evil,
		/turf/open/floor/rogue/grass/evil2,
	)
	neighborlay = "dirtedge"
	muddy = FALSE
	bloodiness = 20
	dirt_amt = 3

/turf/open/floor/rogue/dirt
	name = "dirt"
	desc = "The dirt is pocked with the scars of countless wars."
	icon_state = "dirt"
	layer = MID_TURF_LAYER
	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_SOFT_BAREFOOT
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE
	landsound = 'sound/foley/jumpland/dirtland.wav'
	slowdown = 2
	smooth = SMOOTH_TRUE
	canSmoothWith = list(
		/turf/open/floor/rogue/grass,
		/turf/open/floor/rogue/grass/evil,
		/turf/open/floor/rogue/grass/evil2,
	)
	neighborlay = "dirtedge"
	var/muddy = FALSE
	var/bloodiness = 20
	var/obj/structure/closet/dirthole/holie
	var/dirt_amt = 3

/turf/open/floor/rogue/dirt/get_slowdown(mob/user)
	//No tile slowdown for fairies
	var/mob/living/carbon/human/FM = user
	if(isseelie(FM) && !(FM.resting))    //Add wingcheck
		return 0

	var/returned = slowdown
	if(HAS_TRAIT(user, TRAIT_BOG_TREKKING))
		var/mob/living/L = user
		if(!L.cmode)
			returned = max(returned-2, 0)
	else
		for(var/obj/item/I in user.held_items)
			if(I.walking_stick && !I.wielded)
				var/mob/living/L = user
				if(!L.cmode)
					returned = max(returned-2, 0)
	return returned


/turf/open/floor/rogue/dirt/attack_right(mob/user)
	if(isliving(user))
		var/mob/living/L = user
		if(L.stat != CONSCIOUS)
			return
		var/obj/item/I = new /obj/item/natural/dirtclod(src)
		if(L.put_in_active_hand(I))
			L.visible_message(span_warning("[L] picks up some dirt."))
			dirt_amt--
			if(dirt_amt <= 0)
				src.ChangeTurf(/turf/open/floor/rogue/dirt/road, flags = CHANGETURF_INHERIT_AIR)
		else
			qdel(I)
	.=..()

/turf/open/floor/rogue/dirt/Destroy()
	if(holie)
		QDEL_NULL(holie)
	return ..()


/turf/open/floor/rogue/dirt/Crossed(atom/movable/O)
	..()
	if(ishuman(O))
		var/mob/living/carbon/human/H = O
		if(H.shoes && !(HAS_TRAIT(H, TRAIT_LIGHT_STEP) || isseelie(H))) //Seelie hover, so they won't step on blood
			var/obj/item/clothing/shoes/S = H.shoes
			if(!S.can_be_bloody)
				return
			var/add_blood = 0
			if(bloodiness >= BLOOD_GAIN_PER_STEP)
				add_blood = BLOOD_GAIN_PER_STEP
			else
				add_blood = bloodiness
			S.bloody_shoes[BLOOD_STATE_MUD] = min(MAX_SHOE_BLOODINESS,S.bloody_shoes[BLOOD_STATE_MUD]+add_blood)
			S.blood_state = BLOOD_STATE_MUD
			update_icon()
			H.update_inv_shoes()
		if(water_level)
			START_PROCESSING(SSwaterlevel, src)

/turf/open/floor/rogue/dirt/cardinal_smooth(adjacencies)
	roguesmooth(adjacencies)

/turf/open/floor/rogue/dirt/Initialize()
	dir = pick(GLOB.cardinals)
	. = ..()
	update_water()

/turf/open/floor/rogue/dirt/update_water()
	water_level = max(water_level-10,0)
	if(water_level > 10) //this would be a switch on normal tiles
		color = "#95776a"
	else
		color = null
	return TRUE

/turf/open/floor/rogue/dirt/road/update_water()
	water_level = max(water_level-10,0)
	for(var/D in GLOB.cardinals)
		var/turf/TU = get_step(src, D)
		if(istype(TU, /turf/open/water))
			if(!muddy)
				become_muddy()
			return TRUE //stop processing
	if(water_level > 10) //this would be a switch on normal tiles
		if(!muddy)
			become_muddy()
//flood process goes here to spread to other turfs etc
//	if(water_level > 250)
//		return FALSE
	if(muddy)
		if(water_level <= 0)
			water_level = 0
			muddy = FALSE
			slowdown = initial(slowdown)
			icon_state = initial(icon_state)
			name = initial(name)
			footstep = initial(footstep)
			barefootstep = initial(barefootstep)
			clawfootstep = initial(clawfootstep)
			heavyfootstep = initial(heavyfootstep)
	return TRUE

/turf/open/floor/rogue/dirt/proc/become_muddy()
	if(!muddy)
		water_level = max(water_level-100,0)
		muddy = TRUE
		icon_state = "mud[rand (1,3)]"
		name = "mud"
		slowdown = 2
		footstep = FOOTSTEP_MUD
		barefootstep = FOOTSTEP_MUD
		heavyfootstep = FOOTSTEP_MUD
		bloodiness = 20

/turf/open/floor/rogue/dirt/road
	name = "dirt"
	desc = "The dirt is pocked with the scars of countless steps."
	icon_state = "road"
	layer = MID_TURF_LAYER
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SOFT_BAREFOOT
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE
	landsound = 'sound/foley/jumpland/dirtland.wav'
	smooth = SMOOTH_TRUE
/turf/open/floor/rogue/dirt/road
	canSmoothWith = list(
		/turf/open/floor/rogue/dirt,
		/turf/open/floor/rogue/grass,
		/turf/open/floor/rogue/grass,
		/turf/open/floor/rogue/grass/evil,
		/turf/open/floor/rogue/grass/evil2,
	)
	neighborlay = "roadedge"
	slowdown = 0

/turf/open/floor/rogue/dirt/road/attack_right(mob/user)
	return

/turf/open/floor/rogue/dirt/road/cardinal_smooth(adjacencies)
	roguesmooth(adjacencies)


/turf/proc/roguesmooth(adjacencies)
	var/list/New
	var/holder

	for(var/A in neighborlay_list)
		cut_overlay("[A]")
		neighborlay_list -= A
	var/usedturf
	if(adjacencies & N_NORTH)
		usedturf = get_step(src, NORTH)
		if(isturf(usedturf))
			var/turf/T = usedturf
			if(neighborlay_override)
				holder = "[neighborlay_override]-n"
				LAZYADD(New, holder)
				neighborlay_list += holder
			else if(T.neighborlay)
				holder = "[T.neighborlay]-n"
				LAZYADD(New, holder)
				neighborlay_list += holder
	if(adjacencies & N_SOUTH)
		usedturf = get_step(src, SOUTH)
		if(isturf(usedturf))
			var/turf/T = usedturf
			if(neighborlay_override)
				holder = "[neighborlay_override]-s"
				LAZYADD(New, holder)
				neighborlay_list += holder
			else if(T.neighborlay)
				holder = "[T.neighborlay]-s"
				LAZYADD(New, holder)
				neighborlay_list += holder
	if(adjacencies & N_WEST)
		usedturf = get_step(src, WEST)
		if(isturf(usedturf))
			var/turf/T = usedturf
			if(neighborlay_override)
				holder = "[neighborlay_override]-w"
				LAZYADD(New, holder)
				neighborlay_list += holder
			else if(T.neighborlay)
				holder = "[T.neighborlay]-w"
				LAZYADD(New, holder)
				neighborlay_list += holder
	if(adjacencies & N_EAST)
		usedturf = get_step(src, EAST)
		if(isturf(usedturf))
			var/turf/T = usedturf
			if(neighborlay_override)
				holder = "[neighborlay_override]-e"
				LAZYADD(New, holder)
				neighborlay_list += holder
			else if(T.neighborlay)
				holder = "[T.neighborlay]-e"
				LAZYADD(New, holder)
				neighborlay_list += holder

	if(New)
		add_overlay(New)
	return New

/turf/open/floor/rogue/dirt/nrich
	name = "enriched soil"
	desc = "transplanted dirt, made into a pile and smoothed over to grow crops."
	icon_state = "dirt"
	layer = MID_TURF_LAYER
	footstep = FOOTSTEP_MUD
	barefootstep = FOOTSTEP_MUD
	heavyfootstep = FOOTSTEP_MUD
	tiled_dirt = FALSE
	landsound = 'sound/foley/jumpland/dirtland.wav'
	smooth = SMOOTH_FALSE
	neighborlay = "dirtedge"
	slowdown = 0
	muddy = FALSE

/turf/open/floor/rogue/underworld/road
	name = "ash"
	desc = "Smells like burnt wood."
/turf/open/floor/rogue/underworld/road
	name = "ash"
	desc = "Smells like burnt wood."
	icon_state = "ash"
	layer = MID_TURF_LAYER
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SOFT_BAREFOOT
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE
	landsound = 'sound/foley/jumpland/dirtland.wav'
	smooth = SMOOTH_TRUE
	canSmoothWith = list(/turf/open/floor/rogue, /turf/closed/mineral, /turf/closed/wall/mineral)
	slowdown = 0

/turf/open/floor/rogue/underworld/road/Initialize()
	. = ..()
	dir = rand(0,8)

/turf/open/floor/rogue/volcanic
	name = "dirt"
	desc = "The dirt is pocked with the scars of countless steps."
	icon_state = "lavafloor"
	layer = MID_TURF_LAYER
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SOFT_BAREFOOT
	clawfootstep = FOOTSTEP_SAND
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE
	landsound = 'sound/foley/jumpland/dirtland.wav'
	smooth = SMOOTH_TRUE
	canSmoothWith = list(/turf/open/floor/rogue/dirt/road,/turf/open/floor/rogue/dirt)
	neighborlay = "lavedge"

/turf/open/floor/rogue/volcanic/Initialize()
	dir = pick(GLOB.cardinals)
	. = ..()


/turf/open/floor/rogue/volcanic/lava
	name = "dirt"
	desc = "pulsing heat emanates from below."
	icon_state = "lavafloordark"

/turf/open/floor/rogue/volcanic/lava/rock
	name = "dirt"
	desc = "pulsing heat emanates from below."
	icon_state = "lavafloorrock"

/turf/open/floor/rogue/volcanic/lava/glow
	name = "dirt"
	desc = "pulsing heat emanates from below."
	icon_state = "lavafloorglow1"

/turf/open/floor/rogue/volcanic/lava/glow2
	name = "dirt"
	desc = "pulsing heat emanates from below."
	icon_state = "lavafloorglow2"

/turf/open/floor/rogue/volcanic/lava/glow3
	name = "dirt"
	desc = "pulsing heat emanates from below."
	icon_state = "lavafloorglow3"

/turf/open/floor/rogue/volcanic/lava/crater
	name = "dirt"
	desc = "pulsing heat emanates from below."
	icon_state = "lavafloorcrater"

/turf/open/floor/rogue/blocks
	icon_state = "blocks"
	footstep = FOOTSTEP_STONE
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	landsound = 'sound/foley/jumpland/stoneland.wav'
	smooth = SMOOTH_MORE
	canSmoothWith = list(/turf/closed/mineral/rogue, /turf/closed/mineral, /turf/closed/wall/mineral/rogue/stonebrick, /turf/closed/wall/mineral/rogue/wood, /turf/closed/wall/mineral/rogue/wooddark, /turf/closed/wall/mineral/rogue/stone, /turf/closed/wall/mineral/rogue/stone/moss, /turf/open/floor/rogue/dirt, /turf/open/floor/rogue/grass)
	damage_deflection = 10
	max_integrity = 2800
	break_sound = 'sound/combat/hits/onstone/stonedeath.ogg'
	attacked_sound = list('sound/combat/hits/onstone/wallhit.ogg', 'sound/combat/hits/onstone/wallhit2.ogg', 'sound/combat/hits/onstone/wallhit3.ogg')

/turf/open/floor/rogue/blocks/Initialize()
	. = ..()
	dir = pick(GLOB.cardinals)

/turf/open/floor/rogue/blocks/dark
	icon_state = "blocksdark"

/turf/open/floor/rogue/blocks/red
	icon_state = "blocksred"

/turf/open/floor/rogue/blocks/teal
	icon_state = "blocksteal"

/turf/open/floor/rogue/blocks/stonered
	icon_state = "stoneredlarge"
/turf/open/floor/rogue/blocks/stonegray
	icon_state = "stonegraylarge"
/turf/open/floor/rogue/blocks/stonedark
	icon_state = "stonedarklarge"
/turf/open/floor/rogue/blocks/stoneteal
	icon_state = "stoneteallarge"
/turf/open/floor/rogue/blocks/stonered/tiny
	icon_state = "stoneredtiny"
/turf/open/floor/rogue/blocks/stonegray/tiny
	icon_state = "stonegraytiny"
/turf/open/floor/rogue/blocks/stonedark/tiny
	icon_state = "stonedarktiny"
/turf/open/floor/rogue/blocks/stoneteal/tiny
	icon_state = "stonetealtiny"
/turf/open/floor/rogue/blocks/green
	icon_state = "greenblocks"
/turf/open/floor/rogue/blocks/bluestone
	icon_state = "bluestone2"
/turf/open/floor/rogue/blocks/newstone
	icon_state = "newstone2"
/turf/open/floor/rogue/blocks/newstone/alt
	icon_state = "bluestone"

/turf/open/floor/rogue/blocks/paving
	icon_state = "paving"
/turf/open/floor/rogue/blocks/paving/vert
	icon_state = "paving-t"

/turf/open/floor/rogue/blocks/paving/dark
	icon_state = "pavingdark"
/turf/open/floor/rogue/blocks/paving/vert/dark
	icon_state = "pavingdark-t"

/turf/open/floor/rogue/blocks/pavingred
	icon_state = "pavingred"
/turf/open/floor/rogue/blocks/paving/vert/teal
	icon_state = "pavingred-t"

/turf/open/floor/rogue/blocks/pavingteal
	icon_state = "pavingteal"
/turf/open/floor/rogue/blocks/paving/vert/teal
	icon_state = "pavingteal-t"

/turf/open/floor/rogue/blocks/platform
	name = "platform"
	desc = "A destructible platform."
	damage_deflection = 10
	max_integrity = 800

/turf/open/floor/rogue/blocks/turf_destruction(damage_flag)
	. = ..()
	ScrapeAway(flags = CHANGETURF_INHERIT_AIR)

/turf/open/floor/rogue/greenstone
	icon_state = "greenstone"
	icon = 'icons/turf/greenstone.dmi'
	footstep = FOOTSTEP_STONE
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	landsound = 'sound/foley/jumpland/stoneland.wav'
	damage_deflection = 10
	max_integrity = 800
	break_sound = 'sound/combat/hits/onstone/stonedeath.ogg'
	attacked_sound = list('sound/combat/hits/onstone/wallhit.ogg', 'sound/combat/hits/onstone/wallhit2.ogg', 'sound/combat/hits/onstone/wallhit3.ogg')

/turf/open/floor/rogue/greenstone/turf_destruction(damage_flag)
	. = ..()
	ScrapeAway(flags = CHANGETURF_INHERIT_AIR)

/turf/open/floor/rogue/greenstone/teal
	icon_state = "tealstone"

/turf/open/floor/rogue/greenstone/teal/Initialize()
	. = ..()
	icon_state = "tealstone"

/turf/open/floor/rogue/greenstone/runed
	icon_state = "greenstoneruned"

/turf/open/floor/rogue/hexstone
	icon_state = "hexstone"
	footstep = FOOTSTEP_STONE
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	landsound = 'sound/foley/jumpland/stoneland.wav'
	smooth = SMOOTH_MORE
	neighborlay = "hexstoneedge"
	canSmoothWith = list(
		/turf/open/floor/rogue/hexstone,
		/turf/open/floor/rogue/hexstone/dark,
		/turf/open/floor/rogue/hexstone/red,
		/turf/open/floor/rogue/hexstone/teal,
		/turf/closed/mineral/rogue,
		/turf/open/floor/rogue/herringbone,
		/turf/closed/mineral,
		/turf/closed/wall/mineral/rogue/stonebrick,
		/turf/closed/wall/mineral/rogue/wood,
		/turf/closed/wall/mineral/rogue/wooddark,
		/turf/closed/wall/mineral/rogue/stone,
		/turf/closed/wall/mineral/rogue/stone/moss,
		/turf/open/floor/rogue/cobble,
		/turf/open/floor/rogue/dirt,
		/turf/open/floor/rogue/grass
	)
	damage_deflection = 10
	max_integrity = 800
	break_sound = 'sound/combat/hits/onstone/stonedeath.ogg'
	attacked_sound = list('sound/combat/hits/onstone/wallhit.ogg', 'sound/combat/hits/onstone/wallhit2.ogg', 'sound/combat/hits/onstone/wallhit3.ogg')

/turf/open/floor/rogue/hexstone/cardinal_smooth(adjacencies)
	roguesmooth(adjacencies)

/turf/open/floor/rogue/hexstone/roguesmooth(adjacencies)
	var/list/Yeah = ..()
	if(Yeah)
		var/list/transparent_overlays = list()
		for(var/overlay_state in Yeah)
			var/mutable_appearance/MA = mutable_appearance('icons/turf/roguefloor.dmi', overlay_state)
			MA.alpha = 128
			transparent_overlays += MA
		add_overlay(transparent_overlays)
	return Yeah

/turf/open/floor/rogue/hexstone/Initialize()
	. = ..()
	dir = pick(GLOB.cardinals)

/turf/open/floor/rogue/hexstone/turf_destruction(damage_flag)
	. = ..()
	ScrapeAway(flags = CHANGETURF_INHERIT_AIR)

/turf/open/floor/rogue/hexstone/dark
	icon_state = "hexstonedark"
	neighborlay = "hexstoneedgedark"
	// canSmoothWith same as parent
/turf/open/floor/rogue/hexstone/dark/Initialize()
	. = ..()
	dir = pick(GLOB.cardinals)

/turf/open/floor/rogue/hexstone/red
	icon_state = "hexstonered"
	neighborlay = "hexstoneedgered"
	// canSmoothWith same as parent
/turf/open/floor/rogue/hexstone/red/Initialize()
	. = ..()
	dir = pick(GLOB.cardinals)

/turf/open/floor/rogue/hexstone/teal
	icon_state = "hexstoneteal"
	neighborlay = "hexstoneedgeteal"
	// canSmoothWith same as parent
/turf/open/floor/rogue/hexstone/teal/Initialize()
	. = ..()
	dir = pick(GLOB.cardinals)

//Church floors

/turf/open/floor/rogue/churchmarble
	icon_state = "church_marble"
	footstep = FOOTSTEP_STONE
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	landsound = 'sound/foley/jumpland/stoneland.wav'
	smooth = SMOOTH_MORE
	neighborlay = "churchmarbleedge"
	canSmoothWith = list(
		/turf/open/floor/rogue/churchmarble,
		/turf/open/floor/rogue/churchmarble/dark,
		/turf/open/floor/rogue/churchmarble/teal,
		/turf/open/floor/rogue/church,
		/turf/open/floor/rogue/church/dark,
		/turf/open/floor/rogue/church/teal,
		/turf/open/floor/rogue/church/red,
		/turf/open/floor/rogue/churchbrick,
		/turf/open/floor/rogue/churchbrick/dark,
		/turf/open/floor/rogue/churchbrick/teal,
		/turf/open/floor/rogue/church_teal,
		/turf/closed/mineral/rogue,
		/turf/open/floor/rogue/herringbone,
		/turf/closed/mineral,
		/turf/closed/wall/mineral/rogue/stonebrick,
		/turf/closed/wall/mineral/rogue/wood,
		/turf/closed/wall/mineral/rogue/wooddark,
		/turf/closed/wall/mineral/rogue/stone,
		/turf/closed/wall/mineral/rogue/stone/moss,
		/turf/open/floor/rogue/cobble,
		/turf/open/floor/rogue/dirt,
		/turf/open/floor/rogue/grass
	)
	damage_deflection = 10
	max_integrity = 800
	break_sound = 'sound/combat/hits/onstone/stonedeath.ogg'
	attacked_sound = list('sound/combat/hits/onstone/wallhit.ogg', 'sound/combat/hits/onstone/wallhit2.ogg', 'sound/combat/hits/onstone/wallhit3.ogg')

/turf/open/floor/rogue/churchmarble/cardinal_smooth(adjacencies)
	roguesmooth(adjacencies)

/turf/open/floor/rogue/churchmarble/roguesmooth(adjacencies)
	var/list/Yeah = ..()
	if(Yeah)
		var/list/transparent_overlays = list()
		for(var/overlay_state in Yeah)
			var/mutable_appearance/MA = mutable_appearance('icons/turf/roguefloor.dmi', overlay_state)
			MA.alpha = 128 // 50% opacity to reduce darkening
			transparent_overlays += MA
		add_overlay(transparent_overlays)
	return Yeah

/turf/open/floor/rogue/churchmarble/Initialize()
	. = ..()
	dir = pick(GLOB.cardinals)

/turf/open/floor/rogue/churchmarble/turf_destruction(damage_flag)
	. = ..()
	ScrapeAway(flags = CHANGETURF_INHERIT_AIR)

/turf/open/floor/rogue/churchmarble/dark
	icon_state = "churchmarble_dark"
	neighborlay = "churchmarbledarkedge"
	canSmoothWith = list(
		/turf/open/floor/rogue/churchmarble,
		/turf/open/floor/rogue/churchmarble/dark,
		/turf/open/floor/rogue/churchmarble/teal,
		/turf/open/floor/rogue/church,
		/turf/open/floor/rogue/church/dark,
		/turf/open/floor/rogue/church/teal,
		/turf/open/floor/rogue/church/red,
		/turf/open/floor/rogue/churchbrick,
		/turf/open/floor/rogue/churchbrick/dark,
		/turf/open/floor/rogue/churchbrick/teal,
		/turf/open/floor/rogue/church_teal,
		/turf/closed/mineral/rogue,
		/turf/open/floor/rogue/herringbone,
		/turf/closed/mineral,
		/turf/closed/wall/mineral/rogue/stonebrick,
		/turf/closed/wall/mineral/rogue/wood,
		/turf/closed/wall/mineral/rogue/wooddark,
		/turf/closed/wall/mineral/rogue/stone,
		/turf/closed/wall/mineral/rogue/stone/moss,
		/turf/open/floor/rogue/cobble,
		/turf/open/floor/rogue/dirt,
		/turf/open/floor/rogue/grass
	)

/turf/open/floor/rogue/churchmarble/dark/Initialize()
	. = ..()
	dir = pick(GLOB.cardinals)

/turf/open/floor/rogue/churchmarble/teal
	icon_state = "churchmarble_teal"
	neighborlay = "churchmarbletealedge"
	canSmoothWith = list(
		/turf/open/floor/rogue/churchmarble,
		/turf/open/floor/rogue/churchmarble/dark,
		/turf/open/floor/rogue/churchmarble/teal,
		/turf/open/floor/rogue/church,
		/turf/open/floor/rogue/church/dark,
		/turf/open/floor/rogue/church/teal,
		/turf/open/floor/rogue/church/red,
		/turf/open/floor/rogue/churchbrick,
		/turf/open/floor/rogue/churchbrick/dark,
		/turf/open/floor/rogue/churchbrick/teal,
		/turf/open/floor/rogue/church_teal,
		/turf/closed/mineral/rogue,
		/turf/open/floor/rogue/herringbone,
		/turf/closed/mineral,
		/turf/closed/wall/mineral/rogue/stonebrick,
		/turf/closed/wall/mineral/rogue/wood,
		/turf/closed/wall/mineral/rogue/wooddark,
		/turf/closed/wall/mineral/rogue/stone,
		/turf/closed/wall/mineral/rogue/stone/moss,
		/turf/open/floor/rogue/cobble,
		/turf/open/floor/rogue/dirt,
		/turf/open/floor/rogue/grass
	)

/turf/open/floor/rogue/churchmarble/teal/Initialize()
	. = ..()
	dir = pick(GLOB.cardinals)

/turf/open/floor/rogue/church
	icon_state = "church"
	footstep = FOOTSTEP_STONE
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	landsound = 'sound/foley/jumpland/stoneland.wav'
	smooth = SMOOTH_MORE
	neighborlay = "churchedge"
	canSmoothWith = list(
		/turf/open/floor/rogue/churchmarble,
		/turf/open/floor/rogue/churchmarble/dark,
		/turf/open/floor/rogue/churchmarble/teal,
		/turf/open/floor/rogue/church,
		/turf/open/floor/rogue/church/dark,
		/turf/open/floor/rogue/church/teal,
		/turf/open/floor/rogue/church/red,
		/turf/open/floor/rogue/churchbrick,
		/turf/open/floor/rogue/churchbrick/dark,
		/turf/open/floor/rogue/churchbrick/teal,
		/turf/open/floor/rogue/church_teal,
		/turf/closed/mineral/rogue,
		/turf/open/floor/rogue/herringbone,
		/turf/closed/mineral,
		/turf/closed/wall/mineral/rogue/stonebrick,
		/turf/closed/wall/mineral/rogue/wood,
		/turf/closed/wall/mineral/rogue/wooddark,
		/turf/closed/wall/mineral/rogue/stone,
		/turf/closed/wall/mineral/rogue/stone/moss,
		/turf/open/floor/rogue/cobble,
		/turf/open/floor/rogue/dirt,
		/turf/open/floor/rogue/grass
	)
	damage_deflection = 10
	max_integrity = 800
	break_sound = 'sound/combat/hits/onstone/stonedeath.ogg'
	attacked_sound = list('sound/combat/hits/onstone/wallhit.ogg', 'sound/combat/hits/onstone/wallhit2.ogg', 'sound/combat/hits/onstone/wallhit3.ogg')

/turf/open/floor/rogue/church/cardinal_smooth(adjacencies)
	roguesmooth(adjacencies)

/turf/open/floor/rogue/church/roguesmooth(adjacencies)
	var/list/Yeah = ..()
	if(Yeah)
		var/list/transparent_overlays = list()
		for(var/overlay_state in Yeah)
			var/mutable_appearance/MA = mutable_appearance('icons/turf/roguefloor.dmi', overlay_state)
			MA.alpha = 128 // 50% opacity to reduce darkening
			transparent_overlays += MA
		add_overlay(transparent_overlays)
	return Yeah

/turf/open/floor/rogue/church/Initialize()
	. = ..()
	dir = pick(GLOB.cardinals)

/turf/open/floor/rogue/church/turf_destruction(damage_flag)
	. = ..()
	ScrapeAway(flags = CHANGETURF_INHERIT_AIR)

/turf/open/floor/rogue/church/dark
	icon_state = "churchdark"
	neighborlay = "churchdarkedge"
	canSmoothWith = list(
		/turf/open/floor/rogue/churchmarble,
		/turf/open/floor/rogue/churchmarble/dark,
		/turf/open/floor/rogue/churchmarble/teal,
		/turf/open/floor/rogue/church,
		/turf/open/floor/rogue/church/dark,
		/turf/open/floor/rogue/church/teal,
		/turf/open/floor/rogue/church/red,
		/turf/open/floor/rogue/churchbrick,
		/turf/open/floor/rogue/churchbrick/dark,
		/turf/open/floor/rogue/churchbrick/teal,
		/turf/open/floor/rogue/church_teal,
		/turf/closed/mineral/rogue,
		/turf/open/floor/rogue/herringbone,
		/turf/closed/mineral,
		/turf/closed/wall/mineral/rogue/stonebrick,
		/turf/closed/wall/mineral/rogue/wood,
		/turf/closed/wall/mineral/rogue/wooddark,
		/turf/closed/wall/mineral/rogue/stone,
		/turf/closed/wall/mineral/rogue/stone/moss,
		/turf/open/floor/rogue/cobble,
		/turf/open/floor/rogue/dirt,
		/turf/open/floor/rogue/grass
	)

/turf/open/floor/rogue/church/dark/Initialize()
	. = ..()
	dir = pick(GLOB.cardinals)

/turf/open/floor/rogue/church/teal
	icon_state = "churchteal"
	neighborlay = "churchtealedge"
	canSmoothWith = list(
		/turf/open/floor/rogue/churchmarble,
		/turf/open/floor/rogue/churchmarble/dark,
		/turf/open/floor/rogue/churchmarble/teal,
		/turf/open/floor/rogue/church,
		/turf/open/floor/rogue/church/dark,
		/turf/open/floor/rogue/church/teal,
		/turf/open/floor/rogue/church/red,
		/turf/open/floor/rogue/churchbrick,
		/turf/open/floor/rogue/churchbrick/dark,
		/turf/open/floor/rogue/churchbrick/teal,
		/turf/open/floor/rogue/church_teal,
		/turf/closed/mineral/rogue,
		/turf/open/floor/rogue/herringbone,
		/turf/closed/mineral,
		/turf/closed/wall/mineral/rogue/stonebrick,
		/turf/closed/wall/mineral/rogue/wood,
		/turf/closed/wall/mineral/rogue/wooddark,
		/turf/closed/wall/mineral/rogue/stone,
		/turf/closed/wall/mineral/rogue/stone/moss,
		/turf/open/floor/rogue/cobble,
		/turf/open/floor/rogue/dirt,
		/turf/open/floor/rogue/grass
	)

/turf/open/floor/rogue/church/teal/Initialize()
	. = ..()
	dir = pick(GLOB.cardinals)

/turf/open/floor/rogue/church/red
	icon_state = "churchred"
	neighborlay = "churchrededge"
	canSmoothWith = list(
		/turf/open/floor/rogue/churchmarble,
		/turf/open/floor/rogue/churchmarble/dark,
		/turf/open/floor/rogue/churchmarble/teal,
		/turf/open/floor/rogue/church,
		/turf/open/floor/rogue/church/dark,
		/turf/open/floor/rogue/church/teal,
		/turf/open/floor/rogue/church/red,
		/turf/open/floor/rogue/churchbrick,
		/turf/open/floor/rogue/churchbrick/dark,
		/turf/open/floor/rogue/churchbrick/teal,
		/turf/open/floor/rogue/church_teal,
		/turf/closed/mineral/rogue,
		/turf/open/floor/rogue/herringbone,
		/turf/closed/mineral,
		/turf/closed/wall/mineral/rogue/stonebrick,
		/turf/closed/wall/mineral/rogue/wood,
		/turf/closed/wall/mineral/rogue/wooddark,
		/turf/closed/wall/mineral/rogue/stone,
		/turf/closed/wall/mineral/rogue/stone/moss,
		/turf/open/floor/rogue/cobble,
		/turf/open/floor/rogue/dirt,
		/turf/open/floor/rogue/grass
	)

/turf/open/floor/rogue/church/red/Initialize()
	. = ..()
	dir = pick(GLOB.cardinals)

/turf/open/floor/rogue/churchbrick
	icon_state = "church_brick"
	footstep = FOOTSTEP_STONE
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	landsound = 'sound/foley/jumpland/stoneland.wav'
	smooth = SMOOTH_MORE
	neighborlay = "churchbrickedge"
	canSmoothWith = list(
		/turf/open/floor/rogue/churchmarble,
		/turf/open/floor/rogue/churchmarble/dark,
		/turf/open/floor/rogue/churchmarble/teal,
		/turf/open/floor/rogue/church,
		/turf/open/floor/rogue/church/dark,
		/turf/open/floor/rogue/church/teal,
		/turf/open/floor/rogue/church/red,
		/turf/open/floor/rogue/churchbrick,
		/turf/open/floor/rogue/churchbrick/dark,
		/turf/open/floor/rogue/churchbrick/teal,
		/turf/open/floor/rogue/church_teal,
		/turf/closed/mineral/rogue,
		/turf/open/floor/rogue/herringbone,
		/turf/closed/mineral,
		/turf/closed/wall/mineral/rogue/stonebrick,
		/turf/closed/wall/mineral/rogue/wood,
		/turf/closed/wall/mineral/rogue/wooddark,
		/turf/closed/wall/mineral/rogue/stone,
		/turf/closed/wall/mineral/rogue/stone/moss,
		/turf/open/floor/rogue/cobble,
		/turf/open/floor/rogue/dirt,
		/turf/open/floor/rogue/grass
	)
	damage_deflection = 10
	max_integrity = 800
	break_sound = 'sound/combat/hits/onstone/stonedeath.ogg'
	attacked_sound = list('sound/combat/hits/onstone/wallhit.ogg', 'sound/combat/hits/onstone/wallhit2.ogg', 'sound/combat/hits/onstone/wallhit3.ogg')

/turf/open/floor/rogue/churchbrick/cardinal_smooth(adjacencies)
	roguesmooth(adjacencies)

/turf/open/floor/rogue/churchbrick/roguesmooth(adjacencies)
	var/list/Yeah = ..()
	if(Yeah)
		var/list/transparent_overlays = list()
		for(var/overlay_state in Yeah)
			var/mutable_appearance/MA = mutable_appearance('icons/turf/roguefloor.dmi', overlay_state)
			MA.alpha = 128 // 50% opacity to reduce darkening
			transparent_overlays += MA
		add_overlay(transparent_overlays)
	return Yeah

/turf/open/floor/rogue/churchbrick/Initialize()
	. = ..()
	dir = pick(GLOB.cardinals)

/turf/open/floor/rogue/churchbrick/turf_destruction(damage_flag)
	. = ..()
	ScrapeAway(flags = CHANGETURF_INHERIT_AIR)

/turf/open/floor/rogue/churchbrick/dark
	icon_state = "churchbrick_dark"
	neighborlay = "churchbrickdarkedge"
	canSmoothWith = list(
		/turf/open/floor/rogue/churchmarble,
		/turf/open/floor/rogue/churchmarble/dark,
		/turf/open/floor/rogue/churchmarble/teal,
		/turf/open/floor/rogue/church,
		/turf/open/floor/rogue/church/dark,
		/turf/open/floor/rogue/church/teal,
		/turf/open/floor/rogue/church/red,
		/turf/open/floor/rogue/churchbrick,
		/turf/open/floor/rogue/churchbrick/dark,
		/turf/open/floor/rogue/churchbrick/teal,
		/turf/open/floor/rogue/church_teal,
		/turf/closed/mineral/rogue,
		/turf/open/floor/rogue/herringbone,
		/turf/closed/mineral,
		/turf/closed/wall/mineral/rogue/stonebrick,
		/turf/closed/wall/mineral/rogue/wood,
		/turf/closed/wall/mineral/rogue/wooddark,
		/turf/closed/wall/mineral/rogue/stone,
		/turf/closed/wall/mineral/rogue/stone/moss,
		/turf/open/floor/rogue/cobble,
		/turf/open/floor/rogue/dirt,
		/turf/open/floor/rogue/grass
	)

/turf/open/floor/rogue/churchbrick/dark/Initialize()
	. = ..()
	dir = pick(GLOB.cardinals)

/turf/open/floor/rogue/churchbrick/teal
	icon_state = "churchbrick_teal"
	neighborlay = "churchbricktealedge"
	canSmoothWith = list(
		/turf/open/floor/rogue/churchmarble,
		/turf/open/floor/rogue/churchmarble/dark,
		/turf/open/floor/rogue/churchmarble/teal,
		/turf/open/floor/rogue/church,
		/turf/open/floor/rogue/church/dark,
		/turf/open/floor/rogue/church/teal,
		/turf/open/floor/rogue/church/red,
		/turf/open/floor/rogue/churchbrick,
		/turf/open/floor/rogue/churchbrick/dark,
		/turf/open/floor/rogue/churchbrick/teal,
		/turf/open/floor/rogue/church_teal,
		/turf/closed/mineral/rogue,
		/turf/open/floor/rogue/herringbone,
		/turf/closed/mineral,
		/turf/closed/wall/mineral/rogue/stonebrick,
		/turf/closed/wall/mineral/rogue/wood,
		/turf/closed/wall/mineral/rogue/wooddark,
		/turf/closed/wall/mineral/rogue/stone,
		/turf/closed/wall/mineral/rogue/stone/moss,
		/turf/open/floor/rogue/cobble,
		/turf/open/floor/rogue/dirt,
		/turf/open/floor/rogue/grass
	)

/turf/open/floor/rogue/churchbrick/teal/Initialize()
	. = ..()
	dir = pick(GLOB.cardinals)

/turf/open/floor/rogue/church_teal
	icon_state = "church_teal"
	footstep = FOOTSTEP_STONE
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	landsound = 'sound/foley/jumpland/stoneland.wav'
	smooth = SMOOTH_MORE
	neighborlay = "churchtealedge"
	canSmoothWith = list(
		/turf/open/floor/rogue/churchmarble,
		/turf/open/floor/rogue/churchmarble/dark,
		/turf/open/floor/rogue/churchmarble/teal,
		/turf/open/floor/rogue/church,
		/turf/open/floor/rogue/church/dark,
		/turf/open/floor/rogue/church/teal,
		/turf/open/floor/rogue/church/red,
		/turf/open/floor/rogue/churchbrick,
		/turf/open/floor/rogue/churchbrick/dark,
		/turf/open/floor/rogue/churchbrick/teal,
		/turf/open/floor/rogue/church_teal,
		/turf/closed/mineral/rogue,
		/turf/open/floor/rogue/herringbone,
		/turf/closed/mineral,
		/turf/closed/wall/mineral/rogue/stonebrick,
		/turf/closed/wall/mineral/rogue/wood,
		/turf/closed/wall/mineral/rogue/wooddark,
		/turf/closed/wall/mineral/rogue/stone,
		/turf/closed/wall/mineral/rogue/stone/moss,
		/turf/open/floor/rogue/cobble,
		/turf/open/floor/rogue/dirt,
		/turf/open/floor/rogue/grass
	)
	damage_deflection = 10
	max_integrity = 800
	break_sound = 'sound/combat/hits/onstone/stonedeath.ogg'
	attacked_sound = list('sound/combat/hits/onstone/wallhit.ogg', 'sound/combat/hits/onstone/wallhit2.ogg', 'sound/combat/hits/onstone/wallhit3.ogg')

/turf/open/floor/rogue/church_teal/cardinal_smooth(adjacencies)
	roguesmooth(adjacencies)

/turf/open/floor/rogue/church_teal/roguesmooth(adjacencies)
	var/list/Yeah = ..()
	if(Yeah)
		var/list/transparent_overlays = list()
		for(var/overlay_state in Yeah)
			var/mutable_appearance/MA = mutable_appearance('icons/turf/roguefloor.dmi', overlay_state)
			MA.alpha = 128 // 50% opacity to reduce darkening
			transparent_overlays += MA
		add_overlay(transparent_overlays)
	return Yeah

/turf/open/floor/rogue/church_teal/Initialize()
	. = ..()
	dir = pick(GLOB.cardinals)

/turf/open/floor/rogue/church_teal/turf_destruction(damage_flag)
	. = ..()
	ScrapeAway(flags = CHANGETURF_INHERIT_AIR)

/turf/open/floor/rogue/churchrough
	icon_state = "church_rough"
	footstep = FOOTSTEP_STONE
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	landsound = 'sound/foley/jumpland/stoneland.wav'
	smooth = SMOOTH_MORE
	neighborlay = "churchroughedge"
	canSmoothWith = list(
		/turf/open/floor/rogue/churchrough,
		/turf/open/floor/rogue/churchrough/dark,
		/turf/open/floor/rogue/churchrough/red,
		/turf/open/floor/rogue/churchrough/teal,
		/turf/open/floor/rogue/churchmarble,
		/turf/open/floor/rogue/churchmarble/dark,
		/turf/open/floor/rogue/churchmarble/teal,
		/turf/open/floor/rogue/church,
		/turf/open/floor/rogue/church/dark,
		/turf/open/floor/rogue/church/teal,
		/turf/open/floor/rogue/church/red,
		/turf/open/floor/rogue/churchbrick,
		/turf/open/floor/rogue/churchbrick/dark,
		/turf/open/floor/rogue/churchbrick/teal,
		/turf/open/floor/rogue/church_teal,
		/turf/closed/mineral/rogue,
		/turf/open/floor/rogue/herringbone,
		/turf/closed/mineral,
		/turf/closed/wall/mineral/rogue/stonebrick,
		/turf/closed/wall/mineral/rogue/wood,
		/turf/closed/wall/mineral/rogue/wooddark,
		/turf/closed/wall/mineral/rogue/stone,
		/turf/closed/wall/mineral/rogue/stone/moss,
		/turf/open/floor/rogue/cobble
	)
	damage_deflection = 10
	max_integrity = 800
	break_sound = 'sound/combat/hits/onstone/stonedeath.ogg'
	attacked_sound = list('sound/combat/hits/onstone/wallhit.ogg', 'sound/combat/hits/onstone/wallhit2.ogg', 'sound/combat/hits/onstone/wallhit3.ogg')

/turf/open/floor/rogue/churchrough/cardinal_smooth(adjacencies)
	roguesmooth(adjacencies)

/turf/open/floor/rogue/churchrough/roguesmooth(adjacencies)
	var/list/Yeah = ..()
	if(Yeah)
		var/list/transparent_overlays = list()
		for(var/overlay_state in Yeah)
			var/mutable_appearance/MA = mutable_appearance('icons/turf/roguefloor.dmi', overlay_state)
			MA.alpha = 128 // 50% opacity to reduce darkening
			transparent_overlays += MA
		add_overlay(transparent_overlays)
	return Yeah

/turf/open/floor/rogue/churchrough/Initialize()
	. = ..()
	dir = pick(GLOB.cardinals)

/turf/open/floor/rogue/churchrough/turf_destruction(damage_flag)
	. = ..()
	ScrapeAway(flags = CHANGETURF_INHERIT_AIR)

/turf/open/floor/rogue/churchrough/dark
	icon_state = "church_roughdark"
	neighborlay = "churchroughdarkedge"
	canSmoothWith = list(
		/turf/open/floor/rogue/churchrough,
		/turf/open/floor/rogue/churchrough/dark,
		/turf/open/floor/rogue/churchrough/red,
		/turf/open/floor/rogue/churchrough/teal,
		/turf/open/floor/rogue/churchmarble,
		/turf/open/floor/rogue/churchmarble/dark,
		/turf/open/floor/rogue/churchmarble/teal,
		/turf/open/floor/rogue/church,
		/turf/open/floor/rogue/church/dark,
		/turf/open/floor/rogue/church/teal,
		/turf/open/floor/rogue/church/red,
		/turf/open/floor/rogue/churchbrick,
		/turf/open/floor/rogue/churchbrick/dark,
		/turf/open/floor/rogue/churchbrick/teal,
		/turf/open/floor/rogue/church_teal,
		/turf/closed/mineral/rogue,
		/turf/open/floor/rogue/herringbone,
		/turf/closed/mineral,
		/turf/closed/wall/mineral/rogue/stonebrick,
		/turf/closed/wall/mineral/rogue/wood,
		/turf/closed/wall/mineral/rogue/wooddark,
		/turf/closed/wall/mineral/rogue/stone,
		/turf/closed/wall/mineral/rogue/stone/moss,
		/turf/open/floor/rogue/cobble,
		/turf/open/floor/rogue/dirt,
		/turf/open/floor/rogue/grass
	)

/turf/open/floor/rogue/churchrough/dark/Initialize()
	. = ..()
	dir = pick(GLOB.cardinals)

/turf/open/floor/rogue/churchrough/red
	icon_state = "church_roughred"
	neighborlay = "churchroughrededge"
	canSmoothWith = list(
		/turf/open/floor/rogue/churchrough,
		/turf/open/floor/rogue/churchrough/dark,
		/turf/open/floor/rogue/churchrough/red,
		/turf/open/floor/rogue/churchrough/teal,
		/turf/open/floor/rogue/churchmarble,
		/turf/open/floor/rogue/churchmarble/dark,
		/turf/open/floor/rogue/churchmarble/teal,
		/turf/open/floor/rogue/church,
		/turf/open/floor/rogue/church/dark,
		/turf/open/floor/rogue/church/teal,
		/turf/open/floor/rogue/church/red,
		/turf/open/floor/rogue/churchbrick,
		/turf/open/floor/rogue/churchbrick/dark,
		/turf/open/floor/rogue/churchbrick/teal,
		/turf/open/floor/rogue/church_teal,
		/turf/closed/mineral/rogue,
		/turf/open/floor/rogue/herringbone,
		/turf/closed/mineral,
		/turf/closed/wall/mineral/rogue/stonebrick,
		/turf/closed/wall/mineral/rogue/wood,
		/turf/closed/wall/mineral/rogue/wooddark,
		/turf/closed/wall/mineral/rogue/stone,
		/turf/closed/wall/mineral/rogue/stone/moss,
		/turf/open/floor/rogue/cobble,
		/turf/open/floor/rogue/dirt,
		/turf/open/floor/rogue/grass
	)

/turf/open/floor/rogue/churchrough/red/Initialize()
	. = ..()
	dir = pick(GLOB.cardinals)

/turf/open/floor/rogue/churchrough/teal
	icon_state = "church_roughteal"
	neighborlay = "churchroughtealedge"
	canSmoothWith = list(
		/turf/open/floor/rogue/churchrough,
		/turf/open/floor/rogue/churchrough/dark,
		/turf/open/floor/rogue/churchrough/red,
		/turf/open/floor/rogue/churchrough/teal,
		/turf/open/floor/rogue/churchmarble,
		/turf/open/floor/rogue/churchmarble/dark,
		/turf/open/floor/rogue/churchmarble/teal,
		/turf/open/floor/rogue/church,
		/turf/open/floor/rogue/church/dark,
		/turf/open/floor/rogue/church/teal,
		/turf/open/floor/rogue/church/red,
		/turf/open/floor/rogue/churchbrick,
		/turf/open/floor/rogue/churchbrick/dark,
		/turf/open/floor/rogue/churchbrick/teal,
		/turf/open/floor/rogue/church_teal,
		/turf/closed/mineral/rogue,
		/turf/open/floor/rogue/herringbone,
		/turf/closed/mineral,
		/turf/closed/wall/mineral/rogue/stonebrick,
		/turf/closed/wall/mineral/rogue/wood,
		/turf/closed/wall/mineral/rogue/wooddark,
		/turf/closed/wall/mineral/rogue/stone,
		/turf/closed/wall/mineral/rogue/stone/moss,
		/turf/open/floor/rogue/cobble,
		/turf/open/floor/rogue/dirt,
		/turf/open/floor/rogue/grass
	)

/turf/open/floor/rogue/churchrough/teal/Initialize()
	. = ..()
	dir = pick(GLOB.cardinals)

/turf/open/floor/rogue/herringbone
	icon_state = "herringbone"
	footstep = FOOTSTEP_STONE
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	landsound = 'sound/foley/jumpland/stoneland.wav'
	neighborlay = "herringedge"
	smooth = SMOOTH_TRUE
	canSmoothWith = list(
		/turf/open/floor/rogue/herringbone,
		/turf/open/floor/rogue/herringbone/dark,
		/turf/open/floor/rogue/herringbone/red,
		/turf/open/floor/rogue/herringbone/teal,
		/turf/open/floor/rogue/blocks,
		/turf/open/floor/rogue/dirt,
		/turf/open/floor/rogue/grass
	)
	damage_deflection = 10
	max_integrity = 800
	break_sound = 'sound/combat/hits/onstone/stonedeath.ogg'
	attacked_sound = list('sound/combat/hits/onstone/wallhit.ogg', 'sound/combat/hits/onstone/wallhit2.ogg', 'sound/combat/hits/onstone/wallhit3.ogg')

/turf/open/floor/rogue/herringbone/cardinal_smooth(adjacencies)
	roguesmooth(adjacencies)

/turf/open/floor/rogue/herringbone/Initialize()
	. = ..()
	dir = pick(GLOB.cardinals)

/turf/open/floor/rogue/herringbone/turf_destruction(damage_flag)
	. = ..()
	ScrapeAway(flags = CHANGETURF_INHERIT_AIR)

/turf/open/floor/rogue/herringbone/dark
	icon_state = "herringbonedark"
	neighborlay = "herringedgedark"
	canSmoothWith = list(
		/turf/open/floor/rogue/herringbone,
		/turf/open/floor/rogue/herringbone/dark,
		/turf/open/floor/rogue/herringbone/red,
		/turf/open/floor/rogue/herringbone/teal,
		/turf/open/floor/rogue/blocks,
		/turf/open/floor/rogue/dirt,
		/turf/open/floor/rogue/grass
	)

/turf/open/floor/rogue/herringbone/red
	icon_state = "herringbonered"
	neighborlay = "herringedgered"
	canSmoothWith = list(
		/turf/open/floor/rogue/herringbone,
		/turf/open/floor/rogue/herringbone/dark,
		/turf/open/floor/rogue/herringbone/red,
		/turf/open/floor/rogue/herringbone/teal,
		/turf/open/floor/rogue/blocks,
		/turf/open/floor/rogue/dirt,
		/turf/open/floor/rogue/grass
	)

/turf/open/floor/rogue/herringbone/teal
	icon_state = "herringboneteal"
	neighborlay = "herringedgeteal"
	canSmoothWith = list(
		/turf/open/floor/rogue/herringbone,
		/turf/open/floor/rogue/herringbone/dark,
		/turf/open/floor/rogue/herringbone/red,
		/turf/open/floor/rogue/herringbone/teal,
		/turf/open/floor/rogue/blocks,
		/turf/open/floor/rogue/dirt,
		/turf/open/floor/rogue/grass
	)

/turf/open/floor/rogue/cobble
	icon_state = "cobblestone1"
	footstep = FOOTSTEP_STONE
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	landsound = 'sound/foley/jumpland/stoneland.wav'
	neighborlay = "cobbleedge"
	smooth = SMOOTH_TRUE
	canSmoothWith = list(
		/turf/open/floor/rogue/dirt,
		/turf/open/floor/rogue/grass
	)
	max_integrity = 1200

/turf/open/floor/rogue/cobble/cardinal_smooth(adjacencies)
	roguesmooth(adjacencies)

/turf/open/floor/rogue/cobble/Initialize()
	. = ..()
	icon_state = "cobblestone[rand(1,3)]"

/turf/open/floor/rogue/cobble/turf_destruction(damage_flag)
	. = ..()
	src.ChangeTurf(/turf/open/floor/rogue/dirt, flags = CHANGETURF_INHERIT_AIR)
	new /obj/item/natural/stone(src)


/turf/open/floor/rogue/cobblerock
	icon_state = "cobblerock"
	footstep = FOOTSTEP_STONE
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	landsound = 'sound/foley/jumpland/stoneland.wav'
//	neighborlay = "cobblerock"
	smooth = SMOOTH_MORE
	canSmoothWith = list(/turf/open/floor/rogue, /turf/closed/mineral, /turf/closed/wall/mineral)

/turf/open/floor/rogue/cobblerock/cardinal_smooth(adjacencies)
	roguesmooth(adjacencies)


/turf/open/floor/rogue/cobble/mossy
	icon_state = "mossystone1"
	footstep = FOOTSTEP_STONE
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	landsound = 'sound/foley/jumpland/stoneland.wav'
	neighborlay = "cobbleedge"
	smooth = SMOOTH_TRUE//if it looks weird, remove cansmooth with cobbles//
	canSmoothWith = list(
		/turf/open/floor/rogue/dirt,
		/turf/open/floor/rogue/grass,

	)


/turf/open/floor/rogue/cobble/mossy/cardinal_smooth(adjacencies)
	roguesmooth(adjacencies)

/turf/open/floor/rogue/cobble/mossy/roguesmooth(adjacencies)
	var/list/Yeah = ..()
	if(Yeah)
		var/list/transparent_overlays = list()
		for(var/overlay_state in Yeah)
			var/mutable_appearance/MA = mutable_appearance('icons/turf/roguefloor.dmi', overlay_state)
			MA.alpha = 128 // 50% opacity to reduce darkening
			transparent_overlays += MA
		add_overlay(transparent_overlays)
	return Yeah

/turf/open/floor/rogue/cobble/mossy/Initialize()
	. = ..()
	icon_state = "mossystone[rand(1,3)]"

/turf/open/floor/rogue/cobble/mossy/red
	icon_state = "mossystonered1"
	neighborlay = "mossystonerededge"
	canSmoothWith = list(
		/turf/open/floor/rogue/dirt,
		/turf/open/floor/rogue/grass,

	)

/turf/open/floor/rogue/cobble/mossy/red/Initialize()
	. = ..()
	icon_state = "mossystonered[rand(1,3)]"

/turf/open/floor/rogue/cobble/mossy/dark
	icon_state = "mossystonedark1"
	neighborlay = "mossystonedarkedge"
	canSmoothWith = list(
		/turf/open/floor/rogue/dirt,
		/turf/open/floor/rogue/grass,

	)


/turf/open/floor/rogue/cobble/mossy/dark/Initialize()
	. = ..()
	icon_state = "mossystonedark[rand(1,3)]"

/turf/open/floor/rogue/cobble/mossy/redevil
	icon_state = "mossystoneredevil1"
	neighborlay = "mossystoneredeviledge"
	canSmoothWith = list(
		/turf/open/floor/rogue/dirt,
		/turf/open/floor/rogue/grass,

	)


/turf/open/floor/rogue/cobble/mossy/redevil/Initialize()
	. = ..()
	icon_state = "mossystoneredevil[rand(1,3)]"

/turf/open/floor/rogue/cobble/mossy/evil
	icon_state = "mossystoneevil1"
	neighborlay = "mossystoneeviledge"
	canSmoothWith = list(
		/turf/open/floor/rogue/dirt,
		/turf/open/floor/rogue/grass,
	)

/turf/open/floor/rogue/cobble/mossy/evil/Initialize()
	. = ..()
	icon_state = "mossystoneevil[rand(1,3)]"

/turf/open/floor/rogue/cobble/mossy/darkevil
	icon_state = "mossystonedarkevil1"
	neighborlay = "mossystonedarkeviledge"
	canSmoothWith = list(
		/turf/open/floor/rogue/dirt,
		/turf/open/floor/rogue/grass,
	)

/turf/open/floor/rogue/cobble/mossy/darkevil/Initialize()
	. = ..()
	icon_state = "mossystonedarkevil[rand(1,3)]"




/turf/open/floor/rogue/cobble/dark
	icon_state = "cobblestonedark1"
	neighborlay = "cobbleedgedark"
	smooth = SMOOTH_MORE
	canSmoothWith = list(
		/turf/open/floor/rogue/dirt,
		/turf/open/floor/rogue/grass,
	)

/turf/open/floor/rogue/cobble/dark/cardinal_smooth(adjacencies)
	roguesmooth(adjacencies)

/turf/open/floor/rogue/cobble/dark/Initialize()
	. = ..()
	icon_state = "cobblestonedark[rand(1,3)]"

/turf/open/floor/rogue/cobble/red
	icon_state = "cobblestonered1"
	neighborlay = "cobbleedgered"
	smooth = SMOOTH_MORE
	canSmoothWith = list(
		/turf/open/floor/rogue/dirt,
		/turf/open/floor/rogue/grass,
	)

/turf/open/floor/rogue/cobble/red/cardinal_smooth(adjacencies)
	roguesmooth(adjacencies)

/turf/open/floor/rogue/cobble/red/Initialize()
	. = ..()
	icon_state = "cobblestonered[rand(1,3)]"

/turf/open/floor/rogue/cobble/teal
	icon_state = "cobblestoneteal1"
	neighborlay = "cobbleedgeteal"
	smooth = SMOOTH_MORE
	canSmoothWith = list(
		/turf/open/floor/rogue/cobble,
		/turf/open/floor/rogue/cobble/mossy,
		/turf/open/floor/rogue/cobble/dark,
		/turf/open/floor/rogue/cobble/red,
		/turf/open/floor/rogue/cobble/teal,
		/turf/open/floor/rogue/dirt,
		/turf/open/floor/rogue/grass,
		/turf/open/floor/rogue/sand,
		/turf/open/floor/rogue/sand/red,
		/turf/open/floor/rogue/sand/light,
		/turf/open/floor/rogue/sand/dark
	)

/turf/open/floor/rogue/cobble/teal/cardinal_smooth(adjacencies)
	roguesmooth(adjacencies)

/turf/open/floor/rogue/cobble/teal/Initialize()
	. = ..()
	icon_state = "cobblestoneteal[rand(1,3)]"

/obj/effect/decal/cobbleedge
	name = ""
	desc = ""
	icon = 'icons/turf/roguefloor.dmi'
	icon_state = "cobblestone_edges"
	mouse_opacity = 0

/turf/open/floor/rogue/tile
	icon_state = "chess"
	landsound = 'sound/foley/jumpland/tileland.wav'
	footstep = FOOTSTEP_FLOOR
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	footstepstealth = TRUE
	smooth = SMOOTH_MORE
	canSmoothWith = list(/turf/closed/mineral/rogue, /turf/closed/mineral, /turf/closed/wall/mineral/rogue/stonebrick, /turf/closed/wall/mineral/rogue/wood, /turf/closed/wall/mineral/rogue/wooddark, /turf/closed/wall/mineral/rogue/stone, /turf/closed/wall/mineral/rogue/stone/moss, /turf/open/floor/rogue/cobble, /turf/open/floor/rogue/dirt, /turf/open/floor/rogue/grass)
	damage_deflection = 10
	max_integrity = 800
	break_sound = 'sound/combat/hits/onstone/stonedeath.ogg'
	attacked_sound = list('sound/combat/hits/onstone/wallhit.ogg', 'sound/combat/hits/onstone/wallhit2.ogg', 'sound/combat/hits/onstone/wallhit3.ogg')

/turf/open/floor/rogue/tile/masonic
	icon_state = "masonic"
/turf/open/floor/rogue/tile/masonic/single
	icon_state = "masonicsingle"
/turf/open/floor/rogue/tile/masonic/inverted
	icon_state = "masonicsingleinvert"
/turf/open/floor/rogue/tile/masonic/spiral
	icon_state = "masonicspiral"

/turf/open/floor/rogue/tile/bath
	icon_state = "bathtile"
/turf/open/floor/rogue/tile/bath/dark
	icon_state = "bathtiledark"
/turf/open/floor/rogue/tile/bfloorz
	icon_state = "bfloorz"
/turf/open/floor/rogue/tile/tilerg
	icon_state = "tilerg"
/turf/open/floor/rogue/tile/checker
	icon_state = "linoleum"
/turf/open/floor/rogue/tile/checkeralt
	icon_state = "tile"

/turf/open/floor/rogue/tile/checkergreen
	icon_state = "tilegreen"

/turf/open/floor/rogue/tile/turf_destruction(damage_flag)
	. = ..()
	ScrapeAway(flags = CHANGETURF_INHERIT_AIR)

/turf/open/floor/rogue/concrete
	icon_state = "concretefloor1"
	landsound = 'sound/foley/jumpland/stoneland.wav'
	footstep = FOOTSTEP_STONE
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	smooth = SMOOTH_MORE
	canSmoothWith = list(/turf/closed/mineral/rogue, /turf/closed/mineral, /turf/closed/wall/mineral/rogue/stonebrick, /turf/closed/wall/mineral/rogue/wood, /turf/closed/wall/mineral/rogue/wooddark, /turf/closed/wall/mineral/rogue/stone, /turf/closed/wall/mineral/rogue/stone/moss, /turf/open/floor/rogue/cobble, /turf/open/floor/rogue/dirt, /turf/open/floor/rogue/grass)
	damage_deflection = 10
	max_integrity = 1200
	break_sound = 'sound/combat/hits/onstone/stonedeath.ogg'
	attacked_sound = list('sound/combat/hits/onstone/wallhit.ogg', 'sound/combat/hits/onstone/wallhit2.ogg', 'sound/combat/hits/onstone/wallhit3.ogg')

/turf/open/floor/rogue/concrete/Initialize()
	. = ..()
	icon_state = "concretefloor[rand(1,2)]"
	dir = pick(GLOB.cardinals)

/turf/open/floor/rogue/concrete/turf_destruction(damage_flag)
	. = ..()
	src.ChangeTurf(/turf/open/floor/rogue/dirt, flags = CHANGETURF_INHERIT_AIR)
	new /obj/item/natural/stone(src)

/turf/open/floor/rogue/metal
	icon_state = "plating1"
	landsound = 'sound/foley/jumpland/metalland.wav'
	footstep = FOOTSTEP_PLATING
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	footstepstealth = TRUE
	smooth = SMOOTH_MORE
	canSmoothWith = list(/turf/closed/mineral/rogue, /turf/closed/mineral, /turf/closed/wall/mineral/rogue/stonebrick, /turf/closed/wall/mineral/rogue/wood, /turf/closed/wall/mineral/rogue/wooddark, /turf/closed/wall/mineral/rogue/stone, /turf/closed/wall/mineral/rogue/stone/moss, /turf/open/floor/rogue/cobble, /turf/open/floor/rogue/dirt, /turf/open/floor/rogue/grass)
	damage_deflection = 16
	max_integrity = 1400
	attacked_sound = list('sound/combat/hits/onmetal/grille (1).ogg', 'sound/combat/hits/onmetal/grille (2).ogg', 'sound/combat/hits/onmetal/grille (3).ogg')

/turf/open/floor/rogue/metal/Initialize()
	. = ..()
	dir = pick(GLOB.cardinals)

/turf/open/floor/rogue/metal/barograte
	icon_state = "barograte"
/turf/open/floor/rogue/metal/barograte/open
	icon_state = "barograteopen"

/turf/open/floor/rogue/metal/turf_destruction(damage_flag)
	. = ..()
	ScrapeAway(flags = CHANGETURF_INHERIT_AIR)

/turf/open/floor/rogue/carpet
	icon_state = "carpet"
	landsound = 'sound/foley/jumpland/carpetland.wav'
	footstep = FOOTSTEP_CARPET
	barefootstep = FOOTSTEP_SOFT_BAREFOOT
	clawfootstep = FOOTSTEP_SOFT_BAREFOOT
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	smooth = SMOOTH_MORE
	canSmoothWith = list(/turf/closed/mineral/rogue, /turf/closed/mineral, /turf/closed/wall/mineral/rogue/stonebrick, /turf/closed/wall/mineral/rogue/wood, /turf/closed/wall/mineral/rogue/wooddark, /turf/closed/wall/mineral/rogue/stone, /turf/closed/wall/mineral/rogue/stone/moss, /turf/open/floor/rogue/cobble, /turf/open/floor/rogue/dirt, /turf/open/floor/rogue/grass)
	damage_deflection = 10
	max_integrity = 800
	break_sound = 'sound/combat/hits/onstone/stonedeath.ogg'
	attacked_sound = list('sound/combat/hits/onwood/fence_hit1.ogg','sound/combat/hits/onwood/fence_hit2.ogg','sound/combat/hits/onwood/fence_hit3.ogg')

/turf/open/floor/rogue/carpet/green
	icon_state = "carpethousegreen"

/turf/open/floor/rogue/carpet/red
	icon_state = "carpethousered"

/turf/open/floor/rogue/carpet/yellow
	icon_state = "carpethouseyellow"

/turf/open/floor/rogue/carpet/purple
	icon_state = "carpethousepurple"

/turf/open/floor/rogue/carpet/blue
	icon_state = "carpethouseblue"

/turf/open/floor/rogue/carpet/black
	icon_state = "carpethouseblack"

/turf/open/floor/rogue/carpet/white
	icon_state = "carpethousewhite"

/turf/open/floor/rogue/carpet/lord
	icon_state = ""

/turf/open/floor/rogue/carpet/lord/Initialize()
	. = ..()
	if(GLOB.lordprimary)
		lordcolor(GLOB.lordprimary,GLOB.lordsecondary)
	else
		GLOB.lordcolor += src

/turf/open/floor/rogue/carpet/lord/Destroy()
	GLOB.lordcolor -= src
	return ..()

/turf/open/floor/rogue/carpet/lord/lordcolor(primary,secondary)
	if(!primary || !secondary)
		return
	var/mutable_appearance/M = mutable_appearance(icon, "[icon_state]_primary", -(layer+0.1))
	M.color = primary
	add_overlay(M)
	GLOB.lordcolor -= src

/turf/open/floor/rogue/carpet/lord
    icon = 'icons/turf/roguefloor.dmi'
    footstep = FOOTSTEP_CARPET
    barefootstep = FOOTSTEP_SOFT_BAREFOOT
    clawfootstep = FOOTSTEP_HARD_CLAW
    heavyfootstep = FOOTSTEP_GENERIC_HEAVY
    landsound = 'sound/foley/jumpland/carpetland.wav'
    max_integrity = 600
    break_sound = 'sound/foley/cloth_rip.ogg'
    attacked_sound = list('sound/combat/hits/onwood/fence_hit1.ogg')

/turf/open/floor/rogue/carpet/lord/center
    icon_state = "carpet_c"

/turf/open/floor/rogue/carpet/lord/center/Initialize()
    dir = pick(GLOB.cardinals)
    return ..()

/turf/open/floor/rogue/carpet/lord/left
    icon_state = "carpet_l"

/turf/open/floor/rogue/carpet/lord/right
    icon_state = "carpet_r"

/turf/open/floor/rogue/carpet/lord/green
	icon_state = "carpethousegreen_c"

/turf/open/floor/rogue/carpet/lord/green/Initialize()
	dir = pick(GLOB.cardinals)
	return ..()

/turf/open/floor/rogue/carpet/lord/green/left
	icon_state = "carpethousegreen_l"

/turf/open/floor/rogue/carpet/lord/green/right
	icon_state = "carpethousegreen_r"

/turf/open/floor/rogue/carpet/lord/red
	icon_state = "carpethousered_c"

/turf/open/floor/rogue/carpet/lord/red/Initialize()
	dir = pick(GLOB.cardinals)
	return ..()

/turf/open/floor/rogue/carpet/lord/red/left
	icon_state = "carpethousered_l"

/turf/open/floor/rogue/carpet/lord/red/right
	icon_state = "carpethousered_r"

/turf/open/floor/rogue/carpet/lord/yellow
	icon_state = "carpethouseyellow_c"

/turf/open/floor/rogue/carpet/lord/yellow/Initialize()
	dir = pick(GLOB.cardinals)
	return ..()

/turf/open/floor/rogue/carpet/lord/yellow/left
	icon_state = "carpethouseyellow_l"

/turf/open/floor/rogue/carpet/lord/yellow/right
	icon_state = "carpethouseyellow_r"

/turf/open/floor/rogue/carpet/lord/purple
	icon_state = "carpethousepurple_c"

/turf/open/floor/rogue/carpet/lord/purple/Initialize()
	dir = pick(GLOB.cardinals)
	return ..()

/turf/open/floor/rogue/carpet/lord/purple/left
	icon_state = "carpethousepurple_l"

/turf/open/floor/rogue/carpet/lord/purple/right
	icon_state = "carpethousepurple_r"

/turf/open/floor/rogue/carpet/lord/blue
	icon_state = "carpethouseblue_c"

/turf/open/floor/rogue/carpet/lord/blue/Initialize()
	dir = pick(GLOB.cardinals)
	return ..()

/turf/open/floor/rogue/carpet/lord/blue/left
	icon_state = "carpethouseblue_l"

/turf/open/floor/rogue/carpet/lord/blue/right
	icon_state = "carpethouseblue_r"

/turf/open/floor/rogue/carpet/lord/white
	icon_state = "carpethousewhite_c"

/turf/open/floor/rogue/carpet/lord/white/Initialize()
	dir = pick(GLOB.cardinals)
	return ..()

/turf/open/floor/rogue/carpet/lord/white/left
	icon_state = "carpethousewhite_l"

/turf/open/floor/rogue/carpet/lord/white/right
	icon_state = "carpethousewhite_r"

/turf/open/floor/rogue/carpet/lord/black
	icon_state = "carpethouseblack_c"

/turf/open/floor/rogue/carpet/lord/black/Initialize()
	dir = pick(GLOB.cardinals)
	return ..()

/turf/open/floor/rogue/carpet/lord/black/left
	icon_state = "carpethouseblack_l"

/turf/open/floor/rogue/carpet/lord/black/right
	icon_state = "carpethouseblack_r"

/turf/open/floor/rogue/carpet/turf_destruction(damage_flag)
	. = ..()
	ScrapeAway(flags = CHANGETURF_INHERIT_AIR)

/turf/open/floor/rogue/shroud
	name = "treetop"
	icon_state = "treetop1"
	landsound = 'sound/foley/jumpland/dirtland.wav'
	footstep = null
	barefootstep = null
	clawfootstep = null
	heavyfootstep = null
	slowdown = 4

/turf/open/floor/rogue/shroud/Entered(atom/movable/AM, atom/oldLoc)
	..()
	if(isliving(AM))
		if(istype(oldLoc, type))
			playsound(AM, "plantcross", 100, TRUE)

/turf/open/floor/rogue/shroud/Initialize()
	. = ..()
	icon_state = "treetop[rand(1,2)]"
	dir = pick(GLOB.cardinals)

/turf/open/floor/rogue/naturalstone
	icon_state = "digstone"
	footstep = FOOTSTEP_STONE
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	landsound = 'sound/foley/jumpland/grassland.wav'

/turf/open/floor/rogue/sand
	name = "sand"
	desc = "Loose sand, shifting underfoot."
	icon_state = "sand"
	layer = MID_TURF_LAYER
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SOFT_BAREFOOT
	clawfootstep = FOOTSTEP_SAND
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE
	landsound = 'sound/foley/jumpland/dirtland.wav'
	smooth = SMOOTH_MORE
	neighborlay = "sandedge"
	canSmoothWith = list(
		/turf/open/floor/rogue/sand,
		/turf/open/floor/rogue/sand/red,
		/turf/open/floor/rogue/sand/light,
		/turf/open/floor/rogue/sand/dark,
		/turf/open/floor/rogue/dirt,
		/turf/open/floor/rogue/dirt/road,
		/turf/open/floor/rogue/grass,
		/turf/open/floor/rogue/cobble,
		/turf/open/floor/rogue/volcanic,
		/turf/open/floor/rogue/underworld/road
	)
	slowdown = 1
	max_integrity = 600
	var/dirt_amt = 3

/turf/open/floor/rogue/sand/cardinal_smooth(adjacencies)
	roguesmooth(adjacencies)

/turf/open/floor/rogue/sand/roguesmooth(adjacencies)
	var/list/Yeah = ..()
	if(Yeah)
		var/list/transparent_overlays = list()
		for(var/overlay_state in Yeah)
			var/mutable_appearance/MA = mutable_appearance('icons/turf/roguefloor.dmi', overlay_state)
			MA.alpha = 128 // 50% opacity to reduce darkening
			transparent_overlays += MA
		add_overlay(transparent_overlays)
	return Yeah

/turf/open/floor/rogue/sand/Initialize()
	. = ..()
	dir = pick(GLOB.cardinals)

/turf/open/floor/rogue/sand/turf_destruction(damage_flag)
	. = ..()
	ChangeTurf(/turf/open/floor/rogue/dirt, flags = CHANGETURF_INHERIT_AIR)

/turf/open/floor/rogue/sand/attack_right(mob/user)
	if(isliving(user))
		var/mob/living/L = user
		if(L.stat != CONSCIOUS)
			return
		var/obj/item/natural/sandpile/I = new /obj/item/natural/sandpile(src)
		if(L.put_in_active_hand(I))
			L.visible_message(span_warning("[L] scoops up some sand."))
			dirt_amt--
			if(dirt_amt <= 0)
				ChangeTurf(/turf/open/floor/rogue/dirt/road, flags = CHANGETURF_INHERIT_AIR)
		else
			qdel(I)
	.=..()

/turf/open/floor/rogue/sand/red
	icon_state = "sandred"
	neighborlay = "sandedgered"
	canSmoothWith = list(
		/turf/open/floor/rogue/sand,
		/turf/open/floor/rogue/sand/red,
		/turf/open/floor/rogue/sand/light,
		/turf/open/floor/rogue/sand/dark,
		/turf/open/floor/rogue/dirt,
		/turf/open/floor/rogue/dirt/road,
		/turf/open/floor/rogue/grass,
		/turf/open/floor/rogue/cobble,
		/turf/open/floor/rogue/volcanic,
		/turf/open/floor/rogue/underworld/road
	)

/turf/open/floor/rogue/sand/red/Initialize()
	. = ..()
	dir = pick(GLOB.cardinals)

/turf/open/floor/rogue/sand/light
	icon_state = "sandlight"
	neighborlay = "sandedgelight"
	canSmoothWith = list(
		/turf/open/floor/rogue/sand,
		/turf/open/floor/rogue/sand/red,
		/turf/open/floor/rogue/sand/light,
		/turf/open/floor/rogue/sand/dark,
		/turf/open/floor/rogue/dirt,
		/turf/open/floor/rogue/dirt/road,
		/turf/open/floor/rogue/grass,
		/turf/open/floor/rogue/cobble,
		/turf/open/floor/rogue/volcanic,
		/turf/open/floor/rogue/underworld/road
	)

/turf/open/floor/rogue/sand/light/Initialize()
	. = ..()
	dir = pick(GLOB.cardinals)

/turf/open/floor/rogue/sand/dark
	icon_state = "sanddark"
	neighborlay = "sandedgedark"
	canSmoothWith = list(
		/turf/open/floor/rogue/sand,
		/turf/open/floor/rogue/sand/red,
		/turf/open/floor/rogue/sand/light,
		/turf/open/floor/rogue/sand/dark,
		/turf/open/floor/rogue/dirt,
		/turf/open/floor/rogue/dirt/road,
		/turf/open/floor/rogue/grass,
		/turf/open/floor/rogue/cobble,
		/turf/open/floor/rogue/volcanic,
		/turf/open/floor/rogue/underworld/road
	)

/turf/open/floor/rogue/sand/dark/Initialize()
	. = ..()
	dir = pick(GLOB.cardinals)

/obj/item/natural/sandpile
	name = "pile of sand"
	desc = "A small heap of loose sand."
	icon = 'icons/roguetown/items/natural.dmi'
	icon_state = "mess3"//gotta replace later lmao
	w_class = WEIGHT_CLASS_TINY
	throwforce = 5
	throw_speed = 2
	throw_range = 4

/turf/closed/wall/mineral/rogue
	canSmoothWith = null
	desc = ""
	smooth = SMOOTH_FALSE
	var/smooth_icon = null
	smooth_diag = FALSE
	sheet_type = null
	baseturfs = list(/turf/open/floor/rogue/dirt/road)
	wallclimb = TRUE
	explosion_block = 10
	damage_deflection = 0
	icon = 'icons/turf/roguewall.dmi'

/turf/closed/wall/mineral/rogue/Initialize()
	if(smooth_icon)
		icon = smooth_icon
	. = ..()


/turf/closed/wall/mineral/rogue/stone
	name = "stone wall"
	desc = "A wall of smooth, unyielding stone."
	icon = 'icons/turf/walls/stone_wall.dmi'
	icon_state = "stone"
	smooth = SMOOTH_MORE
	blade_dulling = DULLING_BASH
	max_integrity = 1800
	sheet_type = /obj/item/natural/stone
	break_sound = 'sound/combat/hits/onstone/stonedeath.ogg'
	attacked_sound = list('sound/combat/hits/onstone/wallhit.ogg', 'sound/combat/hits/onstone/wallhit2.ogg', 'sound/combat/hits/onstone/wallhit3.ogg')
	canSmoothWith = list(/turf/closed/wall/mineral/rogue/stone)
	above_floor = /turf/open/floor/rogue/blocks
	baseturfs = list(/turf/open/floor/rogue/blocks)
	neighborlay = "dirtedge"
	climbdiff = 3
	damage_deflection = 10

/turf/closed/wall/mineral/rogue/stone/light
	icon = 'icons/turf/walls/stone_light_wall.dmi'

/turf/closed/wall/mineral/rogue/stone/carved
	icon = 'icons/turf/walls/carved_wall.dmi'

/turf/closed/wall/mineral/rogue/stone/window
	name = "stone window"
	desc = "A window with solid and sturdy stone frame."
	opacity = FALSE
	max_integrity = 1300

/turf/closed/wall/mineral/rogue/stone/window/light
	name = "stone window"
	desc = "A window with solid and sturdy stone frame."
	opacity = FALSE
	max_integrity = 1300

/turf/closed/wall/mineral/rogue/stone/window/carved
	name = "stone window"
	desc = "A window with solid and sturdy stone frame."
	opacity = FALSE
	max_integrity = 1300

/turf/closed/wall/mineral/rogue/stone/window/CanPass(atom/movable/mover, turf/target)
	if(istype(mover) && ((mover.pass_flags & PASSTABLE) || (mover.pass_flags & PASSGRILLE)) )
		return 1
	return ..()

/turf/closed/wall/mineral/rogue/stone/window/Initialize()
	. = ..()
	icon_state = "stone"
	var/mutable_appearance/M = mutable_appearance(icon, "stonehole", layer = ABOVE_NORMAL_TURF_LAYER)
	add_overlay(M)

/turf/closed/wall/mineral/rogue/stone/moss
	icon = 'icons/turf/walls/mossy_stone.dmi'
	climbdiff = 4

/turf/closed/wall/mineral/rogue/stone/window/moss
	icon = 'icons/turf/walls/mossy_stone.dmi'
	climbdiff = 4

/turf/closed/wall/mineral/rogue/stone/moss/light
	icon = 'icons/turf/walls/mossy_stone_light.dmi'
	climbdiff = 4

/turf/closed/wall/mineral/rogue/stone/window/moss/light
	icon = 'icons/turf/walls/mossy_stone_light.dmi'
	climbdiff = 4

/turf/closed/wall/mineral/rogue/craftstone
	name = "stone wall"
	desc = "A durable wall made from specially crafted stone."
	icon = 'icons/turf/walls/craftstone.dmi'
	icon_state = "box"
	smooth = SMOOTH_MORE
	blade_dulling = DULLING_BASH
	max_integrity = 1500
	sheet_type = /obj/item/natural/stone
	break_sound = 'sound/combat/hits/onstone/stonedeath.ogg'
	attacked_sound = list('sound/combat/hits/onstone/wallhit.ogg', 'sound/combat/hits/onstone/wallhit2.ogg', 'sound/combat/hits/onstone/wallhit3.ogg')
	canSmoothWith = list(/turf/closed/wall/mineral/rogue/craftstone)
	above_floor = /turf/open/floor/rogue/blocks
	baseturfs = list(/turf/open/floor/rogue/blocks)
	neighborlay = "dirtedge"
	climbdiff = 3
	damage_deflection = 10


/turf/closed/wall/mineral/rogue/craftstone/light
	canSmoothWith = list(/turf/closed/wall/mineral/rogue/craftstone, /turf/closed/wall/mineral/rogue/craftstone/light)
	icon = 'icons/turf/walls/craftstone_light.dmi'


/turf/closed/wall/mineral/rogue/stonebrick
	name = "brick wall"
	desc = "Several rows of bricks form this wall."
	icon = 'icons/turf/walls/stonebrick.dmi'
	icon_state = "stonebrick"
	smooth = SMOOTH_MORE
	wallclimb = FALSE
	blade_dulling = DULLING_BASH
	max_integrity = 2500
	sheet_type = /obj/item/natural/stone
	break_sound = 'sound/combat/hits/onstone/stonedeath.ogg'
	attacked_sound = list('sound/combat/hits/onstone/wallhit.ogg', 'sound/combat/hits/onstone/wallhit2.ogg', 'sound/combat/hits/onstone/wallhit3.ogg')
	canSmoothWith = list(/turf/closed/wall/mineral/rogue/stonebrick)
	above_floor = /turf/open/floor/rogue/blocks
	baseturfs = list(/turf/open/floor/rogue/blocks)
	neighborlay = "dirtedge"
	climbdiff = 4
	damage_deflection = 20

/turf/closed/wall/mineral/rogue/stonebrick/light
	name = "brick wall"
	desc = "Several rows of bricks form this wall."
	icon = 'icons/turf/walls/stonebrick_light.dmi'
	icon_state = "stonebrick"
	canSmoothWith = list(/turf/closed/wall/mineral/rogue/stonebrick/light)


/turf/closed/wall/mineral/rogue/stonebrick/red
	name = "brick wall"
	desc = "Several rows of bricks form this wall."
	icon = 'icons/turf/walls/stonebrick_red.dmi'
	icon_state = "stonebrick"
	canSmoothWith = list(/turf/closed/wall/mineral/rogue/stonebrick/red)


/turf/closed/wall/mineral/rogue/wood
	name = "wooden wall"
	desc = "A rough-hewn wall of wood."
	icon = 'icons/turf/walls/roguewood.dmi'
	icon_state = "wood"
	smooth = SMOOTH_MORE
	blade_dulling = DULLING_BASHCHOP
	max_integrity = 1100
	break_sound = 'sound/combat/hits/onwood/destroywalldoor.ogg'
	attacked_sound = list('sound/combat/hits/onwood/woodimpact (1).ogg','sound/combat/hits/onwood/woodimpact (2).ogg')
	canSmoothWith = list(/turf/closed/wall/mineral/rogue/wood, /obj/structure/roguewindow, /obj/structure/roguetent, /turf/closed/wall/mineral/rogue/wooddark)
	above_floor = /turf/open/floor/rogue/ruinedwood
	baseturfs = list(/turf/open/floor/rogue/ruinedwood)
	neighborlay = "dirtedge"
	climbdiff = 3
	explosion_block = 4

/turf/closed/wall/mineral/rogue/wood/window
	name = "wooden window"
	desc = "A window with rough hewn wood frame."
	opacity = FALSE
	explosion_block = 1
	max_integrity = 550

/turf/closed/wall/mineral/rogue/wood/light
	name = "wooden wall"
	desc = "A rough-hewn wall of wood."
	icon = 'icons/turf/walls/roguewood_light.dmi'
	canSmoothWith = list(/turf/closed/wall/mineral/rogue/wood, /obj/structure/roguewindow, /obj/structure/roguetent, /turf/closed/wall/mineral/rogue/wooddark)

/turf/closed/wall/mineral/rogue/wood/light/window/
	name = "wooden window"
	desc = "A window with rough hewn wood frame."
	opacity = FALSE
	explosion_block = 1
	max_integrity = 550


/turf/closed/wall/mineral/rogue/wood/dark
	name = "wooden wall"
	desc = "A rough-hewn wall of wood."
	icon = 'icons/turf/walls/roguewood_dark.dmi'
	canSmoothWith = list(/turf/closed/wall/mineral/rogue/wood, /obj/structure/roguewindow, /obj/structure/roguetent, /turf/closed/wall/mineral/rogue/wooddark)

/turf/closed/wall/mineral/rogue/wood/dark/window/
	name = "wooden window"
	desc = "A window with rough hewn wood frame."
	opacity = FALSE
	explosion_block = 1
	max_integrity = 550

/turf/closed/wall/mineral/rogue/wood/window/CanPass(atom/movable/mover, turf/target)
	if(istype(mover) && ((mover.pass_flags & PASSTABLE) || (mover.pass_flags & PASSGRILLE)) )
		return 1
	return ..()

/turf/closed/wall/mineral/rogue/wood/window/Initialize()
	. = ..()
	var/mutable_appearance/M = mutable_appearance(icon, "woodhole", layer = ABOVE_NORMAL_TURF_LAYER)
	add_overlay(M)

/turf/closed/wall/mineral/rogue/wood/log
	name = "Log wall"
	desc = ""
	icon = 'icons/turf/walls/roguewood_log.dmi'
	canSmoothWith = list(/turf/closed/wall/mineral/rogue/wood, /obj/structure/roguewindow, /obj/structure/roguetent, /turf/closed/wall/mineral/rogue/wooddark, /turf/closed/wall/mineral/rogue/wood/log)

/turf/closed/wall/mineral/rogue/wood/log/window/
	name = "Log window"
	desc = ""
	opacity = FALSE
	explosion_block = 1
	max_integrity = 550

/turf/closed/wall/mineral/rogue/wood/log/window/CanPass(atom/movable/mover, turf/target)
	if(istype(mover) && ((mover.pass_flags & PASSTABLE) || (mover.pass_flags & PASSGRILLE)) )
		return 1
	return ..()

/turf/closed/wall/mineral/rogue/wood/log/window/Initialize()
	. = ..()
	var/mutable_appearance/M = mutable_appearance(icon, "woodhole", layer = ABOVE_NORMAL_TURF_LAYER)
	add_overlay(M)

/turf/closed/wall/mineral/rogue/tent
	name = "tent"
	desc = "Made from durable fabric and wooden branches."
	icon = 'icons/turf/roguewall.dmi'
	icon_state = "tent"
	smooth = SMOOTH_FALSE
	blade_dulling = DULLING_BASHCHOP
	max_integrity = 300
	break_sound = 'sound/combat/hits/onwood/destroywalldoor.ogg'
	attacked_sound = list('sound/combat/hits/onwood/woodimpact (1).ogg','sound/combat/hits/onwood/woodimpact (2).ogg')
//	canSmoothWith = list(/turf/closed/wall/mineral/rogue/wood, /obj/structure/roguewindow, /turf/closed/wall/mineral/rogue/wooddark)
	above_floor = /turf/open/floor/rogue/twig
	baseturfs = list(/turf/open/floor/rogue/twig)
	neighborlay = "dirtedge"
	climbdiff = 99 //how are you even supposed to climb a tent??
	explosion_block = 0

/turf/closed/wall/mineral/rogue/wooddark
	name = "dark wood wall"
	desc = "Made from durable, somewhat darker wood." // i am not sure if the wood is really dark
	icon = 'icons/turf/roguewall.dmi'
	icon_state = "corner"
	smooth = SMOOTH_FALSE
	blade_dulling = DULLING_BASHCHOP
	max_integrity = 1100
	break_sound = 'sound/combat/hits/onwood/destroywalldoor.ogg'
	attacked_sound = list('sound/combat/hits/onwood/woodimpact (1).ogg','sound/combat/hits/onwood/woodimpact (2).ogg')
	above_floor = /turf/open/floor/rogue/ruinedwood
	baseturfs = list(/turf/open/floor/rogue/ruinedwood)
	neighborlay = "dirtedge"
	climbdiff = 3
	explosion_block = 4

/turf/closed/wall/mineral/rogue/wooddark/horizontal
	icon_state = "horizwooddark"

/turf/closed/wall/mineral/rogue/wooddark/vertical
	icon_state = "vertwooddark"

/turf/closed/wall/mineral/rogue/wooddark/end
	icon_state = "endwooddark"

/turf/closed/wall/mineral/rogue/wooddark/slitted
	icon_state = "slittedwooddark"

/turf/closed/wall/mineral/rogue/wooddark/window
	name = "dark wood window"
	icon_state = "subwindow"
	opacity = FALSE
	explosion_block = 1
	max_integrity = 850

/turf/closed/wall/mineral/rogue/wooddark/window/CanPass(atom/movable/mover, turf/target)
	if(istype(mover) && ((mover.pass_flags & PASSTABLE) || (mover.pass_flags & PASSGRILLE)) )
		return 1
	return ..()

/turf/closed/wall/mineral/rogue/roofwall
	name = "wooden wall"
	icon = 'icons/turf/roguewall.dmi'
	icon_state = ""
	smooth = SMOOTH_FALSE
	blade_dulling = DULLING_BASHCHOP
	max_integrity = 1100
	break_sound = 'sound/combat/hits/onwood/destroywalldoor.ogg'
	attacked_sound = list('sound/combat/hits/onwood/woodimpact (1).ogg','sound/combat/hits/onwood/woodimpact (2).ogg')
	above_floor = /turf/open/floor/rogue/rooftop
	baseturfs = list(/turf/open/floor/rogue/ruinedwood)
	neighborlay = "dirtedge"
	climbdiff = 3

/turf/closed/wall/mineral/rogue/roofwall/center
	icon_state = "roofTurf_I"

/turf/closed/wall/mineral/rogue/roofwall/middle
	icon_state = "roofTurf_M"

/turf/closed/wall/mineral/rogue/roofwall/outercorner
	icon_state = "roofTurf_OC"

/turf/closed/wall/mineral/rogue/roofwall/innercorner
	icon_state = "roofTurf_IC"

/turf/closed/wall/mineral/rogue/decowood
	name = "decorated wooden wall"
	desc = "Meticulously designed by an professional carpenter."
	icon = 'icons/turf/roguewall.dmi'
	icon_state = "decowood"
	smooth = SMOOTH_FALSE
	blade_dulling = DULLING_BASHCHOP
	max_integrity = 1100
	break_sound = 'sound/combat/hits/onwood/destroywalldoor.ogg'
	attacked_sound = list('sound/combat/hits/onwood/woodimpact (1).ogg','sound/combat/hits/onwood/woodimpact (2).ogg')
	above_floor = /turf/open/floor/rogue/ruinedwood
	baseturfs = list(/turf/open/floor/rogue/ruinedwood)
	neighborlay = "dirtedge"
	climbdiff = 3
	explosion_block = 4

/turf/closed/wall/mineral/rogue/decowood/Initialize()
	. = ..()
	dir = pick(GLOB.cardinals)

/turf/closed/wall/mineral/rogue/decowood/vert
	name = "decorated wooden wall"
	icon_state = "decowood-vert"

/turf/closed/wall/mineral/rogue/decostone
	name = "decorated stone wall"
	desc = "The mason did an excellent job etching details into this wall."
	icon = 'icons/turf/roguewall.dmi'
	icon_state = "decostone-b"
	smooth = SMOOTH_MORE
	wallclimb = FALSE
	blade_dulling = DULLING_BASH
	max_integrity = 1800
	sheet_type = /obj/item/natural/stone
	break_sound = 'sound/combat/hits/onstone/stonedeath.ogg'
	attacked_sound = list('sound/combat/hits/onstone/wallhit.ogg', 'sound/combat/hits/onstone/wallhit2.ogg', 'sound/combat/hits/onstone/wallhit3.ogg')
	above_floor = /turf/open/floor/rogue/blocks
	baseturfs = list(/turf/open/floor/rogue/blocks)
	neighborlay = "dirtedge"
	climbdiff = 3

/turf/closed/wall/mineral/rogue/decostone/long
	icon_state = "decostone-l"

/obj/structure/thronething
	name = "decorated stone wall" // what is thronething??
	icon = 'icons/turf/roguewall.dmi'
	max_integrity = 0
	opacity = 0
	icon_state = "decostone-l"

/turf/closed/wall/mineral/rogue/decostone/center
	icon_state = "decostone-c"

/turf/closed/wall/mineral/rogue/decostone/end
	icon_state = "decostone-e"

/turf/closed/wall/mineral/rogue/decostone/cand
	icon_state = "decostone-cand"

/turf/closed/wall/mineral/rogue/decostone/fluffstone
	icon_state = "fluffstone"




/turf/closed/wall/shroud //vines
	name = "thick treetop"
	desc = "All the birds flew away before I could see one!"
	icon = 'icons/turf/roguewall.dmi'
	icon_state = "shroud1"
	var/smooth_icon = 'icons/turf/smoothrocks.dmi'
	smooth = SMOOTH_MORE|SMOOTH_BORDER
	canSmoothWith = null
	baseturfs = /turf/open/floor/rogue/shroud
	blade_dulling = DULLING_CUT
	opacity = 1
	density = TRUE
	max_integrity = 200
//	layer = EDGED_TURF_LAYER /ROGTODO make these have borders and smooth
	temperature = TCMB
	sheet_type = null
	attacked_sound = list('sound/combat/hits/onvine/vinehit.ogg')
	debris = list(/obj/item/grown/log/tree/stick = 1, /obj/item/natural/thorn = 2, /obj/item/natural/fibers = 1)
	climbdiff = 0
	explosion_block = 0
	above_floor = /turf/open/floor/rogue/shroud
	var/res = 0
	var/res_replenish

/turf/closed/wall/shroud/attack_right(mob/user)
	if(isliving(user))
		var/mob/living/L = user
		user.changeNext_move(CLICK_CD_MELEE)
		playsound(src, "plantcross", 50, FALSE, -1)
		if(do_after(L, rand(5,10), target = src))
			if(!res && world.time > res_replenish)
				res = rand(1,3)
			if(res && prob(50))
				res--
				if(res <= 0)
					res_replenish = world.time + 8 MINUTES
				var/obj/item/B = new /obj/item/grown/log/tree/stick(user.loc)
				user.put_in_hands(B)
				user.visible_message(span_notice("[user] finds [B] in [src]."))
				return
			user.visible_message(span_warning("[user] searches through [src]."))
			if(!res)
				to_chat(user, span_warning("Picked clean... I should try later."))
	..()

/turf/closed/wall/shroud/Initialize()
	. = ..()
	icon_state = "shroud[pick(1,2)]"
	dir = pick(GLOB.cardinals)
	res = rand(1,3)
	var/turf/open/transparent/openspace/target = get_step_multiz(src, UP)
	if(istype(target))
		target.ChangeTurf(/turf/open/floor/rogue/dirt/road)

/turf/closed/wall/mineral/rogue/pipe
	name = "metal wall"
	desc = "Solid steel made into an impenetrable obstacle."
	icon = 'icons/turf/pipewall.dmi'
	icon_state = "iron_box"
	smooth = SMOOTH_MORE
	blade_dulling = DULLING_BASH
	max_integrity = 10000
	sheet_type = null
	break_sound = 'sound/combat/hits/onmetal/sheet (1).ogg'
	attacked_sound = list('sound/combat/hits/onmetal/attackpipewall (1).ogg','sound/combat/hits/onmetal/attackpipewall (2).ogg')
	canSmoothWith = list(/turf/closed/wall/mineral/rogue/pipe)
	above_floor = /turf/open/floor/rogue/concrete
	baseturfs = list(/turf/open/floor/rogue/concrete)
	climbdiff = 4
	damage_deflection = 20

/turf/closed/wall/mineral/rogue/stone/blue_moss
	icon = 'icons/turf/walls/blue_mossy.dmi'

/turf/closed/wall/mineral/rogue/stone/window/blue_moss
	icon = 'icons/turf/walls/blue_mossy.dmi'

/turf/closed/wall/mineral/rogue/stone/red_moss
    icon = 'icons/turf/walls/red_mossy.dmi'

/turf/closed/wall/mineral/rogue/stone/red_moss
    icon = 'icons/turf/walls/red_mossy.dmi'
/turf/closed/wall/mineral/rogue/decostone/mossy
    name = "decorated mossy stone wall"
    desc = "There was much effort put into this wall a long time ago."
    icon = 'icons/turf/Rougewall_mossy.dmi'
    icon_state = "decostone-b-green"
    climbdiff = 4

/turf/closed/wall/mineral/rogue/decostone/mossy/long
    icon_state = "decostone-l-green"

/turf/closed/wall/mineral/rogue/decostone/mossy/end
    icon_state = "decostone-e-green"

/turf/closed/wall/mineral/rogue/decostone/mossy/cand
    icon_state = "decostone-cand-green"

/turf/closed/wall/mineral/rogue/decostone/mossy/blue
    icon_state = "decostone-b-blue"

/turf/closed/wall/mineral/rogue/decostone/mossy/blue/long
    icon_state = "decostone-l-blue"

/turf/closed/wall/mineral/rogue/decostone/mossy/blue/end
    icon_state = "decostone-e-blue"

/turf/closed/wall/mineral/rogue/decostone/mossy/blue/cand
    icon_state = "decostone-cand-blue"

/turf/closed/wall/mineral/rogue/decostone/mossy/red
    icon_state = "decostone-b-red"

/turf/closed/wall/mineral/rogue/decostone/mossy/red/long
    icon_state = "decostone-l-red"

/turf/closed/wall/mineral/rogue/decostone/mossy/red/end
    icon_state = "decostone-e-red"

/turf/closed/wall/mineral/rogue/decostone/mossy/red/cand
    icon_state = "decostone-cand-red"

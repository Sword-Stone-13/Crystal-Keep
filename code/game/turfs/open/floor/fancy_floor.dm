/* In this file:
 * Wood floor
 * Grass floor
 * Fake Basalt
 * Carpet floor
 * Fake pits
 * Fake space
 */

/turf/open/floor/wood
	desc = ""
	icon_state = "wood"
	floor_tile = /obj/item/stack/tile/wood
	broken_states = list("wood-broken", "wood-broken2", "wood-broken3", "wood-broken4", "wood-broken5", "wood-broken6", "wood-broken7")
	footstep = FOOTSTEP_WOOD
	barefootstep = FOOTSTEP_WOOD_BAREFOOT
	clawfootstep = FOOTSTEP_WOOD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE

/turf/open/floor/wood/examine(mob/user)
	. = ..()
	. += span_notice("There's a few <b>screws</b> and a <b>small crack</b> visible.")

/turf/open/floor/wood/screwdriver_act(mob/living/user, obj/item/I)
	if(..())
		return TRUE
	return pry_tile(I, user) ? TRUE : FALSE

/turf/open/floor/wood/try_replace_tile(obj/item/stack/tile/T, mob/user, params)
	if(T.turf_type == type)
		return
	var/obj/item/tool = user.is_holding_item_of_type(/obj/item/screwdriver)
	if(!tool)
		tool = user.is_holding_item_of_type(/obj/item/crowbar)
	if(!tool)
		return
	var/turf/open/floor/plating/P = pry_tile(tool, user, TRUE)
	if(!istype(P))
		return
	P.attackby(T, user, params)

/turf/open/floor/wood/pry_tile(obj/item/C, mob/user, silent = FALSE)
	C.play_tool_sound(src, 80)
	return remove_tile(user, silent, (C.tool_behaviour == TOOL_SCREWDRIVER))

/turf/open/floor/wood/remove_tile(mob/user, silent = FALSE, make_tile = TRUE)
	if(broken || burnt)
		broken = 0
		burnt = 0
		if(user && !silent)
			to_chat(user, span_notice("I remove the broken planks."))
	else
		if(make_tile)
			if(user && !silent)
				to_chat(user, span_notice("I unscrew the planks."))
			if(floor_tile)
				new floor_tile(src)
		else
			if(user && !silent)
				to_chat(user, span_notice("I forcefully pry off the planks, destroying them in the process."))
	return make_plating()

/turf/open/floor/wood/cold
	temperature = 255.37

/turf/open/floor/wood/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/grass
	name = "grass patch"
	desc = ""
	icon = 'icons/turf/grass.dmi'
	icon_state = "grass"
	floor_tile = /obj/item/stack/tile/grass
	broken_states = list("sand")
	flags_1 = NONE
	bullet_bounce_sound = null
	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_GRASS
	clawfootstep = FOOTSTEP_GRASS
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	var/ore_type = /obj/item/stack/ore/glass
	var/turfverb = "uproot"
	tiled_dirt = FALSE

/turf/open/floor/grass/Initialize()
	. = ..()
	update_icon()

/turf/open/floor/grass/attackby(obj/item/C, mob/user, params)
	if((C.tool_behaviour == TOOL_SHOVEL) && params)
		new ore_type(src, 2)
		user.visible_message(span_notice("[user] digs up [src]."), span_notice("I [turfverb] [src]."))
		playsound(src, 'sound/blank.ogg', 50, TRUE)
		make_plating()
	if(..())
		return

/turf/open/floor/grass/fairy //like grass but fae-er
	name = "fairygrass patch"
	desc = ""
	icon_state = "fairygrass"
	floor_tile = /obj/item/stack/tile/fairygrass
	light_range = 2
	light_power = 0.80
	light_color = "#33CCFF"

/turf/open/floor/grass/snow
	gender = PLURAL
	name = "snow"
	icon = 'icons/turf/snow.dmi'
	desc = ""
	icon_state = "snow"
	ore_type = /obj/item/stack/sheet/mineral/snow
	planetary_atmos = TRUE
	floor_tile = null
	initial_gas_mix = FROZEN_ATMOS
	slowdown = 2
	bullet_sizzle = TRUE
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SAND
	clawfootstep = FOOTSTEP_SAND
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY

/turf/open/floor/grass/snow/try_replace_tile(obj/item/stack/tile/T, mob/user, params)
	return

/turf/open/floor/grass/snow/crowbar_act(mob/living/user, obj/item/I)
	return

/turf/open/floor/grass/snow/basalt //By your powers combined, I am captain planet
	gender = NEUTER
	name = "volcanic floor"
	icon = 'icons/turf/floors.dmi'
	icon_state = "basalt"
	ore_type = /obj/item/stack/ore/glass/basalt
	initial_gas_mix = OPENTURF_LOW_PRESSURE
	slowdown = 0

/turf/open/floor/grass/snow/basalt/Initialize()
	. = ..()
	if(prob(15))
		icon_state = "basalt[rand(0, 12)]"
		set_basalt_light(src)

/turf/open/floor/grass/snow/safe
	slowdown = 1.5
	planetary_atmos = FALSE


/turf/open/floor/grass/fakebasalt //Heart is not a real planeteer power
	name = "aesthetic volcanic flooring"
	desc = ""
	icon = 'icons/turf/floors.dmi'
	icon_state = "basalt"
	floor_tile = /obj/item/stack/tile/basalt
	ore_type = /obj/item/stack/ore/glass/basalt
	turfverb = "dig up"
	slowdown = 0
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SAND
	clawfootstep = FOOTSTEP_SAND
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY

/turf/open/floor/grass/fakebasalt/Initialize()
	. = ..()
	if(prob(15))
		icon_state = "basalt[rand(0, 12)]"
		set_basalt_light(src)


/turf/open/floor/carpet
	name = "carpet"
	desc = ""
	icon = 'icons/turf/floors/carpet.dmi'
	icon_state = "carpet"
	floor_tile = /obj/item/stack/tile/carpet
	broken_states = list("damaged")
	smooth = SMOOTH_TRUE
	canSmoothWith = list(/turf/open/floor/carpet, /turf/open/floor/carpet/airless)
	flags_1 = NONE
	bullet_bounce_sound = null
	footstep = FOOTSTEP_CARPET
	barefootstep = FOOTSTEP_SOFT_BAREFOOT
	clawfootstep = FOOTSTEP_SOFT_BAREFOOT
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	tiled_dirt = FALSE

/turf/open/floor/carpet/examine(mob/user)
	. = ..()
//	. += span_notice("There's a <b>small crack</b> on the edge of it.")

/turf/open/floor/carpet/Initialize()
	. = ..()
	update_icon()

/turf/open/floor/carpet/update_icon()
	if(!..())
		return 0
	if(!broken && !burnt)
		if(smooth)
			queue_smooth(src)
	else
		make_plating()
		if(smooth)
			queue_smooth_neighbors(src)

/turf/open/floor/carpet/black
	icon = 'icons/turf/floors/carpet_black.dmi'
	floor_tile = /obj/item/stack/tile/carpet/black
	canSmoothWith = list(/turf/open/floor/carpet/black, /turf/open/floor/carpet/airless)

/turf/open/floor/carpet/blue
	icon = 'icons/turf/floors/carpet_blue.dmi'
	floor_tile = /obj/item/stack/tile/carpet/blue
	canSmoothWith = list(/turf/open/floor/carpet/blue, /turf/open/floor/carpet/blue/airless)

/turf/open/floor/carpet/cyan
	icon = 'icons/turf/floors/carpet_cyan.dmi'
	floor_tile = /obj/item/stack/tile/carpet/cyan
	canSmoothWith = list(/turf/open/floor/carpet/cyan, /turf/open/floor/carpet/cyan/airless)

/turf/open/floor/carpet/green
	icon = 'icons/turf/floors/carpet_green.dmi'
	floor_tile = /obj/item/stack/tile/carpet/green
	canSmoothWith = list(/turf/open/floor/carpet/green, /turf/open/floor/carpet/green/airless)

/turf/open/floor/carpet/orange
	icon = 'icons/turf/floors/carpet_orange.dmi'
	floor_tile = /obj/item/stack/tile/carpet/orange
	canSmoothWith = list(/turf/open/floor/carpet/orange, /turf/open/floor/carpet/orange/airless)

/turf/open/floor/carpet/purple
	icon = 'icons/turf/floors/carpet_purple.dmi'
	floor_tile = /obj/item/stack/tile/carpet/purple
	canSmoothWith = list(/turf/open/floor/carpet/purple, /turf/open/floor/carpet/purple/airless)

/turf/open/floor/carpet/inn
	icon = 'icons/turf/floors/inn.dmi'

/turf/open/floor/carpet/stellar
	icon = 'icons/turf/floors/carpet_stellar.dmi'
	floor_tile = /obj/item/stack/tile/carpet/purple
	canSmoothWith = list(/turf/open/floor/carpet/stellar, /turf/open/floor/carpet/purple/airless)

/turf/open/floor/carpet/red
	icon = 'icons/turf/floors/carpet_red.dmi'
	floor_tile = /obj/item/stack/tile/carpet/red
	canSmoothWith = list(/turf/open/floor/carpet/red, /turf/open/floor/carpet/red/airless)

/turf/open/floor/carpet/royalblack
	icon = 'icons/turf/floors/carpet_royalblack.dmi'
	floor_tile = /obj/item/stack/tile/carpet/royalblack
	canSmoothWith = list(/turf/open/floor/carpet/royalblack, /turf/open/floor/carpet/royalblack/airless)

/turf/open/floor/carpet/royalblue
	icon = 'icons/turf/floors/carpet_royalblue.dmi'
	floor_tile = /obj/item/stack/tile/carpet/royalblue
	canSmoothWith = list(/turf/open/floor/carpet/royalblue, /turf/open/floor/carpet/royalblue/airless)

//Crystal Keep houses. Woe the huge code block

/turf/open/floor/rogue/carpet/house
	smooth = SMOOTH_TRUE
	footstep = FOOTSTEP_CARPET

/turf/open/floor/rogue/carpet/house/black/simple
	icon = 'icons/turf/floors/carpet_house_black_simple.dmi'
	floor_tile = /obj/item/stack/tile/carpet/house/black/simple
	canSmoothWith = list(
		/turf/open/floor/rogue/carpet/house/black/simple,
		/turf/open/floor/rogue/carpet/house/black/simple/airless
	)

/turf/open/floor/rogue/carpet/house/black/gold/diagonal
	icon = 'icons/turf/floors/carpet_house_black_gold_diagonal.dmi'
	floor_tile = /obj/item/stack/tile/carpet/house/black/gold/diagonal
	canSmoothWith = list(
		/turf/open/floor/rogue/carpet/house/black/gold/diagonal,
	)

/turf/open/floor/rogue/carpet/house/black/gold/fancy
	icon = 'icons/turf/floors/carpet_house_black_gold_fancy.dmi'
	floor_tile = /obj/item/stack/tile/carpet/house/black/gold/fancy
	canSmoothWith = list(
		/turf/open/floor/rogue/carpet/house/black/gold/fancy,
	)

/turf/open/floor/rogue/carpet/house/black/silver/diagonal
	icon = 'icons/turf/floors/carpet_house_black_silver_diagonal.dmi'
	floor_tile = /obj/item/stack/tile/carpet/house/black/silver/diagonal
	canSmoothWith = list(
		/turf/open/floor/rogue/carpet/house/black/silver/diagonal,
	)

/turf/open/floor/rogue/carpet/house/black/silver_fancy
	icon = 'icons/turf/floors/carpet_house_black_silver_fancy.dmi'
	floor_tile = /obj/item/stack/tile/carpet/house/black/silver/fancy
	canSmoothWith = list(
		/turf/open/floor/rogue/carpet/house/black/silver/fancy,
	)

/turf/open/floor/rogue/carpet/house/red/simple
	icon = 'icons/turf/floors/carpet_house_red_simple.dmi'
	floor_tile = /obj/item/stack/tile/carpet/house/red/simple
	canSmoothWith = list(
		/turf/open/floor/rogue/carpet/house/red/simple,
		/turf/open/floor/rogue/carpet/house/red/simple/airless
	)

/turf/open/floor/rogue/carpet/house/red/gold/diagonal
	icon = 'icons/turf/floors/carpet_house_red_gold_diagonal.dmi'
	floor_tile = /obj/item/stack/tile/carpet/house/red/gold/diagonal
	canSmoothWith = list(
		/turf/open/floor/rogue/carpet/house/red/gold/diagonal,
	)

/turf/open/floor/rogue/carpet/house/red/gold/fancy
	icon = 'icons/turf/floors/carpet_house_red_gold_fancy.dmi'
	floor_tile = /obj/item/stack/tile/carpet/house/red/gold/fancy
	canSmoothWith = list(
		/turf/open/floor/rogue/carpet/house/red/gold/fancy,
	)

/turf/open/floor/rogue/carpet/house/red/silver/diagonal
	icon = 'icons/turf/floors/carpet_house_red_silver_diagonal.dmi'
	floor_tile = /obj/item/stack/tile/carpet/house/red/silver/diagonal
	canSmoothWith = list(
		/turf/open/floor/rogue/carpet/house/red/silver/diagonal,
	)

/turf/open/floor/rogue/carpet/house/red/silver/fancy
	icon = 'icons/turf/floors/carpet_house_red_silver_fancy.dmi'
	floor_tile = /obj/item/stack/tile/carpet/house/red/silver/fancy
	canSmoothWith = list(
		/turf/open/floor/rogue/carpet/house/red/silver/fancy,
	)

/turf/open/floor/rogue/carpet/house/yellow/simple
	icon = 'icons/turf/floors/carpet_house_yellow_simple.dmi'
	floor_tile = /obj/item/stack/tile/carpet/house/yellow/simple
	canSmoothWith = list(
		/turf/open/floor/rogue/carpet/house/yellow/simple,
	)

/turf/open/floor/rogue/carpet/house/yellow/gold/diagonal
	icon = 'icons/turf/floors/carpet_house_yellow_gold_diagonal.dmi'
	floor_tile = /obj/item/stack/tile/carpet/house/yellow/gold/diagonal
	canSmoothWith = list(
		/turf/open/floor/rogue/carpet/house/yellow/gold/diagonal,
	)

/turf/open/floor/rogue/carpet/house/yellow/gold/fancy
	icon = 'icons/turf/floors/carpet_house_yellow_gold_fancy.dmi'
	floor_tile = /obj/item/stack/tile/carpet/house/yellow/gold/fancy
	canSmoothWith = list(
		/turf/open/floor/rogue/carpet/house/yellow/gold/fancy,
	)

/turf/open/floor/rogue/carpet/house/yellow/silver/diagonal
	icon = 'icons/turf/floors/carpet_house_yellow_silver_diagonal.dmi'
	floor_tile = /obj/item/stack/tile/carpet/house/yellow/silver/diagonal
	canSmoothWith = list(
		/turf/open/floor/rogue/carpet/house/yellow/silver/diagonal,
	)

/turf/open/floor/rogue/carpet/house/yellow/silver/fancy
	icon = 'icons/turf/floors/carpet_house_yellow_silver_fancy.dmi'
	floor_tile = /obj/item/stack/tile/carpet/house/yellow/silver/fancy
	canSmoothWith = list(
		/turf/open/floor/rogue/carpet/house/yellow/silver/fancy,
	)

/turf/open/floor/rogue/carpet/house/purple/simple
	icon = 'icons/turf/floors/carpet_house_purple_simple.dmi'
	floor_tile = /obj/item/stack/tile/carpet/house/purple/simple
	canSmoothWith = list(
		/turf/open/floor/rogue/carpet/house/purple/simple,
		/turf/open/floor/rogue/carpet/house/purple/simple/airless
	)

/turf/open/floor/rogue/carpet/house/purple/gold/diagonal
	icon = 'icons/turf/floors/carpet_house_purple_gold_diagonal.dmi'
	floor_tile = /obj/item/stack/tile/carpet/house/purple/gold/diagonal
	canSmoothWith = list(
		/turf/open/floor/rogue/carpet/house/purple/gold/diagonal,
	)

/turf/open/floor/rogue/carpet/house/purple/gold/fancy
	icon = 'icons/turf/floors/carpet_house_purple_gold_fancy.dmi'
	floor_tile = /obj/item/stack/tile/carpet/house/purple/gold/fancy
	canSmoothWith = list(
		/turf/open/floor/rogue/carpet/house/purple/gold/fancy,
	)

/turf/open/floor/rogue/carpet/house/purple/silver/diagonal
	icon = 'icons/turf/floors/carpet_house_purple_silver_diagonal.dmi'
	floor_tile = /obj/item/stack/tile/carpet/house/purple/silver/diagonal
	canSmoothWith = list(
		/turf/open/floor/rogue/carpet/house/purple/silver/diagonal,
	)

/turf/open/floor/rogue/carpet/house/purple/silver/fancy
	icon = 'icons/turf/floors/carpet_house_purple_silver_fancy.dmi'
	floor_tile = /obj/item/stack/tile/carpet/house/purple/silver/fancy
	canSmoothWith = list(
		/turf/open/floor/rogue/carpet/house/purple/silver/fancy,
	)

/turf/open/floor/rogue/carpet/house/blue/simple
	icon = 'icons/turf/floors/carpet_house_blue_simple.dmi'
	floor_tile = /obj/item/stack/tile/carpet/house/blue/simple
	canSmoothWith = list(
		/turf/open/floor/rogue/carpet/house/blue/simple,
	)

/turf/open/floor/rogue/carpet/house/blue/gold/diagonal
	icon = 'icons/turf/floors/carpet_house_blue_gold_diagonal.dmi'
	floor_tile = /obj/item/stack/tile/carpet/house/blue/gold/diagonal
	canSmoothWith = list(
		/turf/open/floor/rogue/carpet/house/blue/gold/diagonal,
	)

/turf/open/floor/rogue/carpet/house/blue/gold/fancy
	icon = 'icons/turf/floors/carpet_house_blue_gold_fancy.dmi'
	floor_tile = /obj/item/stack/tile/carpet/house/blue/gold/fancy
	canSmoothWith = list(
		/turf/open/floor/rogue/carpet/house/blue/gold/fancy,
	)

/turf/open/floor/rogue/carpet/house/blue/silver/diagonal
	icon = 'icons/turf/floors/carpet_house_blue_silver_diagonal.dmi'
	floor_tile = /obj/item/stack/tile/carpet/house/blue/silver/diagonal
	canSmoothWith = list(
		/turf/open/floor/rogue/carpet/house/blue/silver/diagonal,
	)

/turf/open/floor/rogue/carpet/house/blue/silver/fancy
	icon = 'icons/turf/floors/carpet_house_blue_silver_fancy.dmi'
	floor_tile = /obj/item/stack/tile/carpet/house/blue/silver/fancy
	canSmoothWith = list(
		/turf/open/floor/rogue/carpet/house/blue/silver/fancy,
	)

/turf/open/floor/rogue/carpet/house/green/simple
	icon = 'icons/turf/floors/carpet_house_green_simple.dmi'
	floor_tile = /obj/item/stack/tile/carpet/house/green/simple
	canSmoothWith = list(
		/turf/open/floor/rogue/carpet/house/green/simple,
	)

/turf/open/floor/rogue/carpet/house/green/gold/diagonal
	icon = 'icons/turf/floors/carpet_house_green_gold_diagonal.dmi'
	floor_tile = /obj/item/stack/tile/carpet/house/green/gold/diagonal
	canSmoothWith = list(
		/turf/open/floor/rogue/carpet/house/green/gold/diagonal,
	)

/turf/open/floor/rogue/carpet/house/green/gold/fancy
	icon = 'icons/turf/floors/carpet_house_green_gold_fancy.dmi'
	floor_tile = /obj/item/stack/tile/carpet/house/green/gold/fancy
	canSmoothWith = list(
		/turf/open/floor/rogue/carpet/house/green/gold/fancy,
	)

/turf/open/floor/rogue/carpet/house/green/silver/diagonal
	icon = 'icons/turf/floors/carpet_house_green_silver_diagonal.dmi'
	floor_tile = /obj/item/stack/tile/carpet/house/green/silver/diagonal
	canSmoothWith = list(
		/turf/open/floor/rogue/carpet/house/green/silver/diagonal,
	)

/turf/open/floor/rogue/carpet/house/green/silver/fancy
	icon = 'icons/turf/floors/carpet_house_green_silver_fancy.dmi'
	floor_tile = /obj/item/stack/tile/carpet/house/green/silver/fancy
	canSmoothWith = list(
		/turf/open/floor/rogue/carpet/house/green/silver/fancy,
	)

/turf/open/floor/rogue/carpet/house/white/simple
	icon = 'icons/turf/floors/carpet_house_white_simple.dmi'
	floor_tile = /obj/item/stack/tile/carpet/house/white/simple
	canSmoothWith = list(
		/turf/open/floor/rogue/carpet/house/white/simple,
	)

/turf/open/floor/rogue/carpet/house/white/gold/diagonal
	icon = 'icons/turf/floors/carpet_house_white_gold_diagonal.dmi'
	floor_tile = /obj/item/stack/tile/carpet/house/white/gold/diagonal
	canSmoothWith = list(
		/turf/open/floor/rogue/carpet/house/white/gold/diagonal,
	)

/turf/open/floor/rogue/carpet/house/white/gold/fancy
	icon = 'icons/turf/floors/carpet_house_white_gold_fancy.dmi'
	floor_tile = /obj/item/stack/tile/carpet/house/white/gold/fancy
	canSmoothWith = list(
		/turf/open/floor/rogue/carpet/house/white/gold/fancy,
	)

/turf/open/floor/rogue/carpet/house/white/silver/diagonal
	icon = 'icons/turf/floors/carpet_house_white_silver_diagonal.dmi'
	floor_tile = /obj/item/stack/tile/carpet/house/white/silver/diagonal
	canSmoothWith = list(
		/turf/open/floor/rogue/carpet/house/white/silver/diagonal,
	)

/turf/open/floor/rogue/carpet/house/white/silver/fancy
	icon = 'icons/turf/floors/carpet_house_white_silver_fancy.dmi'
	floor_tile = /obj/item/stack/tile/carpet/house/white/silver/fancy
	canSmoothWith = list(
		/turf/open/floor/rogue/carpet/house/white/silver/fancy,
	)

//*****Airless versions of all of the above.*****
/turf/open/floor/carpet/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/carpet/black/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/carpet/blue/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/carpet/cyan/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/carpet/green/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/carpet/orange/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/carpet/purple/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/carpet/red/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/carpet/royalblack/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/carpet/royalblue/airless
	initial_gas_mix = AIRLESS_ATMOS

//crystal keep, dunno when we'd need this, maybe some day, better safe than never
/turf/open/floor/rogue/carpet/house/black/simple/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/rogue/carpet/house/black/gold/diagonal/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/rogue/carpet/house/black/gold/fancy/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/rogue/carpet/house/black/silver/diagonal/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/rogue/carpet/house/black/silver/fancy/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/rogue/carpet/house/red/simple/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/rogue/carpet/house/red/gold/diagonal/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/rogue/carpet/house/red/gold/fancy/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/rogue/carpet/house/red/silver/diagonal/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/rogue/carpet/house/red/silver/fancy/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/rogue/carpet/house/yellow/simple/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/rogue/carpet/house/yellow/gold/diagonal/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/rogue/carpet/house/yellow/gold/fancy/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/rogue/carpet/house/yellow/silver/diagonal/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/rogue/carpet/house/yellow/silver/fancy/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/rogue/carpet/house/purple/simple/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/rogue/carpet/house/purple/gold/diagonal/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/rogue/carpet/house/purple/gold/fancy/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/rogue/carpet/house/purple/silver/diagonal/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/rogue/carpet/house/purple/silver/fancy/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/rogue/carpet/house/blue/simple/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/rogue/carpet/house/blue/gold/diagonal/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/rogue/carpet/house/blue/gold/fancy/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/rogue/carpet/house/blue/silver/diagonal/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/rogue/carpet/house/blue/silver/fancy/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/rogue/carpet/house/green/simple/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/rogue/carpet/house/green/gold/diagonal/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/rogue/carpet/house/green/gold/fancy/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/rogue/carpet/house/green/silver/diagonal/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/rogue/carpet/house/green/silver/fancy/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/rogue/carpet/house/white/simple/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/rogue/carpet/house/white/gold/diagonal/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/rogue/carpet/house/white/gold/fancy/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/rogue/carpet/house/white/silver/diagonal/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/rogue/carpet/house/white/silver/fancy/airless
	initial_gas_mix = AIRLESS_ATMOS


/turf/open/floor/carpet/narsie_act(force, ignore_mobs, probability = 20)
	. = (prob(probability) || force)
	for(var/I in src)
		var/atom/A = I
		if(ignore_mobs && ismob(A))
			continue
		if(ismob(A) || .)
			A.narsie_act()

/turf/open/floor/carpet/break_tile()
	broken = TRUE
	update_icon()

/turf/open/floor/carpet/burn_tile()
	burnt = TRUE
	update_icon()

/turf/open/floor/carpet/get_smooth_underlay_icon(mutable_appearance/underlay_appearance, turf/asking_turf, adjacency_dir)
	return FALSE


/turf/open/floor/fakepit
	desc = ""
	smooth = SMOOTH_TRUE | SMOOTH_BORDER | SMOOTH_MORE
	canSmoothWith = list(/turf/open/floor/fakepit)
	icon = 'icons/turf/floors/Chasms.dmi'
	icon_state = "smooth"
	tiled_dirt = FALSE

/turf/open/floor/fakepit/get_smooth_underlay_icon(mutable_appearance/underlay_appearance, turf/asking_turf, adjacency_dir)
	underlay_appearance.icon = 'icons/turf/floors.dmi'
	underlay_appearance.icon_state = "basalt"
	return TRUE

/turf/open/floor/fakespace
	icon = 'icons/turf/space.dmi'
	icon_state = "0"
	floor_tile = /obj/item/stack/tile/fakespace
	broken_states = list("damaged")
	plane = PLANE_SPACE
	tiled_dirt = FALSE

/turf/open/floor/fakespace/Initialize()
	. = ..()
	icon_state = SPACE_ICON_STATE

/turf/open/floor/fakespace/get_smooth_underlay_icon(mutable_appearance/underlay_appearance, turf/asking_turf, adjacency_dir)
	underlay_appearance.icon = 'icons/turf/space.dmi'
	underlay_appearance.icon_state = SPACE_ICON_STATE
	underlay_appearance.plane = PLANE_SPACE
	return TRUE

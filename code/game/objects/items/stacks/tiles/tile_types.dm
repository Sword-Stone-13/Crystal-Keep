/obj/item/stack/tile
	name = "broken tile"
	singular_name = "broken tile"
	desc = ""
	lefthand_file = 'icons/mob/inhands/misc/tiles_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/tiles_righthand.dmi'
	icon = 'icons/obj/tiles.dmi'
	w_class = WEIGHT_CLASS_NORMAL
	force = 1
	throwforce = 1
	throw_speed = 3
	throw_range = 7
	max_amount = 60
	mats_per_stack = 500
	var/turf_type = null
	var/mineralType = null
	novariants = TRUE

/obj/item/stack/tile/Initialize(mapload, amount)
	. = ..()
	pixel_x = rand(-3, 3)
	pixel_y = rand(-3, 3) //randomize a little

/obj/item/stack/tile/attackby(obj/item/W, mob/user, params)

	if (W.tool_behaviour == TOOL_WELDER)
		if(get_amount() < 4)
			to_chat(user, span_warning("I need at least four tiles to do this!"))
			return

		if(!mineralType)
			to_chat(user, span_warning("I can not reform this!"))
			return

		if(W.use_tool(src, user, 0, volume=40))
			if(mineralType == "plasma")
				atmos_spawn_air("plasma=5;TEMP=1000")
				user.visible_message(span_warning("[user.name] sets the plasma tiles on fire!"), \
									span_warning("I set the plasma tiles on fire!"))
				qdel(src)
				return

			if (mineralType == "metal")
				var/obj/item/stack/sheet/metal/new_item = new(user.loc)
				user.visible_message(span_notice("[user.name] shaped [src] into metal with the welding tool."), \
							 span_notice("I shaped [src] into metal with the welding tool."), \
							 span_hear("I hear welding."))
				var/obj/item/stack/rods/R = src
				src = null
				var/replace = (user.get_inactive_held_item()==R)
				R.use(4)
				if (!R && replace)
					user.put_in_hands(new_item)

			else
				var/sheet_type = text2path("/obj/item/stack/sheet/mineral/[mineralType]")
				var/obj/item/stack/sheet/mineral/new_item = new sheet_type(user.loc)
				user.visible_message(span_notice("[user.name] shaped [src] into a sheet with the welding tool."), \
							 span_notice("I shaped [src] into a sheet with the welding tool."), \
							 span_hear("I hear welding."))
				var/obj/item/stack/rods/R = src
				src = null
				var/replace = (user.get_inactive_held_item()==R)
				R.use(4)
				if (!R && replace)
					user.put_in_hands(new_item)
	else
		return ..()

//Grass
/obj/item/stack/tile/grass
	name = "grass tile"
	singular_name = "grass floor tile"
	desc = ""
	icon_state = "tile_grass"
	item_state = "tile-grass"
	turf_type = /turf/open/floor/grass
	resistance_flags = FLAMMABLE

//Fairygrass
/obj/item/stack/tile/fairygrass
	name = "fairygrass tile"
	singular_name = "fairygrass floor tile"
	desc = ""
	icon_state = "tile_fairygrass"
	item_state = "tile-fairygrass"
	turf_type = /turf/open/floor/grass/fairy
	resistance_flags = FLAMMABLE

//Wood
/obj/item/stack/tile/wood
	name = "wood floor tile"
	singular_name = "wood floor tile"
	desc = ""
	icon_state = "tile-wood"
	item_state = "tile-wood"
	turf_type = /turf/open/floor/wood
	resistance_flags = FLAMMABLE

//Basalt
/obj/item/stack/tile/basalt
	name = "basalt tile"
	singular_name = "basalt floor tile"
	desc = ""
	icon_state = "tile_basalt"
	item_state = "tile-basalt"
	turf_type = /turf/open/floor/grass/fakebasalt

//Carpets
/obj/item/stack/tile/carpet
	name = "carpet"
	singular_name = "carpet"
	desc = ""
	icon_state = "tile-carpet"
	item_state = "tile-carpet"
	turf_type = /turf/open/floor/carpet
	resistance_flags = FLAMMABLE
	tableVariant = /obj/structure/table/wood/fancy

/obj/item/stack/tile/carpet/black
	name = "black carpet"
	icon_state = "tile-carpet-black"
	item_state = "tile-carpet-black"
	turf_type = /turf/open/floor/carpet/black
	tableVariant = /obj/structure/table/wood/fancy/black

/obj/item/stack/tile/carpet/blue
	name = "blue carpet"
	icon_state = "tile-carpet-blue"
	item_state = "tile-carpet-blue"
	turf_type = /turf/open/floor/carpet/blue
	tableVariant = /obj/structure/table/wood/fancy/blue

/obj/item/stack/tile/carpet/cyan
	name = "cyan carpet"
	icon_state = "tile-carpet-cyan"
	item_state = "tile-carpet-cyan"
	turf_type = /turf/open/floor/carpet/cyan
	tableVariant = /obj/structure/table/wood/fancy/cyan

/obj/item/stack/tile/carpet/green
	name = "green carpet"
	icon_state = "tile-carpet-green"
	item_state = "tile-carpet-green"
	turf_type = /turf/open/floor/carpet/green
	tableVariant = /obj/structure/table/wood/fancy/green

/obj/item/stack/tile/carpet/orange
	name = "orange carpet"
	icon_state = "tile-carpet-orange"
	item_state = "tile-carpet-orange"
	turf_type = /turf/open/floor/carpet/orange
	tableVariant = /obj/structure/table/wood/fancy/orange

/obj/item/stack/tile/carpet/purple
	name = "purple carpet"
	icon_state = "tile-carpet-purple"
	item_state = "tile-carpet-purple"
	turf_type = /turf/open/floor/carpet/purple
	tableVariant = /obj/structure/table/wood/fancy/purple

/obj/item/stack/tile/carpet/red
	name = "red carpet"
	icon_state = "tile-carpet-red"
	item_state = "tile-carpet-red"
	turf_type = /turf/open/floor/carpet/red
	tableVariant = /obj/structure/table/wood/fancy/red

/obj/item/stack/tile/carpet/royalblack
	name = "royal black carpet"
	icon_state = "tile-carpet-royalblack"
	item_state = "tile-carpet-royalblack"
	turf_type = /turf/open/floor/carpet/royalblack
	tableVariant = /obj/structure/table/wood/fancy/royalblack

/obj/item/stack/tile/carpet/royalblue
	name = "royal blue carpet"
	icon_state = "tile-carpet-royalblue"
	item_state = "tile-carpet-royalblue"
	turf_type = /turf/open/floor/carpet/royalblue
	tableVariant = /obj/structure/table/wood/fancy/royalblue



//Crystal Keep houses. Woe the huge code block, thanks babe

/obj/item/stack/tile/carpet/house
	icon_state = "tile-carpet"
	item_state = "tile-carpet"
	turf_type = /turf/open/floor/rogue/carpet/house
	resistance_flags = FLAMMABLE

// Black variations
/obj/item/stack/tile/carpet/house/black/simple
	name = "black house carpet"
	icon_state = "tile-carpet-house-black-simple"
	turf_type = /turf/open/floor/rogue/carpet/house/black/simple

/obj/item/stack/tile/carpet/house/black/gold/diagonal
	name = "black gold diagonal house carpet"
	icon_state = "tile-carpet-house-black-gold-diagonal"
	turf_type = /turf/open/floor/rogue/carpet/house/black/gold/diagonal

/obj/item/stack/tile/carpet/house/black/gold/fancy
	name = "black gold fancy house carpet"
	icon_state = "tile-carpet-house-black-gold-fancy"
	turf_type = /turf/open/floor/rogue/carpet/house/black/gold/fancy

/obj/item/stack/tile/carpet/house/black/silver/diagonal
	name = "black silver diagonal house carpet"
	icon_state = "tile-carpet-house-black-silver-diagonal"
	turf_type = /turf/open/floor/rogue/carpet/house/black/silver/diagonal

/obj/item/stack/tile/carpet/house/black/silver/fancy
	name = "black silver fancy house carpet"
	icon_state = "tile-carpet-house-black-silver-fancy"
	turf_type = /turf/open/floor/rogue/carpet/house/black/silver/fancy

// Red variations
/obj/item/stack/tile/carpet/house/red/simple
	name = "red house carpet"
	icon_state = "tile-carpet-house-red-simple"
	turf_type = /turf/open/floor/rogue/carpet/house/red/simple

/obj/item/stack/tile/carpet/house/red/gold/diagonal
	name = "red gold diagonal house carpet"
	icon_state = "tile-carpet-house-red-gold-diagonal"
	turf_type = /turf/open/floor/rogue/carpet/house/red/gold/diagonal

/obj/item/stack/tile/carpet/house/red/gold/fancy
	name = "red gold fancy house carpet"
	icon_state = "tile-carpet-house-red-gold-fancy"
	turf_type = /turf/open/floor/rogue/carpet/house/red/gold/fancy

/obj/item/stack/tile/carpet/house/red/silver/diagonal
	name = "red silver diagonal house carpet"
	icon_state = "tile-carpet-house-red-silver-diagonal"
	turf_type = /turf/open/floor/rogue/carpet/house/red/silver/diagonal

/obj/item/stack/tile/carpet/house/red/silver/fancy
	name = "red silver fancy house carpet"
	icon_state = "tile-carpet-house-red-silver-fancy"
	turf_type = /turf/open/floor/rogue/carpet/house/red/silver/fancy

// Yellow variations
/obj/item/stack/tile/carpet/house/yellow/simple
	name = "yellow house carpet"
	icon_state = "tile-carpet-house-yellow-simple"
	turf_type = /turf/open/floor/rogue/carpet/house/yellow/simple

/obj/item/stack/tile/carpet/house/yellow/gold/diagonal
	name = "yellow gold diagonal house carpet"
	icon_state = "tile-carpet-house-yellow-gold-diagonal"
	turf_type = /turf/open/floor/rogue/carpet/house/yellow/gold/diagonal

/obj/item/stack/tile/carpet/house/yellow/gold/fancy
	name = "yellow gold fancy house carpet"
	icon_state = "tile-carpet-house-yellow-gold-fancy"
	turf_type = /turf/open/floor/rogue/carpet/house/yellow/gold/fancy

/obj/item/stack/tile/carpet/house/yellow/silver/diagonal
	name = "yellow silver diagonal house carpet"
	icon_state = "tile-carpet-house-yellow-silver-diagonal"
	turf_type = /turf/open/floor/rogue/carpet/house/yellow/silver/diagonal

/obj/item/stack/tile/carpet/house/yellow/silver/fancy
	name = "yellow silver fancy house carpet"
	icon_state = "tile-carpet-house-yellow-silver-fancy"
	turf_type = /turf/open/floor/rogue/carpet/house/yellow/silver/fancy

// Purple variations
/obj/item/stack/tile/carpet/house/purple/simple
	name = "purple house carpet"
	icon_state = "tile-carpet-house-purple-simple"
	turf_type = /turf/open/floor/rogue/carpet/house/purple/simple

/obj/item/stack/tile/carpet/house/purple/gold/diagonal
	name = "purple gold diagonal house carpet"
	icon_state = "tile-carpet-house-purple-gold-diagonal"
	turf_type = /turf/open/floor/rogue/carpet/house/purple/gold/diagonal

/obj/item/stack/tile/carpet/house/purple/gold/fancy
	name = "purple gold fancy house carpet"
	icon_state = "tile-carpet-house-purple-gold-fancy"
	turf_type = /turf/open/floor/rogue/carpet/house/purple/gold/fancy

/obj/item/stack/tile/carpet/house/purple/silver/diagonal
	name = "purple silver diagonal house carpet"
	icon_state = "tile-carpet-house-purple-silver-diagonal"
	turf_type = /turf/open/floor/rogue/carpet/house/purple/silver/diagonal

/obj/item/stack/tile/carpet/house/purple/silver/fancy
	name = "purple silver fancy house carpet"
	icon_state = "tile-carpet-house-purple-silver-fancy"
	turf_type = /turf/open/floor/rogue/carpet/house/purple/silver/fancy

// Blue variations
/obj/item/stack/tile/carpet/house/blue/simple
	name = "blue house carpet"
	icon_state = "tile-carpet-house-blue-simple"
	turf_type = /turf/open/floor/rogue/carpet/house/blue/simple

/obj/item/stack/tile/carpet/house/blue/gold/diagonal
	name = "blue gold diagonal house carpet"
	icon_state = "tile-carpet-house-blue-gold-diagonal"
	turf_type = /turf/open/floor/rogue/carpet/house/blue/gold/diagonal

/obj/item/stack/tile/carpet/house/blue/gold/fancy
	name = "blue gold fancy house carpet"
	icon_state = "tile-carpet-house-blue-gold-fancy"
	turf_type = /turf/open/floor/rogue/carpet/house/blue/gold/fancy

/obj/item/stack/tile/carpet/house/blue/silver/diagonal
	name = "blue silver diagonal house carpet"
	icon_state = "tile-carpet-house-blue-silver-diagonal"
	turf_type = /turf/open/floor/rogue/carpet/house/blue/silver/diagonal

/obj/item/stack/tile/carpet/house/blue/silver/fancy
	name = "blue silver fancy house carpet"
	icon_state = "tile-carpet-house-blue-silver-fancy"
	turf_type = /turf/open/floor/rogue/carpet/house/blue/silver/fancy

// Green variations
/obj/item/stack/tile/carpet/house/green/simple
	name = "green house carpet"
	icon_state = "tile-carpet-house-green-simple"
	turf_type = /turf/open/floor/rogue/carpet/house/green/simple

/obj/item/stack/tile/carpet/house/green/gold/diagonal
	name = "green gold diagonal house carpet"
	icon_state = "tile-carpet-house-green-gold-diagonal"
	turf_type = /turf/open/floor/rogue/carpet/house/green/gold/diagonal

/obj/item/stack/tile/carpet/house/green/gold/fancy
	name = "green gold fancy house carpet"
	icon_state = "tile-carpet-house-green-gold-fancy"
	turf_type = /turf/open/floor/rogue/carpet/house/green/gold/fancy

/obj/item/stack/tile/carpet/house/green/silver/diagonal
	name = "green silver diagonal house carpet"
	icon_state = "tile-carpet-house-green-silver-diagonal"
	turf_type = /turf/open/floor/rogue/carpet/house/green/silver/diagonal

/obj/item/stack/tile/carpet/house/green/silver/fancy
	name = "green silver fancy house carpet"
	icon_state = "tile-carpet-house-green-silver-fancy"
	turf_type = /turf/open/floor/rogue/carpet/house/green/silver/fancy

// White variations
/obj/item/stack/tile/carpet/house/white/simple
	name = "white house carpet"
	icon_state = "tile-carpet-house-white-simple"
	turf_type = /turf/open/floor/rogue/carpet/house/white/simple

/obj/item/stack/tile/carpet/house/white/gold/diagonal
	name = "white gold diagonal house carpet"
	icon_state = "tile-carpet-house-white-gold-diagonal"
	turf_type = /turf/open/floor/rogue/carpet/house/white/gold/diagonal

/obj/item/stack/tile/carpet/house/white/gold/fancy
	name = "white gold fancy house carpet"
	icon_state = "tile-carpet-house-white-gold-fancy"
	turf_type = /turf/open/floor/rogue/carpet/house/white/gold/fancy

/obj/item/stack/tile/carpet/house/white/silver/diagonal
	name = "white silver diagonal house carpet"
	icon_state = "tile-carpet-house-white-silver-diagonal"
	turf_type = /turf/open/floor/rogue/carpet/house/white/silver/diagonal

/obj/item/stack/tile/carpet/house/white/silver/fancy
	name = "white silver fancy house carpet"
	icon_state = "tile-carpet-house-white-silver-fancy"
	turf_type = /turf/open/floor/rogue/carpet/house/white/silver/fancy

/obj/item/stack/tile/carpet/fifty
	amount = 50

/obj/item/stack/tile/carpet/black/fifty
	amount = 50

/obj/item/stack/tile/carpet/blue/fifty
	amount = 50

/obj/item/stack/tile/carpet/cyan/fifty
	amount = 50

/obj/item/stack/tile/carpet/green/fifty
	amount = 50

/obj/item/stack/tile/carpet/orange/fifty
	amount = 50

/obj/item/stack/tile/carpet/purple/fifty
	amount = 50

/obj/item/stack/tile/carpet/red/fifty
	amount = 50

/obj/item/stack/tile/carpet/royalblack/fifty
	amount = 50

/obj/item/stack/tile/carpet/royalblue/fifty
	amount = 50


/obj/item/stack/tile/fakespace
	name = "astral carpet"
	singular_name = "astral carpet"
	desc = ""
	icon_state = "tile_space"
	item_state = "tile-space"
	turf_type = /turf/open/floor/fakespace
	resistance_flags = FLAMMABLE
	merge_type = /obj/item/stack/tile/fakespace

/obj/item/stack/tile/fakespace/loaded
	amount = 30

/obj/item/stack/tile/fakepit
	name = "fake pits"
	singular_name = "fake pit"
	desc = ""
	icon_state = "tile_pit"
	item_state = "tile-basalt"
	turf_type = /turf/open/floor/fakepit
	resistance_flags = FLAMMABLE
	merge_type = /obj/item/stack/tile/fakepit

/obj/item/stack/tile/fakepit/loaded
	amount = 30

//High-traction
/obj/item/stack/tile/noslip
	name = "high-traction floor tile"
	singular_name = "high-traction floor tile"
	desc = ""
	icon_state = "tile_noslip"
	item_state = "tile-noslip"
	turf_type = /turf/open/floor/noslip
	merge_type = /obj/item/stack/tile/noslip

/obj/item/stack/tile/noslip/thirty
	amount = 30

//Circuit
/obj/item/stack/tile/circuit
	name = "blue circuit tile"
	singular_name = "blue circuit tile"
	desc = ""
	icon_state = "tile_bcircuit"
	item_state = "tile-bcircuit"
	turf_type = /turf/open/floor/circuit

/obj/item/stack/tile/circuit/green
	name = "green circuit tile"
	singular_name = "green circuit tile"
	desc = ""
	icon_state = "tile_gcircuit"
	item_state = "tile-gcircuit"
	turf_type = /turf/open/floor/circuit/green

/obj/item/stack/tile/circuit/green/anim
	turf_type = /turf/open/floor/circuit/green/anim

/obj/item/stack/tile/circuit/red
	name = "red circuit tile"
	singular_name = "red circuit tile"
	desc = ""
	icon_state = "tile_rcircuit"
	item_state = "tile-rcircuit"
	turf_type = /turf/open/floor/circuit/red

/obj/item/stack/tile/circuit/red/anim
	turf_type = /turf/open/floor/circuit/red/anim

//Pod floor
/obj/item/stack/tile/pod
	name = "pod floor tile"
	singular_name = "pod floor tile"
	desc = ""
	icon_state = "tile_pod"
	item_state = "tile-pod"
	turf_type = /turf/open/floor/pod

/obj/item/stack/tile/pod/light
	name = "light pod floor tile"
	singular_name = "light pod floor tile"
	desc = ""
	icon_state = "tile_podlight"
	turf_type = /turf/open/floor/pod/light

/obj/item/stack/tile/pod/dark
	name = "dark pod floor tile"
	singular_name = "dark pod floor tile"
	desc = ""
	icon_state = "tile_poddark"
	turf_type = /turf/open/floor/pod/dark

//Plasteel (normal)
/obj/item/stack/tile/plasteel
	name = "floor tile"
	singular_name = "floor tile"
	desc = ""
	icon_state = "tile"
	item_state = "tile"
	force = 6
	custom_materials = list(/datum/material/iron=500)
	throwforce = 10
	flags_1 = CONDUCT_1
	turf_type = /turf/open/floor/plasteel
	mineralType = "metal"
	armor = list("blunt" = 0, "slash" = 0, "stab" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 70)
	resistance_flags = FIRE_PROOF

/obj/item/stack/tile/plasteel/cyborg
	desc = "" //Not the usual floor tile desc as that refers to throwing, Cyborgs can't do that - RR
	custom_materials = null // All other Borg versions of items have no Metal or Glass - RR
	is_cyborg = 1
	cost = 125

/obj/item/stack/tile/plastic
	name = "plastic tile"
	singular_name = "plastic floor tile"
	desc = ""
	icon_state = "tile_plastic"
	custom_materials = list(/datum/material/plastic=500)
	turf_type = /turf/open/floor/plastic

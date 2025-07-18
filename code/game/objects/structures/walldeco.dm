
/obj/structure/fluff/walldeco
	name = ""
	desc = ""
	icon = 'icons/roguetown/misc/decoration.dmi'
	anchored = TRUE
	density = FALSE
	max_integrity = 0
	layer = ABOVE_MOB_LAYER+0.1

/obj/structure/fluff/walldeco/OnCrafted(dirin, user)
	pixel_x = 0
	pixel_y = 0
	switch(dirin)
		if(NORTH)
			pixel_y = 32
		if(SOUTH)
			pixel_y = -32
		if(EAST)
			pixel_x = 32
		if(WEST)
			pixel_x = -32
	. = ..()

/obj/structure/fluff/walldeco/proc/get_attached_wall()
	return

/obj/structure/fluff/walldeco/wantedposter
	name = "bandit notice"
	desc = ""
	icon_state = "wanted1"
	layer = BELOW_MOB_LAYER
	pixel_y = 32

/obj/structure/fluff/walldeco/wantedposter/r
	pixel_y = 0
	pixel_x = 32
/obj/structure/fluff/walldeco/wantedposter/l
	pixel_y = 0
	pixel_x = -32

/obj/structure/fluff/walldeco/wantedposter/Initialize()
	. = ..()
	icon_state = "wanted[rand(1,3)]"
	dir = pick(GLOB.cardinals)

/obj/structure/fluff/walldeco/wantedposter/examine(mob/user)
	. = ..()
	if(user.Adjacent(src))
		if(SSrole_class_handler.bandits_in_round)
			. += span_bold("I see that bandits are active in the region.")
			user.playsound_local(user, 'sound/misc/notice (2).ogg', 100, FALSE)
		else
			. += span_bold("There doesn't seem to be any reports of bandit activity.")

/obj/structure/fluff/walldeco/innsign
	name = "sign"
	desc = ""
	icon_state = "bar"
	layer = ABOVE_MOB_LAYER

/obj/structure/fluff/walldeco/steward
	name = "sign"
	desc = ""
	icon_state = "steward"
	layer = ABOVE_MOB_LAYER

/obj/structure/fluff/walldeco/bsmith
	name = "sign"
	desc = ""
	icon = 'icons/roguetown/misc/tallstructure.dmi'
	icon_state = "bsmith"
	layer = ABOVE_MOB_LAYER

/obj/structure/fluff/walldeco/goblet
	name = "sign"
	desc = ""
	icon = 'icons/roguetown/misc/tallstructure.dmi'
	icon_state = "goblet"
	layer = ABOVE_MOB_LAYER

/obj/structure/fluff/walldeco/sparrowflag
	name = "sparrow flag"
	desc = ""
	icon_state = "sparrow"

/obj/structure/fluff/walldeco/xavo
	name = "xavo flag"
	desc = ""
	icon_state = "xavo"

/obj/structure/fluff/walldeco/serpflag
	name = "serpent flag"
	desc = ""
	icon_state = "serpent"

/obj/structure/fluff/walldeco/artificerflag
	name = "Artificer's Guild"
	desc = ""
	icon_state = "artificer"

/obj/structure/fluff/walldeco/maidendrape
	name = "black drape"
	desc = "A drape of fabric."
	icon_state = "black_drape"
	dir = SOUTH
	pixel_y = 32

/obj/structure/fluff/walldeco/wallshield
	name = ""
	desc = ""
	icon_state = "wallshield"

/obj/structure/fluff/walldeco/psybanner
	name = "banner"
	icon_state = "Psybanner-PURPLE"

/obj/structure/fluff/walldeco/psybanner/red
	icon_state = "Psybanner-RED"

/obj/structure/fluff/walldeco/stone
	name = ""
	desc = ""
	icon_state = "walldec1"
	mouse_opacity = 0

/obj/structure/fluff/walldeco/church/line
	name = ""
	desc = ""
	icon_state = "churchslate"
	mouse_opacity = 0
	layer = BELOW_MOB_LAYER+0.1

/obj/structure/fluff/walldeco/stone/Initialize()
	icon_state = "walldec[rand(1,6)]"
	return ..()

/obj/structure/fluff/walldeco/maidensigil
	name = "stone sigil"
	desc = ""
	icon_state = "maidensigil"
	mouse_opacity = 0
	dir = SOUTH
	pixel_y = 32

/obj/structure/fluff/walldeco/maidensigil/r
	dir = WEST
	pixel_x = 16

/obj/structure/fluff/walldeco/bigpainting
	name = "painting"
	icon = 'icons/roguetown/misc/64x64.dmi'
	icon_state = "sherwoods"
	pixel_y = 32
	pixel_x = -16

/obj/structure/fluff/walldeco/bigpainting/lake
	icon_state = "lake"

/obj/structure/fluff/walldeco/mona
	name = "painting"
	icon = 'icons/roguetown/misc/tallstructure.dmi'
	icon_state = "mona"
	pixel_y = 32

/obj/structure/fluff/walldeco/chains
	name = "hanging chains"
	alpha = 180
	layer = 4.26
	icon_state = "chains1"
	icon = 'icons/roguetown/misc/tallstructure.dmi'
	can_buckle = 1
	buckle_lying = 0
	breakoutextra = 10 MINUTES
	buckleverb = "tie"
	smeltresult = /obj/item/rope/chain

/obj/structure/fluff/walldeco/chains/Initialize()
	icon_state = "chains[rand(1,8)]"
	return ..()

/obj/structure/fluff/walldeco/customflag
	name = "Crystal Keep flag"
	desc = ""
	icon_state = "wallflag"

/obj/structure/fluff/walldeco/customflag/Initialize()
	. = ..()
	if(GLOB.lordprimary)
		lordcolor(GLOB.lordprimary,GLOB.lordsecondary)
	else
		GLOB.lordcolor += src

/obj/structure/fluff/walldeco/customflag/Destroy()
	GLOB.lordcolor -= src
	return ..()

/obj/structure/fluff/walldeco/customflag/lordcolor(primary,secondary)
	if(!primary || !secondary)
		return
	var/mutable_appearance/M = mutable_appearance(icon, "wallflag_primary", -(layer+0.1))
	M.color = primary
	add_overlay(M)
	M = mutable_appearance(icon, "wallflag_secondary", -(layer+0.1))
	M.color = secondary
	add_overlay(M)
	GLOB.lordcolor -= src

/obj/structure/fluff/walldeco/moon
	name = "banner"
	icon_state = "moon"

/obj/structure/fluff/walldeco/rpainting
	name = "painting"
	icon_state = "painting_1"

/obj/structure/fluff/walldeco/rpainting/forest
	icon_state = "painting_2"

/obj/structure/fluff/walldeco/rpainting/crown
	icon_state = "painting_3"

//House stuff

/obj/structure/fluff/walldeco/house
	icon = 'icons/roguetown/misc/housemisc/decoration.dmi'
	icon_state = "banner1green"
	name = "House Banner"
	desc = ""

//Green
/obj/structure/fluff/walldeco/house/green/plain
	icon_state = "banner1green"
	name = "Green Banner"

/obj/structure/fluff/walldeco/house/green/soldary
	icon_state = "banner2green"
	name = "Green Banner"

/obj/structure/fluff/walldeco/house/green/checkered
	icon_state = "banner3green"
	name = "Checkered Green Banner"

/obj/structure/fluff/walldeco/house/green/tree
	icon_state = "banner4green"
	name = "Green Symbol Banner"

/obj/structure/fluff/walldeco/house/green/silver
	icon_state = "banner5green"
	name = "Green Plated Banner"

/obj/structure/fluff/walldeco/house/green/gold
	icon_state = "banner6green"
	name = "Green Gold Banner"

//red
/obj/structure/fluff/walldeco/house/red/plain
    icon_state = "banner1red"
    name = "Red Banner"

/obj/structure/fluff/walldeco/house/red/soldary
    icon_state = "banner2red"
    name = "Red Banner"

/obj/structure/fluff/walldeco/house/red/checkered
    icon_state = "banner3red"
    name = "Checkered Red Banner"

/obj/structure/fluff/walldeco/house/red/tree
    icon_state = "banner4red"
    name = "Red Symbol Banner"

/obj/structure/fluff/walldeco/house/red/silver
    icon_state = "banner5red"
    name = "Red Plated Banner"

/obj/structure/fluff/walldeco/house/red/gold
    icon_state = "banner6red"
    name = "Red Gold Banner"

//yellow

/obj/structure/fluff/walldeco/house/yellow/plain
    icon_state = "banner1yellow"
    name = "Yellow Banner"

/obj/structure/fluff/walldeco/house/yellow/soldary
    icon_state = "banner2yellow"
    name = "Yellow Banner"

/obj/structure/fluff/walldeco/house/yellow/checkered
    icon_state = "banner3yellow"
    name = "Checkered Yellow Banner"

/obj/structure/fluff/walldeco/house/yellow/tree
    icon_state = "banner4yellow"
    name = "Yellow Symbol Banner"

/obj/structure/fluff/walldeco/house/yellow/silver
    icon_state = "banner5yellow"
    name = "Yellow Plated Banner"

/obj/structure/fluff/walldeco/house/yellow/gold
    icon_state = "banner6yellow"
    name = "Yellow Gold Banner"

//Purple

/obj/structure/fluff/walldeco/house/purple/plain
    icon_state = "banner1purple"
    name = "Purple Banner"

/obj/structure/fluff/walldeco/house/purple/soldary
    icon_state = "banner2purple"
    name = "Purple Banner"

/obj/structure/fluff/walldeco/house/purple/checkered
    icon_state = "banner3purple"
    name = "Checkered Purple Banner"

/obj/structure/fluff/walldeco/house/purple/tree
    icon_state = "banner4purple"
    name = "Purple Symbol Banner"

/obj/structure/fluff/walldeco/house/purple/silver
    icon_state = "banner5purple"
    name = "Purple Plated Banner"

/obj/structure/fluff/walldeco/house/purple/gold
    icon_state = "banner6purple"
    name = "Purple Gold Banner"

//Blue

/obj/structure/fluff/walldeco/house/blue/plain
    icon_state = "banner1blue"
    name = "Blue Banner"

/obj/structure/fluff/walldeco/house/blue/soldary
    icon_state = "banner2blue"
    name = "Blue Banner"

/obj/structure/fluff/walldeco/house/blue/checkered
    icon_state = "banner3blue"
    name = "Checkered Blue Banner"

/obj/structure/fluff/walldeco/house/blue/tree
    icon_state = "banner4blue"
    name = "Blue Symbol Banner"

/obj/structure/fluff/walldeco/house/blue/silver
    icon_state = "banner5blue"
    name = "Blue Plated Banner"

/obj/structure/fluff/walldeco/house/blue/gold
    icon_state = "banner6blue"
    name = "Blue Gold Banner"

//white
/obj/structure/fluff/walldeco/house/white/plain
    icon_state = "banner1white"
    name = "White Banner"

/obj/structure/fluff/walldeco/house/white/soldary
    icon_state = "banner2white"
    name = "White Banner"

/obj/structure/fluff/walldeco/house/white/checkered
    icon_state = "banner3white"
    name = "Checkered White Banner"

/obj/structure/fluff/walldeco/house/white/tree
    icon_state = "banner4white"
    name = "White Symbol Banner"

/obj/structure/fluff/walldeco/house/white/silver
    icon_state = "banner5white"
    name = "White Plated Banner"

/obj/structure/fluff/walldeco/house/white/gold
    icon_state = "banner6white"
    name = "White Gold Banner"

//black

/obj/structure/fluff/walldeco/house/black/plain
    icon_state = "banner1black"
    name = "Black Banner"

/obj/structure/fluff/walldeco/house/black/soldary
    icon_state = "banner2black"
    name = "Black Banner"

/obj/structure/fluff/walldeco/house/black/checkered
    icon_state = "banner3black"
    name = "Checkered Black Banner"

/obj/structure/fluff/walldeco/house/black/tree
    icon_state = "banner4black"
    name = "Black Symbol Banner"

/obj/structure/fluff/walldeco/house/black/silver
    icon_state = "banner5black"
    name = "Black Plated Banner"

/obj/structure/fluff/walldeco/house/black/gold
    icon_state = "banner6black"
    name = "Black Gold Banner"


//big paintings
/obj/structure/fluff/walldeco/bigpainting/house
	icon = 'icons/roguetown/misc/housemisc/64x64.dmi'
	icon_state = "paintwidegreen1_deployed"

/obj/structure/fluff/walldeco/bigpainting/house/green/scenery
	icon_state = "paintwidegreen1_deployed"

/obj/structure/fluff/walldeco/bigpainting/house/green/figures
	icon_state = "paintwidegreen2_deployed"

/obj/structure/fluff/walldeco/bigpainting/house/red/scenery
	icon_state = "paintwidered1_deployed"

/obj/structure/fluff/walldeco/bigpainting/house/red/figures
	icon_state = "paintwidered2_deployed"

/obj/structure/fluff/walldeco/bigpainting/house/yellow/scenery
	icon_state = "paintwideyellow1_deployed"

/obj/structure/fluff/walldeco/bigpainting/house/yellow/figures
	icon_state = "paintwideyellow2_deployed"

/obj/structure/fluff/walldeco/bigpainting/house/purple/scenery
	icon_state = "paintwidepurple1_deployed"

/obj/structure/fluff/walldeco/bigpainting/house/purple/figures
	icon_state = "paintwidepurple2_deployed"

/obj/structure/fluff/walldeco/bigpainting/house/blue/scenery
	icon_state = "paintwideblue1_deployed"

/obj/structure/fluff/walldeco/bigpainting/house/blue/figures
	icon_state = "paintwideblue2_deployed"

/obj/structure/fluff/walldeco/bigpainting/house/white/scenery
	icon_state = "paintwidewhite1_deployed"

/obj/structure/fluff/walldeco/bigpainting/house/white/figures
	icon_state = "paintwidewhite2_deployed"

/obj/structure/fluff/walldeco/bigpainting/house/black/scenery
	icon_state = "paintwideblack1_deployed"

/obj/structure/fluff/walldeco/bigpainting/house/black/figures
	icon_state = "paintwideblack2_deployed"

//tall ones

/obj/structure/fluff/walldeco/mona/house
	icon = 'icons/roguetown/misc/housemisc/tallstructure.dmi'
	icon_state = "painttallgreen1_deployed"

/obj/structure/fluff/walldeco/mona/house/green/baron
	icon_state = "painttallgreen1_deployed"

/obj/structure/fluff/walldeco/mona/house/green/knight
	icon_state = "painttallgreen2_deployed"

/obj/structure/fluff/walldeco/mona/house/red/baron
	icon_state = "painttallred1_deployed"

/obj/structure/fluff/walldeco/mona/house/red/knight
	icon_state = "painttallred2_deployed"

/obj/structure/fluff/walldeco/mona/house/yellow/baron
	icon_state = "painttallyellow1_deployed"

/obj/structure/fluff/walldeco/mona/house/yellow/knight
	icon_state = "painttallyellow2_deployed"

/obj/structure/fluff/walldeco/mona/house/purple/baron
	icon_state = "painttallpurple1_deployed"

/obj/structure/fluff/walldeco/mona/house/purple/knight
	icon_state = "painttallpurple2_deployed"

/obj/structure/fluff/walldeco/mona/house/blue/baron
	icon_state = "painttallblue1_deployed"

/obj/structure/fluff/walldeco/mona/house/blue/knight
	icon_state = "painttallblue2_deployed"

/obj/structure/fluff/walldeco/mona/house/white/baron
	icon_state = "painttallwhite1_deployed"

/obj/structure/fluff/walldeco/mona/house/white/knight
	icon_state = "painttallwhite2_deployed"

/obj/structure/fluff/walldeco/mona/house/black/baron
	icon_state = "painttallblack1_deployed"

/obj/structure/fluff/walldeco/mona/house/black/knight
	icon_state = "painttallblack2_deployed"

/obj/item/clothing/suit/roguetown/shirt
	slot_flags = ITEM_SLOT_SHIRT
	body_parts_covered = CHEST|VITALS
	icon = 'icons/roguetown/clothing/shirts.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/shirts.dmi'
	equip_sound = 'sound/blank.ogg'
	drop_sound = 'sound/blank.ogg'
	pickup_sound =  'sound/blank.ogg'
	sleeved = 'icons/roguetown/clothing/onmob/helpers/sleeves_shirts.dmi'
	sleevetype = "shirt"
	edelay_type = 1
	equip_delay_self = 25
	bloody_icon_state = "bodyblood"
	boobed = TRUE
	sewrepair = TRUE
	flags_inv = HIDEBOOB
	w_class = WEIGHT_CLASS_SMALL

/obj/item/clothing/suit/roguetown/shirt/undershirt
	name = "shirt"
	desc = ""
	icon_state = "undershirt"
	item_state = "undershirt"
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	body_parts_covered = CHEST|ARMS|VITALS

/obj/item/clothing/suit/roguetown/shirt/undershirt/priest
	name = "undervestments"
	desc = ""
	icon_state = "priestunder"
	sleeved = null
	allowed_sex = list(MALE, FEMALE)
	allowed_race = NON_DWARVEN_RACE_TYPES

/obj/item/clothing/suit/roguetown/shirt/undershirt/black
	color = CLOTHING_BLACK

/obj/item/clothing/suit/roguetown/shirt/undershirt/purple
	color = CLOTHING_PURPLE

/obj/item/clothing/suit/roguetown/shirt/undershirt/brown
	color = "#6b5445"

/obj/item/clothing/suit/roguetown/shirt/undershirt/lord
	desc = ""
	color = "#616898"

/obj/item/clothing/suit/roguetown/shirt/undershirt/red
	color = "#851a16"

/obj/item/clothing/suit/roguetown/shirt/undershirt/guard
	color = CLOTHING_RED

/obj/item/clothing/suit/roguetown/shirt/undershirt/guard/Initialize()
	. = ..()
	if(GLOB.lordprimary)
		lordcolor(GLOB.lordprimary,GLOB.lordsecondary)
	else
		GLOB.lordcolor += src

/obj/item/clothing/suit/roguetown/shirt/undershirt/guard/Destroy()
	GLOB.lordcolor -= src
	return ..()


/obj/item/clothing/suit/roguetown/shirt/undershirt/guardsecond
	color = CLOTHING_PURPLE

/obj/item/clothing/suit/roguetown/shirt/undershirt/guardsecond/Initialize()
	. = ..()
	if(GLOB.lordprimary)
		lordcolor(GLOB.lordprimary,GLOB.lordsecondary)
	else
		GLOB.lordcolor += src

/obj/item/clothing/suit/roguetown/shirt/undershirt/guardsecond/lordcolor(primary,secondary)
	if(secondary)
		color = secondary

/obj/item/clothing/suit/roguetown/shirt/undershirt/guardsecond/Destroy()
	GLOB.lordcolor -= src
	return ..()

/obj/item/clothing/suit/roguetown/shirt/undershirt/random/Initialize()
	color = pick("#6b5445", "#435436", "#704542", "#79763f")
	return ..()

/obj/item/clothing/suit/roguetown/shirt/undershirt/puritan
	name = "formal silks"
	icon_state = "puritan_shirt"
	allowed_race = CLOTHED_RACES_TYPES
	salvage_result = /obj/item/natural/silk

/obj/item/clothing/suit/roguetown/shirt/undershirt/sailor
	icon_state = "sailorblues"

/obj/item/clothing/suit/roguetown/shirt/undershirt/sailor/red
	icon_state = "sailorreds"

/obj/item/clothing/suit/roguetown/shirt/undershirt/vagrant
	r_sleeve_status = SLEEVE_TORN
	body_parts_covered = CHEST|ARM_LEFT|VITALS
	torn_sleeve_number = 1

/obj/item/clothing/suit/roguetown/shirt/undershirt/vagrant/l
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_TORN
	body_parts_covered = CHEST|ARM_RIGHT|VITALS

/obj/item/clothing/suit/roguetown/shirt/undershirt/vagrant/Initialize()
	color = pick("#6b5445", "#435436", "#704542", "#79763f")
	return ..()

/obj/item/clothing/suit/roguetown/shirt/shortshirt
	name = "shirt"
	desc = "A simple shirt."
	icon_state = "shortshirt"
	item_state = "shortshirt"
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL

/obj/item/clothing/suit/roguetown/shirt/shortshirt/random/Initialize()
	color = pick("#6b5445", "#435436", "#704542", "#79763f")
	return ..()

/obj/item/clothing/suit/roguetown/shirt/shortshirt/merc
	name = "shirt"
	desc = ""
	icon_state = "shortshirt"
	item_state = "shortshirt"
	r_sleeve_status = SLEEVE_TORN
	l_sleeve_status = SLEEVE_TORN
	body_parts_covered = CHEST|VITALS
	torn_sleeve_number = 2

/obj/item/clothing/suit/roguetown/shirt/shortshirt/bog
	color = "#9ac878"

/obj/item/clothing/suit/roguetown/shirt/rags
	slot_flags = ITEM_SLOT_ARMOR
	name = "rags"
	desc = "Better than going naked? You be the judge."
	body_parts_covered = CHEST|GROIN|VITALS
	color = "#b0b0b0"
	icon_state = "rags"
	item_state = "rags"
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	flags_inv = HIDECROTCH|HIDEBOOB
	fiber_salvage = FALSE

/obj/item/clothing/suit/roguetown/shirt/tunic
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT
	name = "tunic"
	desc = ""
	body_parts_covered = CHEST|GROIN|VITALS
	boobed = FALSE
	icon_state = "tunic"
	item_state = "undershirt"
	sleevetype = "tunic"
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	flags_inv = HIDECROTCH|HIDEBOOB

/obj/item/clothing/suit/roguetown/shirt/tunic/green
	color = CLOTHING_GREEN

/obj/item/clothing/suit/roguetown/shirt/tunic/blue
	color = CLOTHING_BLUE

/obj/item/clothing/suit/roguetown/shirt/tunic/red
	color = CLOTHING_RED

/obj/item/clothing/suit/roguetown/shirt/tunic/purple
	color = CLOTHING_PURPLE

/obj/item/clothing/suit/roguetown/shirt/tunic/white
	color = CLOTHING_WHITE

/obj/item/clothing/suit/roguetown/shirt/tunic/ucolored
	color = COLOR_GRAY

/obj/item/clothing/suit/roguetown/shirt/tunic/random/Initialize()
	color = pick(CLOTHING_PURPLE, CLOTHING_RED, CLOTHING_BLUE, CLOTHING_GREEN)
	return ..()

/obj/item/clothing/suit/roguetown/shirt/dress
	slot_flags = ITEM_SLOT_ARMOR
	name = "dress"
	desc = ""
	body_parts_covered = CHEST|GROIN|LEGS|VITALS
	icon_state = "dress"
	item_state = "dress"
	allowed_sex = list(MALE, FEMALE)
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	flags_inv = HIDECROTCH|HIDEBOOB

/obj/item/clothing/suit/roguetown/shirt/dress/gen
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT
	name = "dress"
	desc = ""
	body_parts_covered = CHEST|GROIN|LEGS|VITALS
	icon_state = "dressgen"
	item_state = "dressgen"
	color = "#6b5445"

/obj/item/clothing/suit/roguetown/shirt/dress/gen/black
	color = CLOTHING_BLACK

/obj/item/clothing/suit/roguetown/shirt/dress/gen/blue
	color = CLOTHING_BLUE

/obj/item/clothing/suit/roguetown/shirt/dress/gen/purple
	color = CLOTHING_PURPLE

/obj/item/clothing/suit/roguetown/shirt/dress/gen/random/Initialize()
	color = pick("#6b5445", "#435436", "#704542", "#79763f", CLOTHING_BLUE)
	return ..()

/obj/item/clothing/suit/roguetown/shirt/dress/silkdress
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT
	name = "chemise"
	desc = "Comfortable yet elegant, it offers both style and comfort for everyday wear"
	body_parts_covered = CHEST|GROIN|LEGS|VITALS
	icon_state = "silkdress"
	item_state = "silkdress"
	color = "#e6e5e5"

/obj/item/clothing/suit/roguetown/shirt/dress/silkdress/black
	color = CLOTHING_BLACK

/obj/item/clothing/suit/roguetown/shirt/dress/silkdress/green
	color = CLOTHING_DARK_GREEN

/obj/item/clothing/suit/roguetown/shirt/dress/silkdress/random/Initialize()
	. = ..()
	color = pick("#e6e5e5", "#52BE80", "#C39BD3", "#EC7063","#5DADE2")

// 
//   Velvet Dress
//

/obj/item/clothing/suit/roguetown/shirt/dress/velvetdress
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT
	name = "velvet dress"
	desc = "A dress made with the finest velvet, befitting a person of high standing"
	body_parts_covered = CHEST|GROIN|LEGS|VITALS
	icon = 'icons/roguetown/clothing/nobledresses/shirts.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/nobledresses/onmob/shirts.dmi'
	icon_state = "velvetdress"
	item_state = "velvetdress"

/obj/item/clothing/suit/roguetown/shirt/dress/velvetdress/black
	color = CLOTHING_BLACK

/obj/item/clothing/suit/roguetown/shirt/dress/velvetdress/green
	color = CLOTHING_DARK_GREEN

/obj/item/clothing/suit/roguetown/shirt/dress/velvetdress/random/Initialize()
	. = ..()
	color = pick("#e6e5e5", "#52BE80", "#C39BD3", "#EC7063","#5DADE2")

// 
//   Noble dress
//

/obj/item/clothing/suit/roguetown/shirt/dress/nobledress
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT
	name = "noble dress"
	desc = "a noble dress, fit for a person of high standing"
	body_parts_covered = CHEST|GROIN|LEGS|VITALS
	icon = 'icons/roguetown/clothing/nobledresses/shirts.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/nobledresses/onmob/shirts.dmi'
	icon_state = "nobledress"
	item_state = "nobledress"

/obj/item/clothing/suit/roguetown/shirt/dress/nobledress/black
	color = CLOTHING_BLACK

/obj/item/clothing/suit/roguetown/shirt/dress/nobledress/green
	color = CLOTHING_DARK_GREEN

/obj/item/clothing/suit/roguetown/shirt/dress/nobledress/random/Initialize()
	. = ..()
	color = pick("#e6e5e5", "#52BE80", "#C39BD3", "#EC7063","#5DADE2")


/obj/item/clothing/suit/roguetown/shirt/dress/gen/sexy
	slot_flags = ITEM_SLOT_ARMOR
	name = "dress"
	desc = ""
	body_parts_covered = null
	icon_state = "sexydress"
	sleevetype = null
	sleeved = null
	color = "#a90707"

/obj/item/clothing/suit/roguetown/shirt/dress/gen/sexy/Initialize()
	. = ..()
	color = pick("#a90707", "#16239a", "#d68fbd", CLOTHING_BLACK)

/obj/item/clothing/suit/roguetown/shirt/undershirt/webs
	name = "webbed shirt"
	desc = "Exotic silk finely woven into.. this? Might as well be wearing a spiderweb"
	icon_state = "webs"
	item_state = "webs"
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	body_parts_covered = CHEST|ARMS|VITALS
	color = null
	salvage_amount = 1
	salvage_result = /obj/item/natural/silk

/obj/item/clothing/suit/roguetown/shirt/jester
	slot_flags = ITEM_SLOT_SHIRT|ITEM_SLOT_ARMOR
	name = "jester's tunick"
	desc = ""
	body_parts_covered = CHEST|GROIN|ARMS|VITALS
	icon_state = "jestershirt"
	icon = 'icons/roguetown/clothing/shirts.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/shirts.dmi'
	sleeved = 'icons/roguetown/clothing/onmob/shirts.dmi'
	boobed = TRUE
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	flags_inv = HIDECROTCH|HIDEBOOB

/obj/item/clothing/suit/roguetown/shirt/grenzelhoft
	slot_flags = ITEM_SLOT_SHIRT|ITEM_SLOT_ARMOR
	name = "grenzelhoftian hip-shirt"
	desc = ""
	body_parts_covered = CHEST|GROIN|ARMS|VITALS
	icon_state = "grenzelshirt"
	sleeved = 'icons/roguetown/clothing/onmob/helpers/stonekeep_merc.dmi'
	boobed = TRUE
	detail_tag = "_detail"
	detail_color = CLOTHING_WHITE
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	var/picked = FALSE
	colorgrenz = TRUE

/obj/item/clothing/suit/roguetown/shirt/grenzelhoft/attack_right()
	..()
	if(!picked)
		var/list/colors = list(
		"PURPLE"="#865c9c",
		"RED"="#933030",
		"BROWN"="#685542",
		"GREEN"="#79763f",
		"BLUE"="#395480",
		"YELLOW"="#b5b004",
		"TEAL"="#249589",
		"WHITE"="#ffffff",
		"ORANGE"="#b86f0c",
		"MAJENTA"="#962e5c")

		var/mob/living/carbon/human/L = loc
		var/choice = input(L, "Choose a color.", "GRENZELHOFTIAN COLORPLEX") as anything in colors
		var/playerchoice = colors[choice]
		picked = TRUE
		detail_color = playerchoice
		update_icon()
		for(var/obj/item/clothing/V in L.get_equipped_items(FALSE))
			testing("clothes to color are [V]")
			if(V.colorgrenz)
				V.detail_color = playerchoice
				V.update_icon()
		L.regenerate_icons()



/obj/item/clothing/suit/roguetown/shirt/grenzelhoft/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)



//villager core


/obj/item/clothing/suit/roguetown/shirt/dress/villager
	slot_flags = ITEM_SLOT_ARMOR
	name = "Walnutian Dress"
	desc = ""
	body_parts_covered = CHEST|GROIN|LEGS|VITALS
	icon_state = "villager_w1_dress"
	item_state = "villager_w1_dress"
	allowed_sex = list(FEMALE)

/obj/item/clothing/suit/roguetown/shirt/tunic/villager
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT
	name = "Walnutian Tunic"
	desc = ""
	body_parts_covered = CHEST|GROIN|VITALS
	icon_state = "millager_m1_shirt"
	item_state = "millager_m1_shirt"
	sleevetype = null
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	flags_inv = HIDECROTCH|HIDEBOOB

/obj/item/clothing/suit/roguetown/shirt/rags/orphan
	slot_flags = ITEM_SLOT_SHIRT
	name = "thin rags"
	desc = "paper thin, so cold..."
	body_parts_covered = CHEST|GROIN|VITALS
	icon_state = "villager_orphan_shirt"
	item_state = "villager_orphan_shirt"



///HOUSE CORE


/obj/item/clothing/suit/roguetown/shirt/dress/housegreen
	slot_flags = ITEM_SLOT_SHIRT
	name = "Guild Mage Girdle"
	desc = ""
	body_parts_covered = CHEST|GROIN|LEGS|VITALS
	icon = 'icons/roguetown/clothing/nobledresses/shirts.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/nobledresses/onmob/shirts.dmi'
	icon_state = "house_green_witch_shirt"
	item_state = "house_green_witch_shirt"
	allowed_sex = list(FEMALE)


/obj/item/clothing/suit/roguetown/shirt/dress/housered
	slot_flags = ITEM_SLOT_ARMOR
	name = "Alrich Robes"
	desc = "These look like they've been cut shorter"
	body_parts_covered = CHEST|GROIN|VITALS
	icon_state = "house_red_witch_dress"
	item_state = "house_red_witch_dress"
	allowed_sex = list(FEMALE)

/obj/item/clothing/suit/roguetown/shirt/dress/houseyellow
	slot_flags = ITEM_SLOT_SHIRT
	name = "Bravado Dressing"
	desc = ""
	body_parts_covered = CHEST|GROIN|VITALS
	icon_state = "house_yellow_witch_dress"
	item_state = "house_yellow_witch_dress"
	allowed_sex = list(FEMALE)

/obj/item/clothing/suit/roguetown/shirt/dress/housepurple
	slot_flags = ITEM_SLOT_ARMOR
	name = "Caesar Robes"
	desc = ""
	body_parts_covered = CHEST|GROIN|VITALS
	icon_state = "house_purple_witch_dress"
	item_state = "house_purple_witch_dress"
	allowed_sex = list(FEMALE)

/obj/item/clothing/suit/roguetown/shirt/dress/houseblue
	slot_flags = ITEM_SLOT_ARMOR
	name = "Deleon Robes"
	desc = "Revealing"
	body_parts_covered = CHEST|VITALS
	icon_state = "house_blue_witch_dress"
	item_state = "house_blue_witch_dress"
	allowed_sex = list(FEMALE)

/obj/item/clothing/suit/roguetown/shirt/dress/houseblack
	slot_flags = ITEM_SLOT_SHIRT
	name = "Court Magos Top"
	desc = ""
	body_parts_covered = CHEST
	icon_state = "house_black_witch_dress"
	item_state = "house_black_witch_dress"
	allowed_sex = list(FEMALE)
	toggle_icon_state = FALSE
	hoodtype = /obj/item/clothing/head/roguetown/wizhat/house/black 

/obj/item/clothing/suit/roguetown/shirt/dress/houseblack/wash_act(clean)
	. = ..()
	if(hood)
		wash_atom(hood, clean)

/obj/item/clothing/suit/roguetown/shirt/dress/houseblack/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/storage/concrete)
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	if(STR)
		STR.max_combined_w_class = 3
		STR.max_w_class = WEIGHT_CLASS_NORMAL
		STR.max_items = 1

/obj/item/clothing/suit/roguetown/shirt/dress/houseblack/dropped(mob/living/carbon/human/user)
	..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	if(STR)
		var/list/things = STR.contents()
		for(var/obj/item/I in things)
			STR.remove_from_storage(I, get_turf(src))



/obj/item/clothing/suit/roguetown/shirt/dress/housewhite
	slot_flags = ITEM_SLOT_SHIRT
	name = "Church Magus Girdle"
	desc = ""
	body_parts_covered = CHEST|VITALS
	icon_state = "house_white_witch_dress"
	item_state = "house_white_witch_dress"
	allowed_sex = list(FEMALE)

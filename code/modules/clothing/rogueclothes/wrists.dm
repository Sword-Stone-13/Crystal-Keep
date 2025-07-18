/obj/item/clothing/wrists/roguetown
	slot_flags = ITEM_SLOT_WRISTS
	sleeved = 'icons/roguetown/clothing/onmob/wrists.dmi'
	icon = 'icons/roguetown/clothing/wrists.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/wrists.dmi'
	sleevetype = "shirt"
	w_class = WEIGHT_CLASS_SMALL
	sewrepair = TRUE
	fiber_salvage = FALSE

/obj/item/clothing/wrists/roguetown/bracers
	name = "bracers"
	desc = ""
	body_parts_covered = ARMS
	icon_state = "bracers"
	item_state = "bracers"
	armor = list("blunt" = 90, "slash" = 100, "stab" = 80, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	armor_class = ARMOR_CLASS_MEDIUM
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	blocksound = PLATEHIT
	max_integrity = 300
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel
	sewrepair = FALSE

/obj/item/clothing/wrists/roguetown/bracers/leather
	name = "leather bracers"
	desc = "Leather bracers worn on the wrists."
	icon_state = "lbracers"
	item_state = "lbracers"
	armor = list("blunt" = 32, "slash" = 12, "stab" = 22, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	armor_class = ARMOR_CLASS_LIGHT
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_BLUNT, BCLASS_TWIST)
	resistance_flags = null
	blocksound = SOFTHIT
	max_integrity = 200
	blade_dulling = DULLING_BASHCHOP
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	anvilrepair = null
	sewrepair = TRUE
	salvage_amount = 1
	salvage_result = /obj/item/natural/hide/cured

/obj/item/clothing/wrists/roguetown/bracers/leather/advanced
	name = "hardened leather bracers"
	desc = "Hardened leather braces that will keep your wrists safe from bludgeoning."
	icon_state = "albracers"
	armor = list("blunt" = 60, "slash" = 40, "stab" = 20, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	armor_class = ARMOR_CLASS_LIGHT
	prevent_crits = list(BCLASS_CUT, BCLASS_BLUNT, BCLASS_TWIST) //We're losing stab here
	max_integrity = 250

/obj/item/clothing/wrists/roguetown/bracers/leather/masterwork
	name = "masterwork leather bracers"
	desc = "These bracers are a craftsmanship marvel. Made with the finest leather. Strong, nimible, reliable."
	armor = list("blunt" = 80, "slash" = 60, "stab" = 40, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	armor_class = ARMOR_CLASS_MEDIUM
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST) //We're getting chop here
	max_integrity = 300
	filters = filter(type="drop_shadow", x=0, y=0, size=0.5, offset=1, color=rgb(218, 165, 32))

/obj/item/clothing/wrists/roguetown/wrappings
	name = "solar wrappings"
	icon_state = "wrappings"
	item_state = "wrappings"

/obj/item/clothing/wrists/roguetown/nocwrappings
	name = "moon wrappings"
	icon_state = "nocwrappings"
	item_state = "nocwrappings"

/obj/item/clothing/wrists/roguetown/splintarms
	name = "brigandine rerebraces"
	desc = "Brigandine bracers, pauldrons and a set of metal couters, designed to protect the arms while still providing almost complete free range of movement."
	body_parts_covered = ARMS
	icon_state = "splintarms"
	item_state = "splintarms"
	armor = list("blunt" = 60, "slash" = 70, "stab" = 70, "bullet" = 60, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	armor_class = ARMOR_CLASS_MEDIUM
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT)
	blocksound = SOFTHIT
	max_integrity = 250
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/iron
	armor_class = ARMOR_CLASS_MEDIUM
	w_class = WEIGHT_CLASS_NORMAL
	resistance_flags = FIRE_PROOF
	sewrepair = FALSE

///CRYSTAL KEEP///

///Decoratives///

/obj/item/clothing/wrists/roguetown/bracers/cloth
	name = "fabric bracers"
	desc = ""
	icon_state = "house_blue_witch_bracer"
	item_state = "house_blue_witch_bracer"
	armor = list("blunt" = 10, "slash" = 12, "stab" = 10, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	armor_class = ARMOR_CLASS_LIGHT
	prevent_crits = list(BCLASS_TWIST)
	resistance_flags = null
	blocksound = SOFTHIT
	max_integrity = 120
	blade_dulling = DULLING_BASHCHOP
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	anvilrepair = null
	sewrepair = TRUE
	salvage_amount = 1
	salvage_result = /obj/item/natural/hide/cured
	allowed_sex = list(FEMALE)

/obj/item/clothing/wrists/roguetown/bracers/cloth/black
	name = "fabric bracers"
	desc = ""
	icon_state = "house_black_witch_bracer"
	item_state = "house_black_witch_bracer"

///ELFNUT///
/obj/item/clothing/wrists/roguetown/bracers/elfnut
	name = "elfnut bracers"
	desc = "Elven bracers. Two pieces slide together perfectly, despite growing apart."
	armor = list("blunt" = 80, "slash" = 90, "stab" = 80, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	armor_class = ARMOR_CLASS_LIGHT
	icon_state = "elfnut_gauntlet"
	item_state = "elfnut_gauntlet"
	smeltresult = /obj/item/ingot/iron
	max_integrity = 200
	allowed_race = list(/datum/species/elf/wood, /datum/species/elf/dark)

/obj/item/clothing/wrists/roguetown/bracers/elfnut/silverwood
	name = "elfnut bracers"
	desc = "Silver light shines off these bracers."
	armor = list("blunt" = 90, "slash" = 100, "stab" = 80, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	armor_class = ARMOR_CLASS_MEDIUM
	icon_state = "elfnut_var_gauntlet"
	item_state = "elfnut_var_gauntlet"
	smeltresult = /obj/item/ingot/steel
	max_integrity = 320

///BLUESTEEL///
/obj/item/clothing/wrists/roguetown/bracers/bluesteel
	name = "bluesteel bracers"
	desc = "thick, heavy, blue bracers. Dwarven fit."
	body_parts_covered = ARMS
	icon_state = "bracers"
	item_state = "bracers"
	armor = list("blunt" = 100, "slash" = 100, "stab" = 80, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	armor_class = ARMOR_CLASS_HEAVY
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	blocksound = PLATEHIT
	max_integrity = 400
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel
	sewrepair = FALSE

///REDSTEEL///
//NO Gauntlets, sorrgy//

///The houses///



/*
/obj/item/clothing/wrists/roguetown/bracers/alrich
	name = "alrich bracers"
	desc = ""
	icon_state = "plate_red"

/obj/item/clothing/wrists/roguetown/bracers/bravado
	name = "Bravado bracers"
	desc = ""
	icon_state = "plate_yellow"

/obj/item/clothing/wrists/roguetown/bracers/caesar
	name = "Caesar bracers"
	desc = ""
	icon_state = "plate_purple"

/obj/item/clothing/wrists/roguetown/bracers/deleon
	name = "Deleon bracers"
	desc = ""
	icon_state = "plate_blue"

/obj/item/clothing/wrists/roguetown/bracers/echarus
	name = "Echarus bracers"
	desc = ""
	icon_state = "plate_green"

/obj/item/clothing/wrists/roguetown/bracers/black
	name = "Black House bracers"
	desc = ""
	icon_state = "plate_black"

/obj/item/clothing/wrists/roguetown/bracers/white
	name = "White House bracers"
	desc = ""
	icon_state = "plate_white"
*/ //for now commented out unless I need it.

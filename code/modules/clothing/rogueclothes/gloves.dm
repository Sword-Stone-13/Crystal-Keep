
/obj/item/clothing/gloves/roguetown
	slot_flags = ITEM_SLOT_GLOVES
	body_parts_covered = HANDS
	sleeved = 'icons/roguetown/clothing/onmob/gloves.dmi'
	icon = 'icons/roguetown/clothing/gloves.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/gloves.dmi'
	bloody_icon_state = "bloodyhands"
	sleevetype = "shirt"
	siemens_coefficient = 1 //Who in astrata's name forgot to set this to 1? No more immunity from lightning due to gloves.
	max_heat_protection_temperature = 361
	w_class = WEIGHT_CLASS_SMALL
	sewrepair = TRUE
	fiber_salvage = FALSE
	salvage_amount = 1

/obj/item/clothing/gloves/roguetown/leather
	name = "leather gloves"
	desc = "Leather gloves usually worn by laborers."
	icon_state = "leather_gloves"
	armor = list("blunt" = 30, "slash" = 10, "stab" = 20, "bullet" = 1, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	armor_class = ARMOR_CLASS_LIGHT
	prevent_crits = list(BCLASS_CUT, BCLASS_BLUNT)
	resistance_flags = null
	blocksound = SOFTHIT
	blade_dulling = DULLING_BASHCHOP
	max_integrity = 150
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	salvage_result = /obj/item/natural/hide/cured

/obj/item/clothing/gloves/roguetown/leather/black
	desc = "Leather gloves usually worn by laborers. Dyed black."
	color = "#6b6c6b"
	icon_state = "gloves_black"

/obj/item/clothing/gloves/roguetown/leather/advanced
	name = "hardened leather gloves"
	desc = "Sturdy, durable, flexible. A marvel of the dark ages that exists solely to protect your fingers."
	icon_state = "algloves"
	max_integrity = 200
	prevent_crits = list(BCLASS_CUT, BCLASS_BLUNT, BCLASS_TWIST)
	armor = list("blunt" = 50, "slash" = 40, "stab" = 20, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/gloves/roguetown/leather/masterwork
	name = "masterwork leather gloves"
	desc = "These gloves are a craftsmanship marvel. Made with the finest leather. Strong, nimible, reliable."
	max_integrity = 300
	prevent_crits = list(BCLASS_CUT, BCLASS_BLUNT, BCLASS_TWIST, BCLASS_CHOP) //we're adding chop here!
	armor = list("blunt" = 80, "slash" = 60, "stab" = 40, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	filters = filter(type="drop_shadow", x=0, y=0, size=0.5, offset=1, color=rgb(218, 165, 32))

/obj/item/clothing/gloves/roguetown/fingerless
	name = "fingerless gloves"
	desc = "Gloves with holes for fingers, preferred by archers."
	icon_state = "fingerless_gloves"
	resistance_flags = null
	blocksound = SOFTHIT
	blade_dulling = DULLING_BASHCHOP
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'


/obj/item/clothing/gloves/roguetown/angle
	name = "heavy leather gloves"
	desc = "A thick pair of leather gloves."
	icon_state = "angle"
	armor = list("blunt" = 50, "slash" = 25, "stab" = 40, "bullet" = 5, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	armor_class = ARMOR_CLASS_LIGHT
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_BLUNT)
	resistance_flags = null
	blocksound = SOFTHIT
	max_integrity = 100
	blade_dulling = DULLING_BASHCHOP
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	salvage_result = /obj/item/natural/fur

/obj/item/clothing/gloves/roguetown/chain
	name = "chain gauntlets"
	desc = "Gauntlets made with interlinking rings, provides adequate protection against slashing attacks."
	icon_state = "cgloves"
	armor = list("blunt" = 60, "slash" = 100, "stab" = 80, "bullet" = 20, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	armor_class = ARMOR_CLASS_LIGHT
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_BLUNT)
	resistance_flags = null
	blocksound = CHAINHIT
	max_integrity = 200
	blade_dulling = DULLING_BASHCHOP
	break_sound = 'sound/foley/breaksound.ogg'
	drop_sound = 'sound/foley/dropsound/chain_drop.ogg'
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel
	resistance_flags = FIRE_PROOF
	sewrepair = FALSE

/obj/item/clothing/gloves/roguetown/chain/iron
	icon_state = "icgloves"
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/iron

//rogtodo sprites for this
/obj/item/clothing/gloves/roguetown/plate
	name = "plate gauntlets"
	desc = "A heavy set of plate gauntlets which provide excellent protection."
	icon_state = "gauntlets"
	armor = list("blunt" = 90, "slash" = 100, "stab" = 80, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	armor_class = ARMOR_CLASS_MEDIUM
	prevent_crits = list(BCLASS_CHOP, BCLASS_CUT, BCLASS_BLUNT, BCLASS_TWIST)
	resistance_flags = FIRE_PROOF
	blocksound = PLATEHIT
	max_integrity = 300
	blade_dulling = DULLING_BASH
	break_sound = 'sound/foley/breaksound.ogg'
	drop_sound = 'sound/foley/dropsound/armor_drop.ogg'
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel
	sewrepair = FALSE

/obj/item/clothing/gloves/roguetown/grenzelgloves
	name = "grenzelhoft gloves"
	desc = "Fancy gloves worn by foreign mercenaries."
	icon_state = "grenzelgloves"
	item_state = "grenzelgloves"
	sleeved = 'icons/roguetown/clothing/onmob/helpers/stonekeep_merc.dmi'
	armor = list("blunt" = 15, "slash" = 15, "stab" = 15, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	armor_class = ARMOR_CLASS_LIGHT
	prevent_crits = list(BCLASS_CUT, BCLASS_BLUNT)
	resistance_flags = null
	blocksound = SOFTHIT
	blade_dulling = DULLING_BASHCHOP
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	
	//---------------- BLACKSTEEL ---------------------

/obj/item/clothing/gloves/roguetown/blacksteel/plategloves
	name = "Blacksteel Plate Gauntlets"
	desc = "A set of plate gauntlets forged of blacksteel."
	icon = 'icons/roguetown/clothing/special/blkknight.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/blkknight.dmi'
	icon_state = "bkgloves"
	item_state = "bkgloves"
	armor = list("blunt" = 90, "slash" = 100, "stab" = 80, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	armor_class = ARMOR_CLASS_MEDIUM
	prevent_crits = list(BCLASS_CHOP, BCLASS_CUT, BCLASS_BLUNT, BCLASS_TWIST)
	resistance_flags = null
	blocksound = PLATEHIT
	max_integrity = 400
	blade_dulling = DULLING_BASH
	break_sound = 'sound/foley/breaksound.ogg'
	drop_sound = 'sound/foley/dropsound/armor_drop.ogg'
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/blacksteel

///CKEEP///

///ELFNUT///
/obj/item/clothing/gloves/roguetown/chain/elfnut
	name = "elfnut gauntlets"
	desc = "gauntlets made of solid wooden rings."
	icon_state = "elfnut_gloves"
	item_state = "elfnut_gloves"
	armor = list("blunt" = 70, "slash" = 80, "stab" = 80, "bullet" = 20, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	armor_class = ARMOR_CLASS_LIGHT
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_BLUNT)
	resistance_flags = null
	max_integrity = 150
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/iron
	allowed_race = list(/datum/species/elf/wood, /datum/species/elf/dark) 

/obj/item/clothing/gloves/roguetown/chain/elfnut/silverwood
	name = "silverwood gauntlets"
	desc = "Elvish gauntlets made of interwoven wood-like silver threads."
	icon_state = "elfnut_var_gloves"
	item_state = "elfnut_var_gloves"
	armor = list("blunt" = 70, "slash" = 100, "stab" = 80, "bullet" = 20, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	max_integrity = 350


///BLUESTEEL///
//nothing, dwarves use their bare fucking hands//

///REDSTEEL///
/obj/item/clothing/gloves/roguetown/plate/redsteel
	name = "Redsteel gauntlets"
	desc = "a pair of gauntlets that protect the dorsals of the hands."
	icon_state = "redsteel_gloves"
	item_state = "redsteel_gloves"
	armor = list("blunt" = 90, "slash" = 100, "stab" = 80, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	armor_class = ARMOR_CLASS_MEDIUM
	anvilrepair = /datum/skill/craft/armorsmithing



///The houses///

/obj/item/clothing/gloves/roguetown/plate/alrich
	name = "red plated gauntlets"
	desc = ""
	icon_state = "house_red_gloves"
	item_state = "house_red_gloves"

/obj/item/clothing/gloves/roguetown/plate/bravado
	name = "bronze plated gauntlets"
	desc = ""
	icon_state = "house_yellow_gloves"
	item_state = "house_yellow_gloves"

/obj/item/clothing/gloves/roguetown/plate/caesar
	name = "purple plated gauntlets"
	desc = ""
	icon_state = "house_purple_gloves"
	item_state = "house_purple_gloves"

/obj/item/clothing/gloves/roguetown/leather/deleon
	name = "leather gloves"
	desc = "marked with the insignia of house Deleon"
	icon_state = "house_blue_gloves"
	item_state = "house_blue_gloves"

/obj/item/clothing/gloves/roguetown/plate/echarus
	name = "guild standard gauntlets"
	desc = ""
	icon_state = "house_green_gloves"
	item_state = "house_green_gloves"

/obj/item/clothing/gloves/roguetown/plate/black
	name = "black stained gauntlets"
	desc = ""
	icon_state = "house_black_gloves"
	item_state = "house_black_gloves"

/obj/item/clothing/gloves/roguetown/plate/white
	name = "white gauntlets"
	desc = ""
	icon_state = "house_white_gloves"
	item_state = "house_white_gloves"

//witch stuff//

/obj/item/clothing/gloves/roguetown/fingerless/house//green
	name = "brown fingerless gloves"
	desc = ""
	icon_state = "house_green_witch_gloves"
	item_state = "house_green_witch_gloves"
	allowed_sex = list(FEMALE)

/obj/item/clothing/gloves/roguetown/fingerless/house/red
	name = "cuffed fingerless gloves"
	desc = ""
	icon_state = "house_red_witch_gloves"
	item_state = "house_red_witch_gloves"

/obj/item/clothing/gloves/roguetown/leather/house
	name = "yellow wraps"
	desc = ""
	icon_state = "house_yellow_witch_gloves"
	item_state = "house_yellow_witch_gloves"
	allowed_sex = list(FEMALE)

/obj/item/clothing/gloves/roguetown/leather/house/white
	name = "long leather gloves"
	desc = ""
	icon_state = "house_white_witch_gloves"
	item_state = "house_white_witch_gloves"

//BLACSTONE//

/obj/item/clothing/gloves/roguetown/inqgloves
	name = "inquisitorial leather gloves"
	desc = "Leather gloves with a psycross stitched inside. The confessors call you Master."
	icon_state = "inqgloves"
	item_state = "inqgloves"
	armor = list("blunt" = 15, "slash" = 15, "stab" = 15, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_BLUNT)
	resistance_flags = null
	blocksound = SOFTHIT
	blade_dulling = DULLING_BASHCHOP
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'

//CKEEP//

/obj/item/clothing/gloves/roguetown/angel/long
	name = "long fur gloves"
	desc = ""
	icon_state = "angel_nun_gloves"
	item_state = "angel_nun_gloves"
	max_integrity = 120
	salvage_result = /obj/item/natural/fur
	allowed_sex = list(FEMALE)

/obj/item/clothing/gloves/roguetown/leather/villager
	name = "Walnutian gloves"
	desc = ""
	icon_state = "villager_orphan_gloves"
	icon_state = "villager_orphan_gloves"

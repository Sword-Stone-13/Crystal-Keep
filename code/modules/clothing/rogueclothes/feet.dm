/obj/item/clothing/shoes/roguetown
	name = "shoes"
	icon = 'icons/roguetown/clothing/feet.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/feet.dmi'
	desc = ""
	gender = PLURAL
	slot_flags = ITEM_SLOT_SHOES
	body_parts_covered = FEET
	sleeved = 'icons/roguetown/clothing/onmob/feet.dmi'
	sleevetype = "leg"
	bloody_icon_state = "shoeblood"
	equip_delay_self = 30
	w_class = WEIGHT_CLASS_SMALL
	sewrepair = TRUE

/obj/item/clothing/shoes/roguetown/shortboots
	name = "shortboots"
	color = "#d5c2aa"
	desc = "Boots which are a bit shorter at the ankles."
	icon_state = "shortboots"
	item_state = "shortboots"

/obj/item/clothing/shoes/roguetown/ridingboots
	name = "riding boots"
	color = "#d5c2aa"
	desc = "Boots worn by those who ride Saigas often."
	icon_state = "ridingboots"
	item_state = "ridingboots"


/obj/item/clothing/shoes/roguetown/gladiator
	name = "leather sandals"
	desc = ""
	icon_state = "gladiator"
	item_state = "gladiator"

/obj/item/clothing/shoes/roguetown/sandals
	name = "sandals"
	desc = ""
	icon_state = "sandals"
	item_state = "sandals"

/obj/item/clothing/shoes/roguetown/jester
	name = "funny shoes"
	desc = "Perfect for performing a jig or running for your life after a bad joke."
	icon_state = "jestershoes"
	resistance_flags = null

/obj/item/clothing/shoes/roguetown/simpleshoes
	name = "shoes"
	desc = "Better than going barefoot."
	icon_state = "simpleshoe"
	item_state = "simpleshoe"
	resistance_flags = null
	color = "#473a30"
	salvage_amount = 1
	salvage_result = /obj/item/natural/hide/cured

/obj/item/clothing/shoes/roguetown/simpleshoes/white
	color = null

/obj/item/clothing/shoes/roguetown/simpleshoes/buckle
	name = "shoes"
	icon_state = "buckleshoes"
	color = null

/obj/item/clothing/shoes/roguetown/simpleshoes/lord
	name = "shoes"
	desc = ""
	icon_state = "simpleshoe"
	item_state = "simpleshoe"
	resistance_flags = null
	color = "#cbcac9"


// **ARMOURED** //


/obj/item/clothing/shoes/roguetown/armor //This subtype is for armoured shoes
	name = "dark boots"
	color = "#d5c2aa"
	desc = "A fine set of dark boots."
	icon_state = "blackboots"
	item_state = "blackboots"
	blocksound = SOFTHIT //This hit sound is for leather
	prevent_crits = list(BCLASS_BLUNT, BCLASS_TWIST) //These match leather helmets
	armor = list("blunt" = 30, "slash" = 10, "stab" = 20, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	armor_class = ARMOR_CLASS_LIGHT

/obj/item/clothing/shoes/roguetown/armor/leather
	name = "leather boots"
	desc = "Boots made of leather."
	max_integrity = 150
	icon_state = "leatherboots"
	item_state = "leatherboots"
	salvage_amount = 1
	salvage_result = /obj/item/natural/hide/cured

/obj/item/clothing/shoes/roguetown/armor/leather/advanced
	name = "hardened leather boots"
	desc = "Sturdy, durable, flexible. A marvel of the dark ages that exists solely to protect your toes."
	max_integrity = 200
	icon_state = "alboots"
	item_state = "alboots"
	prevent_crits = list(BCLASS_CUT, BCLASS_BLUNT, BCLASS_TWIST)
	armor = list("blunt" = 50, "slash" = 40, "stab" = 20, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	armor_class = ARMOR_CLASS_LIGHT

/obj/item/clothing/shoes/roguetown/armor/leather/masterwork
	name = "masterwork leather boots"
	desc = "These boots are a craftsmanship marvel. Made with the finest leather. Strong, nimible, reliable."
	max_integrity = 300
	prevent_crits = list(BCLASS_CUT, BCLASS_BLUNT, BCLASS_TWIST, BCLASS_CHOP) //we're adding chop here!
	armor = list("blunt" = 80, "slash" = 60, "stab" = 40, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	armor_class = ARMOR_CLASS_MEDIUM
	filters = filter(type="drop_shadow", x=0, y=0, size=0.5, offset=1, color=rgb(218, 165, 32))

/obj/item/clothing/shoes/roguetown/armor/steel
	name = "steel plated boots"
	desc = "Boots forged of a set of steel plates to protect your fragile toes."
	icon_state = "armorboots"
	item_state = "armorboots"
	color = null
	blocksound = PLATEHIT
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel
	sewrepair = FALSE
	resistance_flags = FIRE_PROOF
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	armor = list("blunt" = 90, "slash" = 100, "stab" = 70, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	armor_class = ARMOR_CLASS_HEAVY

	// ----------------- BLACKSTEEL -----------------------

/obj/item/clothing/shoes/roguetown/boots/blacksteel/plateboots
	name = "Blacksteel Plate Boots"	
	desc = "Boots forged of durable blacksteel."
	body_parts_covered = FEET
	icon = 'icons/roguetown/clothing/special/blkknight.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/blkknight.dmi'
	icon_state = "bkboots"
	item_state = "bkboots"
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	color = null
	blocksound = PLATEHIT
	armor = list("blunt" = 90, "slash" = 100, "stab" = 70, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	armor_class = ARMOR_CLASS_HEAVY
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/blacksteel

/obj/item/clothing/shoes/roguetown/armor/nobleboot
	name = "noble boots"
	desc = "Fine dark leather boots."
	icon_state = "nobleboots"
	item_state = "nobleboots"
	armor = list("blunt" = 35, "slash" = 15, "stab" = 25, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	armor_class = ARMOR_CLASS_LIGHT

/obj/item/clothing/shoes/roguetown/armor/shalal
	name = "babouche"
	desc = "Simple cheap shoes."
	icon_state = "shalal"
	item_state = "shalal"
	armor = list("blunt" = 25, "slash" = 20, "stab" = 25, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	armor_class = ARMOR_CLASS_LIGHT

/obj/item/clothing/shoes/roguetown/armor/grenzelhoft
	name = "grenzelhoft boots"
	desc = "A pair of fine boots worn by mercenaries."
	icon_state = "grenzelboots"
	item_state = "grenzelboots"
	sleeved = 'icons/roguetown/clothing/onmob/helpers/stonekeep_merc.dmi'
	armor = list("blunt" = 15, "slash" = 15, "stab" = 15, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	armor_class = ARMOR_CLASS_LIGHT

///CRYSTAL KEEP///

///ELFNUT///


/obj/item/clothing/shoes/roguetown/armor/elfnut
	name = "elfnut boots"
	desc = "An elvish pair of boots. They tighten around the longer ankle like sandles, but the bottom part is... oddly soft and maleable. You can feel everything underneath."
	icon_state = "elfnut_boots"
	item_state = "elfnut_boots"
	sleeved = 'icons/roguetown/clothing/onmob/helpers/stonekeep_merc.dmi'
	armor = list("blunt" = 90, "slash" = 100, "stab" = 80, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	armor_class = ARMOR_CLASS_LIGHT
	allowed_race = list(/datum/species/elf/wood, /datum/species/elf/dark) 
	
/obj/item/clothing/shoes/roguetown/armor/elfnut/silverwood
	name = "elfnut boots"
	desc = "Beautiful silver boots made, not by elvish hands, but the memory of elvish hands."
	icon_state = "elfnut_var_boots"
	item_state = "elfnut_var_boots"
	sleeved = 'icons/roguetown/clothing/onmob/helpers/stonekeep_merc.dmi'
	armor = list("blunt" = 90, "slash" = 100, "stab" = 90, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	armor_class = ARMOR_CLASS_MEDIUM
	max_integrity = 400

///BLUESTEEL///

/obj/item/clothing/shoes/roguetown/armor/steel/bluesteel
	name = "bluesteel plated boots"
	desc = "Boots of bluesteel, easily the most comfortable pair of boots you'll find. Masterful craftsmanship."
	icon_state = "bluesteel_boots"
	item_state = "bluesteel_boots"
	color = null
	blocksound = PLATEHIT
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel
	sewrepair = FALSE
	resistance_flags = FIRE_PROOF
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	armor = list("blunt" = 90, "slash" = 100, "stab" = 70, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	armor_class = ARMOR_CLASS_HEAVY
	body_parts_covered = FEET
	max_integrity = 350

///REDSTEEL///

//NOTHING, it got sprited but it was unintentional///


///THE Houses///

/obj/item/clothing/shoes/roguetown/armor/steel/alrich
	name = "Red plated boots"
	desc = ""
	icon_state = "house_red_boots"

/obj/item/clothing/shoes/roguetown/armor/steel/bravado
	name = "bronze plated boots"
	desc = ""
	icon_state = "house_yellow_boots"

/obj/item/clothing/shoes/roguetown/armor/steel/caesar
	name = "purple plated boots"
	desc = ""
	icon_state = "house_purple_boots"

/obj/item/clothing/shoes/roguetown/armor/steel/deleon
	name = "Plated boots"
	desc = "there's a Deleon insignia on its side"
	icon_state = "house_blue_boots"

/obj/item/clothing/shoes/roguetown/armor/steel/echarus
	name = "leather boots"
	desc = "A guild insignia signifies it has steel in its leather workings"
	icon_state = "house_green_boots"
	item_state = "house_green_boots"
	max_integrity = 300
	prevent_crits = list(BCLASS_CUT, BCLASS_BLUNT, BCLASS_TWIST, BCLASS_CHOP)
	armor = list("blunt" = 70, "slash" = 100, "stab" = 80, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)


/obj/item/clothing/shoes/roguetown/armor/steel/white
	name = "white plated boots"
	desc = ""
	icon_state = "house_white_boots"
	item_state = "house_white_boots"

//witch stuff//

/obj/item/clothing/shoes/roguetown/armor/leather/house
	name = "high boots"
	desc = ""
	max_integrity = 170
	icon_state = "house_white_witch_boots"
	item_state = "house_white_witch_boots"
	salvage_amount = 2
	salvage_result = /obj/item/natural/hide/cured
	allowed_sex = list(FEMALE)

/obj/item/clothing/shoes/roguetown/armor/leather/house/red
	name = "soft leather boots"
	desc = ""
	icon_state = "house_red_witch_boots"
	item_state = "house_red_witch_boots"

/obj/item/clothing/shoes/roguetown/armor/leather/house/yellow
	name = "yellow boots"
	desc = ""
	icon_state = "house_yellow_witch_boots"
	item_state = "house_yellow_witch_boots"

/obj/item/clothing/shoes/roguetown/armor/leather/house/purple
	name = "purple boots"
	desc = "snazzy"
	icon_state = "house_purple_witch_boots"
	item_state = "house_purple_witch_boots"

/obj/item/clothing/shoes/roguetown/armor/leather/house/blue
	name = "purple boots"
	desc = "snazzy"
	icon_state = "house_blue_witch_boots"
	item_state = "house_blue_witch_boots"

/obj/item/clothing/shoes/roguetown/sandals/house
	name = "anklet"
	desc = ""
	icon_state = "house_black_witch_boots"
	item_state = "house_black_witch_boots"
	allowed_sex = list(FEMALE)

///STEPPE///

//Gronn
/obj/item/clothing/shoes/roguetown/armor/nomadboots
	name = "nomad boots"
	desc = "Hardened Leather boots of the steppes."
	icon_state = "nomadboots"
	item_state = "nomadboots"
	max_integrity = 250
	prevent_crits = list(BCLASS_CUT, BCLASS_BLUNT, BCLASS_TWIST, BCLASS_CHOP)
	armor = list("blunt" = 45, "slash" = 40, "stab" = 40, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)



///BLACKSTONE///

/obj/item/clothing/shoes/roguetown/armor/inqboots
	name = "inquisitorial boots"
	desc = "Boots stained and chaffed with dirt. They'll learn to love you, in time."
	icon_state = "inqboots"
	item_state = "inqboots"
	blocksound = SOFTHIT //This hit sound is for leather
	prevent_crits = list(BCLASS_BLUNT, BCLASS_TWIST)
	armor = list("blunt" = 30, "slash" = 10, "stab" = 20, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)


///CKEEEPP///

/obj/item/clothing/shoes/roguetown/armor/nobleboot/nyanderthal
	name = "animal skin boots"
	desc = "Surprisingly well made."
	icon_state = "nyanderthal_boots"
	item_state = "nyanderthal_boots"

/obj/item/clothing/shoes/roguetown/armor/nobleboot/angel
	name = "durable travel boots"
	desc = ""
	icon_state = "angel_nun_boots"
	item_state = "angel_nun_boots"
	allowed_sex = list(FEMALE)

/obj/item/clothing/shoes/roguetown/armor/leather/villager
	name = "walnutian women's boots"
	desc = ""
	max_integrity = 170
	icon_state = "villager_m1_boots"
	item_state = "villager_m1_boots"
	salvage_amount = 1
	salvage_result = /obj/item/natural/hide/cured
	allowed_sex = list(MALE)

/obj/item/clothing/shoes/roguetown/armor/leather/villager/women
	name = "walnutian shoes"
	desc = ""
	max_integrity = 170
	icon_state = "villager_w1_boots"
	item_state = "villager_w1_boots"
	salvage_amount = 1
	salvage_result = /obj/item/natural/hide/cured
	allowed_sex = list(FEMALE)

/obj/item/clothing/shoes/roguetown/armor/leather/villager/orphan
	name = "fur padded boots"
	desc = ""
	icon_state = "villager_orphan_boots"
	item_state = "villager_orphan_boots"


//Wizards with attitude

/obj/item/clothing/shoes/roguetown/armor/leather/masterwork/wizard
	name = "dark wizard shoes"
	desc = "an inscription inside reads 'For the hardest mf's in the world'."
	max_integrity = 300
	icon_state = "shadowwiz_shoes"
	item_state = "shadowwiz_shoes"
	armor = list("blunt" = 80, "slash" = 80, "stab" = 40, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 0)
	armor_class = ARMOR_CLASS_LIGHT
	filters = null

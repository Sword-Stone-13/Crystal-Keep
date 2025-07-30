
/obj/item/clothing/step_action() //this was made to rewrite clown shoes squeaking
	SEND_SIGNAL(src, COMSIG_CLOTHING_STEP_ACTION)

/obj/item/clothing
	var/do_sound_chain = FALSE
	var/do_sound_plate = FALSE

/obj/item/clothing/Initialize()
	. = ..()
	if(do_sound_chain)
		AddComponent(/datum/component/squeak, list('sound/foley/footsteps/armor/chain (1).ogg',\
													'sound/foley/footsteps/armor/chain (2).ogg',\
													'sound/foley/footsteps/armor/chain (3).ogg'), 100)
	else if(do_sound_plate)
		AddComponent(/datum/component/squeak, list('sound/foley/footsteps/armor/plate (1).ogg',\
													'sound/foley/footsteps/armor/plate (2).ogg',\
													'sound/foley/footsteps/armor/plate (3).ogg'), 100)

/obj/item/clothing/suit/roguetown/armor
	slot_flags = ITEM_SLOT_ARMOR
	body_parts_covered = CHEST
	icon = 'icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/armor.dmi'
	equip_sound = 'sound/blank.ogg'
	drop_sound = 'sound/blank.ogg'
	pickup_sound =  'sound/blank.ogg'
	sleeved = 'icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	sleevetype = "shirt"
	edelay_type = 0
	equip_delay_self = 25
	unequip_delay_self = 25
	bloody_icon_state = "bodyblood"
	boobed = TRUE
	resistance_flags = FIRE_PROOF
	blocksound = PLATEHIT
	sellprice = 1
	blade_dulling = DULLING_BASHCHOP
	break_sound = 'sound/foley/breaksound.ogg'
	drop_sound = 'sound/foley/dropsound/armor_drop.ogg'
	experimental_onhip = TRUE
	nodismemsleeves = TRUE
	flags_inv = HIDEBOOB|HIDECROTCH
	w_class = WEIGHT_CLASS_NORMAL //Anti-pouch storage due to the weight class no longer being small.
	engraveable = TRUE

/obj/item/clothing/suit/roguetown/armor/chainmail
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT
	name = "haubergeon"
	desc = "A steel maille shirt also known as the little coat of mail, composed of interwoven metal rings, that absorb arrow impacts decently enough while being also comfortable enough to sleep in covering the torso and arms."
	body_parts_covered = CHEST|GROIN|ARMS|VITALS
	icon_state = "haubergeon"
	armor = list("blunt" = 60, "slash" = 100, "stab" = 80, "bullet" = 20, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_ASSASSIN)
	blocksound = CHAINHIT
	do_sound_chain = TRUE
	drop_sound = 'sound/foley/dropsound/chain_drop.ogg'
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel
	armor_class = ARMOR_CLASS_LIGHT

/obj/item/clothing/suit/roguetown/armor/chainmail/iron
	icon_state = "ichainmail"
	name = "chainmaille"
	desc = "A iron chain vest composed of interwoven metal rings, that absorb arrow impacts decently enough while being also comfortable enough to sleep in covering just the torso."
	body_parts_covered = CHEST|GROIN|VITALS
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/iron
	armor_class = ARMOR_CLASS_LIGHT

/obj/item/clothing/suit/roguetown/armor/chainmail/hauberk
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT
	name = "hauberk"
	desc = "A longer steel maille also known as coat of mail, composed of interwoven metal rings that absorb arrow impacts decently enough while being also comfortable enough to sleep in covering the torso, arms and legs."
	body_parts_covered = CHEST|GROIN|ARMS|LEGS|VITALS
	icon_state = "hauberk"
	item_state = "hauberk"
	max_integrity = 220
	armor = list("blunt" = 60, "slash" = 100, "stab" = 80, "bullet" = 20, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel
	do_sound_chain = TRUE
	armor_class = ARMOR_CLASS_MEDIUM
	w_class = WEIGHT_CLASS_BULKY

/obj/item/clothing/suit/roguetown/armor/chainmail/chainkini
	name = "chainmail bikini"
	desc = "Not very comfortable against the skin."
	icon_state = "chainkini"
	item_state = "chainkini"
	allowed_sex = list(FEMALE)
	allowed_race = CLOTHED_RACES_TYPES
	body_parts_covered = CHEST|GROIN|VITALS //added vitals because realism balancing ends up being a trojan horse for arguing for thing me like and thing me no like arguments
	anvilrepair = /datum/skill/craft/armorsmithing
	armor_class = ARMOR_CLASS_LIGHT
	edelay_type = 1
	w_class = WEIGHT_CLASS_SMALL

/obj/item/clothing/suit/roguetown/armor/plate
	slot_flags = ITEM_SLOT_ARMOR
	name = "steel half-plate"
	desc = "\'Adventurer-fit\' plate armor with pauldrons."
	body_parts_covered = CHEST|GROIN|VITALS
	icon_state = "halfplate"
	item_state = "halfplate"
	armor = list("blunt" = 80, "slash" = 100, "stab" = 80, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	nodismemsleeves = TRUE
	max_integrity = 500
	allowed_sex = list(MALE, FEMALE)
	do_sound_plate = TRUE
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel
	equip_delay_self = 40
	unequip_delay_self = 40
	armor_class = ARMOR_CLASS_HEAVY
	w_class = WEIGHT_CLASS_BULKY
	clothing_flags = CANT_SLEEP_IN

/obj/item/clothing/suit/roguetown/armor/plate/half
	slot_flags = ITEM_SLOT_ARMOR
	name = "steel cuirass"
	desc = "A basic cuirass of steel. Lightweight and durable."
	body_parts_covered = CHEST|VITALS
	icon_state = "cuirass"
	item_state = "cuirass"
	armor = list("blunt" = 80, "slash" = 100, "stab" = 80, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	allowed_race = CLOTHED_RACES_TYPES
	nodismemsleeves = TRUE
	do_sound_plate = FALSE
	blocking_behavior = null
	max_integrity = 300
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel
	armor_class = ARMOR_CLASS_MEDIUM

/obj/item/clothing/suit/roguetown/armor/plate/full
	name = "plate armor"
	desc = "Full plate. Leg protecting tassets, groin cup, armored vambraces."
	icon_state = "plate"
	max_integrity = 520
	body_parts_covered = CHEST|GROIN|VITALS|LEGS|ARMS
	equip_delay_self = 1200
	unequip_delay_self = 1200
	equip_delay_other = 60
	strip_delay = 60

/obj/item/clothing/suit/roguetown/armor/plate/half/iron
	name = "iron breastplate"
	desc = "Solid iron to protect the chest."
	icon_state = "ibreastplate"
	max_integrity = 235
	smeltresult = /obj/item/ingot/iron
	armor_class = ARMOR_CLASS_MEDIUM

/obj/item/clothing/suit/roguetown/armor/plate/scale
	slot_flags = ITEM_SLOT_ARMOR
	name = "scalemail"
	desc = "Steel metal scales interwoven intricately to form flexible protection that ends up covering the torso and legs."
	body_parts_covered = CHEST|VITALS|GROIN|LEGS
	allowed_sex = list(MALE, FEMALE)
	icon_state = "lamellar"
	max_integrity = 200
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel
	equip_delay_self = 40
	armor_class = ARMOR_CLASS_MEDIUM

/obj/item/clothing/suit/roguetown/armor/jadekingdom/emperor
	slot_flags = ITEM_SLOT_ARMOR
	name = "coat of armor"
	desc = "A lordly coat of armor."
	body_parts_covered = CHEST|GROIN|VITALS|LEGS|ARMS
	icon_state = "jadekingdom_var"
	item_state = "jadekingdom_var"
	armor = list("blunt" = 90, "slash" = 90, "stab" = 80, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	allowed_sex = list(MALE, FEMALE)
	nodismemsleeves = TRUE
	blocking_behavior = null
	max_integrity = 400
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel
	armor_class = ARMOR_CLASS_HEAVY
	w_class = WEIGHT_CLASS_BULKY
	clothing_flags = CANT_SLEEP_IN

/obj/item/clothing/suit/roguetown/armor/jadekingdom/shogun
	slot_flags = ITEM_SLOT_ARMOR
	name = "coat of armor"
	desc = "A lordly coat of armor."
	body_parts_covered = CHEST|GROIN|VITALS|LEGS|ARMS
	icon_state = "jadekingdom_shogun_var"
	item_state = "jadekingdom_shogun_var"
	armor = list("blunt" = 90, "slash" = 90, "stab" = 80, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	allowed_sex = list(MALE, FEMALE)
	nodismemsleeves = TRUE
	blocking_behavior = null
	max_integrity = 400
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel
	armor_class = ARMOR_CLASS_HEAVY
	w_class = WEIGHT_CLASS_BULKY
	clothing_flags = CANT_SLEEP_IN

/obj/item/clothing/suit/roguetown/armor/brigandine
	slot_flags = ITEM_SLOT_ARMOR
	name = "brigandine"
	desc = "A coat with plates concealed inside an exterior fabric."
	icon_state = "brigandine"
	blocksound = SOFTHIT
	body_parts_covered = CHEST|GROIN|VITALS|LEGS|ARMS
	armor = list("blunt" = 90, "slash" = 60, "stab" = 70, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	allowed_sex = list(MALE, FEMALE)
	nodismemsleeves = TRUE
	max_integrity = 350
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel
	equip_delay_self = 40
	armor_class = ARMOR_CLASS_HEAVY
	w_class = WEIGHT_CLASS_BULKY
	clothing_flags = CANT_SLEEP_IN

/obj/item/clothing/suit/roguetown/armor/brigandine/Initialize()
	. = ..()
	AddComponent(/datum/component/squeak, list('sound/foley/footsteps/armor/coatplates (1).ogg',\
												'sound/foley/footsteps/armor/coatplates (2).ogg',\
												'sound/foley/footsteps/armor/coatplates (3).ogg'), 100)

/obj/item/clothing/suit/roguetown/armor/brigandine/attack_right(mob/user)
	if(detail_tag)
		return
	var/the_time = world.time
	var/pickedcolor = input(user, "Select a color.","Brigandine Color") as null|anything in CLOTHING_COLOR_NAMES
	if(!pickedcolor)
		return
	if(world.time > (the_time + 30 SECONDS))
		return
	detail_tag = "_det"
	detail_color = clothing_color2hex(pickedcolor)
	update_icon()
	if(ismob(loc))
		var/mob/L = loc
		L.update_inv_armor()

/obj/item/clothing/suit/roguetown/armor/brigandine/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

/obj/item/clothing/suit/roguetown/armor/brigandine/sheriff/Initialize()
	. = ..()
	if(GLOB.lordprimary)
		lordcolor(GLOB.lordprimary,GLOB.lordsecondary)
	else
		GLOB.lordcolor += src

/obj/item/clothing/suit/roguetown/armor/brigandine/sheriff/lordcolor(primary,secondary)
	detail_tag = "_det"
	detail_color = primary
	update_icon()
	if(ismob(loc))
		var/mob/L = loc
		L.update_inv_armor()

/obj/item/clothing/suit/roguetown/armor/brigandine/sheriff/Destroy()
	GLOB.lordcolor -= src
	return ..()

/obj/item/clothing/suit/roguetown/armor/brigandine/coatplates
	slot_flags = ITEM_SLOT_ARMOR
	name = "coat of plates"
	desc = "A leather coat with plates attached to it to increase protection while retaining mobility"
	icon_state = "coat_of_plates"
	blocksound = PLATEHIT
	body_parts_covered = CHEST|GROIN|VITALS|ARMS
	armor = list("blunt" = 90, "slash" = 100, "stab" = 80, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	max_integrity = 250
	armor_class = ARMOR_CLASS_HEAVY

/obj/item/clothing/suit/roguetown/armor/brigandine/light
	slot_flags = ITEM_SLOT_ARMOR
	name = "lightweight brigandine"
	desc = "A light riveted coat with plates concealed inside an exterior fabric."
	icon_state = "light_brigandine"
	blocksound = SOFTHIT
	body_parts_covered = CHEST|GROIN|VITALS
	armor = list("blunt" = 60, "slash" = 70, "stab" = 70, "bullet" = 60, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	smeltresult = /obj/item/ingot/iron
	equip_delay_self = 40
	armor_class = ARMOR_CLASS_MEDIUM
	w_class = WEIGHT_CLASS_BULKY
	clothing_flags = CANT_SLEEP_IN
	resistance_flags = FIRE_PROOF

/obj/item/clothing/suit/roguetown/armor/armordress
	slot_flags = ITEM_SLOT_ARMOR
	name = "padded dress"
	desc = "This dress has been padded for extra protection."
	body_parts_covered = CHEST|GROIN|LEGS|ARMS|VITALS
	icon_state = "armordress"
	armor = list("blunt" = 60, "slash" = 40, "stab" = 50, "bullet" = 10, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_BLUNT)
	blocksound = SOFTHIT
	allowed_sex = list(MALE, FEMALE)
	allowed_race = NON_DWARVEN_RACE_TYPES
	blade_dulling = DULLING_BASHCHOP
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	sewrepair = TRUE
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	armor_class = ARMOR_CLASS_LIGHT

/obj/item/clothing/suit/roguetown/armor/armordress/alt
	icon_state = "armordressalt"

/obj/item/clothing/suit/roguetown/armor/gambeson
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT
	name = "gambeson"
	desc = "A large padded defense jacket designed to be cheap, resewable and worn as its own armor or go beneath armor that protects the torso, arms and legs."
	icon_state = "gambeson"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS|VITALS
	armor = list("blunt" = 60, "slash" = 40, "stab" = 50, "bullet" = 25, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_BLUNT)
	blocksound = SOFTUNDERHIT
	blade_dulling = DULLING_BASHCHOP
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	sewrepair = TRUE
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	armor_class = ARMOR_CLASS_LIGHT

/obj/item/clothing/suit/roguetown/armor/gambeson/councillor
	color = "#646464"

//HOUSE SLOP
/obj/item/clothing/suit/roguetown/armor/gambeson/house/alrich
	color = "#a3343c"

/obj/item/clothing/suit/roguetown/armor/gambeson/house/bravado
	color = "#d3b54d"

/obj/item/clothing/suit/roguetown/armor/gambeson/house/caesar
	color = "#8b308f"

/obj/item/clothing/suit/roguetown/armor/gambeson/house/deleon
	color = "#343da3"



/obj/item/clothing/suit/roguetown/armor/gambeson/lord
	name = "arming jacket"
	desc = "Similar to a gambeson, it is meant to be used under heavier armor."
	icon_state = "dgamb"
	allowed_sex = list(MALE, FEMALE)
	allowed_race = NON_DWARVEN_RACE_TYPES

/obj/item/clothing/suit/roguetown/armor/leather
	name = "leather armor"
	desc = "Flexible cowhide armor. Lightweight, better than nothing."
	icon_state = "leather"
	body_parts_covered = CHEST|GROIN|VITALS
	armor = list("blunt" = 50, "slash" = 25, "stab" = 40, "bullet" = 10, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_BLUNT)
	blocksound = SOFTHIT
	blade_dulling = DULLING_BASHCHOP
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	sewrepair = TRUE
	nodismemsleeves = TRUE
	max_integrity = 150
	sellprice = 20
	armor_class = ARMOR_CLASS_LIGHT
	salvage_result = /obj/item/natural/hide/cured


/obj/item/clothing/suit/roguetown/armor/leather/advanced
	name = "hardened leather coat"
	desc = "Sturdy, durable, flexible. Will keep you alive in style."
	icon_state = "alcoat"
	max_integrity = 350
	body_parts_covered = CHEST|GROIN|VITALS|LEGS|ARMS
	prevent_crits = list(BCLASS_CUT, BCLASS_BLUNT, BCLASS_TWIST)
	armor = list("blunt" = 75, "slash" = 60, "stab" = 30, "bullet" = 10, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/suit/roguetown/armor/leather/masterwork
	name = "masterwork leather coat"
	desc = "This coat is a craftsmanship marvel. Made with the finest leather. Strong, nimible, reliable."
	icon_state = "leather"
	max_integrity = 400
	prevent_crits = list(BCLASS_CUT, BCLASS_BLUNT, BCLASS_TWIST, BCLASS_CHOP) //we're adding chop here!
	armor = list("blunt" = 100, "slash" = 70, "stab" = 40, "bullet" = 10, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	filters = filter(type="drop_shadow", x=0, y=0, size=0.5, offset=1, color=rgb(218, 165, 32))

/obj/item/clothing/suit/roguetown/armor/leather/hide
	name = "hide armor"
	desc = "A light armor of wildbeast hide. Far more durable than leather."
	icon_state = "hidearmor"
	max_integrity = 230
	armor_class = ARMOR_CLASS_LIGHT

/obj/item/clothing/suit/roguetown/armor/leather/studded
	name = "studded leather armor"
	desc = "Studded leather is the most durable of all hides and leathers and about as light."
	icon_state = "studleather"
	item_state = "studleather"
	blocksound = SOFTHIT
	armor = list("blunt" = 70, "slash" = 50, "stab" = 60, "bullet" = 15, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_BLUNT, BCLASS_CHOP)
	nodismemsleeves = TRUE
	body_parts_covered = CHEST|GROIN|VITALS
	max_integrity = 300
	sellprice = 25
	armor_class = ARMOR_CLASS_LIGHT

/obj/item/clothing/suit/roguetown/armor/leather/vest
	name = "leather vest"
	desc = "A leather vest. Not very protective, but fashion."
	icon_state = "vest"
	item_state = "vest"
	color = "#514339"
	armor = list("blunt" = 30, "slash" = 10, "stab" = 20, "bullet" = 5, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT)
	blocksound = SOFTHIT
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT
	blade_dulling = DULLING_BASHCHOP
	body_parts_covered = CHEST|VITALS|LEGS
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	sewrepair = TRUE
	sleevetype = null
	sleeved = null
	armor_class = ARMOR_CLASS_LIGHT
	salvage_result = /obj/item/natural/hide/cured

/obj/item/clothing/suit/roguetown/armor/leather/vest/sailor
	name = "sea jacket"
	desc = "A sailor's garb."
	icon_state = "sailorvest"
	color = null
	slot_flags = ITEM_SLOT_ARMOR
	sleeved = 'icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	sleevetype = "shirt"

/obj/item/clothing/suit/roguetown/armor/leather/vest/sailor/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/storage/concrete)
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	if(STR)
		STR.max_combined_w_class = 2
		STR.max_w_class = WEIGHT_CLASS_NORMAL
		STR.max_items = 1

/obj/item/clothing/suit/roguetown/armor/leather/vest/sailor/dropped(mob/living/carbon/human/user)
	..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	if(STR)
		var/list/things = STR.contents()
		for(var/obj/item/I in things)
			STR.remove_from_storage(I, get_turf(src))

/obj/item/clothing/suit/roguetown/armor/leather/vest/sailor/nightman
	name = "silk jacket"
	desc = "A soft and comfortable jacket."
	icon_state = "nightman"
	sleeved = 'icons/roguetown/clothing/onmob/armor.dmi'
	allowed_sex = list(MALE, FEMALE)
	allowed_race = NON_DWARVEN_RACE_TYPES

/obj/item/clothing/suit/roguetown/armor/leather/vest/black
	color = "#3c3a38"

/obj/item/clothing/suit/roguetown/armor/leather/vest/handcoat
	name = "Hand's vest"
	desc = "A soft vest of finest fabric."
	icon_state = "handcoat"
	color = null
	allowed_sex = list(MALE, FEMALE)
	allowed_race = list("human", "tiefling", "dwarf", "elf", "aasimar")

/obj/item/clothing/suit/roguetown/armor/workervest
	name = "striped tunic"
	desc = "This cheap tunic is often used by sturdy laborous men and women."
	icon_state = "workervest"
	armor = null
	blocksound = SOFTHIT
	blade_dulling = DULLING_BASHCHOP
	body_parts_covered = CHEST|VITALS
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	sewrepair = TRUE
	sleevetype = null
	sleeved = null
	nodismemsleeves = TRUE
	boobed = TRUE

/obj/item/clothing/suit/roguetown/armor/workervest/Initialize()
	color = pick("#94b4b6", "#ba8f9e", "#bd978c", "#92bd8c", "#c7c981")
	return ..()

/obj/item/clothing/suit/roguetown/armor/silkcoat
	name = "silk coat"
	desc = "A padded dressing made from the finest silks."
	icon_state = "bliaut"
	color = null
	armor = list("blunt" = 70, "slash" = 35, "stab" = 60, "bullet" = 7, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_TWIST)
	blocksound = SOFTHIT
	slot_flags = ITEM_SLOT_ARMOR
	blade_dulling = DULLING_BASHCHOP
	body_parts_covered = CHEST|LEGS|VITALS|GROIN
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	sewrepair = TRUE
	sleeved = 'icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	sleevetype = "shirt"
	max_integrity = 100
	sellprice = 50
	armor_class = ARMOR_CLASS_LIGHT
	allowed_sex = list(MALE, FEMALE)
	allowed_race = CLOTHED_RACES_TYPES
	salvage_result = /obj/item/natural/fur

/obj/item/clothing/suit/roguetown/armor/silkcoat/Initialize()
	. = ..()
	color = pick(CLOTHING_PURPLE, null,CLOTHING_GREEN, CLOTHING_RED)

/obj/item/clothing/suit/roguetown/armor/leather/cult_robe
	name = "cultist robes"
	desc = " "
	icon_state = "warlock"
	item_state = "warlock"
	armor = list("blunt" = 30, "slash" = 10, "stab" = 20, "bullet" = 5, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT)
	blocksound = SOFTHIT
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT
	blade_dulling = DULLING_BASHCHOP
	body_parts_covered = CHEST|VITALS|LEGS
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	sewrepair = TRUE
	armor_class = ARMOR_CLASS_LIGHT
	salvage_result = /obj/item/natural/hide/cured

/obj/item/clothing/suit/roguetown/armor/blacksteel/platechest
	slot_flags = ITEM_SLOT_ARMOR
	name = "Blacksteel Plate Armor"
	desc = "A suit of Full Plate smithed of durable blacksteel."
	body_parts_covered = CHEST|GROIN|VITALS|LEGS|ARMS
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	icon = 'icons/roguetown/clothing/special/blkknight.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/blkknight.dmi'
	icon_state = "bkarmor"
	item_state = "bkarmor"
	armor = list("blunt" = 90, "slash" = 100, "stab" = 80, "bullet" = 80, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	allowed_race = CLOTHED_RACES_TYPES
	nodismemsleeves = TRUE
	do_sound_plate = TRUE
	blocking_behavior = null
	max_integrity = 400
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/blacksteel
	armor_class = ARMOR_CLASS_HEAVY
	equip_delay_self = 12 SECONDS
	unequip_delay_self = 12 SECONDS
	equip_delay_other = 3 SECONDS
	strip_delay = 6 SECONDS

/obj/item/clothing/suit/roguetown/armor/blacksteel/cuirass
	slot_flags = ITEM_SLOT_ARMOR
	name = "Blacksteel Cuirass"
	desc = "A basic cuirass forged from blacksteel. It's somewhat more durable than regular steel."
	body_parts_covered = CHEST|VITALS
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	icon_state = "grenzelcuirass"
	item_state = "grenzelcuirass"
	sleeved = 'icons/roguetown/clothing/onmob/helpers/stonekeep_merc.dmi'
	armor = list("blunt" = 80, "slash" = 100, "stab" = 80, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	allowed_race = CLOTHED_RACES_TYPES
	nodismemsleeves = TRUE
	blocking_behavior = null
	max_integrity = 400
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/blacksteel
	armor_class = ARMOR_CLASS_MEDIUM


//Crystallis keepus

//Jade Kingdom

/obj/item/clothing/suit/roguetown/armor/plate/jadekingdomhalf //unobtainable for now
	slot_flags = ITEM_SLOT_ARMOR
	name = "steel cuirass"
	desc = "A foreign curaiss made of interwoven pieces of iron."
	body_parts_covered = CHEST|VITALS
	icon_state = "cuirass"
	item_state = "cuirass"
	armor = list("blunt" = 70, "slash" = 80, "stab" = 70, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	allowed_race = NON_DWARVEN_RACE_TYPES
	nodismemsleeves = TRUE
	do_sound_plate = FALSE
	blocking_behavior = null
	max_integrity = 400
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel
	armor_class = ARMOR_CLASS_LIGHT


/obj/item/clothing/suit/roguetown/armor/plate/full/jadekingdom
	name = "plate armor"
	desc = "Foreign armor made of interwoven metal shingles. Lighter."
	//icon = 'icons/roguetown/topadd/Polyushko#0323/giftsforthatsever.dmi'
	icon = 'icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = 'icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	icon_state = "jade_samurai"
	item_state = "jade_samurai"
	max_integrity = 400
	body_parts_covered = CHEST|GROIN|VITALS|LEGS|ARMS
	armor = list("blunt" = 70, "slash" = 80, "stab" = 70, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	equip_delay_self = 600
	unequip_delay_self = 600
	equip_delay_other = 30
	strip_delay = 60
	armor_class = ARMOR_CLASS_MEDIUM

/obj/item/clothing/suit/roguetown/armor/plate/full/jadekingdom/nyandit
	name = "plate armor"
	icon_state = "nyandit_samurai"
	item_state = "nyandit_samurai"
	strip_delay = 20//solo bandit issues

/obj/item/clothing/suit/roguetown/armor/plate/full/jadekingdom/kitsune
	name = "plate armor"
	icon_state = "kitsune_samurai"
	item_state = "kitsune_samurai"

/obj/item/clothing/suit/roguetown/armor/plate/full/jadekingdom/neko
	name = "plate armor"
	icon_state = "neko_samurai"
	item_state = "neko_samurai"


//elf tech

/obj/item/clothing/suit/roguetown/armor/plate/elfnut
	slot_flags = ITEM_SLOT_ARMOR
	name = "elvish halfplate armor"
	desc = "Elvish armor with a grainy texture and a red sheen. It all looks like its one piece with flexible joints."
	body_parts_covered = CHEST|GROIN|ARMS
	icon_state = "elfnut_halfplate"
	item_state = "elfnut_halfplate"
	armor = list("blunt" = 70, "slash" = 100, "stab" = 90, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	nodismemsleeves = TRUE
	max_integrity = 450
	allowed_sex = list(MALE, FEMALE)
	do_sound_plate = TRUE
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/iron
	equip_delay_self = 40
	unequip_delay_self = 40
	armor_class = ARMOR_CLASS_LIGHT
	w_class = WEIGHT_CLASS_BULKY
	clothing_flags = CANT_SLEEP_IN

/obj/item/clothing/suit/roguetown/armor/plate/elfnut/silver
	name = "elvish halfplate armor"
	desc = "Elvish armor with a grainy texture and a minty sheen. It all looks like its one piece with flexible joints."
	icon_state = "elfnut_silverhalf"
	item_state = "elfnut_silverhalf"
	max_integrity = 690
	smeltresult = /obj/item/ingot/silver



/obj/item/clothing/suit/roguetown/armor/plate/full/elfnut
	name = "plate armor"
	desc = "Full plate. Leg protecting tassets, groin cup, armored vambraces."
	icon_state = "elfnut_fullplate"
	item_state = "elfnut_fullplate"
	max_integrity = 480
	body_parts_covered = CHEST|VITALS|ARMS
	equip_delay_self = 1200
	unequip_delay_self = 1200
	equip_delay_other = 60
	strip_delay = 60
	smeltresult = /obj/item/ingot/iron
	armor_class = ARMOR_CLASS_MEDIUM
	allowed_race = list(/datum/species/elf/wood, /datum/species/elf/dark) //until I have the time to make a variation of the armor that fits humans, it stays, sadly. 


/obj/item/clothing/suit/roguetown/armor/plate/full/elfnut/silverwood
	name = "plate armor"
	desc = "Beautiful ornate plate armor that shines like lustrous pure silver, with a strange green tinge where it was plucked from."
	icon_state = "elfnut_silverplate"
	item_state = "elfnut_silverplate"

	max_integrity = 720
	body_parts_covered = CHEST|VITALS|ARMS
	equip_delay_self = 1200
	unequip_delay_self = 1200
	equip_delay_other = 60
	strip_delay = 60
	smeltresult = /obj/item/ingot/silver

/obj/item/clothing/suit/roguetown/armor/chainmail/elfnut
	name = "haubergeon"
	desc = "Although it looks rusty, it's smooth, and has a beautiful red sheen."
	body_parts_covered = CHEST|GROIN|ARMS|VITALS
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/shirts.dmi'
	icon = 'icons/roguetown/clothing/shirts.dmi'
	icon_state = "elfnut_shirt"
	item_state = "elfnut_shirt"
	armor = list("blunt" = 60, "slash" = 100, "stab" = 80, "bullet" = 20, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	smeltresult = /obj/item/ingot/iron
	armor_class = ARMOR_CLASS_LIGHT
	max_integrity = 260

/obj/item/clothing/suit/roguetown/armor/chainmail/elfnut/silverwood
	name = "haubergeon"
	desc = "It's lighter and breathes better."
	icon_state = "elfnut_var_shirt"
	item_state = "elfnut_var_shirt"
	armor = list("blunt" = 70, "slash" = 100, "stab" = 80, "bullet" = 20, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	smeltresult = /obj/item/ingot/silver
	max_integrity = 300

//Dwarvish Bluesteel
/obj/item/clothing/suit/roguetown/armor/bluesteel/
	slot_flags = ITEM_SLOT_ARMOR
	name = "Bluesteel Half-Plate"
	desc = "Blocky and durable armor that sheens a strong blue."
	body_parts_covered = CHEST|GROIN|VITALS|LEGS|ARMS
	icon_state = "bluesteel"
	item_state = "bluesteel"
	armor = list("blunt" = 90, "slash" = 100, "stab" = 80, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 70, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	nodismemsleeves = TRUE
	max_integrity = 500
	allowed_sex = list(MALE, FEMALE)//fingers crossed females use the same sprite
	allowed_race = list(/datum/species/goblinp, /datum/species/nuppies, /datum/species/dwarf/mountain)
	do_sound_plate = TRUE
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/bluesteel
	equip_delay_self = 40
	unequip_delay_self = 40
	armor_class = ARMOR_CLASS_HEAVY
	w_class = WEIGHT_CLASS_BULKY
	clothing_flags = CANT_SLEEP_IN

/*
/obj/item/clothing/suit/roguetown/armor/chainmail/bluesteel
	name = "Bluesteel Haubergeon"
	desc = "A series of square of heavy bluesteel are rung together."
	icon_state = "bluesteel_shirt"
	item_state = "bluesteel_shirt"
	armor_class = ARMOR_CLASS_MEDIUM
	armor = list("blunt" = 70, "slash" = 100, "stab" = 80, "bullet" = 20, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	smeltresult = /obj/item/ingot/steel
	max_integrity = 270
*/
//Kobold Redsteel

/obj/item/clothing/suit/roguetown/armor/redsteel/
	slot_flags = ITEM_SLOT_ARMOR
	name = "Redsteel Cuirass"
	desc = "A perfectly shaped cuirass that glints a brilliant red."
	icon_state = "redsteel_kobold"
	item_state = "redsteel_kobold"
	allowed_race = list(/datum/species/goblinp, /datum/species/nuppies, /datum/species/kobold)
	armor = list("blunt" = 80, "slash" = 100, "stab" = 90, "bullet" = 100, "laser" = 50,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 70, "acid" = 0)
	max_integrity = 450
	body_parts_covered = CHEST|VITALS|GROIN
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	nodismemsleeves = TRUE
	armor_class = ARMOR_CLASS_MEDIUM
	blocking_behavior = null
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/redsteel


/obj/item/clothing/suit/roguetown/armor/plate/scale/redsteel
	slot_flags = ITEM_SLOT_SHIRT
	name = "Dragon Scaleskin"
	desc = "A full body suit made of interwoven redsteel scales. The grooves of the inside suction onto you. If not for the weight, you'd think it another layer of skin. "
	body_parts_covered = CHEST|VITALS|GROIN|LEGS|ARMS|FEET|HANDS
	allowed_sex = list(MALE, FEMALE)
	icon_state = "resteel_suit"
	item_state = "resteel_suit"
	max_integrity = 300
	armor = list("blunt" = 80, "slash" = 100, "stab" = 90, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 0)
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/redsteel
	allowed_race = list(/datum/species/goblinp, /datum/species/nuppies, /datum/species/kobold)
	armor_class = ARMOR_CLASS_LIGHT

//House Armors//

//For now, they're all just plate armor reskins.//

/obj/item/clothing/suit/roguetown/armor/plate/full/alrich
	name = "House alrich plate armor"
	desc = "Full plate armor shining a regal red, bearing the insignia of House alrich. Proud and unyielding."
	icon_state = "house_red_armor"
	item_state = "house_red_armor"

/obj/item/clothing/suit/roguetown/armor/plate/full/bravado
	name = "House Bravado plate armor"
	desc = "Polished golden plate armor worn by the knights of House Bravado. Bold and radiant."
	icon_state = "house_yellow_armor"
	item_state = "house_yellow_armor"

/obj/item/clothing/suit/roguetown/armor/plate/full/caesar
	name = "House Caesar plate armor"
	desc = "Purple-stained full plate of House Caesar, crafted to command respect and awe."
	icon_state = "house_purple_armor"
	item_state = "house_purple_armor"
	body_parts_covered = CHEST|GROIN|VITALS|LEGS|ARMS|NECK


/obj/item/clothing/suit/roguetown/armor/plate/full/deleon
	name = "House Deleon plate armor"
	desc = "Blue draped plate armor of House Deleon. Serene and steadfast as the sea."
	icon_state = "house_blue_armor"
	item_state = "house_blue_armor"

/obj/item/clothing/suit/roguetown/armor/plate/full/echarus
	name = "Guild Echarus plate armor"
	desc = "Green smithed armor of Guild Echarus. A quiet fury."
	icon_state = "house_green_armor"
	item_state = "house_green_armor"

/* //for now, just a chainmail since there's already court black armor
/obj/item/clothing/suit/roguetown/armor/plate/full/black
	name = "Black House plate armor"
	desc = "Grand black armor for the defenders of the King's lands."
	icon_state = "plate_black"
*/
/obj/item/clothing/suit/roguetown/armor/plate/full/white
	name = "White House plate armor"
	desc = "Hope inspiring white armor for the defenders of the King's peasants and church."
	icon_state = "house_white_armor"
	item_state = "house_white_armor"

////chainmail////

/obj/item/clothing/suit/roguetown/armor/chainmail/black
	name = "Black House chainmail"
	desc = "None can pass me."
	icon_state = "house_black_chain"
	item_state = "house_black_chain"
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_BLUNT, BCLASS_ASSASSIN)


/obj/item/clothing/suit/roguetown/armor/leather/nyandit
	name = "Fur Bikini"
	desc = "Fur undergarments made of a beast native to Avarikyo."
	icon = 'icons/roguetown/clothing/shirts.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/shirts.dmi'
	icon_state = "nyanderthal_bikini"
	item_state = "nyanderthal_bikini"
	allowed_sex = list(FEMALE)
	sellprice = 150
	body_parts_covered = CHEST|GROIN|VITALS
	armor_class = ARMOR_CLASS_LIGHT
	edelay_type = 1
	w_class = WEIGHT_CLASS_SMALL

/obj/item/clothing/suit/roguetown/armor/leather/nyandit/male
	name = "Fur Thong"
	desc = "Fur undergarments made of a beast native to Avarikyo."
	icon = 'icons/roguetown/clothing/pants.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/pants.dmi'
	icon_state = "nyanderthal_bottom"
	item_state = "nyanderthal_bottom"
	allowed_sex = list(MALE)
	sellprice = 20
	body_parts_covered = GROIN

/obj/item/clothing/suit/roguetown/armor/chainmail/hauberk/housegreen
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT
	name = "hauberk"
	desc = "A guild grade gambeson with chainmail underneath."
	body_parts_covered = CHEST|GROIN|ARMS|LEGS|VITALS
	icon_state = "house_green_shirt"
	item_state = "house_green_shirt"
	max_integrity = 240
	armor = list("blunt" = 80, "slash" = 100, "stab" = 70, "bullet" = 20, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel
	do_sound_chain = TRUE
	blocksound = SOFTHIT
	armor_class = ARMOR_CLASS_MEDIUM
	w_class = WEIGHT_CLASS_BULKY


///Steppe armor, courtesy of a kind donator
///Crafting recipes coming later, but these should be more difficult to get, and I don't think making a new leather subtype skill is worth it. To be determined.

//Gronn
/obj/item/clothing/suit/roguetown/armor/hudesutu_quyaq
	slot_flags = ITEM_SLOT_ARMOR
	name = "Hudesutu quyaq"
	desc = "Lamellar Armor made of iron and leathers."
	body_parts_covered = CHEST|GROIN|LEGS|VITALS
	icon_state = "hudesutu"
	item_state = "hudesutu"
	armor = list("blunt" = 65, "slash" = 60, "stab" = 55, "bullet" = 20, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT)
	blocksound = CHAINHIT
	do_sound_chain = TRUE
	drop_sound = 'sound/foley/dropsound/chain_drop.ogg'
	max_integrity = 250
	anvilrepair = /datum/skill/craft/blacksmithing
	smeltresult = /obj/item/ingot/iron
	armor_class = ARMOR_CLASS_LIGHT

/obj/item/clothing/suit/roguetown/armor/kurche
	slot_flags = ITEM_SLOT_ARMOR
	name = "Kurche"
	desc = "Pieces of Iron Plates and Leathers that protect the vitals."
	body_parts_covered = CHEST|GROIN|ARMS|VITALS
	icon_state = "kurche"
	item_state = "kurche"
	armor = list("blunt" = 75, "slash" = 65, "stab" = 70, "bullet" = 20, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT)
	blocksound = CHAINHIT
	do_sound_chain = TRUE
	drop_sound = 'sound/foley/dropsound/chain_drop.ogg'
	max_integrity = 300
	anvilrepair = /datum/skill/craft/blacksmithing
	smeltresult = /obj/item/ingot/iron
	armor_class = ARMOR_CLASS_LIGHT

//more whimsical color variants, proper dying
/obj/item/clothing/suit/roguetown/armor/kurche/purple
	icon_state = "kurche_purple"
	item_state = "kurche_purple"

/obj/item/clothing/suit/roguetown/armor/kurche/orange
	icon_state = "kurche_orange"
	item_state = "kurche_orange"


/obj/item/clothing/suit/roguetown/armor/leather/chargah
	name = "Chargah"
	desc = "A robe made from padded cloth."
	icon_state = "chargah"
	item_state = "chargah"
	armor = list("blunt" = 35, "slash" = 20, "stab" = 10, "bullet" = 10, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT)
	blocksound = SOFTHIT
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT
	blade_dulling = DULLING_BASHCHOP
	body_parts_covered = CHEST|GROIN|LEGS|ARMS|VITALS
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	sewrepair = TRUE
	armor_class = ARMOR_CLASS_LIGHT
	salvage_result = /obj/item/natural/hide/cured

/obj/item/clothing/suit/roguetown/armor/leather/hatanga_degel
	name = "Hatanga Degel"
	desc = "A soft padded armor made from leathers."
	icon_state = "hatanga"
	item_state = "hatanga"
	armor = list("blunt" = 50, "slash" = 35, "stab" = 40, "bullet" = 30, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT,BCLASS_BLUNT)
	blocksound = SOFTHIT
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT
	blade_dulling = DULLING_BASHCHOP
	body_parts_covered = CHEST|GROIN|LEGS|ARMS|VITALS
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	sewrepair = TRUE
	armor_class = ARMOR_CLASS_LIGHT
	salvage_result = /obj/item/natural/hide/cured

/obj/item/clothing/suit/roguetown/armor/leather/hatanga_degel_fur
	name = "Hatanga Degel Fur"
	desc = "A soft padded armor made from leathers and fur."
	icon_state = "hatangafur"
	item_state = "hatangafur"
	armor = list("blunt" = 55, "slash" = 40, "stab" = 45, "bullet" = 35, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT,BCLASS_BLUNT)
	blocksound = SOFTHIT
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT
	blade_dulling = DULLING_BASHCHOP
	body_parts_covered = CHEST|GROIN|LEGS|ARMS|VITALS
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	sewrepair = TRUE
	armor_class = ARMOR_CLASS_LIGHT
	salvage_result = /obj/item/natural/hide/cured

/obj/item/clothing/suit/roguetown/armor/leather/hatanga_degel_fur_purple
	icon_state = "hatangafur_purple"
	item_state = "hatangafur_purple"

/obj/item/clothing/suit/roguetown/armor/leather/hatanga_degel_fur_orange
	icon_state = "hatangafur_orange"
	item_state = "hatangafur_orange"

/obj/item/clothing/suit/roguetown/armor/leather/Huus_quyaq
	name = "Huus quyaq"
	desc = "Armor made of leather plates."
	icon_state = "huus"
	item_state = "huus"
	armor = list("blunt" = 60, "slash" = 50, "stab" = 45, "bullet" = 15, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT,BCLASS_BLUNT)
	blocksound = SOFTHIT
	slot_flags = ITEM_SLOT_ARMOR
	blade_dulling = DULLING_BASHCHOP
	body_parts_covered = CHEST|GROIN|LEGS|VITALS
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	sewrepair = TRUE
	armor_class = ARMOR_CLASS_LIGHT
	salvage_res

//Blackstone Slop///I just stole these from one of the Blackstone offshoots///

/obj/item/clothing/suit/roguetown/armor/plate/scale/inqcoat
	slot_flags = ITEM_SLOT_ARMOR
	name = "inquisitorial duster"
	desc = "Metal plates reinforce this heavy coat. You live, die, and live again."
	body_parts_covered = CHEST|VITALS|GROIN|LEGS|ARMS
	allowed_sex = list(MALE, FEMALE)
	icon_state = "inqcoat"
	item_state = "inqcoat"
	sleevetype = "shirt"
	blocksound = PLATEHIT
	armor = list("blunt" = 90, "slash" = 100, "stab" = 80, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	max_integrity = 210
	armor_class = ARMOR_CLASS_MEDIUM


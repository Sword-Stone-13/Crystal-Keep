/obj/item/clothing/neck/roguetown
	name = "necklace"
	desc = ""
	icon = 'icons/roguetown/clothing/neck.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/neck.dmi'
	bloody_icon_state = "bodyblood"
	w_class = WEIGHT_CLASS_SMALL

/obj/item/clothing/neck/roguetown/coif
	name = "coif"
	icon_state = "coif"
	item_state = "coif"
	desc = "A coif made either of leather or cloth that is comfortable enough to sleep in that protects the head, ears and neck, while providing no protection from arrows and bolts and sadly enough, too soft to prevent chops from decapitating."
	flags_inv = HIDEHAIR
	slot_flags = ITEM_SLOT_NECK|ITEM_SLOT_HEAD
	blocksound = SOFTHIT
	body_parts_covered = NECK|HAIR|EARS|HEAD
	armor = list("blunt" = 33, "slash" = 12, "stab" = 22, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	armor_class = ARMOR_CLASS_LIGHT
	max_integrity = 125
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_BLUNT)
	adjustable = CAN_CADJUST
	toggle_icon_state = TRUE
	sewrepair = TRUE

/obj/item/clothing/neck/roguetown/coif/AdjustClothes(mob/user)
	if(loc == user)
		if(adjustable == CAN_CADJUST)
			adjustable = CADJUSTED
			if(toggle_icon_state)
				icon_state = "[initial(icon_state)]_t"
			flags_inv = null
			body_parts_covered = NECK
			if(ishuman(user))
				var/mob/living/carbon/H = user
				H.update_inv_neck()
				H.update_inv_head()
		else if(adjustable == CADJUSTED)
			ResetAdjust(user)
			flags_inv = HIDEHAIR
			if(user)
				if(ishuman(user))
					var/mob/living/carbon/H = user
					H.update_inv_neck()
					H.update_inv_head()



/obj/item/clothing/neck/roguetown/chaincoif
	name = "chain coif"
	icon_state = "chaincoif"
	item_state = "chaincoif"
	desc = "A steel chain coif, composed of interlinked metal rings that barely absorb impacts from arrows and bolts that protects the head, ears and neck, and is sadly too uncomfortable to sleep in."
	flags_inv = HIDEHAIR
	resistance_flags = FIRE_PROOF
	armor = list("blunt" = 30, "slash" = 60, "stab" = 45, "bullet" = 10, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	armor_class = ARMOR_CLASS_LIGHT
	max_integrity = 200
	resistance_flags = FIRE_PROOF
	slot_flags = ITEM_SLOT_NECK|ITEM_SLOT_HEAD
	body_parts_covered = NECK|HAIR|EARS|HEAD
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_ASSASSIN)
	adjustable = CAN_CADJUST
	toggle_icon_state = TRUE
	blocksound = CHAINHIT
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel

/obj/item/clothing/neck/roguetown/chaincoif/AdjustClothes(mob/user)
	if(loc == user)
		if(adjustable == CAN_CADJUST)
			adjustable = CADJUSTED
			if(toggle_icon_state)
				icon_state = "[initial(icon_state)]_t"
			flags_inv = null
			body_parts_covered = NECK
			if(ishuman(user))
				var/mob/living/carbon/H = user
				H.update_inv_neck()
				H.update_inv_head()
		else if(adjustable == CADJUSTED)
			ResetAdjust(user)
			flags_inv = HIDEHAIR
			if(user)
				if(ishuman(user))
					var/mob/living/carbon/H = user
					H.update_inv_neck()
					H.update_inv_head()


/obj/item/clothing/neck/roguetown/chaincoif/iron
	icon_state = "ichaincoif"
	anvilrepair = /datum/skill/craft/armorsmithing
	desc = "An iron chain coif, composed of interlinked metal rings, that barely absorb impacts from arrows that protects the head, ears and neck, and is sadly too uncomfortable to sleep in."
	smeltresult = /obj/item/ingot/iron
	max_integrity = 150

/obj/item/clothing/neck/roguetown/chaincoif/ironb
	icon_state = "ichaincoif"
	anvilrepair = /datum/skill/craft/armorsmithing
	desc = "An iron chain coif, composed of interlinked metal rings, that barely absorb impacts from arrows that protects the head, ears and neck, and is sadly too uncomfortable to sleep in. blackened iron."
	smeltresult = /obj/item/ingot/iron
	color = "#151615"
	max_integrity = 150

/obj/item/clothing/neck/roguetown/bervor
	name = "bevor"
	desc = "A steel bevor that protects the lower part of the head, that being the neck, mouth and nose."
	icon_state = "bervor"
	armor = list("blunt" = 90, "slash" = 100, "stab" = 80, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	armor_class = ARMOR_CLASS_MEDIUM
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel
	max_integrity = 300
	resistance_flags = FIRE_PROOF
	slot_flags = ITEM_SLOT_NECK
	body_parts_covered = NECK|MOUTH|NOSE
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	blocksound = PLATEHIT

/obj/item/clothing/neck/roguetown/gorget
	name = "gorget"
	desc = "An iron gorget to protect the neck."
	icon_state = "gorget"
	armor = list("blunt" = 90, "slash" = 100, "stab" = 80, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	armor_class = ARMOR_CLASS_MEDIUM
	smeltresult = /obj/item/ingot/iron
	anvilrepair = /datum/skill/craft/armorsmithing
	max_integrity = 150
	resistance_flags = FIRE_PROOF
	slot_flags = ITEM_SLOT_NECK
	body_parts_covered = NECK
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	blocksound = PLATEHIT

/obj/item/clothing/neck/roguetown/leather
	name = "hardened leather gorget"
	desc = "Sturdy, durable, flexible. Will protect your neck from some good lumbering."
	icon_state = "lgorget"
	armor = list("blunt" = 70, "slash" = 60, "stab" = 30, "bullet" = 20, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	armor_class = ARMOR_CLASS_MEDIUM
	max_integrity = 150
	slot_flags = ITEM_SLOT_NECK
	body_parts_covered = NECK
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST) //This one will help against chopping
	blocksound = SOFTHIT
	sewrepair = TRUE
	salvage_amount = 1
	salvage_result = /obj/item/natural/hide/cured

/obj/item/clothing/neck/roguetown/gorget/prisoner/Initialize()
	. = ..()
	name = "cursed collar"
	ADD_TRAIT(src, TRAIT_NODROP, CURSED_ITEM_TRAIT)
	clothing_flags = null

/obj/item/clothing/neck/roguetown/gorget/prisoner/dropped(mob/living/carbon/human/user)
	. = ..()
	if(QDELETED(src))
		return
	qdel(src)

/obj/item/clothing/neck/roguetown/gorget/alt
	name = "vreccale"
	desc = "Nature knows not of mercy."
	icon_state = "iwolfcollar"

/obj/item/clothing/neck/roguetown/psicross
	name = "psycross"//why are they spelled different...
	desc = ""
	icon_state = "psicrossiron"
	//dropshrink = 0.75
	resistance_flags = FIRE_PROOF
	slot_flags = ITEM_SLOT_NECK|ITEM_SLOT_HIP|ITEM_SLOT_WRISTS
	sellprice = 10
	experimental_onhip = TRUE
	anvilrepair = /datum/skill/craft/armorsmithing

/obj/item/clothing/neck/roguetown/psicross/astrata
	name = "amulet of Astrata"
	desc = ""
	icon_state = "astrata"

/obj/item/clothing/neck/roguetown/psicross/noc
	name = "amulet of Noc"
	desc = ""
	icon_state = "noc"

/obj/item/clothing/neck/roguetown/psicross/dendor
	name = "amulet of Dendor"
	desc = ""
	icon_state = "dendor"

/obj/item/clothing/neck/roguetown/psicross/necra
	name = "amulet of Necra"
	desc = ""
	icon_state = "necra"

/obj/item/clothing/neck/roguetown/psicross/pestra
	name = "amulet of Pestra"
	desc = ""

/obj/item/clothing/neck/roguetown/psicross/ravox
	name = "amulet of Ravox"
	desc = ""

/obj/item/clothing/neck/roguetown/psicross/malum
	name = "amulet of Malum"
	icon_state = "malum"
	desc = ""

/obj/item/clothing/neck/roguetown/psicross/wood
	name = "wooden amulet"
	icon_state = "psicrossw"
	sellprice = 0

/obj/item/clothing/neck/roguetown/psicross/wood/aasimar
	name = "aasimarian amulet"
	icon_state = "villager_m1_neck"
	item_state = "villager_m1_neck"
	sellprice = 0

/obj/item/clothing/neck/roguetown/psicross/silver
	name = "silver psycross"
	icon_state = "psicross"
	item_state = "psicross"
	sellprice = 50

/obj/item/clothing/neck/roguetown/psicross/gold
	name = "gold psycross"
	icon_state = "psicrossg"
	item_state = "psicrossg"
	sellprice = 200

/obj/item/clothing/neck/roguetown/psicross/silver/aasimar
	name = "silver aasimarian psycross"
	icon_state = "psicross_elfnut"
	item_state = "psicross_elfnut"

/obj/item/clothing/neck/roguetown/psicross/silver/gold/aasimar//lmao
	name = "gold aasimarian psycross"
	icon_state = "psicross_elfnutg"
	item_state = "psicross_elfnutg"

/obj/item/clothing/neck/roguetown/psicross/silver/pickup(mob/user)
	. = ..()
	var/mob/living/carbon/human/H = user
	if(!H.mind)
		return
	var/datum/antagonist/vampirelord/V_lord = H.mind.has_antag_datum(/datum/antagonist/vampirelord/)
	var/datum/antagonist/werewolf/W = H.mind.has_antag_datum(/datum/antagonist/werewolf/)
	if(ishuman(H))
		if(H.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser))
			to_chat(H, span_userdanger("I can't pick up the silver, it is my BANE!"))
			H.Knockdown(20)
			H.adjustFireLoss(60)
			H.Paralyze(20)
			H.fire_act(1,5)
		if(V_lord)
			if(V_lord.vamplevel < 4 && !H.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser))
				to_chat(H, span_userdanger("I can't pick up the silver, God despises me!"))
				H.Knockdown(10)
				H.Paralyze(10)
		if(W && W.transformed == TRUE)
			to_chat(H, span_userdanger("I can't equip the silver, it is my BANE!"))
			H.Knockdown(20)
			H.Paralyze(20)

/obj/item/clothing/neck/roguetown/psicross/silver/mob_can_equip(mob/living/M, mob/living/equipper, slot, disable_warning = FALSE, bypass_equip_delay_self = FALSE)
	. = ..()
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(!H.mind)
			return TRUE
		var/datum/antagonist/vampirelord/V_lord = H.mind.has_antag_datum(/datum/antagonist/vampirelord/)
		var/datum/antagonist/werewolf/W = H.mind.has_antag_datum(/datum/antagonist/werewolf/)
		if(H.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser))
			to_chat(H, span_userdanger("I can't equip the silver, it is my BANE!"))
			H.Knockdown(20)
			H.adjustFireLoss(60)
			H.Paralyze(20)
			H.fire_act(1,5)
		if(V_lord)
			if(V_lord.vamplevel < 4 && !H.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser))
				to_chat(H, span_userdanger("I can't equip the silver, it is my BANE!"))
				H.Knockdown(10)
				H.Paralyze(10)
		if(W && W.transformed == TRUE)
			to_chat(H, span_userdanger("I can't equip the silver, it is my BANE!"))
			H.Knockdown(20)
			H.Paralyze(20)

/obj/item/clothing/neck/roguetown/psicross/g
	name = "golden psycross"
	desc = ""
	icon_state = "psicrossg"
	//dropshrink = 0.75
	resistance_flags = FIRE_PROOF
	sellprice = 100

/obj/item/clothing/neck/roguetown/talkstone
	name = "talkstone"
	desc = ""
	icon_state = "talkstone"
	item_state = "talkstone"
	//dropshrink = 0.75
	resistance_flags = FIRE_PROOF
	allowed_race = CLOTHED_RACES_TYPES
	sellprice = 98
	anvilrepair = /datum/skill/craft/armorsmithing

/obj/item/clothing/neck/roguetown/horus
	name = "eye of horuz"
	desc = ""
	icon_state = "horus"
	//dropshrink = 0.75
	resistance_flags = FIRE_PROOF
	sellprice = 30
	anvilrepair = /datum/skill/craft/armorsmithing

/obj/item/clothing/neck/roguetown/shalal
	name = "desert rider medal"
	desc = ""
	icon_state = "shalal"
	//dropshrink = 0.75
	resistance_flags = FIRE_PROOF
	sellprice = 15
	anvilrepair = /datum/skill/craft/armorsmithing


///CRYSTAL KEEP///


/obj/item/clothing/neck/roguetown/walnutian
	name = "gold piece necklace"
	desc = ""
	icon_state = "villager_w1_neck"
	item_state = "villager_w1_neck"
	sellprice = 300

///ELFNUT///
/obj/item/clothing/neck/roguetown/bervor/elfnut
	name = "elfnut bervor"
	desc = ""
	icon_state = "elfnut_bervor"
	item_state = "elfnut_bervor"
	armor_class = ARMOR_CLASS_LIGHT
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/iron
	max_integrity = 250


/obj/item/clothing/neck/roguetown/bervor/elfnut/silverwood
	name = "elfnut silver bervor"
	desc = ""
	icon_state = "elfnut_var_bervor"
	item_state = "elfnut_var_bervor"
	armor_class = ARMOR_CLASS_LIGHT
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/silver
	max_integrity = 300


/obj/item/clothing/neck/roguetown/bling
	name = "solid gold bling"
	desc = "It reads 'Wizard Federation'"
	icon_state = "shadowwiz_neck"
	item_state = "shadowwiz_neck"
	sellprice = 600

///BLUESTEEL///
/*
/obj/item/clothing/neck/roguetown/bervor/bluesteel
	name = "Bluesteel Ring Bervor"
	desc = "A thick ring around the neck for protection."
	armor_class = ARMOR_CLASS_HEAVY
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/bluesteel
	max_integrity = 400
	icon_state = "ichaincoif"
	item_state = "ichaincoif"
	color = "#4bcdfc"
*/
///REDSTEEL///
/obj/item/clothing/neck/roguetown/bervor/redsteel
	name = "Redsteel Haunch"
	desc = "A redsteel haunch, scaly, shifts around to pressure, inner part clips in and the outer is someone fluid."
	icon_state = "redsteel_bervor"
	item_state = "redsteel_bervor"
	armor = list("blunt" = 90, "slash" = 100, "stab" = 100, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 0)
	armor_class = ARMOR_CLASS_LIGHT
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/redsteel
	max_integrity = 500

///The houses///


/obj/item/clothing/neck/roguetown/bervor/bravado
	name = "Bronze plated bervor"
	desc = ""
	icon_state = "house_yellow_bervor"
	item_state = "house_yellow_bervor"

/obj/item/clothing/neck/roguetown/bervor/alrich
	name = "alrich bervor"
	desc = ""
	icon_state = "house_red_bervor"
	item_state = "house_red_bervor"

/obj/item/clothing/neck/roguetown/bervor/bravado
	name = "Bronze plated bervor"
	desc = ""
	icon_state = "house_yellow_bervor"
	item_state = "house_yellow_bervor"

/*
/obj/item/clothing/neck/roguetown/bervor/caesar
	name = "Caesar bervor"
	desc = ""
	icon_state = "plate_purple"

/obj/item/clothing/neck/roguetown/bervor/deleon
	name = "Deleon bervor"
	desc = ""
	icon_state = "plate_blue"

/obj/item/clothing/neck/roguetown/bervor/echarus
	name = "Echarus bervor"
	desc = ""
	icon_state = "plate_green"

/obj/item/clothing/neck/roguetown/bervor/black
	name = "Black House bervor"
	desc = ""
	icon_state = "plate_black"
*/

/obj/item/clothing/neck/roguetown/bervor/white
	name = "White House bervor"
	desc = ""
	icon_state = "plate_white"

/obj/item/organ/penis
	name = "penis"
	icon_state = "penis" 
	visible_organ = TRUE
	zone = BODY_ZONE_PRECISE_GROIN
	slot = ORGAN_SLOT_PENIS
	exclude = TRUE
	organ_dna_type = /datum/organ_dna/penis
	accessory_type = /datum/sprite_accessory/penis/human
	var/sheath_type = SHEATH_TYPE_NONE
	var/penis_type = PENIS_TYPE_PLAIN
	var/penis_size = DEFAULT_PENIS_SIZE

/obj/item/organ/penis/Initialize()
	. = ..()

/obj/item/organ/penis/knotted
	name = "knotted penis"
	penis_type = PENIS_TYPE_KNOTTED
	sheath_type = SHEATH_TYPE_NORMAL
	icon_state = "knotpenis" 

/obj/item/organ/penis/knotted/big
	penis_size = 3

/obj/item/organ/penis/equine
	name = "equine penis"
	penis_type = PENIS_TYPE_EQUINE
	sheath_type = SHEATH_TYPE_NORMAL
	icon_state = "equinepenis"

/obj/item/organ/penis/tapered_mammal
	name = "tapered penis"
	penis_type = PENIS_TYPE_TAPERED
	sheath_type = SHEATH_TYPE_NORMAL
	icon_state = "taperedpenis"

/obj/item/organ/penis/tapered
	name = "tapered penis"
	penis_type = PENIS_TYPE_TAPERED
	sheath_type = SHEATH_TYPE_SLIT
	icon_state = "taperedpenis"

/obj/item/organ/penis/tapered_double
	name = "hemi tapered penis"
	penis_type = PENIS_TYPE_TAPERED_DOUBLE
	sheath_type = SHEATH_TYPE_SLIT
	icon_state = "hemipenis"

/obj/item/organ/penis/tapered_double_knotted
	name = "hemi knotted tapered penis"
	penis_type = PENIS_TYPE_TAPERED_DOUBLE_KNOTTED
	sheath_type = SHEATH_TYPE_SLIT
	icon_state = "hemiknotpenis"

/obj/item/organ/penis/barbed
	name = "barbed penis"
	penis_type = PENIS_TYPE_BARBED
	sheath_type = SHEATH_TYPE_NORMAL
	icon_state = "barbpenis"

/obj/item/organ/penis/barbed_knotted
	name = "barbed knotted penis"
	penis_type = PENIS_TYPE_BARBED_KNOTTED
	sheath_type = SHEATH_TYPE_NORMAL
	icon_state = "barbpenis"

/obj/item/organ/breasts
	name = "breasts"
	icon_state = "breasts"
	visible_organ = TRUE
	zone = BODY_ZONE_CHEST
	slot = ORGAN_SLOT_BREASTS
	exclude = TRUE
	organ_dna_type = /datum/organ_dna/breasts
	accessory_type = /datum/sprite_accessory/breasts/pair
	var/breast_size = DEFAULT_BREASTS_SIZE
/obj/item/organ/tail
	name = "tail"
	desc = "A severed tail. What did you cut this off of?"
	icon_state = "severedtail"
	visible_organ = TRUE
	zone = BODY_ZONE_PRECISE_GROIN
	slot = ORGAN_SLOT_TAIL
	var/can_wag = TRUE
	var/wagging = FALSE
	var/can_penetrate = FALSE

/obj/item/organ/tail/cat
	name = "cat tail"
	desc = "A severed cat tail. Who's wagging now?"
	accessory_type = /datum/sprite_accessory/tail/catbig

/obj/item/organ/tail/lizard
	name = "reptoid tail"
	desc = "A severed reptoid tail. Somewhere, no doubt, a lizard hater is very pleased with themselves."
	color = "#116611"
	accessory_type = /datum/sprite_accessory/tail/lizard/smooth
	icon_state = "lizardtail"
	can_penetrate = TRUE

/obj/item/organ/tail/lizard/fake
	name = "fabricated lizard tail"
	desc = "A fabricated severed lizard tail. This one's made of synthflesh. Probably not usable for lizard wine."

/obj/item/organ/tail/monkey
	name = "monkey tail"
	desc = "A severed monkey tail. Does not look like a banana."
	icon_state = "severedmonkeytail"
	accessory_type = /datum/sprite_accessory/tail/monkey

/obj/item/organ/tail/tajaran
	name = "tajaran tail"

/obj/item/organ/tail/tiefling
	name = "tiefling tail"
	accessory_type =  /datum/sprite_accessory/tail/tiefling

/obj/item/organ/tail/kobold
	name = "kobold tail"
	desc = ""
	color = "#116611"
	accessory_type =  /datum/sprite_accessory/tail/lizard/kobold
	icon_state = "koboldtail"
	can_penetrate = TRUE

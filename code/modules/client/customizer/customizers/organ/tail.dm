/datum/customizer/organ/tail
	name = "Tail"
	abstract_type = /datum/customizer/organ/tail
	allows_disabling = TRUE

/datum/customizer_choice/organ/tail
	name = "Tail"
	organ_type = /obj/item/organ/tail
	organ_slot = ORGAN_SLOT_TAIL
	abstract_type = /datum/customizer_choice/organ/tail

/datum/customizer/organ/tail/tabaxi
	customizer_choices = list(/datum/customizer_choice/organ/tail/tabaxi)

/datum/customizer_choice/organ/tail/tabaxi
	name = "Tabaxi Tail"
	organ_type = /obj/item/organ/tail/cat
	sprite_accessories = list(
		/datum/sprite_accessory/tail/catbig,
		/datum/sprite_accessory/tail/cat,
		/datum/sprite_accessory/tail/tiger,
		/datum/sprite_accessory/tail/leopard,
		)

/datum/customizer/organ/tail/lizard
	customizer_choices = list(/datum/customizer_choice/organ/tail/lizard)

/datum/customizer_choice/organ/tail/lizard
	name = "Reptoid Tail"
	organ_type = /obj/item/organ/tail/lizard
	generic_random_pick = TRUE
	sprite_accessories = list(
		/datum/sprite_accessory/tail/lizard/smooth,
		/datum/sprite_accessory/tail/lizard/dtiger,
		/datum/sprite_accessory/tail/lizard/ltiger,
		/datum/sprite_accessory/tail/lizard/spikes,
		)

/datum/customizer/organ/tail/kobold
	customizer_choices = list(/datum/customizer_choice/organ/tail/kobold)

/datum/customizer_choice/organ/tail/kobold
	name = "Kobold Tail"
	organ_type = /obj/item/organ/tail/kobold
	generic_random_pick = TRUE
	sprite_accessories = list(
		/datum/sprite_accessory/tail/lizard/kobold,
		)

/datum/customizer/organ/tail/tiefling
	customizer_choices = list(/datum/customizer_choice/organ/tail/tiefling)

/datum/customizer_choice/organ/tail/tiefling
	name = "Tiefling Tail"
	organ_type = /obj/item/organ/tail/tiefling
	generic_random_pick = TRUE
	sprite_accessories = list(
		/datum/sprite_accessory/tail/tiefling/pointed,
		/datum/sprite_accessory/tail/tiefling/heart,
		)
	allows_accessory_color_customization = FALSE

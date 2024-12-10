/datum/customizer/organ/snout
	abstract_type = /datum/customizer/organ/snout
	name = "Snout"

/datum/customizer_choice/organ/snout
	abstract_type = /datum/customizer_choice/organ/snout
	name = "Snout"
	organ_type = /obj/item/organ/snout
	organ_slot = ORGAN_SLOT_SNOUT

/datum/customizer/organ/snout/lizard
	customizer_choices = list(/datum/customizer_choice/organ/snout/lizard)

/datum/customizer_choice/organ/snout/lizard
	name = "Lizard Snout"
	organ_type = /obj/item/organ/snout/lizard
	generic_random_pick = TRUE
	sprite_accessories = list(
		/datum/sprite_accessory/snout/sharp,
		/datum/sprite_accessory/snout/round,
		/datum/sprite_accessory/snout/sharplight,
		/datum/sprite_accessory/snout/roundlight,
		/datum/sprite_accessory/snout/front/sharp,
		/datum/sprite_accessory/snout/front/round,
		/datum/sprite_accessory/snout/front/sharplight,
		/datum/sprite_accessory/snout/front/roundlight,
		)
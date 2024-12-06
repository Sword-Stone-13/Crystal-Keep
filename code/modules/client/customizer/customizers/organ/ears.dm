/datum/customizer/organ/ears
	name = "Ears"
	abstract_type = /datum/customizer/organ/ears

/datum/customizer_choice/organ/ears
	name = "Ears"
	organ_type = /obj/item/organ/ears
	organ_slot = ORGAN_SLOT_EARS
	abstract_type = /datum/customizer_choice/organ/ears

/datum/customizer/organ/ears/tabaxi
	customizer_choices = list(/datum/customizer_choice/organ/ears/tabaxi)

/datum/customizer_choice/organ/ears/tabaxi
	name = "Tabaxi Ears"
	organ_type = /obj/item/organ/ears/tabaxi
	sprite_accessories = list(
		/datum/sprite_accessory/ears/cat,
		/datum/sprite_accessory/ears/cat_big,
		/datum/sprite_accessory/ears/cat_normal,
		)

/datum/customizer/organ/ears/cat
	customizer_choices = list(/datum/customizer_choice/organ/ears/cat)

/datum/customizer_choice/organ/ears/cat
	name = "Cat Ears"
	organ_type = /obj/item/organ/ears/cat
	sprite_accessories = list(/datum/sprite_accessory/ears/cat)
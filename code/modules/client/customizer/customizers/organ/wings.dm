/datum/customizer/organ/wings
	abstract_type = /datum/customizer/organ/wings
	name = "Wings"

/datum/customizer_choice/organ/wings
	abstract_type = /datum/customizer_choice/organ/wings
	name = "Wings"
	organ_type = /obj/item/organ/wings
	organ_slot = ORGAN_SLOT_WINGS

/datum/customizer/organ/wings/moth
	customizer_choices = list(/datum/customizer_choice/organ/wings/moth)

/datum/customizer_choice/organ/wings/moth
	name = "Aasimar Wings"
	organ_type = /obj/item/organ/wings/moth
	sprite_accessories = list(
		/datum/sprite_accessory/wings/moth/plain,
		/datum/sprite_accessory/wings/moth/monarch,
		/datum/sprite_accessory/wings/moth/luna,
		/datum/sprite_accessory/wings/moth/atlas,
		/datum/sprite_accessory/wings/moth/reddish,
		/datum/sprite_accessory/wings/moth/royal,
		/datum/sprite_accessory/wings/moth/gothic,
		/datum/sprite_accessory/wings/moth/lovers,
		/datum/sprite_accessory/wings/moth/whitefly,
		/datum/sprite_accessory/wings/moth/punished,
		/datum/sprite_accessory/wings/moth/firewatch,
		/datum/sprite_accessory/wings/moth/deathhead,
		/datum/sprite_accessory/wings/moth/poison,
		/datum/sprite_accessory/wings/moth/ragged,
		/datum/sprite_accessory/wings/moth/moonfly,
		/datum/sprite_accessory/wings/moth/snow,
		/datum/sprite_accessory/wings/moth/oakworm,
		/datum/sprite_accessory/wings/moth/jungle,
		/datum/sprite_accessory/wings/moth/witchwing,
		/datum/sprite_accessory/wings/moth/rosy,
		/datum/sprite_accessory/wings/moth/featherful,
		/datum/sprite_accessory/wings/moth/brown,
		/datum/sprite_accessory/wings/moth/plasmafire,
		)

/datum/customizer/organ/wings/seelie
	var/accessory_colors = "000000"
	var/allows_accessory_color_customization = FALSE
	customizer_choices = list(/datum/customizer_choice/organ/wings/seelie)

/datum/customizer_choice/organ/wings/seelie
	name = "Seelie Wings"
	organ_type = /obj/item/organ/wings/seelie
	sprite_accessories = list(
		/datum/sprite_accessory/wings/seelie,
		/datum/sprite_accessory/wings/bee,
	)

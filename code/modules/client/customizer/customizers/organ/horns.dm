/datum/customizer/organ/horns
	abstract_type = /datum/customizer/organ/horns
	name = "Horns"
	allows_disabling = TRUE

/datum/customizer_choice/organ/horns
	abstract_type = /datum/customizer_choice/organ/horns
	name = "Horns"
	organ_type = /obj/item/organ/horns
	organ_slot = ORGAN_SLOT_HORNS

/datum/customizer/organ/horns/humanoid
	customizer_choices = list(/datum/customizer_choice/organ/horns/humanoid)

/datum/customizer/organ/horns/humanoid/reptoid
	default_disabled = TRUE

/datum/customizer_choice/organ/horns/humanoid
	name = "Horns"
	organ_type = /obj/item/organ/horns/humanoid
	generic_random_pick = TRUE
	sprite_accessories = list(
		/datum/sprite_accessory/horns/simple,
		/datum/sprite_accessory/horns/short,
		/datum/sprite_accessory/horns/curled,
		/datum/sprite_accessory/horns/ram,
		/datum/sprite_accessory/horns/angler,
		/datum/sprite_accessory/horns/guilmon,
		/datum/sprite_accessory/horns/drake,
		/datum/sprite_accessory/horns/knight,
		/datum/sprite_accessory/horns/antlers,
		/datum/sprite_accessory/horns/ramalt,
		/datum/sprite_accessory/horns/smallantlers,
		/datum/sprite_accessory/horns/curledramhorns,
		/datum/sprite_accessory/horns/curledramhornsalt,
		/datum/sprite_accessory/horns/smallramhorns,
		/datum/sprite_accessory/horns/smallramhornsalt,
		/datum/sprite_accessory/horns/smallramhornsthree,
		/datum/sprite_accessory/horns/liftedhorns,
		/datum/sprite_accessory/horns/bigcurlyhorns,
		/datum/sprite_accessory/horns/billberry,
		/datum/sprite_accessory/horns/stabbers,
		/datum/sprite_accessory/horns/outstretched,
		/datum/sprite_accessory/horns/halo,
		/datum/sprite_accessory/horns/greathorns,
		/datum/sprite_accessory/horns/bunhorns,
		/datum/sprite_accessory/horns/marauder,
		/datum/sprite_accessory/horns/faceguard,
		/datum/sprite_accessory/horns/sheephorns,
		/datum/sprite_accessory/horns/doublehorns,
		)

/datum/customizer/organ/horns/humanoid/tiefling
	customizer_choices = list(/datum/customizer_choice/organ/horns/humanoid/tiefling)
	default_disabled = FALSE

/datum/customizer_choice/organ/horns/humanoid/tiefling
	name = "Horns"
	organ_type = /obj/item/organ/horns
	generic_random_pick = TRUE
	sprite_accessories = list(
		/datum/sprite_accessory/horns/simple,
		/datum/sprite_accessory/horns/short,
		/datum/sprite_accessory/horns/curled,
		/datum/sprite_accessory/horns/ram,
		/datum/sprite_accessory/horns/drake,
		/datum/sprite_accessory/horns/knight,
		/datum/sprite_accessory/horns/antlers,
		/datum/sprite_accessory/horns/ramalt,
		/datum/sprite_accessory/horns/smallantlers,
		/datum/sprite_accessory/horns/curledramhorns,
		/datum/sprite_accessory/horns/curledramhornsalt,
		/datum/sprite_accessory/horns/smallramhorns,
		/datum/sprite_accessory/horns/smallramhornsalt,
		/datum/sprite_accessory/horns/liftedhorns,
		/datum/sprite_accessory/horns/bigcurlyhorns,
		/datum/sprite_accessory/horns/billberry,
		/datum/sprite_accessory/horns/stabbers,
		/datum/sprite_accessory/horns/outstretched,
		/datum/sprite_accessory/horns/halo,
		/datum/sprite_accessory/horns/greathorns,
		/datum/sprite_accessory/horns/bunhorns,
		/datum/sprite_accessory/horns/marauder,
		/datum/sprite_accessory/horns/faceguard,
		/datum/sprite_accessory/horns/doublehorns,
		/datum/sprite_accessory/horns/tiefhorns,
		)

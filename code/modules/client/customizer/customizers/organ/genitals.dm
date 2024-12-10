/datum/customizer/organ/penis
	abstract_type = /datum/customizer/organ/penis
	name = "Penis"

/datum/customizer/organ/penis/is_allowed(datum/preferences/prefs)
	return (prefs.gender == MALE)

/datum/customizer_choice/organ/penis
	abstract_type = /datum/customizer_choice/organ/penis
	name = "Penis"
	organ_type = /obj/item/organ/penis
	organ_slot = ORGAN_SLOT_PENIS
	organ_dna_type = /datum/organ_dna/penis
	customizer_entry_type = /datum/customizer_entry/organ/penis

/datum/customizer_choice/organ/penis/validate_entry(datum/preferences/prefs, datum/customizer_entry/entry)
	..()
	var/datum/customizer_entry/organ/penis/penis_entry = entry
	penis_entry.penis_size = sanitize_integer(penis_entry.penis_size, MIN_PENIS_SIZE, MAX_PENIS_SIZE, DEFAULT_PENIS_SIZE)

/datum/customizer_choice/organ/penis/imprint_organ_dna(datum/organ_dna/organ_dna, datum/customizer_entry/entry, datum/preferences/prefs)
	..()
	var/datum/organ_dna/penis/penis_dna = organ_dna
	var/datum/customizer_entry/organ/penis/penis_entry = entry
	penis_dna.penis_size = penis_entry.penis_size

/datum/customizer_choice/organ/penis/generate_pref_choices(list/dat, datum/preferences/prefs, datum/customizer_entry/entry, customizer_type)
	..()
	var/datum/customizer_entry/organ/penis/penis_entry = entry
	dat += "<br>Penis size: <a href='?_src_=prefs;task=change_customizer;customizer=[customizer_type];customizer_task=penis_size''>[find_key_by_value(GLOB.named_penis_sizes, penis_entry.penis_size)]</a>"

/datum/customizer_choice/organ/penis/handle_topic(mob/user, list/href_list, datum/preferences/prefs, datum/customizer_entry/entry, customizer_type)
	..()
	var/datum/customizer_entry/organ/penis/penis_entry = entry
	switch(href_list["customizer_task"])
		if("penis_size")
			var/named_size = input(user, "Choose your penis size:", "Character Preference", find_key_by_value(GLOB.named_penis_sizes, penis_entry.penis_size)) as anything in GLOB.named_penis_sizes
			if(isnull(named_size))
				return
			var/new_size = GLOB.named_penis_sizes[named_size]
			penis_entry.penis_size = sanitize_integer(new_size, MIN_PENIS_SIZE, MAX_PENIS_SIZE, DEFAULT_PENIS_SIZE)

/datum/customizer_entry/organ/penis
	var/penis_size = DEFAULT_PENIS_SIZE

/datum/customizer/organ/penis/human
	customizer_choices = list(/datum/customizer_choice/organ/penis/human)

/datum/customizer_choice/organ/penis/human
	name = "Plain Penis"
	organ_type = /obj/item/organ/penis
	sprite_accessories = list(/datum/sprite_accessory/penis/human)
	allows_accessory_color_customization = FALSE

/datum/customizer/organ/breasts
	abstract_type = /datum/customizer/organ/breasts
	name = "Breasts"

/datum/customizer/organ/breasts/is_allowed(datum/preferences/prefs)
	return (prefs.gender == FEMALE)

/datum/customizer_choice/organ/breasts
	abstract_type = /datum/customizer_choice/organ/breasts
	name = "Breasts"
	customizer_entry_type = /datum/customizer_entry/organ/breasts
	organ_type = /obj/item/organ/breasts
	organ_slot = ORGAN_SLOT_BREASTS
	organ_dna_type = /datum/organ_dna/breasts

/datum/customizer_choice/organ/breasts/validate_entry(datum/preferences/prefs, datum/customizer_entry/entry)
	..()
	var/datum/customizer_entry/organ/breasts/breasts_entry = entry
	breasts_entry.breast_size = sanitize_integer(breasts_entry.breast_size, MIN_BREASTS_SIZE, MAX_BREASTS_SIZE, DEFAULT_BREASTS_SIZE)

/datum/customizer_choice/organ/breasts/imprint_organ_dna(datum/organ_dna/organ_dna, datum/customizer_entry/entry, datum/preferences/prefs)
	..()
	var/datum/organ_dna/breasts/breasts_dna = organ_dna
	var/datum/customizer_entry/organ/breasts/breasts_entry = entry
	breasts_dna.breast_size = breasts_entry.breast_size

/datum/customizer_choice/organ/breasts/generate_pref_choices(list/dat, datum/preferences/prefs, datum/customizer_entry/entry, customizer_type)
	..()
	var/datum/customizer_entry/organ/breasts/breasts_entry = entry
	dat += "<br>Breast size: <a href='?_src_=prefs;task=change_customizer;customizer=[customizer_type];customizer_task=breast_size''>[find_key_by_value(GLOB.named_breast_sizes, breasts_entry.breast_size)]</a>"

/datum/customizer_choice/organ/breasts/handle_topic(mob/user, list/href_list, datum/preferences/prefs, datum/customizer_entry/entry, customizer_type)
	..()
	var/datum/customizer_entry/organ/breasts/breasts_entry = entry
	switch(href_list["customizer_task"])
		if("breast_size")
			var/named_size = input(user, "Choose your breast size:", "Character Preference", find_key_by_value(GLOB.named_breast_sizes, breasts_entry.breast_size)) as anything in GLOB.named_breast_sizes
			if(isnull(named_size))
				return
			var/new_size = GLOB.named_breast_sizes[named_size]
			breasts_entry.breast_size = sanitize_integer(new_size, MIN_BREASTS_SIZE, MAX_BREASTS_SIZE, DEFAULT_BREASTS_SIZE)

/datum/customizer_entry/organ/breasts
	var/breast_size = DEFAULT_BREASTS_SIZE

/datum/customizer/organ/breasts/human
	customizer_choices = list(/datum/customizer_choice/organ/breasts/human)

/datum/customizer_choice/organ/breasts/human
	sprite_accessories = list(/datum/sprite_accessory/breasts/pair)
	allows_accessory_color_customization = FALSE
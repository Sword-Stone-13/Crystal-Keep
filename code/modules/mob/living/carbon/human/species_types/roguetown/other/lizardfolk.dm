/mob/living/carbon/human/species/lizardfolk
	race = /datum/species/lizardfolk

/datum/species/lizardfolk
	name = "Reptoid"
	id = "lizardfolk"
	desc = "<b>Reptoid</b><br>\
	Reptoids, favored of Dendor, are semi-aquatic reptilian humanoids.\
	Powerfully built and savage, these creachers are the terror of societies elsewhere. \
	Moreso, they're a terror to one another, matriarchs and ursurpers constantly plague their violent and volotile savage societies. \
	They maintain groups no larger than small nomadic parties, ready to engulf unprepared villages like maggots to a corpse. \
	Every once in a while, a friendly one arrives with a funny hat and a firm handshake. Perhaps an oversight from a demanding matriarch. \
	Regardless, the sins of the many taint the visage of the few."


	skin_tone_wording = "Skin Colors"
	species_traits = list(EYECOLOR,LIPS,STUBBLE,MUTCOLORS)
	inherent_traits = list(TRAIT_NOMOBSWAP)
	possible_ages = ALL_AGES_LIST
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	limbs_icon_m = 'icons/roguetown/mob/bodies/m/mt.dmi'
	limbs_icon_f = 'icons/roguetown/mob/bodies/m/mt.dmi'
	dam_icon = 'icons/roguetown/mob/bodies/dam/dam_male.dmi'
	dam_icon_f = 'icons/roguetown/mob/bodies/dam/dam_male.dmi'
	use_m = TRUE
	soundpack_m = /datum/voicepack/male
	soundpack_f = /datum/voicepack/female
	offset_features = list(
		OFFSET_ID = list(0,1), OFFSET_GLOVES = list(0,1), OFFSET_WRISTS = list(0,1),\
		OFFSET_CLOAK = list(0,1), OFFSET_FACEMASK = list(0,1), OFFSET_HEAD = list(0,1), \
		OFFSET_FACE = list(0,1), OFFSET_BELT = list(0,1), OFFSET_BACK = list(0,1), \
		OFFSET_NECK = list(0,1), OFFSET_MOUTH = list(0,1), OFFSET_PANTS = list(0,0), \
		OFFSET_SHIRT = list(0,1), OFFSET_ARMOR = list(0,1), OFFSET_HANDS = list(0,1), OFFSET_UNDIES = list(0,1), \
		OFFSET_ID_F = list(0,1), OFFSET_GLOVES_F = list(0,1), OFFSET_WRISTS_F = list(0,1), OFFSET_HANDS_F = list(0,1), \
		OFFSET_CLOAK_F = list(0,1), OFFSET_FACEMASK_F = list(0,1), OFFSET_HEAD_F = list(0,1), \
		OFFSET_FACE_F = list(0,1), OFFSET_BELT_F = list(0,1), OFFSET_BACK_F = list(0,1), \
		OFFSET_NECK_F = list(0,1), OFFSET_MOUTH_F = list(0,1), OFFSET_PANTS_F = list(0,0), \
		OFFSET_SHIRT_F = list(0,1), OFFSET_ARMOR_F = list(0,1), OFFSET_UNDIES_F = list(0,1), \
		)
	specstats = list(
		"strength" = 2,
		"skill" = -2,
		"mageability" = -4,
		"constitution" = 1,
		"endurance" = 1,
		"speed" = -2,
		"faith" = -3,
		"fortune" = 0
		)
	specstats_m = list(
		"speed" = 1,
		"endurance" = 1,

	)
	specstats_f = list(
		"strength" = 1,
		"constitution" = 1,
	)
	enflamed_icon = "widefire"
	attack_verb = "slash"
	attack_sound = 'sound/blank.ogg'
	miss_sound = 'sound/blank.ogg'
	organs = list(
		ORGAN_SLOT_BRAIN = /obj/item/organ/brain,
		ORGAN_SLOT_HEART = /obj/item/organ/heart,
		ORGAN_SLOT_LUNGS = /obj/item/organ/lungs,
		ORGAN_SLOT_EYES = /obj/item/organ/eyes,
		ORGAN_SLOT_EARS = /obj/item/organ/ears,
		ORGAN_SLOT_TONGUE = /obj/item/organ/tongue/lizard,
		ORGAN_SLOT_LIVER = /obj/item/organ/liver,
		ORGAN_SLOT_STOMACH = /obj/item/organ/stomach,
		ORGAN_SLOT_APPENDIX = /obj/item/organ/appendix,
		ORGAN_SLOT_SNOUT = /obj/item/organ/snout/lizard,
		ORGAN_SLOT_TAIL_FEATURE = /obj/item/organ/tail_feature/lizard_spines,
		ORGAN_SLOT_FRILLS = /obj/item/organ/frills/lizard,
		ORGAN_SLOT_HORNS = /obj/item/organ/horns,
		ORGAN_SLOT_PENIS = /obj/item/organ/penis/tapered_double,
		)
	customizers = list(
		/datum/customizer/organ/eyes/humanoid,
		/datum/customizer/bodypart_feature/hair/head/humanoid/bald_default,
		/datum/customizer/bodypart_feature/hair/facial/humanoid/shaved_default,
		/datum/customizer/bodypart_feature/accessory,
		/datum/customizer/bodypart_feature/face_detail,
		/datum/customizer/organ/tail/lizard,
		/datum/customizer/organ/tail_feature/lizard_spines,
		/datum/customizer/organ/snout/lizard,
		/datum/customizer/organ/frills/lizard,
		/datum/customizer/organ/horns/humanoid/reptoid,
		)
	body_marking_sets = list(
		/datum/body_marking_set/none,
		/datum/body_marking_set/bellyscale,
		/datum/body_marking_set/tiger,
		/datum/body_marking_set/tiger_dark,
	)
	body_markings = list(
		/datum/body_marking/flushed_cheeks,
		/datum/body_marking/eyeliner,
		/datum/body_marking/bellyscale,
		/datum/body_marking/bellyscaleslim,
		/datum/body_marking/bellyscaleslimsmooth,
		/datum/body_marking/buttscale,
		/datum/body_marking/tiger,
		/datum/body_marking/tiger/dark,
		/datum/body_marking/drake_eyes,
		/datum/body_marking/tonage,
	)
	languages = list(
		/datum/language/common,
		/datum/language/draconic
	)
	stress_examine = TRUE
	stress_desc = span_red("I gotta go before that lizard gets hungry.")
	descriptor_choices = list(
		/datum/descriptor_choice/height,
		/datum/descriptor_choice/body,
		/datum/descriptor_choice/stature,
		/datum/descriptor_choice/face,
		/datum/descriptor_choice/face_exp,
		/datum/descriptor_choice/scales,
		/datum/descriptor_choice/voice,
		/datum/descriptor_choice/prominent_one,
		/datum/descriptor_choice/prominent_two,
		/datum/descriptor_choice/prominent_three,
		/datum/descriptor_choice/prominent_four,
	)

	alignment_weights = LIZARDFOLK_WEIGHTS

/datum/species/lizardfolk/check_roundstart_eligible()
	return TRUE

/datum/species/lizardfolk/qualifies_for_rank(rank, list/features)
	return TRUE

/datum/species/lizardfolk/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	..()
	RegisterSignal(C, COMSIG_MOB_SAY, PROC_REF(handle_speech))
	ADD_TRAIT(C, TRAIT_STRONGBITE, TRAIT_GENERIC)

/datum/species/lizardfolk/on_species_loss(mob/living/carbon/C)
	. = ..()
	UnregisterSignal(C, COMSIG_MOB_SAY)
	REMOVE_TRAIT(C, TRAIT_STRONGBITE, TRAIT_GENERIC)

/datum/species/lizardfolk/get_random_body_markings(list/passed_features)
	return assemble_body_markings_from_set(GLOB.body_marking_sets_by_type[/datum/body_marking_set/bellyscale], passed_features, src)

/datum/species/lizardfolk/get_random_features()
	var/list/returned = MANDATORY_FEATURE_LIST
	var/main_color
	var/second_color
	var/random = rand(1,5)
	//Choose from a variety of lizardish colors
	switch(random)
		if(1)
			main_color = "15921a"
			second_color = "3a8f3d"
		if(2)
			main_color = "63d100"
			second_color = "89d248"
		if(3)
			main_color = "51aa01"
			second_color = "70ae39"
		if(4)
			main_color = "00b302"
			second_color = "2eb62f"
		if(5)
			main_color = "02c33c"
			second_color = "3ac664"
	returned["mcolor"] = main_color
	returned["mcolor2"] = second_color
	returned["mcolor3"] = second_color
	return returned

/datum/species/lizardfolk/get_accent(mob/living/carbon/human/H)
		return strings("brazillian_replacement.json", "full")

// "start" group in JSON lists
/datum/species/lizardfolk/get_accent_start(mob/living/carbon/human/H)
		return strings("brazillian_replacement.json", "start")

// "end" group in JSON lists
/datum/species/lizardfolk/get_accent_end(mob/living/carbon/human/H)
		return strings("brazillian_replacement.json", "end")

// "syllable" group in JSON lists
/datum/species/lizardfolk/get_accent_any(mob/living/carbon/human/H)
		return strings("brazillian_replacement.json", "syllable")

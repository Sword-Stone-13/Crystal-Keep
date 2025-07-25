/mob/living/carbon/human/species/aasimar
	race = /datum/species/aasimar

/datum/species/aasimar
	name = "Aasimar"
	id = "aasimar"
	desc = "<b>Aasimar</b><br>\
	Aasimar are creachers that descended from the heavens less than a few hundred years ago. \
	Or so they claim. \
	No one really knows where they arrived from. The Walnutians of the Walnut Federation claims their Monogod, Psydon, created them and dropped them in cocoons from the heavens.\
	This, ofcourse, is disputed by Noccian scholars who claim Aasimars are yet another corrupted Chimera folk of many. \
	Regardless, Aasimar are a taller, more robust folk to the common humen, and possess bulbous eyes and a feathery down across their entire body that, on rarities, hums and lightly glows in the starlight. \
	In general they're incandescent, tall, and overbearing; moreso, they possess an ethereal, offputting demeanor to the point of heresy. They're often on the fringes of societies, huddled over in secrecy. \
	Likely due to they're foreign appearance, they posses antisocial inhumen behavior, whereas they are generally Psydonite zealots that affront the Ten. \
	Crystal Keep's populace holds them with a mixture of uneasy fear, distaste, and on some occasions, hatred. \
	For some reason, they generally don't get along with Tiebereans. Often more fire to the flame of their inhumen reputation."

	species_traits = list(EYECOLOR,LIPS,STUBBLE,MUTCOLORS)
	inherent_traits = list(TRAIT_NOMOBSWAP)
	possible_ages = ALL_AGES_LIST
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	limbs_icon_m = 'icons/roguetown/mob/bodies/m/mofm.dmi'
	limbs_icon_f = 'icons/roguetown/mob/bodies/f/moff.dmi'
	dam_icon = 'icons/roguetown/mob/bodies/dam/dam_male.dmi'
	dam_icon_f = 'icons/roguetown/mob/bodies/dam/dam_female.dmi'
	soundpack_m = /datum/voicepack/male/elf
	soundpack_f = /datum/voicepack/female/elf
	offset_features = list(
		OFFSET_ID = list(0,1), OFFSET_GLOVES = list(0,1), OFFSET_WRISTS = list(0,1),\
		OFFSET_CLOAK = list(0,1), OFFSET_FACEMASK = list(0,1), OFFSET_HEAD = list(0,1), \
		OFFSET_FACE = list(0,1), OFFSET_BELT = list(0,1), OFFSET_BACK = list(0,1), \
		OFFSET_NECK = list(0,1), OFFSET_MOUTH = list(0,1), OFFSET_PANTS = list(0,0), \
		OFFSET_SHIRT = list(0,1), OFFSET_ARMOR = list(0,1), OFFSET_HANDS = list(0,1), OFFSET_UNDIES = list(0,1), \
		OFFSET_ID_F = list(0,-1), OFFSET_GLOVES_F = list(0,0), OFFSET_WRISTS_F = list(0,0), OFFSET_HANDS_F = list(0,0), \
		OFFSET_CLOAK_F = list(0,0), OFFSET_FACEMASK_F = list(0,-1), OFFSET_HEAD_F = list(0,-1), \
		OFFSET_FACE_F = list(0,-1), OFFSET_BELT_F = list(0,0), OFFSET_BACK_F = list(0,-1), \
		OFFSET_NECK_F = list(0,-1), OFFSET_MOUTH_F = list(0,-1), OFFSET_PANTS_F = list(0,0), \
		OFFSET_SHIRT_F = list(0,0), OFFSET_ARMOR_F = list(0,0), OFFSET_UNDIES_F = list(0,0), \
		)
	specstats = list(
		"strength" = 0,
		"skill" = 0,
		"mageability" = 0,
		"constitution" = 0,
		"endurance" = 0,
		"speed" = 0,
		"faith" = 3,
		"fortune" = 1
		)
	specstats_m = list(
		"strength" = 3,
		"mageability" = 1,
		"endurance" = 1,
	)
	specstats_f = list(
		"constitution" = 1,
		"mageability" = 3,
		"speed" = 1,
	)
	enflamed_icon = "widefire"

	organs = list(
		ORGAN_SLOT_BRAIN = /obj/item/organ/brain,
		ORGAN_SLOT_HEART = /obj/item/organ/heart,
		ORGAN_SLOT_LUNGS = /obj/item/organ/lungs,
		ORGAN_SLOT_EYES = /obj/item/organ/eyes/moth,
		ORGAN_SLOT_EARS = /obj/item/organ/ears,
		ORGAN_SLOT_TONGUE = /obj/item/organ/tongue,
		ORGAN_SLOT_LIVER = /obj/item/organ/liver,
		ORGAN_SLOT_STOMACH = /obj/item/organ/stomach,
		ORGAN_SLOT_APPENDIX = /obj/item/organ/appendix,
		ORGAN_SLOT_ANTENNAS = /obj/item/organ/antennas/moth,
		ORGAN_SLOT_NECK_FEATURE = /obj/item/organ/neck_feature/moth_fluff,
		ORGAN_SLOT_WINGS = /obj/item/organ/wings/moth,
		ORGAN_SLOT_PENIS = /obj/item/organ/penis/tapered,
		)
	customizers = list(
		/datum/customizer/organ/eyes/moth,
		/datum/customizer/bodypart_feature/accessory,
		/datum/customizer/bodypart_feature/face_detail,
		/datum/customizer/organ/wings/moth,
		/datum/customizer/organ/antennas/moth,
		/datum/customizer/organ/neck_feature/moth_fluff,
		)
	body_marking_sets = list(
		/datum/body_marking_set/moth/reddish,
		/datum/body_marking_set/moth/royal,
		/datum/body_marking_set/moth/gothic,
		/datum/body_marking_set/moth/whitefly,
		/datum/body_marking_set/moth/burnt_off,
		/datum/body_marking_set/moth/deathhead,
		/datum/body_marking_set/moth/poison,
		/datum/body_marking_set/moth/ragged,
		/datum/body_marking_set/moth/moonfly,
		/datum/body_marking_set/moth/oakworm,
		/datum/body_marking_set/moth/jungle,
		/datum/body_marking_set/moth/witchwing,
		/datum/body_marking_set/moth/lovers,
	)
	body_markings = list(
		/datum/body_marking/flushed_cheeks,
		/datum/body_marking/eyeliner,
		/datum/body_marking/moth/grayscale/reddish,
		/datum/body_marking/moth/grayscale/royal,
		/datum/body_marking/moth/grayscale/gothic,
		/datum/body_marking/moth/grayscale/whitefly,
		/datum/body_marking/moth/grayscale/burnt_off,
		/datum/body_marking/moth/grayscale/deathhead,
		/datum/body_marking/moth/grayscale/poison,
		/datum/body_marking/moth/grayscale/ragged,
		/datum/body_marking/moth/grayscale/moonfly,
		/datum/body_marking/moth/grayscale/oakworm,
		/datum/body_marking/moth/grayscale/jungle,
		/datum/body_marking/moth/grayscale/witchwing,
		/datum/body_marking/moth/grayscale/lovers,
	)
	descriptor_choices = list(
		/datum/descriptor_choice/height,
		/datum/descriptor_choice/body,
		/datum/descriptor_choice/stature,
		/datum/descriptor_choice/face,
		/datum/descriptor_choice/face_exp,
		/datum/descriptor_choice/feathers,
		/datum/descriptor_choice/voice,
		/datum/descriptor_choice/prominent_one,
		/datum/descriptor_choice/prominent_two,
		/datum/descriptor_choice/prominent_three,
		/datum/descriptor_choice/prominent_four,
	)
	stress_examine = TRUE
	stress_desc = span_red("That bulbous headed thing is disturbing...")
	languages = list(
		/datum/language/common,
		/datum/language/celestial
	)

	alignment_weights = AASIMAR_WEIGHTS
/datum/species/aasimar/check_roundstart_eligible()
	return TRUE

/datum/species/aasimar/qualifies_for_rank(rank, list/features)
	return TRUE

/datum/species/aasimar/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	. = ..()
	RegisterSignal(C, COMSIG_MOB_SAY, PROC_REF(handle_speech))

/datum/species/aasimar/after_creation(mob/living/carbon/C)
	..()
	to_chat(C, "<span class='info'>I can speak Celestial with ,c before my speech.</span>")

/datum/species/aasimar/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	..()
	var/mob/living/carbon/human/species/aasimar/H = C
	if(H.age == AGE_YOUTH)
		offset_features = list(
			OFFSET_ID = list(0,-1), OFFSET_GLOVES = list(0,-1), OFFSET_WRISTS = list(0,-1),\
			OFFSET_CLOAK = list(0,-1), OFFSET_FACEMASK = list(0,-1), OFFSET_HEAD = list(0,-1), \
			OFFSET_FACE = list(0,-1), OFFSET_BELT = list(0,-1), OFFSET_BACK = list(0,-1), \
			OFFSET_NECK = list(0,-1), OFFSET_MOUTH = list(0,-1), OFFSET_PANTS = list(0,-1), \
			OFFSET_SHIRT = list(0,-1), OFFSET_ARMOR = list(0,-1), OFFSET_HANDS = list(0,-1), OFFSET_UNDIES = list(0,-1), \
			OFFSET_ID_F = list(0,-1), OFFSET_GLOVES_F = list(0,-1), OFFSET_WRISTS_F = list(0,-1), OFFSET_HANDS_F = list(0,-2), \
			OFFSET_CLOAK_F = list(0,-1), OFFSET_FACEMASK_F = list(0,-2), OFFSET_HEAD_F = list(0,-2), \
			OFFSET_FACE_F = list(0,-2), OFFSET_BELT_F = list(0,-1), OFFSET_BACK_F = list(0,-2), \
			OFFSET_NECK_F = list(0,-2), OFFSET_MOUTH_F = list(0,-2), OFFSET_PANTS_F = list(0,-1), \
			OFFSET_SHIRT_F = list(0,-1), OFFSET_ARMOR_F = list(0,-1), OFFSET_UNDIES_F = list(0,-1))
		limbs_icon_m = 'icons/roguetown/mob/bodies/m/mofmy.dmi'
		limbs_icon_f = 'icons/roguetown/mob/bodies/f/moffy.dmi'
		hairyness = null
		body_marking_sets = null
		body_markings = null
//		soundpack_m = new /datum/voicepack/male/young()
		H.has_stubble = FALSE
		H.facial_hairstyle = "None"
		H.update_hair()
		H.update_body()



/datum/species/aasimar/on_species_loss(mob/living/carbon/C)
	. = ..()
	UnregisterSignal(C, COMSIG_MOB_SAY)

/datum/species/aasimar/random_name(gender,unique,lastname)

	var/randname
	if(unique)
		if(gender == MALE)
			for(var/i in 1 to 10)
				randname = pick( world.file2list("strings/rt/names/other/aasm.txt") )
				if(!findname(randname))
					break
		if(gender == FEMALE)
			for(var/i in 1 to 10)
				randname = pick( world.file2list("strings/rt/names/other/aasf.txt") )
				if(!findname(randname))
					break
	else
		if(gender == MALE)
			randname = pick( world.file2list("strings/rt/names/other/aasm.txt") )
		if(gender == FEMALE)
			randname = pick( world.file2list("strings/rt/names/other/aasf.txt") )
	return randname

/datum/species/aasimar/random_surname()
	return

/datum/species/aasimar/get_random_body_markings(list/passed_features)
	return assemble_body_markings_from_set(GLOB.body_marking_sets_by_type[pick(body_marking_sets)], passed_features, src)

/datum/species/aasimar/get_random_features()
	var/list/returned = MANDATORY_FEATURE_LIST
	var/main_color
	var/second_color
	var/random = rand(1,1)
	switch(random)
		if(1)
			main_color = "edcf7e"
			second_color = "2b2a24"
	returned["mcolor"] = main_color
	returned["mcolor2"] = second_color
	returned["mcolor3"] = second_color
	return returned

/datum/species/aasimar/get_accent(mob/living/carbon/human/H)
	return strings("spanish_latin_replacement.json", "full")

// "start" group in JSON lists
/datum/species/aasimar/get_accent_start(mob/living/carbon/human/H)
	return strings("spanish_latin_replacement.json", "start")

// "end" group in JSON lists
/datum/species/aasimar/get_accent_end(mob/living/carbon/human/H)
	return strings("spanish_latin_replacement.json", "end")

// "syllable" group in JSON lists
/datum/species/aasimar/get_accent_any(mob/living/carbon/human/H)
	return strings("spanish_latin_replacement.json", "syllable")

/mob/living/carbon/human/species/nuppies
	race = /datum/species/nuppies

/datum/species/nuppies
	name = "Nuppy"
	id = "nuppies"
	desc = "<b>Nuppy</b><br>\
	Small adorable creachers. No one really knows where they came from, not them even. \
	They're bipedal and somewhat catlike in appearance, males more so, while the females are more human in the face with a thin velvet fur, results vary. \
	They call themselves nuppies, and they claim Astrata as their goddess. \
	Noc scholars still debate their Astratan origin. Posing if they're a type of goblin or dwarf intermix masking from Eora. \
	Regardless, they're considered peaceful folk and are generally staying out of trouble... Generally. Most everyone has a good opinion of them, even the dark elves. \
	Walnutians scholars claim the answer to their origin is somewhere in their labyrinthian libraries, locked away. Regardless, they've always been in Crystal Keep, with humen at least."

	species_traits = list(EYECOLOR,LIPS,STUBBLE)
	inherent_traits = list(TRAIT_NOMOBSWAP)
	possible_ages = ALL_AGES_LIST
	use_skintones = TRUE
	skin_tone_wording = "Tribes"
	limbs_icon_m = 'icons/mob/species/nuppy_male.dmi'
	limbs_icon_f = 'icons/mob/species/nuppy_female.dmi'
	dam_icon = 'icons/roguetown/mob/bodies/dam/dam_male.dmi'
	dam_icon_f = 'icons/roguetown/mob/bodies/dam/dam_female.dmi'
	soundpack_m = /datum/voicepack/male/goblin
	soundpack_f = /datum/voicepack/female
	custom_clothes = TRUE
	use_f = TRUE
	clothes_id = "dwarf"
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	organs = list(
		ORGAN_SLOT_BRAIN = /obj/item/organ/brain,
		ORGAN_SLOT_HEART = /obj/item/organ/heart,
		ORGAN_SLOT_LUNGS = /obj/item/organ/lungs,
		ORGAN_SLOT_EYES = /obj/item/organ/eyes/nuppy,
		ORGAN_SLOT_EARS = /obj/item/organ/ears/nuppy,
		ORGAN_SLOT_TONGUE = /obj/item/organ/tongue,
		ORGAN_SLOT_LIVER = /obj/item/organ/liver,
		ORGAN_SLOT_STOMACH = /obj/item/organ/stomach,
		ORGAN_SLOT_APPENDIX = /obj/item/organ/appendix,
		ORGAN_SLOT_PENIS = /obj/item/organ/penis,
		ORGAN_SLOT_BREASTS = /obj/item/organ/breasts,
		)
	offset_features = list(
		OFFSET_ID = list(0,0), OFFSET_GLOVES = list(0,0), OFFSET_WRISTS = list(0,0),\
		OFFSET_CLOAK = list(0,0), OFFSET_FACEMASK = list(0,-5), OFFSET_HEAD = list(0,-5), \
		OFFSET_FACE = list(0,-5), OFFSET_BELT = list(0,-4), OFFSET_BACK = list(0,-3), \
		OFFSET_NECK = list(0,-4), OFFSET_MOUTH = list(0,-5), OFFSET_PANTS = list(0,0), \
		OFFSET_SHIRT = list(0,0), OFFSET_ARMOR = list(0,0), OFFSET_HANDS = list(0,-3), \
		OFFSET_ID_F = list(0,-4), OFFSET_GLOVES_F = list(0,-4), OFFSET_WRISTS_F = list(0,-4), OFFSET_HANDS_F = list(0,-4), \
		OFFSET_CLOAK_F = list(0,0), OFFSET_FACEMASK_F = list(0,-6), OFFSET_HEAD_F = list(0,-6), \
		OFFSET_FACE_F = list(0,-6), OFFSET_BELT_F = list(0,-4), OFFSET_BACK_F = list(0,-4), \
		OFFSET_NECK_F = list(0,-5), OFFSET_MOUTH_F = list(0,-8), OFFSET_PANTS_F = list(0,0), \
		OFFSET_SHIRT_F = list(0,0), OFFSET_ARMOR_F = list(0,0), OFFSET_UNDIES = list(0,0), OFFSET_UNDIES_F = list(0,0), \
		)

	specstats = list(
		"strength" = 0, 
		"skill" = 0, 
		"mageability" = 0, 
		"constitution" = 0, 
		"endurance" = 0, 
		"speed" = 0, 
		"fortune" = 0,
		"faith" = 0
	)
	// Tribe stat modifiers
	var/static/list/tribe_stat_modifiers = list(
		"City Tribes" = list(
			"strength" = -1,
			"skill" = 2,
			"mageability" = 0,
			"constitution" = -1,
			"endurance" = -1,
			"speed" = 1,
			"fortune" = 0,
			"faith" = -2
		),
		"Village Tribes" = list(
			"strength" = 2,
			"skill" = 0,
			"mageability" = -2,
			"constitution" = 2,
			"endurance" = 1,
			"speed" = -2,
			"fortune" = 0,
			"faith" = 1
		),
		"Warrior Tribes" = list(
			"strength" = 0,
			"skill" = 1,
			"mageability" = -2,
			"constitution" = 0,
			"endurance" = 1,
			"speed" = 1,
			"fortune" = 0,
			"faith" = -1
		),
		"Magic Tribes" = list(
			"strength" = -2,
			"skill" = 1,
			"mageability" = 2,
			"constitution" = -2,
			"endurance" = -1,
			"speed" = 0,
			"fortune" = 0,
			"faith" = -1
		),
		"Farmer Tribes" = list(
			"strength" = 0,
			"skill" = 1,
			"mageability" = 0,
			"constitution" = 1,
			"endurance" = 2,
			"speed" = -1,
			"fortune" = 1,
			"faith" = 1
		),
		"Nomad Tribes" = list(
			"strength" = 0,
			"skill" = 0,
			"mageability" = -1,
			"constitution" = 1,
			"endurance" = 1,
			"speed" = 2,
			"fortune" = 0,
			"faith" = 2
		),
		"Hunting Tribes" = list(
			"strength" = 2,
			"skill" = -1,
			"mageability" = -1,
			"constitution" = 1,
			"endurance" = 1,
			"speed" = 0,
			"fortune" = 0,
			"faith" = 0
		)
	)


	enflamed_icon = "widefire"
	attack_verb = "slash"
	attack_sound = 'sound/blank.ogg'
	miss_sound = 'sound/blank.ogg'
	customizers = list(
		/datum/customizer/organ/eyes/nuppy,
		/datum/customizer/bodypart_feature/hair/head/humanoid,
		/datum/customizer/bodypart_feature/hair/facial/humanoid,
		/datum/customizer/bodypart_feature/accessory,
		/datum/customizer/bodypart_feature/face_detail,
		)
	languages = list(
		/datum/language/common
	)

/datum/species/nuppies/check_roundstart_eligible()
	return TRUE

/datum/species/nuppies/qualifies_for_rank(rank, list/features)
	return TRUE

/datum/species/nuppies/get_skin_list()
	return list(
		"City Tribes" = FUZZ_COLOR_MOONSTONE,
		"Village Tribes" = FUZZ_COLOR_HEROBLUE,
		"Warrior Tribes" = FUZZ_COLOR_CADETGRAY,
		"Magic Tribes" = FUZZ_COLOR_ULTRAVIOLET,
		"Farmer Tribes" = FUZZ_COLOR_WHEAT,
		"Nomad Tribes" = FUZZ_COLOR_DUSK,
		"Hunting Tribes" = FUZZ_COLOR_FIREY
	)
	alignment_weights = NUPPY_WEIGHTS

/datum/species/nuppies/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	..()
	RegisterSignal(C, COMSIG_MOB_SAY, PROC_REF(handle_speech))
	var/mob/living/carbon/human/species/nuppies/H = C

//test start
//So, this is AI generated code here. I'll be honest, I didn't think it'd work. If anyone wants to refine it, start in test start, end in test end.
//Maybe one day this will be added to other species, races, etc. For now, let's let people enjoy this, get feedback, etc. -Encino xxOxXoOXXOox

	// Map skin tones to tribe names for lookup
	var/static/list/skin_to_tribe = list(
		FUZZ_COLOR_MOONSTONE = "City Tribes",
		FUZZ_COLOR_HEROBLUE = "Village Tribes",
		FUZZ_COLOR_CADETGRAY = "Warrior Tribes",
		FUZZ_COLOR_ULTRAVIOLET = "Magic Tribes",
		FUZZ_COLOR_WHEAT = "Farmer Tribes",
		FUZZ_COLOR_DUSK = "Nomad Tribes",
		FUZZ_COLOR_FIREY = "Hunting Tribes"
	)

	// Get the tribe name from skin_tone
	var/tribe = H.skin_tone
	if(H.skin_tone in skin_to_tribe)
		tribe = skin_to_tribe[H.skin_tone]
	else if(!(H.skin_tone in get_skin_list()))
		// Fallback: Default to City Tribes
		tribe = "City Tribes"
		H.skin_tone = FUZZ_COLOR_MOONSTONE
	if(tribe in tribe_stat_modifiers)
		specstats = tribe_stat_modifiers[tribe]
	else
//test end

/datum/species/nuppies/on_species_loss(mob/living/carbon/C)
	. = ..()
	UnregisterSignal(C, COMSIG_MOB_SAY)


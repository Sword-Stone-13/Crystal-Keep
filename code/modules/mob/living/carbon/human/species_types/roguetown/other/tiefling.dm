/mob/living/carbon/human/species/tieberian
	race = /datum/species/tieberian

/datum/species/tieberian
	name = "Tiefling"
	id = "tiefling"
	desc = "<b>Tiefling</b><br>\
	Tieflings, also known as fiendish folk, are a new folk of Crystal Keep.\
	Their culture is a long established one of the jungles and deserts of Etruska having whisked off from their main land after a series of pogroms. \
	Supposedly their origin is an ancient bestial like one, formerly, according to their oral language, having been humen, then blessed by Dendor. \
	They claim they were a soft, pale folk with hooves, shades of pink and green; having once a natural attunement of magic.\
	Others have claimed that they are the spawn of a succubus (Or incubus) laying with a mortal, due to their appearance. \
	Tieflings usually cause strong disturbances with their presence and leave a trail of disorder wherever they stay in. \
	As they generally worship Xylix and take part in Dark Elf practices, that includes cult sacrifices, they maintain an uneasy homeostasis in their locale. \
	Facing scrutiny, judgement, and upheaval in the past, Tieflings are generally a bitter, scornful race. \
	The church of the Ten currently holds them under protection in Crystal Keep as an established people. \
	Tiefling tend to be extremely perceptive and paranoid, as luck is rarely on their side, \
	as of late, in fact, a new folk, Aasimar, have been stoking their flames relentlessly, leading to mutual disdain and disturbing of the general peace."

	skin_tone_wording = "Progenitor"

	species_traits = list(EYECOLOR,HAIR,FACEHAIR,LIPS,STUBBLE,OLDGREY)
	inherent_traits = list(TRAIT_NOMOBSWAP)
	default_features = MANDATORY_FEATURE_LIST
	use_skintones = 1
	skinned_type = /obj/item/stack/sheet/animalhide/human
	disliked_food = NONE
	liked_food = NONE
	possible_ages = ALL_AGES_LIST
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	limbs_icon_m = 'icons/roguetown/mob/bodies/m/mt.dmi'
	limbs_icon_f = 'icons/roguetown/mob/bodies/f/fm.dmi'
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
		"strength" = 1,
		"skill" = 2,
		"mageability" = 1,
		"constitution" = 1,
		"endurance" = 1,
		"speed" = 0,
		"faith" = -1,
		"fortune" = -1
	)
	specstats_f = list(
		"mageability" = 2,
		"faith" = -1,
	)
	enflamed_icon = "widefire"
	organs = list(
		ORGAN_SLOT_BRAIN = /obj/item/organ/brain,
		ORGAN_SLOT_HEART = /obj/item/organ/heart,
		ORGAN_SLOT_LUNGS = /obj/item/organ/lungs,
		ORGAN_SLOT_EYES = /obj/item/organ/eyes,
		ORGAN_SLOT_EARS = /obj/item/organ/ears/tiefling,
		ORGAN_SLOT_TONGUE = /obj/item/organ/tongue,
		ORGAN_SLOT_LIVER = /obj/item/organ/liver,
		ORGAN_SLOT_STOMACH = /obj/item/organ/stomach,
		ORGAN_SLOT_APPENDIX = /obj/item/organ/appendix,
		ORGAN_SLOT_PENIS = /obj/item/organ/penis,
		ORGAN_SLOT_BREASTS = /obj/item/organ/breasts,

	)
	bodypart_features = list(
		/datum/bodypart_feature/hair/head,
		/datum/bodypart_feature/hair/facial,
	)
	customizers = list(
		/datum/customizer/organ/eyes/humanoid,
		/datum/customizer/bodypart_feature/hair/head/humanoid,
		/datum/customizer/bodypart_feature/hair/facial/humanoid,
		/datum/customizer/bodypart_feature/accessory,
		/datum/customizer/bodypart_feature/face_detail,
		/datum/customizer/organ/horns/humanoid/tiefling,
		/datum/customizer/organ/tail/tiefling,
	)
	body_markings = list(
		/datum/body_marking/flushed_cheeks,
		/datum/body_marking/eyeliner,
		/datum/body_marking/tonage,
	)
	languages = list(
		/datum/language/common,
		/datum/language/hellspeak,
	)
	stress_examine = TRUE
	stress_desc = span_red("Helldweller... better stay away.")

	alignment_weights = TIEFLING_WEIGHTS

/datum/species/tieberian/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	..()
	RegisterSignal(C, COMSIG_MOB_SAY, PROC_REF(handle_speech))
	var/mob/living/carbon/human/H = C
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
			OFFSET_SHIRT_F = list(0,-1), OFFSET_ARMOR_F = list(0,-1), OFFSET_UNDIES_F = list(0,-1)
		)
		limbs_icon_m = 'icons/roguetown/mob/bodies/m/mos.dmi'
		limbs_icon_f = 'icons/roguetown/mob/bodies/f/fos.dmi'
		hairyness = null
//		soundpack_m = new /datum/voicepack/male/young()
		H.has_stubble = FALSE
		H.facial_hairstyle = "None"
		H.update_hair()
		H.update_body()

/datum/species/tieberian/after_creation(mob/living/carbon/C)
	..()
	to_chat(C, "<span class='info'>I can speak Infernal with ,h before my speech.</span>")

/datum/species/tieberian/on_species_loss(mob/living/carbon/C)
	. = ..()
	UnregisterSignal(C, COMSIG_MOB_SAY)

/datum/species/tieberian/qualifies_for_rank(rank, list/features)
	return TRUE

/datum/species/tieberian/get_skin_list()
	return list(
		"Castillian" = SKIN_COLOR_CASTILLIAN,
		"Mysterious" = SKIN_COLOR_MYSTERIOUS,
		"Succubus" = SKIN_COLOR_SUCCUBUS,
		"Incubus" = SKIN_COLOR_INCUBUS,
		"Mephistopheles" = SKIN_COLOR_MEPHISTOPHELES,
		"Dispater" = SKIN_COLOR_DISPATER,
	)

/datum/species/tieberian/get_hairc_list()
	return sortList(list(
		"black - oil" = "181a1d",
		"black - cave" = "201616",
		"black - rogue" = "2b201b",
		"black - midnight" = "1d1b2b"
	))

/datum/species/tieberian/random_name(gender,unique,lastname)

	var/randname
	if(unique)
		if(gender == MALE)
			for(var/i in 1 to 10)
				randname = pick( world.file2list("strings/rt/names/other/tiefm.txt") )
				if(!findname(randname))
					break
		if(gender == FEMALE)
			for(var/i in 1 to 10)
				randname = pick( world.file2list("strings/rt/names/other/tieff.txt") )
				if(!findname(randname))
					break
	else
		if(gender == MALE)
			randname = pick( world.file2list("strings/rt/names/other/tiefm.txt") )
		if(gender == FEMALE)
			randname = pick( world.file2list("strings/rt/names/other/tieff.txt") )
	return randname

/datum/species/tieberian/random_surname()
	return " [pick(world.file2list("strings/rt/names/other/tieflast.txt"))]"

//some moutbreathing poo huffer commented out spanish tieflings. Throw him in the nut smacking device. He'd probably like it, so put it on light smack mode.

/datum/species/tieberian/get_accent(mob/living/carbon/human/H)
	return strings("spanish_funny_replacement.json", "full")

/datum/species/tieberian/get_accent_start(mob/living/carbon/human/H)
	return strings("spanish_funny_replacement.json", "start")

/datum/species/tieberian/get_accent_end(mob/living/carbon/human/H)
	return strings("spanish_funny_replacement.json", "end")

/datum/species/tieberian/get_accent_any(mob/living/carbon/human/H)
	return strings("spanish_funny_replacement.json", "syllable")

/mob/living/carbon/human/species/elf/dark
	race = /datum/species/elf/dark

/datum/species/elf/dark
	name = "Dark Elf"
	id = "elfd"
	desc = "<b>Dark Elf</b><br>\
	Dark elf is a term for a folk generally elf-like, whom \
    claim their original heritage to the gods themselves. \
	they are a hated creachers of dark complexion and originate mostly from the underdark. \
    Their culture and entire lives are entirely set to serving, not a single god, but the ten as well as some of the inhumen, some call evil, gods as well. \
    Previously rare but in recent times, more and more dark elfs can be seen on the surface. \
    They serve a largely matriarchal society that culls most of their males through sacrifices and offerings to the gods. Occasionally dipping into the broader light for men of other societies. \
    This ofcourse prompts many males to flee in search of survival while some more sinister ones abandon their cities in search of new and greater power, and men. "

/*
	Former RT Desc: These guys were undead which doesn't really fit considering now you have a ton of them walking around.

	Descending from a perversion of necromancy, Dark Elves are a unique species \
	that have only recently found themselves a staple of daily life. \
	They boast a proud, beauty-centric culture that demands only the finest \
	out of its citizens, with anyone falling behind their cripplingly high standards \
	refered to as a Homonculus, while less graceful terms such as \
	Stitchface, Zombie or corpsewalker are most commonly thrown out by the elder races\
	Dark Elves tend to be extremely arrogant of others plights, with selfishness\
	being seen as a massive boon in their society. They are academic and usually well taught\
	through are noted to suffer from their biology, which tends to be weak and falls apart\
	without careful upkeep...\
	They typically trace their beginnings to how their progenator died before being raised."
*/
	skin_tone_wording = "Origin City-State"

	species_traits = list(EYECOLOR,HAIR,FACEHAIR,LIPS,OLDGREY)
	inherent_traits = list(TRAIT_NOMOBSWAP)
	default_features = MANDATORY_FEATURE_LIST
	use_skintones = 1
	skinned_type = /obj/item/stack/sheet/animalhide/human
	disliked_food = NONE
	liked_food = NONE
	possible_ages = ALL_AGES_LIST
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	limbs_icon_m = 'icons/roguetown/mob/bodies/m/mem.dmi'
	limbs_icon_f = 'icons/roguetown/mob/bodies/f/fm.dmi'
	dam_icon = 'icons/roguetown/mob/bodies/dam/dam_male.dmi'
	dam_icon_f = 'icons/roguetown/mob/bodies/dam/dam_female.dmi'
	use_f = TRUE
	soundpack_m = /datum/voicepack/male/elf
	soundpack_f = /datum/voicepack/female/elf
	offset_features = list(
		OFFSET_ID = list(0,0), OFFSET_GLOVES = list(0,1), OFFSET_WRISTS = list(0,1), OFFSET_HANDS = list(0,0), \
		OFFSET_CLOAK = list(0,1), OFFSET_FACEMASK = list(0,0), OFFSET_HEAD = list(0,0), \
		OFFSET_FACE = list(0,0), OFFSET_BELT_F = list(0,0), OFFSET_BACK = list(0,0), \
		OFFSET_NECK = list(0,0), OFFSET_MOUTH = list(0,0), OFFSET_PANTS = list(0,0), \
		OFFSET_SHIRT = list(0,1), OFFSET_ARMOR = list(0,1), OFFSET_UNDIES = list(0,1),\
		OFFSET_ID_F = list(0,-1), OFFSET_GLOVES_F = list(0,0), OFFSET_WRISTS_F = list(0,0), OFFSET_HANDS_F = list(0,0), \
		OFFSET_CLOAK_F = list(0,0), OFFSET_FACEMASK_F = list(0,-1), OFFSET_HEAD_F = list(0,-1), \
		OFFSET_FACE_F = list(0,-1), OFFSET_BELT_F = list(0,-1), OFFSET_BACK_F = list(0,-1), \
		OFFSET_NECK_F = list(0,-1), OFFSET_MOUTH_F = list(0,-1), OFFSET_PANTS_F = list(0,0), \
		OFFSET_SHIRT_F = list(0,0), OFFSET_ARMOR_F = list(0,0), OFFSET_UNDIES_F = list(0,0), \
		)
	specstats = list(
		"strength" = 0,
		"skill" = -1,
		"mageability" = 0,
		"constitution" = 0,
		"endurance" = 1,
		"speed" = 1,
		"fortune" = 0
		)
	specstats_m = list(
		"strength" = -1,
		"speed" = 1,
	)
	specstats_f = list(
		"constitution" = 1,
		"mageability" = -1,
	)
	enflamed_icon = "widefire"

	organs = list(
		ORGAN_SLOT_BRAIN = /obj/item/organ/brain,
		ORGAN_SLOT_HEART = /obj/item/organ/heart,
		ORGAN_SLOT_LUNGS = /obj/item/organ/lungs,
		ORGAN_SLOT_EYES = /obj/item/organ/eyes,
		ORGAN_SLOT_EARS = /obj/item/organ/ears/elf,
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
		)
	body_markings = list(
	)


	gender_swapping = TRUE
	stress_examine = TRUE
	stress_desc = span_red("A loathesome dark elf.")

	alignment_weights = DARKELF_WEIGHTS

/datum/species/elf/dark/get_span_language(datum/language/message_language)
	if(!message_language)
		return
	if(message_language.type == /datum/language/elvish)
		return list(SPAN_DELF)
	return message_language.spans

/datum/species/elf/dark/get_skin_list()
	return list(
		"Commorah" = SKIN_COLOR_COMMORAH,
		"Gloomhaven" = SKIN_COLOR_GLOOMHAVEN,
		"Darkpila" = SKIN_COLOR_DARKPILA,
		"Sshanntynlan" = SKIN_COLOR_SSHANNTYNLAN,
		"Llurth Dreir" = SKIN_COLOR_LLURTH_DREIR,
		"Tafravma" = SKIN_COLOR_TAFRAVMA,
		"Yuethindrynn" = SKIN_COLOR_YUETHINDRYNN,
	)

/datum/species/elf/dark/get_hairc_list()
	return sortList(list(
	"black - oil" = "181a1d",
	"black - cave" = "201616",
	"black - rogue" = "2b201b",
	"black - midnight" = "1d1b2b",

	"white - cavedew" = "dee9ed",
	"white - spiderweb" = "f4f4f4"

	))


/datum/species/elf/dark/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	..()
	var/mob/living/carbon/human/species/elf/dark/H = C
	if(H.age == AGE_YOUTH)
		offset_features = list(OFFSET_ID = list(0,-2), OFFSET_GLOVES = list(0,-1), OFFSET_WRISTS = list(0,-1),\
		OFFSET_CLOAK = list(0,-1), OFFSET_FACEMASK = list(0,-2), OFFSET_HEAD = list(0,-2), \
		OFFSET_FACE = list(0,-2), OFFSET_BELT = list(0,-1), OFFSET_BACK = list(0,-2), \
		OFFSET_NECK = list(0,-2), OFFSET_MOUTH = list(0,-2), OFFSET_PANTS = list(0, -1), \
		OFFSET_SHIRT = list(0,-1), OFFSET_ARMOR = list(0,-1), OFFSET_HANDS = list(0,-2), OFFSET_UNDIES = list(0,-1), \
		OFFSET_ID_F = list(0,-1), OFFSET_GLOVES_F = list(0,-1), OFFSET_WRISTS_F = list(0,-1), OFFSET_HANDS_F = list(0,-2), \
		OFFSET_CLOAK_F = list(0,-1), OFFSET_FACEMASK_F = list(0,-2), OFFSET_HEAD_F = list(0,-2), \
		OFFSET_FACE_F = list(0,-2), OFFSET_BELT_F = list(0,-1), OFFSET_BACK_F = list(0,-2), \
		OFFSET_NECK_F = list(0,-2), OFFSET_MOUTH_F = list(0,-2), OFFSET_PANTS_F = list(0,-1), \
		OFFSET_SHIRT_F = list(0,-1), OFFSET_ARMOR_F = list(0,-1), OFFSET_UNDIES_F = list(0,-1))

		limbs_icon_m = 'icons/roguetown/mob/bodies/m/mems.dmi'
		limbs_icon_f = 'icons/roguetown/mob/bodies/f/fs.dmi'

		hairyness = null

//		soundpack_m = new /datum/voicepack/male/young()
		H.has_stubble = FALSE
		H.facial_hairstyle = "None"
		H.update_hair()
		H.update_body()

/datum/species/elf/dark/random_name(gender,unique,lastname)
	var/randname
	if(unique)
		if(gender == MALE)
			for(var/i in 1 to 10)
				randname = pick( world.file2list("strings/rt/names/elf/elfdm.txt") )
				if(!findname(randname))
					break
		if(gender == FEMALE)
			for(var/i in 1 to 10)
				randname = pick( world.file2list("strings/rt/names/elf/elfdf.txt") )
				if(!findname(randname))
					break
	else
		if(gender == MALE)
			randname = pick( world.file2list("strings/rt/names/elf/elfdm.txt") )
		if(gender == FEMALE)
			randname = pick( world.file2list("strings/rt/names/elf/elfdf.txt") )
	return randname

/datum/species/elf/dark/random_surname()
	return " [pick(world.file2list("strings/rt/names/elf/elfsnf.txt"))]"

//Groups of Accents for each race set by associated 'skin_tone', see 'get_skin_list' above
// "full" group in JSON lists
/datum/species/elf/dark/get_accent(mob/living/carbon/human/H)
		return strings("french_replacement.json", "full")

// "start" group in JSON lists
/datum/species/elf/dark/get_accent_start(mob/living/carbon/human/H)
		return strings("french_replacement.json", "start")

// "end" group in JSON lists
/datum/species/elf/dark/get_accent_end(mob/living/carbon/human/H)
		return strings("french_replacement.json", "end")

// "syllable" group in JSON lists
/datum/species/elf/dark/get_accent_any(mob/living/carbon/human/H)
		return strings("french_replacement.json", "syllable")

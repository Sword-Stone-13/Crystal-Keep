/mob/living/carbon/human/species/human/nyanderthal
	race = /datum/species/human/nyanderthal

/datum/species/human/nyanderthal
	name = "Nyapanese"
	id = "nyanderthal"
	desc = "<b>The Nyapanese.</b><br>\
	A violent, feral, cretinous creacher. They cannot, rather, will not, integrate themselves into society. \
	Instead, they opt for banditry, for their god, Nyatthios. They torment the people of Avarikyo, and their path of destruction leads towards Crystal Keep."

	skin_tone_wording = "Likeness"
	default_color = "FFFFFF"
	species_traits = list(EYECOLOR,HAIR,FACEHAIR,LIPS,STUBBLE,OLDGREY)
	inherent_traits = list(TRAIT_NOMOBSWAP)
	default_features = MANDATORY_FEATURE_LIST
	use_skintones = 1
	possible_ages = ALL_AGES_LIST
	skinned_type = /obj/item/stack/sheet/animalhide/human
	disliked_food = NONE
	liked_food = NONE
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	limbs_icon_m = 'icons/roguetown/mob/bodies/m/mt.dmi'
	limbs_icon_f = 'icons/roguetown/mob/bodies/f/fm.dmi'
	dam_icon = 'icons/roguetown/mob/bodies/dam/dam_male.dmi'
	dam_icon_f = 'icons/roguetown/mob/bodies/dam/dam_female.dmi'

	soundpack_m = /datum/voicepack/male
	soundpack_f = /datum/voicepack/female
	offset_features = list(
		OFFSET_ID = list(0,1), OFFSET_GLOVES = list(0,1), OFFSET_WRISTS = list(0,1),\
		OFFSET_CLOAK = list(0,1), OFFSET_FACEMASK = list(0,1), OFFSET_HEAD = list(0,1), \
		OFFSET_FACE = list(0,1), OFFSET_BELT = list(0,1), OFFSET_BACK = list(0,1), \
		OFFSET_NECK = list(0,1), OFFSET_MOUTH = list(0,1), OFFSET_PANTS = list(0,1), \
		OFFSET_SHIRT = list(0,1), OFFSET_ARMOR = list(0,1), OFFSET_HANDS = list(0,1), OFFSET_UNDIES = list(0,1), \
		OFFSET_ID_F = list(0,-1), OFFSET_GLOVES_F = list(0,0), OFFSET_WRISTS_F = list(0,0), OFFSET_HANDS_F = list(0,0), \
		OFFSET_CLOAK_F = list(0,0), OFFSET_FACEMASK_F = list(0,-1), OFFSET_HEAD_F = list(0,-1), \
		OFFSET_FACE_F = list(0,-1), OFFSET_BELT_F = list(0,0), OFFSET_BACK_F = list(0,-1), \
		OFFSET_NECK_F = list(0,-1), OFFSET_MOUTH_F = list(0,-1), OFFSET_PANTS_F = list(0,0), \
		OFFSET_SHIRT_F = list(0,0), OFFSET_ARMOR_F = list(0,0), OFFSET_UNDIES_F = list(0,0))
	specstats = list(
		"strength" = 1,
		"mageability" = 1,
		"skill" = 2,
		"constitution" = -1,
		"endurance" = -1,
		"speed" = 2,
		"faith" = 1,
		"fortune" = 0
	)
	specstats_f = list(
		"mageability" = 1,
		"speed" = 1,
	)
	enflamed_icon = "widefire"
	organs = list(
		ORGAN_SLOT_BRAIN = /obj/item/organ/brain,
		ORGAN_SLOT_HEART = /obj/item/organ/heart,
		ORGAN_SLOT_LUNGS = /obj/item/organ/lungs,
		ORGAN_SLOT_EYES = /obj/item/organ/eyes,
		ORGAN_SLOT_EARS = /obj/item/organ/ears/cat,
		ORGAN_SLOT_TONGUE = /obj/item/organ/tongue,
		ORGAN_SLOT_LIVER = /obj/item/organ/liver,
		ORGAN_SLOT_STOMACH = /obj/item/organ/stomach,
		ORGAN_SLOT_APPENDIX = /obj/item/organ/appendix,
		ORGAN_SLOT_PENIS = /obj/item/organ/penis/barbed,
		ORGAN_SLOT_BREASTS = /obj/item/organ/breasts,
		ORGAN_SLOT_TAIL = /obj/item/organ/tail/cat
	)

	customizers = list(
		/datum/customizer/organ/eyes/humanoid,
		/datum/customizer/bodypart_feature/hair/head/humanoid,
		/datum/customizer/bodypart_feature/hair/facial/humanoid,
		/datum/customizer/bodypart_feature/accessory,
		/datum/customizer/bodypart_feature/face_detail,
		/datum/customizer/organ/tail/tabaxi,
		/datum/customizer/organ/ears/cat,
	)
	languages = list(
		/datum/language/aphasia
	)
	stress_examine = TRUE
	stress_desc = span_red("What an annoying creacher...")
	body_markings = list(
		/datum/body_marking/flushed_cheeks,
		/datum/body_marking/eyeliner,
		/datum/body_marking/tonage,
	)

	alignment_weights = NYANDERTHAL_WEIGHTS

/datum/species/human/nyanderthal/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	..()
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
			OFFSET_SHIRT_F = list(0,-1), OFFSET_ARMOR_F = list(0,-1), OFFSET_UNDIES_F = list(0,-1))
		limbs_icon_m = 'icons/roguetown/mob/bodies/m/mos.dmi'
		limbs_icon_f = 'icons/roguetown/mob/bodies/f/fos.dmi'
		hairyness = null
//		soundpack_m = new /datum/voicepack/male/young()
		H.has_stubble = FALSE
		H.facial_hairstyle = "None"
		H.update_hair()
		H.update_body()

/datum/species/human/nyanderthal/after_creation(mob/living/carbon/C)
	..()
	to_chat(C, "<span class='info'>I can speak Nyapanese with ,k before my speech.</span>")

/datum/species/human/nyanderthal/on_species_loss(mob/living/carbon/C)
	..()

/datum/species/human/nyanderthal/get_skin_list()
	return list(
		"Grenzelhoft" = SKIN_COLOR_GRENZELHOFT,
		"Hammerhold" = SKIN_COLOR_HAMMERHOLD,
		"Avarikyo" = SKIN_COLOR_AVARIKYO,
		"Rockhill" = SKIN_COLOR_ROCKHILL,
		"Otava" = SKIN_COLOR_OTAVA,
		"Etrusca" = SKIN_COLOR_ETRUSCA,
		"Gronn" = SKIN_COLOR_GRONN,
		"Giza" = SKIN_COLOR_GIZA,
		"Shalvistine" = SKIN_COLOR_SHALVISTINE,
		"Lalvestine" = SKIN_COLOR_LALVESTINE,
		"Babar" = SKIN_COLOR_BABAR,
	)

/datum/species/human/nyanderthal/get_hairc_list()
	return sortList(list(
		"blond - pale" = "9d8d6e",
		"blond - dirty" = "88754f",
		"blond - drywheat" = "d5ba7b",
		"blond - strawberry" = "c69b71",

		"brown - mud" = "362e25",
		"brown - oats" = "584a3b",
		"brown - grain" = "58433b",
		"brown - soil" = "48322a",

		"black - oil" = "181a1d",
		"black - cave" = "201616",
		"black - rogue" = "2b201b",
		"black - midnight" = "1d1b2b",

		"red - berry" = "48322a",
		"red - wine" = "82534c",
		"red - sunset" = "82462b",
		"red - blood" = "822b2b"

	))

/datum/species/human/nyanderthal/get_accent(mob/living/carbon/human/H)
	return strings("Nyapanese.json", "full")

/datum/species/human/nyanderthal/get_accent_start(mob/living/carbon/human/H)
	return strings("Nyapanese.json", "start")

/datum/species/human/nyanderthal/get_accent_end(mob/living/carbon/human/H)
	return strings("Nyapanese.json", "end")

/datum/species/human/nyanderthal/get_accent_any(mob/living/carbon/human/H)
	return strings("Nyapanese.json", "syllable")

/datum/species/human/nyanderthal/check_roundstart_eligible()
	return TRUE//when I can find a way to make people spawn as bandits without being completely bald, we let them make one for now, for now....
	

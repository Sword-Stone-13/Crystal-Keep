/mob/living/carbon/human/species/human/nyanderthal
	race = /datum/species/human/nyanderthal

/datum/species/human/nyanderthal
	name = "Nyanderthal"
	id = "nyanderthal"
	desc = "<b>nya</b><br>\
	cats cats cats"

	skin_tone_wording = "Ancestry"
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

	offset_features = list(OFFSET_ID = list(0,1), OFFSET_GLOVES = list(0,1), OFFSET_WRISTS = list(0,1),\
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
		"faith" = -1,
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
		/datum/customizer/organ/breasts/human,
		/datum/customizer/organ/tail/tabaxi,
		/datum/customizer/organ/ears/tabaxi,
		)
	body_markings = list(
		/datum/body_marking/flushed_cheeks,
		/datum/body_marking/eyeliner,
		/datum/body_marking/tonage,
	)

/datum/species/human/northern/get_skin_list()
	return list(
		"Grenzelhoft" = SKIN_COLOR_GRENZELHOFT,
		"Hammerhold" = SKIN_COLOR_HAMMERHOLD,
		"Avar" = SKIN_COLOR_AVAR,
		"Rockhill" = SKIN_COLOR_ROCKHILL,
		"Otava" = SKIN_COLOR_OTAVA,
		"Etrusca" = SKIN_COLOR_ETRUSCA,
		"Gronn" = SKIN_COLOR_GRONN,
		"Giza" = SKIN_COLOR_GIZA,
		"Shalvistine" = SKIN_COLOR_SHALVISTINE,
		"Lalvestine" = SKIN_COLOR_LALVESTINE,
		"Ebon" = SKIN_COLOR_EBON,
	)

/datum/species/human/northern/get_hairc_list()
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

//Groups of Accents for each race set by associated 'skin_tone', see 'get_skin_list' above
// "full" group in JSON lists
/datum/species/human/northern/get_accent(mob/living/carbon/human/H)
		switch(H.skin_tone)
				if(SKIN_COLOR_GRENZELHOFT) //Grenzelhoft
						return strings("german_replacement.json", "full")
				if(SKIN_COLOR_HAMMERHOLD) //Hammerhold
						return strings("Anglish.json", "full")
		return null

// "start" group in JSON lists
/datum/species/human/northern/get_accent_start(mob/living/carbon/human/H)
		switch(H.skin_tone)
				if(SKIN_COLOR_GRENZELHOFT) //Grenzelhoft
						return strings("german_replacement.json", "start")
				if(SKIN_COLOR_HAMMERHOLD) //Hammerhold
						return strings("Anglish.json", "start")
		return null

// "end" group in JSON lists
/datum/species/human/northern/get_accent_end(mob/living/carbon/human/H)
		switch(H.skin_tone)
				if(SKIN_COLOR_GRENZELHOFT) //Grenzelhoft
						return strings("german_replacement.json", "end")
				if(SKIN_COLOR_HAMMERHOLD) //Hammerhold
						return strings("Anglish.json", "end")
		return null

// "syllable" group in JSON lists
/datum/species/human/northern/get_accent_any(mob/living/carbon/human/H)
		switch(H.skin_tone)
				if(SKIN_COLOR_GRENZELHOFT) //Grenzelhoft
						return strings("german_replacement.json", "syllable")
				if(SKIN_COLOR_HAMMERHOLD) //Hammerhold
						return strings("Anglish.json", "syllable")
		return null

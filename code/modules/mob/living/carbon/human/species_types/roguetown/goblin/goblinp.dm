/mob/living/carbon/human/species/goblinp
	race = /datum/species/goblinp

/datum/species/goblinp
	name = "Goblin"
	id = "goblinp"
	desc = "<b>Goblin</b><br>\
	A vile race of miniature fiends with brains as small as their hearts. Be not fooled by their appearance - What they lack in stature, they possess in sheer malice. \
	Incapable of forming their own societies and civilizations, they are largely the folk of Graggar, and as such are usually hunted out of societies at large. Some, find their way in, however \
	and can even hold some semblance of peace for the while. Whether it be the cause of a humane (or humen) parent, or the willful worship of a more peaceful god, the peaceful ones look and behave \
	somewhat more civil. Despite this, many folk view these creachers, even the 'good ones' with disdain and may attack on sight."
	species_traits = list(EYECOLOR,LIPS,STUBBLE)
	inherent_traits = list(TRAIT_NOMOBSWAP)
	possible_ages = ALL_AGES_LIST
	use_skintones = TRUE
	skin_tone_wording = "subspecies"
	limbs_icon_m = 'icons/mob/species/nuppy_male.dmi'//I thought the sprites were decent enough to replace gobbos... for now.
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
		ORGAN_SLOT_EARS = /obj/item/organ/ears/goblin,
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
		"strength" = -1, 
		"skill" = 1, 
		"mageability" = 2, 
		"constitution" = 0, 
		"endurance" = 0, 
		"speed" = 0, 
		"fortune" = 0,
		"faith" = -1
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



/datum/species/goblinp/check_roundstart_eligible()
	return TRUE

/datum/species/goblinp/qualifies_for_rank(rank, list/features)
	return TRUE

/datum/species/goblinp/get_skin_list()
	return list(
		"Forest Goblin" = SKIN_COLOR_GOB,
		"Swamp Goblin" = SKIN_COLOR_DARK,
		"Island Goblin" = SKIN_COLOR_MINT,
		"Filth Goblin" = SKIN_COLOR_DIRTY,
		"Moon Goblin" = SKIN_COLOR_MOON, 
		"Twilight Imp" = SKIN_COLOR_STONE_IMP,
		"Firey Imp" = SKIN_COLOR_PINK_IMP,
		"Shadow Imp" = SKIN_COLOR_SHADOW_IMP,
		"Cruel Imp" = SKIN_COLOR_FIREY_IMP
	)

/datum/species/goblinp/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	..()
	RegisterSignal(C, COMSIG_MOB_SAY, PROC_REF(handle_speech))
	var/mob/living/carbon/human/species/goblinp/H = C
	if(H.skin_tone == SKIN_COLOR_STONE_IMP || H.skin_tone == SKIN_COLOR_PINK_IMP || H.skin_tone == SKIN_COLOR_SHADOW_IMP || H.skin_tone == SKIN_COLOR_FIREY_IMP)
		H.grant_language(/datum/language/hellspeak)
		to_chat(H, span_info("I can speak infernal with ,h before my speech."))

/*
	if(selected_type in list("Twilight Imp", "Firey Imp", "Shadow Imp", "Cruel Imp"))
		C.dna.features["body_marking_set"] = /datum/body_marking_set/imp_markings
	else
		C.dna.features["body_marking_set"] = /datum/body_marking_set/none
	C.update_body()
*/


/datum/species/goblinp/on_species_loss(mob/living/carbon/C)
	..()
	UnregisterSignal(C, COMSIG_MOB_SAY)

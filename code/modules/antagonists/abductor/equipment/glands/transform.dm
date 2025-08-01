/obj/item/organ/heart/gland/transform
	true_name = "anthropmorphic transmorphosizer"
	cooldown_low = 900
	cooldown_high = 1800
	uses = -1
	human_only = TRUE
	icon_state = "species"
	mind_control_uses = 7
	mind_control_duration = 300

/obj/item/organ/heart/gland/transform/activate()
	to_chat(owner, span_notice("I feel unlike myself."))
	randomize_human(owner)
	var/species = pick(list(/datum/species/human, /datum/species/lizard, /datum/species/aasimar, /datum/species/fly))
	owner.set_species(species)

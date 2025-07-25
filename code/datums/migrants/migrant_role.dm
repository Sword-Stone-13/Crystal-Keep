/datum/migrant_role
	abstract_type = /datum/migrant_role
	/// Name of the role
	var/name = "MIGRANT ROLE"
	/// Restricts species if the list is not null
	var/list/allowed_races = RACES_ALL_KINDS	//QUICK FIX TO EXCLUDE SEELIE
	/// Restricts sexes if list is not null
	var/list/allowed_sexes
	/// Restricts ages if list is not null
	var/list/allowed_ages
	/// Typepath of outfit for the migrant role
	var/outfit
	/// Typepath of the antag datum for the migrant role
	var/antag_datum
	/// If defined they'll get adv class rolls
	var/list/advclass_cat_rolls
	/// Text to greet player of this role in the wave
	var/greet_text
	/// Whether to grant a lit torch upon spawn
	var/grant_lit_torch = FALSE
	//Whether to display "wandering Human" rather than their job title
	var/show_wanderer_examine = TRUE
	var/advjob_examine = TRUE
	var/banned_leprosy = TRUE
	var/banned_lunatic = TRUE

	var/associated_squad = /datum/antagonist/squad/none

/datum/migrant_role/proc/after_spawn(mob/living/carbon/human/character)
	if(character.mind && associated_squad)
		var/preferred_squad_datum_type = associated_squad
		character.mind.add_antag_datum(preferred_squad_datum_type)
		var/datum/antagonist/squad/squad_datum = character.mind.has_antag_datum(preferred_squad_datum_type)
		if(squad_datum)
			character.mind.squad = squad_datum.squad_type
			squad_datum.greet()
	else
		// Explicitly clear squad if no associated squad
		character.mind.squad = null
		var/datum/antagonist/squad/squad_datum = character.mind.has_antag_datum(/datum/antagonist/squad)
		if(squad_datum)
			character.mind.remove_antag_datum(squad_datum)
	return

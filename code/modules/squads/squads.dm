// Squad antagonist datums
/datum/antagonist/squad
	name = "Squad Member"
	show_in_antagpanel = FALSE
	show_name_in_check_antagonists = FALSE
	prevent_roundtype_conversion = FALSE
	var/squad_leader = null
	var/squad_type

/datum/atom_hud/antag/squad
	// This is the squad HUD
	self_visible = TRUE

/datum/antagonist/squad/proc/promote_to_leader(datum/mind/new_leader)
	if(!squad_leader || !new_leader)
		return FALSE

	// we're removing this so we can make them the leader instead
	new_leader.remove_antag_datum(type)

	if(new_leader.add_antag_datum(squad_leader))
		return src

// Check if there is a leader for this squad type, since there should only be one
/datum/antagonist/squad/proc/has_leader()
	for(var/mob/living/carbon/human/H in GLOB.mob_list)
		if(H.mind && H.mind.has_antag_datum(squad_leader))
			return H



/datum/antagonist/squad/alrich
	name = "Alrich Squad Member"
	antag_hud_type = SQUAD_HUD
	antag_hud_name = "alrich"
	squad_type = SQUAD_ALRICH
	squad_leader = /datum/antagonist/squad/alrich/leader

/datum/antagonist/squad/alrich/leader
	name = "Alrich Squad Leader"
	antag_hud_name = "alrich_leader"
	squad_leader = null

/datum/antagonist/squad/bravado
	name = "Bravado Squad Member" 
	antag_hud_type = SQUAD_HUD
	antag_hud_name = "bravado"
	squad_type = SQUAD_BRAVADO
	squad_leader = /datum/antagonist/squad/bravado/leader

/datum/antagonist/squad/bravado/leader
	name = "Bravado Squad Leader"
	antag_hud_name = "bravado_leader"
	squad_leader = null

/datum/antagonist/squad/caesar
	name = "Caesar Squad Member"
	antag_hud_type = SQUAD_HUD
	antag_hud_name = "caesar"
	squad_type = SQUAD_CAESAR
	squad_leader = /datum/antagonist/squad/caesar/leader

/datum/antagonist/squad/caesar/leader
	name = "Caesar Squad Leader"
	antag_hud_name = "caesar_leader"
	squad_leader = null

/datum/antagonist/squad/deleon
	name = "Deleon Squad Member"
	antag_hud_type = SQUAD_HUD
	antag_hud_name = "deleon"
	squad_type = SQUAD_DELEON
	squad_leader = /datum/antagonist/squad/deleon/leader

/datum/antagonist/squad/deleon/leader
	name = "Deleon Squad Leader"
	antag_hud_name = "deleon_leader"
	squad_leader = null

/datum/antagonist/squad/bog/bog_guard
	name = "Bog Guard"
	antag_hud_type = SQUAD_HUD
	antag_hud_name = "bog_guard"
	squad_type = SQUAD_BOG_GUARD
	squad_leader = /datum/antagonist/squad/bog/master

/datum/antagonist/squad/bog/master
	name = "Bog Master"
	antag_hud_type = SQUAD_HUD
	antag_hud_name = "bog_master"
	squad_type = SQUAD_BOG_MASTER
	squad_leader = null

/datum/antagonist/squad/apply_innate_effects(mob/living/mob_override)
	var/mob/living/M = mob_override || owner.current
	add_antag_hud(antag_hud_type, antag_hud_name, M)

/datum/antagonist/squad/remove_innate_effects(mob/living/mob_override)
	var/mob/living/M = mob_override || owner.current
	remove_antag_hud(antag_hud_type, M)

/datum/antagonist/squad/alrich/greet()
	to_chat(owner, "<span class='notice'>House Alrich. The pride of Aurorus. Madame Aurorus Alrich.</span>")

/datum/antagonist/squad/bravado/greet() 
	to_chat(owner, "<span class='notice'>House Bravado, of Bjorn's finest. Solid structure, solid men. As if carved by Bjorn Bravado himself.</span>")

/datum/antagonist/squad/caesar/greet()
	to_chat(owner, "<span class='notice'>House Caesar. Caesar Concarne's men. A poet, a scholar, a champion, con carne.</span>")

/datum/antagonist/squad/deleon/greet()
	to_chat(owner, "<span class='notice'>Deleon's house. Dante D'leon's house. Also known as Dante Deldiablo, tiefling in all but physical.</span>")

/datum/antagonist/squad/bog/greet()
	to_chat(owner, "<span class='notice'>You are [name]. Thy charge is to guard the Bog against any and all threats.</span>")





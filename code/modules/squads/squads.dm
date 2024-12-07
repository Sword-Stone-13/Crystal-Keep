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


/datum/antagonist/squad/alpha
	name = "Alpha Squad Member"
	antag_hud_type = SQUAD_HUD
	antag_hud_name = "alpha"
	squad_type = SQUAD_ALPHA
	squad_leader = /datum/antagonist/squad/alpha/leader

/datum/antagonist/squad/alpha/leader
	name = "Alpha Squad Leader"
	antag_hud_name = "alpha_leader"
	squad_leader = null

/datum/antagonist/squad/bravo
	name = "Bravo Squad Member" 
	antag_hud_type = SQUAD_HUD
	antag_hud_name = "bravo"
	squad_type = SQUAD_BRAVO
	squad_leader = /datum/antagonist/squad/bravo/leader

/datum/antagonist/squad/bravo/leader
	name = "Bravo Squad Leader"
	antag_hud_name = "bravo_leader"
	squad_leader = null

/datum/antagonist/squad/charlie
	name = "Charlie Squad Member"
	antag_hud_type = SQUAD_HUD
	antag_hud_name = "charlie"
	squad_type = SQUAD_CHARLIE
	squad_leader = /datum/antagonist/squad/charlie/leader

/datum/antagonist/squad/charlie/leader
	name = "Charlie Squad Leader"
	antag_hud_name = "charlie_leader"
	squad_leader = null

/datum/antagonist/squad/delta
	name = "Delta Squad Member"
	antag_hud_type = SQUAD_HUD
	antag_hud_name = "delta"
	squad_type = SQUAD_DELTA
	squad_leader = /datum/antagonist/squad/delta/leader

/datum/antagonist/squad/delta/leader
	name = "Delta Squad Leader"
	antag_hud_name = "delta_leader"
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

/datum/antagonist/squad/alpha/greet()
	to_chat(owner, "<span class='notice'>You have been chosen for the Alpha Squad. First to engage, first to fall. Alpha Squad stands as the vanguard of battle.</span>")

/datum/antagonist/squad/bravo/greet() 
	to_chat(owner, "<span class='notice'>You are now a member of the Bravo Squad. The steadfast support. Bravo Squad specializes in aid and the art of multiplication in force.</span>")

/datum/antagonist/squad/charlie/greet()
	to_chat(owner, "<span class='notice'>You have been assigned to the Charlie Squad. The masters of tactics. Charlie Squad excels in covert operations and flanking maneuvers.</span>")

/datum/antagonist/squad/delta/greet()
	to_chat(owner, "<span class='notice'>You are now part of the Delta Squad. The final bastion of defense. Delta Squad focus on the safeguarding of the stronghold and critical points of defense.</span>")

/datum/antagonist/squad/bog/greet()
	to_chat(owner, "<span class='notice'>You are [name]. Thy charge is to guard the Bog against any and all threats.</span>")





// Squad antagonist datums
/datum/antagonist/squad
	name = "None"
	show_in_antagpanel = FALSE
	show_name_in_check_antagonists = FALSE
	prevent_roundtype_conversion = FALSE
	var/squad_leader = null
	var/squad_type

/datum/antagonist/squad/none
	name = "None"
	squad_type = SQUAD_NONE

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


/datum/antagonist/squad/none
	name = "Unaffliated"
	antag_hud_type = SQUAD_HUD
	antag_hud_name = null
	squad_type = SQUAD_NONE

/datum/antagonist/squad/alrich
	name = "Alrich House Footman"
	antag_hud_type = SQUAD_HUD
	antag_hud_name = "house_red_footsoldier"
	squad_type = SQUAD_ALRICH
	squad_leader = /datum/antagonist/squad/alrich/leader

/datum/antagonist/squad/alrich/leader
	name = "Alrich House Baron"
	antag_hud_name = "house_red_baron"
	squad_leader = null
	squad_type = SQUAD_ALRICH_MASTER

/datum/antagonist/squad/alrich/mage
	name = "Alrich Magos"
	antag_hud_name = "house_red_mage"
	squad_type = SQUAD_ALRICH
	squad_leader = /datum/antagonist/squad/alrich/leader

/datum/antagonist/squad/alrich/knight
	name = "Knight of House Alrich"
	antag_hud_name = "house_red_knight"
	squad_type = SQUAD_ALRICH
	squad_leader = /datum/antagonist/squad/alrich/leader

/datum/antagonist/squad/bravado
	name = "Bravado House Footman"
	antag_hud_type = SQUAD_HUD
	antag_hud_name = "house_yellow_footsoldier"
	squad_type = SQUAD_BRAVADO
	squad_leader = /datum/antagonist/squad/bravado/leader

/datum/antagonist/squad/bravado/leader
	name = "Bravado House Baron"
	antag_hud_name = "house_yellow_baron"
	squad_leader = null
	squad_type = SQUAD_BRAVADO_MASTER

/datum/antagonist/squad/bravado/mage
	name = "Bravado Magos"
	antag_hud_name = "house_yellow_mage"
	squad_type = SQUAD_BRAVADO
	squad_leader = /datum/antagonist/squad/bravado/leader

/datum/antagonist/squad/bravado/knight
	name = "Knight of House Bravado"
	antag_hud_name = "house_yellow_knight"
	squad_type = SQUAD_BRAVADO
	squad_leader = /datum/antagonist/squad/bravado/leader

/datum/antagonist/squad/caesar
	name = "Caesar House Footman"
	antag_hud_type = SQUAD_HUD
	antag_hud_name = "house_purple_footsoldier"
	squad_type = SQUAD_CAESAR
	squad_leader = /datum/antagonist/squad/caesar/leader

/datum/antagonist/squad/caesar/leader
	name = "Caesar House Baron"
	antag_hud_name = "house_purple_baron"
	squad_leader = null
	squad_type = SQUAD_CAESAR_MASTER

/datum/antagonist/squad/caesar/mage
	name = "Caesar Magos"
	antag_hud_name = "house_purple_mage"
	squad_type = SQUAD_CAESAR
	squad_leader = /datum/antagonist/squad/caesar/leader

/datum/antagonist/squad/caesar/knight
	name = "Knight of House Caesar"
	antag_hud_name = "house_purple_knight"
	squad_type = SQUAD_CAESAR
	squad_leader = /datum/antagonist/squad/caesar/leader

/datum/antagonist/squad/deleon
	name = "Deleon House Footman"
	antag_hud_type = SQUAD_HUD
	antag_hud_name = "house_blue_footsoldier"
	squad_type = SQUAD_DELEON
	squad_leader = /datum/antagonist/squad/deleon/leader

/datum/antagonist/squad/deleon/leader
	name = "Deleon House Baron"
	antag_hud_name = "house_blue_baron"
	squad_leader = null
	squad_type = SQUAD_DELEON_MASTER

/datum/antagonist/squad/deleon/mage
	name = "Deleon Magos"
	antag_hud_name = "house_blue_mage"
	squad_type = SQUAD_DELEON
	squad_leader = /datum/antagonist/squad/deleon/leader

/datum/antagonist/squad/deleon/knight
	name = "Knight of House Deleon"
	antag_hud_name = "house_blue_knight"
	squad_type = SQUAD_DELEON
	squad_leader = /datum/antagonist/squad/deleon/leader


//Most of these are placeholders just in case for now. I don't want to have everyone and their mother with a HUD icon.
/datum/antagonist/squad/black
	name = "Man at Arms"
	antag_hud_type = SQUAD_HUD
	antag_hud_name = "house_black_footsoldier"
	squad_type = SQUAD_HAND
	squad_leader = /datum/antagonist/squad/black/leader

/datum/antagonist/squad/black/leader
	name = "The Hand"
	antag_hud_name = "house_black_baron"
	squad_leader = null
	squad_type = SQUAD_HAND_MASTER

/datum/antagonist/squad/black/mage
	name = "Court Magos"
	antag_hud_name = "house_black_mage"
	squad_type = SQUAD_HAND
	squad_leader = /datum/antagonist/squad/black/leader

/datum/antagonist/squad/black/knight
	name = "The King's Knight"
	antag_hud_name = "house_black_knight"
	squad_type = SQUAD_HAND
	squad_leader = /datum/antagonist/squad/black/leader

/datum/antagonist/squad/white
	name = "Crusader"
	antag_hud_type = SQUAD_HUD
	antag_hud_name = "house_white_footsoldier"
	squad_type = SQUAD_HEART
	squad_leader = /datum/antagonist/squad/white/leader

/datum/antagonist/squad/white/leader
	name = "Bishop"
	antag_hud_name = "house_white_baron"
	squad_leader = null
	squad_type = SQUAD_HEART_MASTER

/datum/antagonist/squad/white/mage
	name = "Clergy"
	antag_hud_name = "house_white_mage"
	squad_type = SQUAD_HEART
	squad_leader = /datum/antagonist/squad/white/leader

/datum/antagonist/squad/white/knight
	name = "Templar"
	antag_hud_name = "house_white_knight"
	squad_type = SQUAD_HEART
	squad_leader = /datum/antagonist/squad/white/leader

/datum/antagonist/squad/green/
	name = "Guild Member"
	antag_hud_type = SQUAD_HUD
	antag_hud_name = "house_green_footsoldier"
	squad_type = SQUAD_ECHARUS
	squad_leader = /datum/antagonist/squad/green/leader

/datum/antagonist/squad/green/leader
	name = "Guildmaster"
	antag_hud_type = SQUAD_HUD
	antag_hud_name = "house_green_baron"
	squad_type = SQUAD_ECHARUS_MASTER
	squad_leader = null

/datum/antagonist/squad/green/mage
	name = "Guild Mage"
	antag_hud_name = "house_green_mage"
	squad_type = SQUAD_ECHARUS
	squad_leader = /datum/antagonist/squad/green/mage

/datum/antagonist/squad/green/knight
	name = "Hedge Knight"
	antag_hud_name = "house_green_knight"
	squad_type = SQUAD_ECHARUS
	squad_leader = /datum/antagonist/squad/green/knight


/datum/antagonist/squad/apply_innate_effects(mob/living/mob_override)
	var/mob/living/M = mob_override || owner.current
	add_antag_hud(antag_hud_type, antag_hud_name, M)

/datum/antagonist/squad/remove_innate_effects(mob/living/mob_override)
	var/mob/living/M = mob_override || owner.current
	remove_antag_hud(antag_hud_type, M)

/datum/antagonist/squad/none/greet()
	to_chat(owner, "<span class='notice'>You are not affiliated with any house. You are a lone wolf.</span>")

/datum/antagonist/squad/alrich/greet()
	to_chat(owner, "<span class='notice'>House Alrich. The pride of Aurorus. Madame Aurorus Alrich.</span>")

/datum/antagonist/squad/bravado/greet() 
	to_chat(owner, "<span class='notice'>House Bravado, of Bjorn's finest. Solid structure, solid men. As if carved by Bjorn Bravado himself.</span>")

/datum/antagonist/squad/caesar/greet()
	to_chat(owner, "<span class='notice'>House Caesar. Caesar Concarne's men. A poet, a scholar, a champion, con carne.</span>")

/datum/antagonist/squad/deleon/greet()
	to_chat(owner, "<span class='notice'>Deleon's house. Dante D'leon's house. Also known as Dante Deldiablo, tiefling in all but physical.</span>")

/datum/antagonist/squad/heart/greet()
	to_chat(owner, "<span class='notice'>Praise the lord. You crusade for God. Ave.</span>")

/datum/antagonist/squad/hand/greet()
	to_chat(owner, "<span class='notice'>You have sworn fealty to the king. You are his hand first and foremost.</span>")

/datum/antagonist/squad/green/greet()
	to_chat(owner, "<span class='notice'>You are [name]. Welcome to the adventurer's guild.</span>")





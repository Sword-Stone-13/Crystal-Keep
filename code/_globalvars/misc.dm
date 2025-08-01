GLOBAL_VAR_INIT(admin_notice, "") // Admin notice that all clients see when joining the server

GLOBAL_VAR_INIT(timezoneOffset, 0) // The difference betwen midnight (of the host computer) and 0 world.ticks.

	// For FTP requests. (i.e. downloading runtime logs.)
	// However it'd be ok to use for accessing attack logs and such too, which are even laggier.
GLOBAL_VAR_INIT(fileaccess_timer, 0)

GLOBAL_DATUM_INIT(data_core, /datum/datacore, new)

GLOBAL_VAR_INIT(CELLRATE, 0.002)  // conversion ratio between a watt-tick and kilojoule
GLOBAL_VAR_INIT(CHARGELEVEL, 0.001) // Cap for how fast cells charge, as a percentage-per-tick (.001 means cellcharge is capped to 1% per second)

GLOBAL_LIST_EMPTY(powernets)

GLOBAL_VAR_INIT(bsa_unlock, FALSE)	//BSA unlocked by head ID swipes

GLOBAL_LIST_EMPTY(player_details)	// ckey -> /datum/player_details

///All currently running polls held as datums
GLOBAL_LIST_EMPTY(polls)
GLOBAL_PROTECT(polls)

///All poll option datums of running polls
GLOBAL_LIST_EMPTY(poll_options)
GLOBAL_PROTECT(poll_options)

// All religion stuff
GLOBAL_VAR(religion)
GLOBAL_VAR(deity)
GLOBAL_VAR(bible_name)
GLOBAL_VAR(bible_icon_state)
GLOBAL_VAR(bible_item_state)
GLOBAL_VAR(holy_weapon_type)
GLOBAL_VAR(holy_armor_type)

GLOBAL_LIST_INIT(all_squads, list("None" = SQUAD_NONE, SQUAD_ALRICH = /datum/antagonist/squad/alrich, SQUAD_BRAVADO = /datum/antagonist/squad/bravado, SQUAD_CAESAR = /datum/antagonist/squad/caesar, SQUAD_DELEON = /datum/antagonist/squad/deleon,))
GLOBAL_LIST_EMPTY(soliloquies)
GLOBAL_VAR(chosen_soliloquy)

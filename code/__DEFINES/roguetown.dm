//used in various places
#define ALL_RACES_TYPES list(\
	/datum/species/human/northern,\
	/datum/species/human/nyanderthal,\
	/datum/species/human/halfelf,\
	/datum/species/elf/dark,\
	/datum/species/elf/wood,\
	/datum/species/dwarf/mountain,\
	/datum/species/tieberian,\
	/datum/species/aasimar,\
	/datum/species/lizardfolk,\
	/datum/species/halforc,\
	/datum/species/kobold,\
	/datum/species/goblinp,\
	/datum/species/seelie,\
	/datum/species/nuppies\
)

#define RACES_RESPECTED \
	/datum/species/human/northern,\
	/datum/species/elf/wood,\
	/datum/species/dwarf/mountain\

#define RACES_TOLERATED \
	/datum/species/tieberian,\
	/datum/species/human/halfelf,\
	/datum/species/nuppies\

#define RACES_SHUNNED \
	/datum/species/aasimar,\
	/datum/species/kobold\

#define RACES_VERY_SHUNNED \
	/datum/species/elf/dark,\
	/datum/species/halforc,\
	/datum/species/goblinp,\

#define RACES_DESPISED \
	/datum/species/lizardfolk\

#define RACES_SEELIE \
	/datum/species/human/nyanderthal,\
	/datum/species/seelie//Seelie having its own global define and nothing else will prevent allowing it via RACES_ALL_KINDS

#define RACES_ALL_KINDS list(RACES_DESPISED, RACES_SHUNNED, RACES_TOLERATED, RACES_VERY_SHUNNED, RACES_RESPECTED, RACES_SEELIE)

#define RACES_ALL_KINDS_NO_SEELIE list(RACES_DESPISED, RACES_SHUNNED, RACES_TOLERATED, RACES_VERY_SHUNNED, RACES_RESPECTED)

#define RACES_VERY_SHUNNED_UP list(RACES_SHUNNED, RACES_TOLERATED, RACES_VERY_SHUNNED, RACES_RESPECTED)

#define RACES_SHUNNED_UP list(RACES_SHUNNED, RACES_TOLERATED, RACES_RESPECTED)

#define RACES_SHUNNED_UP_PLUS_SEELIE list(RACES_SHUNNED, RACES_TOLERATED, RACES_RESPECTED, RACES_SEELIE)

#define RACES_TOLERATED_UP list(RACES_TOLERATED, RACES_RESPECTED)

#define RACES_EORA_APPROVED list(RACES_RESPECTED)//jobs won't allow just putting races respected in there

//CK note, I have no idea what a noble race is supposed to be, this is the only reference to itself. I assume it was originally the royal race pool, now it will be the Queen race pool. Kings, for lore reason, are gonna be restricted to the map's people.
#define NOBLE_RACES_TYPES list(\
	/datum/species/human/northern,\
	/datum/species/human/halfelf,\
	/datum/species/elf/wood,\
	/datum/species/dwarf/mountain,\
	/datum/species/tieberian,\
	/datum/species/aasimar,\
	/datum/species/lizardfolk,\
	/datum/species/kobold,\
	/datum/species/goblinp,\
	/datum/species/nuppies,\
	/datum/species/human/nyanderthal,\
	/datum/species/halforc,\
	/datum/species/elf/dark,\
	/datum/species/seelie\
)
//originally I was just going to make it the human/dwarf/elf dynamic for queens. But I realized if I was king I'd absolutely a gobbo, lizard, and kobold. But that's me. I added darkelves and horcs, I know what the players want. Monster waifus...and revolt.
#define CLOTHED_RACES_TYPES list(\
	/datum/species/human/northern,\
	/datum/species/human/nyanderthal,\
	/datum/species/human/halfelf,\
	/datum/species/elf/dark,\
	/datum/species/elf/wood,\
	/datum/species/dwarf/mountain,\
	/datum/species/tieberian,\
	/datum/species/aasimar,\
	/datum/species/lizardfolk,\
	/datum/species/halforc,\
	/datum/species/kobold,\
	/datum/species/goblinp,\
	/datum/species/seelie,\
	/datum/species/nuppies\
)
// Non-dwarf non-kobold non-goblin mostly
#define NON_DWARVEN_RACE_TYPES list(\
	/datum/species/human/northern,\
	/datum/species/human/nyanderthal,\
	/datum/species/human/halfelf,\
	/datum/species/elf/dark,\
	/datum/species/elf/wood,\
	/datum/species/tieberian,\
	/datum/species/aasimar,\
	/datum/species/lizardfolk,\
	/datum/species/halforc,\
	/datum/species/seelie,\
	/datum/species/nuppies\
)
// Non-elf non-dwarf non-kobold non-goblinp mostly
#define HUMANLIKE_RACE_TYPES list(\
	/datum/species/human/northern,\
	/datum/species/human/nyanderthal,\
	/datum/species/tieberian,\
	/datum/species/aasimar\
)
#define ALL_CLERIC_PATRONS list(\
	/datum/patron/divine/astrata,\
	/datum/patron/divine/noc,\
	/datum/patron/divine/dendor,\
	/datum/patron/divine/necra,\
	/datum/patron/divine/pestra,\
	/datum/patron/divine/malum,\
	/datum/patron/divine/ravox\
)

#define ALL_ACOLYTE_PATRONS list(\
	/datum/patron/divine/astrata,\
	/datum/patron/divine/noc,\
	/datum/patron/divine/dendor,\
	/datum/patron/divine/pestra,\
	/datum/patron/divine/malum\
)

#define ALL_DIVINE_PATRONS list(\
	/datum/patron/divine/astrata,\
	/datum/patron/divine/noc,\
	/datum/patron/divine/dendor,\
	/datum/patron/divine/abyssor,\
	/datum/patron/divine/ravox,\
	/datum/patron/divine/necra,\
	/datum/patron/divine/xylix,\
	/datum/patron/divine/pestra,\
	/datum/patron/divine/malum,\
	/datum/patron/divine/eora\
)

#define ALL_INHUMEN_PATRONS list(\
	/datum/patron/inhumen/psydon,\
	/datum/patron/inhumen/graggar,\
	/datum/patron/inhumen/baotha,\
	/datum/patron/inhumen/nyatthios,\
	/datum/patron/zizo\
)

#define ALL_NON_INHUMEN_PATRONS list(\
	/datum/patron/divine/astrata,\
	/datum/patron/divine/noc,\
	/datum/patron/divine/dendor,\
	/datum/patron/divine/abyssor,\
	/datum/patron/divine/ravox,\
	/datum/patron/divine/necra,\
	/datum/patron/divine/xylix,\
	/datum/patron/divine/pestra,\
	/datum/patron/divine/malum,\
	/datum/patron/divine/eora\
)

#define TEN_CURSES list(\
	/datum/curse/astrata,\
	/datum/curse/noc,\
	/datum/curse/ravox,\
	/datum/curse/necra,\
	/datum/curse/xylix,\
	/datum/curse/pestra,\
	/datum/curse/eora,\
	/datum/curse/dendor,\
	/datum/curse/mallum,\
	/datum/curse/abyssor\
)

#define INHUMEN_CURSES list(\
	/datum/curse/zizo,\
	/datum/curse/graggar,\
	/datum/curse/nyatthios,\
	/datum/curse/baotha\
)//	/datum/curse/psydon\ I'll get around to this, it's gonna be a 2 hour ban lmaoo

#define SPECIAL_CURSES list(\
	/datum/curse/atheism\
)

#define ALL_CURSES list(\
	SPECIAL_CURSES,\
	TEN_CURSES,\
	INHUMEN_CURSES\
)

#define PLATEHIT "plate"
#define CHAINHIT "chain"
#define SOFTHIT "soft"
#define SOFTUNDERHIT "softunder" // This is just for the soft underarmors like gambesons and arming jackets so they can be worn with light armors that use the same sound like studded leather

/proc/get_armor_sound(blocksound, blade_dulling)
	switch(blocksound)
		if(PLATEHIT)
			if(blade_dulling == BCLASS_CUT||blade_dulling == BCLASS_CHOP)
				return pick('sound/combat/hits/armor/plate_slashed (1).ogg','sound/combat/hits/armor/plate_slashed (2).ogg','sound/combat/hits/armor/plate_slashed (3).ogg','sound/combat/hits/armor/plate_slashed (4).ogg')
			if(blade_dulling == BCLASS_STAB||blade_dulling == BCLASS_PICK||blade_dulling == BCLASS_BITE)
				return pick('sound/combat/hits/armor/plate_stabbed (1).ogg','sound/combat/hits/armor/plate_stabbed (2).ogg','sound/combat/hits/armor/plate_stabbed (3).ogg')
			else
				return pick('sound/combat/hits/armor/plate_blunt (1).ogg','sound/combat/hits/armor/plate_blunt (2).ogg','sound/combat/hits/armor/plate_blunt (3).ogg')
		if(CHAINHIT)
			if(blade_dulling == BCLASS_BITE||blade_dulling == BCLASS_STAB||blade_dulling == BCLASS_PICK||blade_dulling == BCLASS_CUT||blade_dulling == BCLASS_CHOP)
				return pick('sound/combat/hits/armor/chain_slashed (1).ogg','sound/combat/hits/armor/chain_slashed (2).ogg','sound/combat/hits/armor/chain_slashed (3).ogg','sound/combat/hits/armor/chain_slashed (4).ogg')
			else
				return pick('sound/combat/hits/armor/chain_blunt (1).ogg','sound/combat/hits/armor/chain_blunt (2).ogg','sound/combat/hits/armor/chain_blunt (3).ogg')
		if(SOFTHIT)
			if(blade_dulling == BCLASS_BITE||blade_dulling == BCLASS_STAB||blade_dulling == BCLASS_PICK||blade_dulling == BCLASS_CUT||blade_dulling == BCLASS_CHOP)
				return pick('sound/combat/hits/armor/light_stabbed (1).ogg','sound/combat/hits/armor/light_stabbed (2).ogg','sound/combat/hits/armor/light_stabbed (3).ogg')
			else
				return pick('sound/combat/hits/armor/light_blunt (1).ogg','sound/combat/hits/armor/light_blunt (2).ogg','sound/combat/hits/armor/light_blunt (3).ogg')
		if(SOFTUNDERHIT)
			if(blade_dulling == BCLASS_BITE||blade_dulling == BCLASS_STAB||blade_dulling == BCLASS_PICK||blade_dulling == BCLASS_CUT||blade_dulling == BCLASS_CHOP)
				return pick('sound/combat/hits/armor/light_stabbed (1).ogg','sound/combat/hits/armor/light_stabbed (2).ogg','sound/combat/hits/armor/light_stabbed (3).ogg')
			else
				return pick('sound/combat/hits/armor/light_blunt (1).ogg','sound/combat/hits/armor/light_blunt (2).ogg','sound/combat/hits/armor/light_blunt (3).ogg')

GLOBAL_LIST_INIT(lockhashes, list())
GLOBAL_LIST_INIT(lockids, list())
GLOBAL_LIST_EMPTY(credits_icons)
GLOBAL_LIST_EMPTY(confessors)

//preference stuff
#define FAMILY_NONE 1
#define FAMILY_PARTIAL 2
#define FAMILY_FULL 3

GLOBAL_LIST_EMPTY(sunlights)
GLOBAL_LIST_EMPTY(head_bounties)
GLOBAL_LIST_EMPTY(job_respawn_delays)



/*
	Formerly bitflags, now we are strings
	Currently used for classes
*/

#define CTAG_ALLCLASS		"CAT_ALLCLASS"		// jus a define for allclass to not deal with actively typing strings
#define CTAG_DISABLED 		"CAT_DISABLED" 		// Disabled, aka don't make it fuckin APPEAR
#define CTAG_PILGRIM 		"CAT_PILGRIM"  		// Pilgrim classes
#define CTAG_ADVENTURER 	"CAT_ADVENTURER"  	// Adventurer classes
#define CTAG_TOWNER 		"CAT_TOWNER"  		// Villager class - Villagers can use it
#define CTAG_ANTAG 			"CAT_ANTAG"  		// Antag class - results in an antag
#define CTAG_BANDIT			"CAT_BANDIT"		// Bandit class - Tied to the bandit antag really
#define CTAG_CHALLENGE 		"CAT_CHALLENGE"  	// Challenge class - Meant to be free for everyone
#define CTAG_MERCENARY 		"CAT_MERCENARY" 	// Mercs
#define CTAG_BOG 			"CAT_BOG" 			// Bog Guards

/*
	Defines for the triumph buy datum categories
*/
#define TRIUMPH_CAT_ROUND_EFX "ROUND-EFX"
#define TRIUMPH_CAT_CHARACTER "CHARACTER"
#define TRIUMPH_CAT_MISC "MISC!"
#define TRIUMPH_CAT_ACTIVE_DATUMS "ACTIVE"

/*	........   Nutrition defines   ................ */
#define MEAL_FILLING 30
#define MEAL_GOOD 24
#define MEAL_AVERAGE 18
#define MEAL_MEAGRE 15
#define SNACK_CHUNKY 12
#define SNACK_NUTRITIOUS 9
#define SNACK_DECENT 6
#define SNACK_POOR 3

#define DOUGH_NUTRITION MEAL_MEAGRE
#define SMALLDOUGH_NUTRITION MEAL_MEAGRE/2
#define BUTTERDOUGH_NUTRITION DOUGH_NUTRITION+BUTTERSLICE_NUTRITION
#define BUTTERDOUGHSLICE_NUTRITION BUTTERDOUGH_NUTRITION/2
#define BUTTER_NUTRITION SNACK_CHUNKY
#define BUTTERSLICE_NUTRITION BUTTER_NUTRITION/6
#define MEATSLAB_NUTRITION SNACK_NUTRITIOUS
#define SAUSAGE_NUTRITION SNACK_NUTRITIOUS
#define MINCE_NUTRITION MEATSLAB_NUTRITION/2
#define FRESHCHEESE_NUTRITION SNACK_DECENT

/*	........   Rotting defines   ................ */
#define SHELFLIFE_EXTREME 270 MINUTES
#define SHELFLIFE_LONG 135 MINUTES
#define SHELFLIFE_DECENT 75 MINUTES
#define SHELFLIFE_SHORT 45 MINUTES
#define SHELFLIFE_TINY 30 MINUTES

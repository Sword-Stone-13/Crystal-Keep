/datum/patron/inhumen
	name = null
	associated_faith = /datum/faith/inhumen
	undead_hater = FALSE
	confess_lines = list()

/datum/patron/inhumen/graggar
	name = "Graggar"
	domain = "God of Conquest, Murder and Pillaging"
	desc = "The Furious One, Graggar taught dark elves to worship fury and created orcs in his image."
	worshippers = "Orcs, Goblins, Murderers and the Cruel"
	t1 = /obj/effect/proc_holder/spell/invoked/burden
	mob_traits = list(TRAIT_ORGAN_EATER)
	confess_lines = list(
		"GRAGGAR IS THE BEAST I WORSHIP!",
		"GRAGGAR BRINGS UNHOLY DESTRUCTION!",
		"THE BLACK SUN DEMANDS BLOOD!",
	)

/datum/patron/inhumen/nyatthios 
	name = "Nyatthios"
	domain = "God of Robbery, Mugging and Redistribution of Wealth"
	desc = "Chimera of envy, Nyatthios taught man that only through theft and popular revolts can social woes be alleviated."
	worshippers = "Highwaymen, Robbers and the Wild Folk"
	t1 = /obj/effect/proc_holder/spell/invoked/burden
	t2 = /obj/effect/proc_holder/spell/targeted/beasttame
	mob_traits = list(TRAIT_COMMIE)
	confess_lines = list(
		"NYATTHIOS STEALS FROM THE WORTHLESS!",
		"NYATTHIOS IS JUSTICE!",
		"NYAAA!",
	)

/datum/patron/inhumen/baotha
	name = "Baotha"
	domain = "Goddess of Degeneracy, Debauchery and Addiction"
	desc = "Man turned Goddess, Baotha taught man that life is too short to care for the consequences of their pleasures and leads them to peculiar vices and perversions. "
	worshippers = "Perverts, Gamblers, Drunkards, and Bards"
	t1 = /obj/effect/proc_holder/spell/invoked/attach_bodypart //crouching tiger leaping gock
	t2 = /obj/effect/proc_holder/spell/invoked/vigorousexchange
	t3 = /obj/effect/proc_holder/spell/invoked/heal
	mob_traits = list(TRAIT_CRACKHEAD)
	confess_lines = list(
		"BAOTHA DEMANDS PLEASURE!",
		"LIVE, LAUGH, LOVE!",
		"BAOTHA IS MY JOY!",
	)

/datum/patron/inhumen/psydon
	name = "Psydon"
	domain = "The Original God"
	desc = "The first True God, Psydon is the creator of all things. He is believed dead by the Church of the Successors."
	worshippers = "Aasimars, Heretics, and Walnutians"
	associated_faith = /datum/faith/psydon
	confess_lines = list(
		"GOD NEVER DIES!",
		"THE SUCCESSORS ARE FALSE GODS!",
		"PSYDON LIVES!",
	)

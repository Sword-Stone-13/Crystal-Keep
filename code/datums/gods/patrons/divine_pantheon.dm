/datum/patron/divine
	name = null
	associated_faith = /datum/faith/divine
	t0 = /obj/effect/proc_holder/spell/invoked/lesser_heal

/datum/patron/divine/astrata
	name = "Astrata"
	domain = "Goddess of the Sun, Day, and Order"
	desc = "The Firstborn sister, twin of Noc, gifted man the Sun as her divine gift."
	worshippers = "Rockhillians, Nuppies, Zealots and Farmers"
	t1 = /obj/effect/proc_holder/spell/invoked/sacred_flame_rogue
	t2 = /obj/effect/proc_holder/spell/invoked/heal
	t3 = /obj/effect/proc_holder/spell/invoked/solar_smite //we'll see how people play with this in live, if its too much, we get a weaker smite
	t4 = /obj/effect/proc_holder/spell/invoked/revive
	confess_lines = list(
		"ASTRATA IS MY LIGHT!",
		"ASTRATA BRINGS LAW!",
		"I SERVE THE GLORY OF THE SUN!",
	)

/datum/patron/divine/noc
	name = "Noc"
	domain = "God of the Moon, Night, and Knowledge"
	desc = "The Firstborn brother, twin of Astrata, gifted man divine knowledge."
	worshippers = "Babars, Imps, Wizards, and Scholars"
	t1 = /obj/effect/proc_holder/spell/invoked/blindness
	t2 = /obj/effect/proc_holder/spell/invoked/invisibility
	confess_lines = list(
		"NOC IS NIGHT!",
		"NOC SEES ALL!",
		"I SEEK THE MYSTERIES OF THE MOON!",
	)

/datum/patron/divine/dendor
	name = "Dendor"
	domain = "God of the Earth, Nature, and Strength Over All"
	desc = "The hunter god of strength, patron of beasts, wild warriors and the wood. Only the fittest may live."
	worshippers = "Wood elves, Druids, Reptoids, gladiators"
	mob_traits = list(TRAIT_VINE_WALKER) //only druids get glowshroom walker
	t1 = /obj/effect/proc_holder/spell/invoked/burden
	t2 = /obj/effect/proc_holder/spell/targeted/conjure_vines
	t3 = /obj/effect/proc_holder/spell/targeted/conjure_glowshroom
	t4 = /obj/effect/proc_holder/spell/targeted/blesscrop //What I've noticed is that if bless crop is allowed anywhere, it just leads to farmers being forgotten. If it continues, I might replace this spell. I already plan on it later on so...
	confess_lines = list(
		"DENDOR DOMINATES!",
		"THE TREEFATHER DEMANDS BOUNTY!",
		"I ANSWER THE CALL OF THE WILD!",
	)

/datum/patron/divine/abyssor
	name = "Abyssor"
	domain = "God of the Ocean, Storms and the Tide"
	desc = "The god of the chaotic unyielding seas. He commands the waves, tribute may satisfy him."
	worshippers = "Men of the Sea, Primitive Aquatics, Avarikyans, and men who desire inner peace."
	confess_lines = list(
		"ABYSSOR COMMANDS THE WAVES!",
		"THE OCEAN'S FURY IS ABYSSOR'S WILL!",
		"I AM DRAWN BY THE PULL OF THE TIDE!",
	)

/datum/patron/divine/ravox
	name = "Ravox"
	domain = "God of War, Justice and power"
	desc = "The god of war and might of armies. Might makes right."
	worshippers = "Grenzelhofts, Goblins, Warriors, Sellswords & Slavers."
	t1 = /obj/effect/proc_holder/spell/invoked/burden
	confess_lines = list(
		"RAVOX IS JUSTICE!",
		"WOE TO THE VANQUISHED!",
		"THE DRUMS OF WAR BEAT IN MY CHEST!",
	)

/datum/patron/divine/necra
	name = "Necra"
	domain = "Goddess of Death and Spirits"
	desc = "The Veiled Lady, a feared but respected God who leads the dead."
	worshippers = "Zybantians, Mourners, and Gravekeepers"
	mob_traits = list(TRAIT_SOUL_EXAMINE)
	t1 = /obj/effect/proc_holder/spell/targeted/burialrite
	t2 = /obj/effect/proc_holder/spell/targeted/churn
	t3 = /obj/effect/proc_holder/spell/targeted/soulspeak
	confess_lines = list(
		"ALL SOULS FIND THEIR WAY TO NECRA!",
		"THE UNDERMAIDEN IS OUR FINAL REPOSE!",
		"I FEAR NOT DEATH, NECRALHAMDELLILAH!",
	)

/datum/patron/divine/xylix
	name = "Xylix"
	domain = "God of Chaos, Trickery, Language, currency, and Deceit"
	desc = "The chaos god. Gave man an answer to the suffering, Any order brought from the word is merely the trick of the moment. There is no greater order."
	worshippers = "Gizans, Book Burners, Silver-Tongued Rogues and Merchants"
	mob_traits = list(TRAIT_SEEPRICES_SHITTY) //may add greedy here, but greedy is such a boon, honestly.
	confess_lines = list(
		"ASTRAIA IS MY LIGHT!",
		"NOCUB IS NIGHT!",
		"DENDAN DOMINATES!",
		"ABYSSORATSU COMMANDS THE WAVES!",
		"RAVODIN IS JUSTICE!",
		"ALL SOULS FIND THEIR WAY TO NECRALLAH!",
		"HAHAHAHA! AHAHAHA! HAHAHAHA!",
		"PESTRU SOOTHES ALL ILLS!",
		"XENUM IS MY MUSE!",
		"APHRODEORA BRINGS US TOGETHER!",
	)

/datum/patron/divine/pestra
	name = "Pestra"
	domain = "Goddess of Decay, Disease and Medicine"
	desc = "The visceral God, gifted man medicine with their many arms."
	worshippers = "Otavans, The Ill, Morbidly Curious, and Phyicians"
	mob_traits = list(TRAIT_EMPATH, TRAIT_ROT_EATER)
	t0 = list(/obj/effect/proc_holder/spell/invoked/diagnose, /obj/effect/proc_holder/spell/invoked/lesser_heal) // Combine both spells on t0
	t1 = /obj/effect/proc_holder/spell/invoked/heal
	t2 = /obj/effect/proc_holder/spell/invoked/attach_bodypart
	t3 = /obj/effect/proc_holder/spell/invoked/cure_rot
	confess_lines = list(
		"PESTRA SOOTHES ALL ILLS!",
		"DECAY IS A CONTINUATION OF LIFE!",
		"MY AFFLICTION IS MY TESTAMENT!",
	)

/datum/patron/divine/malum
	name = "Malum"
	domain = "God of Fire, Idols and Vanity"
	desc = "The God of idols and craftsmanship. Beauty is the most valuable function."
	worshippers = "Dwarves, Kobolds, Smiths, Miners, Artists"
	t1 = /obj/effect/proc_holder/spell/invoked/vigorousexchange
	t2 = /obj/effect/proc_holder/spell/invoked/heatmetal
	t3 = /obj/effect/proc_holder/spell/invoked/hammerfall
	t4 = /obj/effect/proc_holder/spell/invoked/craftercovenant
	confess_lines = list(
		"MALUM IS MY MUSE!",
		"TRUE VALUE IS IN BEHOLDING!",
		"I AM AN INSTRUMENT OF CREATION!",
	)

/datum/patron/divine/eora
	name = "Eora"
	domain = "Goddess of the Family, Bloodlines, and Unions"
	desc = "The Pure One, her divine gift was that of family, loyalty, and purity of bloodlines."
	worshippers = "Etruskans, Half Elves, Royals, Racial Purists, Struggling Families"
	confess_lines = list(
		"EORA BRINGS US TOGETHER!",
		"HER BEAUTY IS EVEN IN THIS TORMENT!",
		"WE MUST KEEP THE BLOODLINES PURE!",
	)

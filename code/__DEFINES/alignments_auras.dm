#define ALIGNMENT_LAWFUL_GOOD "lawful_good"
#define ALIGNMENT_NEUTRAL_GOOD "neutral_good"
#define ALIGNMENT_CHAOTIC_GOOD "chaotic_good"
#define ALIGNMENT_LAWFUL_NEUTRAL "lawful_neutral"
#define ALIGNMENT_TRUE_NEUTRAL "true_neutral"
#define ALIGNMENT_CHAOTIC_NEUTRAL "chaotic_neutral"
#define ALIGNMENT_LAWFUL_EVIL "lawful_evil"
#define ALIGNMENT_NEUTRAL_EVIL "neutral_evil"
#define ALIGNMENT_CHAOTIC_EVIL "chaotic_evil"

GLOBAL_LIST_INIT(alignments_by_id, list(
		ALIGNMENT_LAWFUL_GOOD = new /datum/alignment_aura/lawful_good(),
		ALIGNMENT_NEUTRAL_GOOD = new /datum/alignment_aura/neutral_good(),
		ALIGNMENT_CHAOTIC_GOOD = new /datum/alignment_aura/chaotic_good(),
		ALIGNMENT_LAWFUL_NEUTRAL = new /datum/alignment_aura/lawful_neutral(),
		ALIGNMENT_TRUE_NEUTRAL = new /datum/alignment_aura/true_neutral(),
		ALIGNMENT_CHAOTIC_NEUTRAL = new /datum/alignment_aura/chaotic_neutral(),
		ALIGNMENT_LAWFUL_EVIL = new /datum/alignment_aura/lawful_evil(),
		ALIGNMENT_NEUTRAL_EVIL = new /datum/alignment_aura/neutral_evil(),
		ALIGNMENT_CHAOTIC_EVIL = new /datum/alignment_aura/chaotic_evil()
	))
	//Contingency plan. If players complain about being forced into alignments, give more races more alignments.
#define HUMAN_WEIGHTS list(\
	ALIGNMENT_LAWFUL_GOOD = 1,\
	ALIGNMENT_NEUTRAL_GOOD = 1,\
	ALIGNMENT_CHAOTIC_GOOD = 1,\
	ALIGNMENT_LAWFUL_NEUTRAL = 1,\
	ALIGNMENT_TRUE_NEUTRAL = 1,\
	ALIGNMENT_CHAOTIC_NEUTRAL = 1,\
	ALIGNMENT_LAWFUL_EVIL = 1,\
	ALIGNMENT_NEUTRAL_EVIL = 1,\
	ALIGNMENT_CHAOTIC_EVIL = 1)

#define HALFELF_WEIGHTS list(\
	ALIGNMENT_LAWFUL_GOOD = 1,\
	ALIGNMENT_NEUTRAL_GOOD = 2,\
	ALIGNMENT_CHAOTIC_GOOD = 1,\
	ALIGNMENT_LAWFUL_NEUTRAL = 1,\
	ALIGNMENT_TRUE_NEUTRAL = 1,\
	ALIGNMENT_CHAOTIC_NEUTRAL = 1,\
	ALIGNMENT_LAWFUL_EVIL = 1,\
	ALIGNMENT_NEUTRAL_EVIL = 1,\
	ALIGNMENT_CHAOTIC_EVIL = 1)

#define DARKELF_WEIGHTS list(\
	ALIGNMENT_LAWFUL_GOOD = 1,\
	ALIGNMENT_NEUTRAL_GOOD = 1,\
	ALIGNMENT_CHAOTIC_GOOD = 1,\
	ALIGNMENT_LAWFUL_NEUTRAL = 1,\
	ALIGNMENT_TRUE_NEUTRAL = 3,\
	ALIGNMENT_CHAOTIC_NEUTRAL = 3,\
	ALIGNMENT_LAWFUL_EVIL = 3,\
	ALIGNMENT_NEUTRAL_EVIL = 3,\
	ALIGNMENT_CHAOTIC_EVIL = 3)

#define WOODELF_WEIGHTS list(\
	ALIGNMENT_LAWFUL_GOOD = 1,\
	ALIGNMENT_NEUTRAL_GOOD = 3,\
	ALIGNMENT_CHAOTIC_GOOD = 3,\
	ALIGNMENT_LAWFUL_NEUTRAL = 2,\
	ALIGNMENT_TRUE_NEUTRAL = 1,\
	ALIGNMENT_CHAOTIC_NEUTRAL = 2,\
	ALIGNMENT_LAWFUL_EVIL = 1,\
	ALIGNMENT_NEUTRAL_EVIL = 1,\
	ALIGNMENT_CHAOTIC_EVIL = 1)

#define DWARF_WEIGHTS list(\
	ALIGNMENT_LAWFUL_GOOD = 2,\
	ALIGNMENT_NEUTRAL_GOOD = 1,\
	ALIGNMENT_CHAOTIC_GOOD = 1,\
	ALIGNMENT_LAWFUL_NEUTRAL = 3,\
	ALIGNMENT_TRUE_NEUTRAL = 1,\
	ALIGNMENT_CHAOTIC_NEUTRAL = 1,\
	ALIGNMENT_LAWFUL_EVIL = 2,\
	ALIGNMENT_NEUTRAL_EVIL = 1,\
	ALIGNMENT_CHAOTIC_EVIL = 1)

#define AASIMAR_WEIGHTS list(\
	ALIGNMENT_LAWFUL_GOOD = 5,\
	ALIGNMENT_NEUTRAL_GOOD = 3,\
	ALIGNMENT_CHAOTIC_GOOD = 1,\
	ALIGNMENT_LAWFUL_NEUTRAL = 2,\
	ALIGNMENT_TRUE_NEUTRAL = 1,\
	ALIGNMENT_CHAOTIC_NEUTRAL = 1,\
	ALIGNMENT_LAWFUL_EVIL = 1,\
	ALIGNMENT_NEUTRAL_EVIL = 1,\
	ALIGNMENT_CHAOTIC_EVIL = 1)

#define TIEFLING_WEIGHTS list(\
	ALIGNMENT_LAWFUL_GOOD = 1,\
	ALIGNMENT_NEUTRAL_GOOD = 1,\
	ALIGNMENT_CHAOTIC_GOOD = 1,\
	ALIGNMENT_LAWFUL_NEUTRAL = 1,\
	ALIGNMENT_TRUE_NEUTRAL = 1,\
	ALIGNMENT_CHAOTIC_NEUTRAL = 1,\
	ALIGNMENT_LAWFUL_EVIL = 3,\
	ALIGNMENT_NEUTRAL_EVIL = 2,\
	ALIGNMENT_CHAOTIC_EVIL = 5)

#define HALFORC_WEIGHTS list(\
	ALIGNMENT_LAWFUL_GOOD = 1,\
	ALIGNMENT_NEUTRAL_GOOD = 1,\
	ALIGNMENT_CHAOTIC_GOOD = 1,\
	ALIGNMENT_LAWFUL_NEUTRAL = 1,\
	ALIGNMENT_TRUE_NEUTRAL = 1,\
	ALIGNMENT_CHAOTIC_NEUTRAL = 2,\
	ALIGNMENT_LAWFUL_EVIL = 1,\
	ALIGNMENT_NEUTRAL_EVIL = 3,\
	ALIGNMENT_CHAOTIC_EVIL = 3)

#define KOBOLD_WEIGHTS list(\
	ALIGNMENT_LAWFUL_GOOD = 2,\
	ALIGNMENT_NEUTRAL_GOOD = 1,\
	ALIGNMENT_CHAOTIC_GOOD = 1,\
	ALIGNMENT_LAWFUL_NEUTRAL = 2,\
	ALIGNMENT_TRUE_NEUTRAL = 3,\
	ALIGNMENT_CHAOTIC_NEUTRAL = 1,\
	ALIGNMENT_LAWFUL_EVIL = 3,\
	ALIGNMENT_NEUTRAL_EVIL = 1,\
	ALIGNMENT_CHAOTIC_EVIL = 1)

#define LIZARDFOLK_WEIGHTS list(\
	ALIGNMENT_LAWFUL_GOOD = 1,\
	ALIGNMENT_NEUTRAL_GOOD = 2,\
	ALIGNMENT_CHAOTIC_GOOD = 1,\
	ALIGNMENT_LAWFUL_NEUTRAL = 1,\
	ALIGNMENT_TRUE_NEUTRAL = 1,\
	ALIGNMENT_CHAOTIC_NEUTRAL = 5,\
	ALIGNMENT_LAWFUL_EVIL = 1,\
	ALIGNMENT_NEUTRAL_EVIL = 1,\
	ALIGNMENT_CHAOTIC_EVIL = 3)

#define NYANDERTHAL_WEIGHTS list(\
	ALIGNMENT_LAWFUL_GOOD = 1,\
	ALIGNMENT_NEUTRAL_GOOD = 1,\
	ALIGNMENT_CHAOTIC_GOOD = 1,\
	ALIGNMENT_LAWFUL_NEUTRAL = 1,\
	ALIGNMENT_TRUE_NEUTRAL = 1,\
	ALIGNMENT_CHAOTIC_NEUTRAL = 1,\
	ALIGNMENT_LAWFUL_EVIL = 1,\
	ALIGNMENT_NEUTRAL_EVIL = 3,\
	ALIGNMENT_CHAOTIC_EVIL = 2)

#define SEELIE_WEIGHTS list(\
	ALIGNMENT_LAWFUL_GOOD = 1,\
	ALIGNMENT_NEUTRAL_GOOD = 3,\
	ALIGNMENT_CHAOTIC_GOOD = 1,\
	ALIGNMENT_LAWFUL_NEUTRAL = 1,\
	ALIGNMENT_TRUE_NEUTRAL = 1,\
	ALIGNMENT_CHAOTIC_NEUTRAL = 1,\
	ALIGNMENT_LAWFUL_EVIL = 1,\
	ALIGNMENT_NEUTRAL_EVIL = 1,\
	ALIGNMENT_CHAOTIC_EVIL = 1)

#define WEREWOLF_WEIGHTS list(\
	ALIGNMENT_CHAOTIC_NEUTRAL = 1,\
	ALIGNMENT_LAWFUL_EVIL = 1,\
	ALIGNMENT_NEUTRAL_EVIL = 1,\
	ALIGNMENT_CHAOTIC_EVIL = 10)

#define NUPPY_WEIGHTS list(\
	ALIGNMENT_LAWFUL_GOOD = 1,\
	ALIGNMENT_NEUTRAL_GOOD = 1,\
	ALIGNMENT_CHAOTIC_GOOD = 3,\
	ALIGNMENT_LAWFUL_NEUTRAL = 1,\
	ALIGNMENT_TRUE_NEUTRAL = 1,\
	ALIGNMENT_CHAOTIC_NEUTRAL = 3,\
	ALIGNMENT_LAWFUL_EVIL = 1,\
	ALIGNMENT_NEUTRAL_EVIL = 1,\
	ALIGNMENT_CHAOTIC_EVIL = 3)

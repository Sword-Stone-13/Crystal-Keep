/datum/alignment_aura
	var/name
	var/desc = ""
	var/descriptor
	var/color
	var/id
	var/effect_cooldown = 3 MINUTES // how often the aura effects are applied
	var/list/judgements = list() // how they see other alignments canonly, shows in flavourtext

/datum/alignment_aura/proc/on_life(mob/living/parent)
	for(var/mob/living/carbon/human/H in view(8, parent))
		if(!H || !considered_alive(H.mind))
			continue
		var/datum/alignment_aura/other_aura = H.get_alignment()
		if(!other_aura || other_aura.type == type)
			continue
		if(world.time >= parent.mind.aura_effect_last_trigger + effect_cooldown)
			if(check_special_interactions(H, parent, other_aura))
				parent.mind.aura_effect_last_trigger = world.time

	return TRUE


/datum/alignment_aura/proc/apply(mob/living/parent)
	apply_visual_effects(parent)
	return TRUE

/datum/alignment_aura/proc/remove(mob/living/parent)
	remove_visual_effects(parent)
	return TRUE

/datum/alignment_aura/proc/apply_visual_effects(mob/living/parent)
	var/filter_id = "alignment_aura_outline"
	parent.remove_filter(filter_id)
	parent.add_filter(filter_id, 2, list("type" = "outline", "color" = color, "size" = 1, "alpha" = 80))
	animate(parent.get_filter(filter_id), alpha = 100, time = 20, loop = -1, easing = SINE_EASING)
	animate(alpha = 80, time = 20)
/datum/alignment_aura/proc/remove_visual_effects(mob/living/parent)
	parent.remove_filter("alignment_aura_outline")

/datum/alignment_aura/proc/check_special_interactions(mob/living/carbon/human/H, mob/living/carbon/human/parent, datum/alignment_aura/other_aura)
	return

/datum/alignment_aura/lawful_good
	name = "lawful good"
	desc = "An aura of honor, compassion and duty that inspires others to uphold justice and protect the innocent."
	descriptor = "righteous presence"
	color = "#FFD700"
	id = ALIGNMENT_LAWFUL_GOOD
	judgements = list(ALIGNMENT_CHAOTIC_EVIL = "Their very presence offends everything I stand for.", 
					ALIGNMENT_NEUTRAL_EVIL = "A dark soul that must be guided to the light or faced with justice.",
					ALIGNMENT_CHAOTIC_NEUTRAL = "Their disregard for order and proper conduct is concerning.",
					ALIGNMENT_LAWFUL_EVIL = "They understand order, but twist it for malevolent ends. Most disappointing.",
					ALIGNMENT_LAWFUL_NEUTRAL = "Their neutrality is... confusing. But I respect that they understand order.",
					ALIGNMENT_CHAOTIC_GOOD = "It's amusing that they think they can uphold righteousness without order.")

/datum/alignment_aura/lawful_good/check_special_interactions(mob/living/carbon/human/H, mob/living/carbon/human/parent, datum/alignment_aura/other_aura)
	if(istype(parent.dna.species, /datum/species/aasimar) && istype(H.dna.species, /datum/species/tieberian))
		if(other_aura.type == /datum/alignment_aura/chaotic_evil)
			parent.visible_message(span_warning("[parent] recoils at the corrupted presence of [H], their righteous essence driving them on guard at their presence!"))
			SEND_SIGNAL(parent, COMSIG_ADD_MOOD_EVENT, "murderous rage", /datum/mood_event/murderous_rage)
			return TRUE

/datum/alignment_aura/neutral_good
	name = "neutral good"
	desc = "A warm, caring aura focused on helping others and doing what's right without being bound by rules or chaos."
	descriptor = "benevolent aura"
	color = "#98FB98"
	id = ALIGNMENT_NEUTRAL_GOOD
	judgements = list(ALIGNMENT_CHAOTIC_EVIL = "Such mindless cruelty breaks my heart. They need help, or stopping.",
					ALIGNMENT_NEUTRAL_EVIL = "Their selfish nature causes such needless suffering.",
					ALIGNMENT_LAWFUL_EVIL = "Rules without compassion are just another form of cruelty.",
					ALIGNMENT_LAWFUL_GOOD = "Naive to think they can enforce goodness through such rigidity.")

/datum/alignment_aura/chaotic_good
	name = "chaotic good"
	desc = "A wild but positive energy that promotes individual freedom and the fight against tyranny and oppression."
	descriptor = "free-spirited energy"
	color = "#87CEEB"
	id = ALIGNMENT_CHAOTIC_GOOD
	judgements = list(ALIGNMENT_LAWFUL_EVIL = "Another coward hiding behind their precious rules.",
					ALIGNMENT_LAWFUL_GOOD = "Too rigid, too bound by rules to do what's truly right.",
					ALIGNMENT_LAWFUL_NEUTRAL = "All those rules must be suffocating. Live a little!")

/datum/alignment_aura/lawful_neutral
	name = "lawful neutral"
	desc = "A structured aura that emphasizes order, tradition and the following of established rules above all else."
	descriptor = "orderly presence"
	color = "#C0C0C0"
	id = ALIGNMENT_LAWFUL_NEUTRAL
	judgements = list(ALIGNMENT_CHAOTIC_NEUTRAL = "Their unpredictability threatens the proper order of things.",
					ALIGNMENT_CHAOTIC_EVIL = "A menace to organized society that must be contained.",
					ALIGNMENT_CHAOTIC_GOOD = "Good intentions don't excuse disrupting the established order.")

/datum/alignment_aura/true_neutral
	name = "true neutral"
	desc = "A perfectly balanced aura that seeks harmony between all extremes and maintains the natural order."
	descriptor = "balanced essence"
	color = "#808080"
	id = ALIGNMENT_TRUE_NEUTRAL
	judgements = list(ALIGNMENT_LAWFUL_GOOD = "People like these are too... rigid in their righteousness.",
					ALIGNMENT_CHAOTIC_EVIL = "They're a menace and disregard the all people.",
					ALIGNMENT_NEUTRAL_GOOD = "Their altruism disrupts the natural balance.",
					ALIGNMENT_NEUTRAL_EVIL = "Their selfishness disrupts the natural balance.")
/datum/alignment_aura/chaotic_neutral
	name = "chaotic neutral"
	desc = "An erratic aura that values personal freedom and whims above any moral or ethical considerations."
	descriptor = "unpredictable force"
	color = "#DDA0DD"
	id = ALIGNMENT_CHAOTIC_NEUTRAL
	judgements = list(ALIGNMENT_LAWFUL_GOOD = "Oh look, another self-righteous rule follower. Sheep.",
					ALIGNMENT_LAWFUL_NEUTRAL = "How boring can one get? Rules, rules, rules.",
					ALIGNMENT_LAWFUL_EVIL = "At least be interesting with your evil!",
					ALIGNMENT_CHAOTIC_EVIL = "They're just a bunch of mindless savages, but at least they're not boring.")

/datum/alignment_aura/lawful_evil
	name = "lawful evil"
	desc = "A domineering aura that seeks to impose order through fear and strict hierarchy for personal gain."
	descriptor = "tyrannical presence"
	color = "#8B0000"
	id = ALIGNMENT_LAWFUL_EVIL
	judgements = list(ALIGNMENT_CHAOTIC_GOOD = "Their rebellion threatens everything we've built.",
					ALIGNMENT_LAWFUL_GOOD = "Such wasted potential, using order to protect the weak.",
					ALIGNMENT_CHAOTIC_EVIL = "Mindless destruction helps no one. Evil requires structure.",
					ALIGNMENT_NEUTRAL_EVIL = "They need to be tamed, or else they'll destroy everything.")

/datum/alignment_aura/neutral_evil
	name = "neutral evil"
	desc = "A dark aura of pure selfishness, willing to hurt others to achieve its goals without loyalty to law or chaos."
	descriptor = "malevolent aura"
	color = "#4B0082"
	id = ALIGNMENT_NEUTRAL_EVIL
	judgements = list(ALIGNMENT_NEUTRAL_GOOD = "Their kindness is weakness I can exploit.",
					ALIGNMENT_LAWFUL_GOOD = "So many rules holding them back from taking what they want.",
					ALIGNMENT_CHAOTIC_GOOD = "Their freedom fighting is just an excuse for weakness.")

/datum/alignment_aura/chaotic_evil
	name = "chaotic evil"
	desc = "A violent and unpredictable aura that revels in destruction and suffering for its own sake."
	descriptor = "destructive energy"
	color = "#800000"
	id = ALIGNMENT_CHAOTIC_EVIL
	judgements = list(ALIGNMENT_LAWFUL_GOOD = "Their self-righteousness makes their suffering all the sweeter.",
					ALIGNMENT_NEUTRAL_GOOD = "Such soft hearts are fun to break.",
					ALIGNMENT_LAWFUL_NEUTRAL = "Rules are made to be broken, quite violently. Perhaps they will learn.",
					ALIGNMENT_TRUE_NEUTRAL = "Balance? You're a liar.",
					ALIGNMENT_CHAOTIC_GOOD = "They don't understand the true nature of chaos.")

/datum/alignment_aura/chaotic_evil/check_special_interactions(mob/living/carbon/human/H, mob/living/carbon/human/parent, datum/alignment_aura/other_aura)
	if(istype(parent.dna.species, /datum/species/tieberian) && istype(H.dna.species, /datum/species/aasimar))
		if(other_aura.type == /datum/alignment_aura/lawful_good)
			H.visible_message(span_warning("[parent] sneers at the self-righteous presence of [H], their sanctimonious aura driving them into a murderous rage!"))
			SEND_SIGNAL(parent, COMSIG_ADD_MOOD_EVENT, "murderous rage", /datum/mood_event/murderous_rage)
			return TRUE
/datum/alignment_aura/proc/get_judgement(alignment_id)
	return judgements[alignment_id]

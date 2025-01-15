/proc/pick_weighted_alignment(list/weights)
	var/list/weighted_list = list()
	for(var/alignment in weights)
		weighted_list[alignment] = weights[alignment]
	return pickweight(weighted_list)
/mob/living/carbon/human/proc/get_alignment()
	if(!mind)
		return FALSE
	var/datum/alignment_aura/alignment = GLOB.alignments_by_id[mind.alignment]
	return alignment


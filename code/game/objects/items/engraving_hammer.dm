/obj/item/engraving_hammer
	name = "engraving hammer"
	desc = "A special hammer used to engrave images onto items. Only works on engraveable items. You can also remove engravings with it."
	icon = 'icons/obj/items_and_weapons.dmi'
	icon_state = "hammeroff"
	force = 8
	throwforce = 10
	w_class = WEIGHT_CLASS_SMALL
	associated_skill = /datum/skill/craft/engravement



/obj/item/engraving_hammer/afterattack(atom/target, mob/living/user, proximity)
	. = ..()
	if(!proximity || !istype(target, /obj/item))
		return
		
	var/obj/item/I = target
	if(I.engraveable != TRUE)
		to_chat(user, span_warning("[I] cannot be engraved!"))
		return
		
	if(I.engraved_url)
		remove_engraving(target, user, proximity)
		return

	var/skill_level = user.mind.get_skill_level(/datum/skill/craft/engravement)
		
	var/old_url = I.engraved_url
	var/input = input(user, "Enter the URL of the image to engrave (must be externally hosted):", "Engraving", old_url) as text|null
	if(!input || !user.canUseTopic(src, BE_CLOSE))
		return
		
	if(!validate_url(input))
		to_chat(user, span_warning("Invalid image URL! URL must start with http:// or https:// and end with .jpg, .jpeg, .png or .gif"))
		return
		
	// Skill-based engraving quality
	var/engraving_quality = ENGRAVING_QUALITY_CRUDE
	switch(skill_level)
		if(SKILL_LEVEL_NOVICE to SKILL_LEVEL_APPRENTICE)
			engraving_quality = ENGRAVING_QUALITY_CRUDE
		if(SKILL_LEVEL_JOURNEYMAN to SKILL_LEVEL_EXPERT)
			engraving_quality = ENGRAVING_QUALITY_DECENT
		if(SKILL_LEVEL_MASTER to SKILL_LEVEL_LEGENDARY)
			engraving_quality = ENGRAVING_QUALITY_MASTERFUL
			
	I.engraved_url = input
	I.engraving_quality = engraving_quality
	
	// Add experience based on quality
	var/exp_gain = user.STASKL * (engraving_quality * 2)
	user.mind.add_sleep_experience(/datum/skill/craft/engravement, exp_gain)
	
	to_chat(user, span_notice("You carefully engrave [I] with an image."))
	playsound(src, 'sound/items/bsmith1.ogg', 50, TRUE)

	return TRUE

/obj/item/engraving_hammer/proc/remove_engraving(atom/target, mob/living/user, proximity)
	if(!user.canUseTopic(src, BE_CLOSE))
		return

	if(!istype(target, /obj/item))
		return FALSE

	var/obj/item/I = target
		
	if(!I.engraveable || !I.engraved_url)
		to_chat(user, span_warning("[I] has no engraving to remove!"))
		return
		
	I.engraved_url = null
	I.engraving_quality = 0
	
	// Add experience for successful removal
	var/exp_gain = user.STASKL
	user.mind.add_sleep_experience(/datum/skill/craft/engravement, exp_gain)
	
	to_chat(user, span_notice("You carefully remove the engraving from [I]."))
	playsound(src, 'sound/items/bsmith2.ogg', 50, TRUE)

	return TRUE

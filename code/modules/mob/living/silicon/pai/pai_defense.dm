
/mob/living/silicon/pai/blob_act(obj/structure/blob/B)
	return FALSE

/mob/living/silicon/pai/emp_act(severity)
	. = ..()
	if(. & EMP_PROTECT_SELF)
		return
	take_holo_damage(50/severity)
	Paralyze(400/severity)
	silent = max(20/severity, silent)
	if(holoform)
		fold_in(force = TRUE)
	//Need more effects that aren't instadeath or permanent law corruption.
	//Ask and you shall receive
	switch(rand(1, 3))
		if(1)
			stuttering = 1
			to_chat(src, span_danger("Warning: Feedback loop detected in speech module."))
		if(2)
			slurring = 1
			to_chat(src, span_danger("Warning: Audio synthesizer CPU stuck."))
		if(3)
			derpspeech = 1
			to_chat(src, span_danger("Warning: Vocabulary databank corrupted."))
	if(prob(40))
		mind.language_holder.selected_default_language = pick(mind.language_holder.languages)


/mob/living/silicon/pai/ex_act(severity, target)
	take_holo_damage(severity * 50)
	switch(severity)
		if(1)	//RIP
			qdel(card)
			qdel(src)
		if(2)
			fold_in(force = 1)
			Paralyze(400)
		if(3)
			fold_in(force = 1)
			Paralyze(200)

/mob/living/silicon/pai/attack_hand(mob/living/carbon/human/user)
	switch(user.used_intent.type)
		if(INTENT_HELP)
			visible_message(span_notice("[user] gently pats [src] on the head, eliciting an off-putting buzzing from its holographic field."))
		if(INTENT_DISARM)
			visible_message(span_notice("[user] boops [src] on the head!"))
		if(INTENT_HARM)
			user.do_attack_animation(src)
			if (user.name == master)
				visible_message(span_notice("Responding to its master's touch, [src] disengages its holochassis emitter, rapidly losing coherence."))
				if(do_after(user, 1 SECONDS, TRUE, src))
					fold_in()
					if(user.put_in_hands(card))
						user.visible_message(span_notice("[user] promptly scoops up [user.p_their()] pAI's card."))
			else
				visible_message(span_danger("[user] stomps on [src]!."))
				take_holo_damage(2)

/mob/living/silicon/pai/bullet_act(obj/projectile/Proj)
	if(Proj.stun)
		fold_in(force = TRUE)
		src.visible_message(span_warning("The electrically-charged projectile disrupts [src]'s holomatrix, forcing [src] to fold in!"))
	. = ..(Proj)

/mob/living/silicon/pai/stripPanelUnequip(obj/item/what, mob/who, where) //prevents stripping
	to_chat(src, span_warning("My holochassis stutters and warps intensely as you attempt to interact with the object, forcing you to cease lest the field fail."))

/mob/living/silicon/pai/stripPanelEquip(obj/item/what, mob/who, where) //prevents stripping
	to_chat(src, span_warning("My holochassis stutters and warps intensely as you attempt to interact with the object, forcing you to cease lest the field fail."))

/mob/living/silicon/pai/IgniteMob(mob/living/silicon/pai/P)
	return FALSE //No we're not flammable

/mob/living/silicon/pai/proc/take_holo_damage(amount)
	emitterhealth = CLAMP((emitterhealth - amount), -50, emittermaxhealth)
	if(emitterhealth < 0)
		fold_in(force = TRUE)
	to_chat(src, span_danger("The impact degrades my holochassis!"))
	return amount

/mob/living/silicon/pai/adjustBruteLoss(amount, updating_health = TRUE, forced = FALSE)
	return take_holo_damage(amount)

/mob/living/silicon/pai/adjustFireLoss(amount, updating_health = TRUE, forced = FALSE)
	return take_holo_damage(amount)

/mob/living/silicon/pai/adjustToxLoss(amount, updating_health = TRUE, forced = FALSE)
	return FALSE

/mob/living/silicon/pai/adjustOxyLoss(amount, updating_health = TRUE, forced = FALSE)
	return FALSE

/mob/living/silicon/pai/adjustCloneLoss(amount, updating_health = TRUE, forced = FALSE)
	return FALSE



/mob/living/silicon/pai/getBruteLoss()
	return emittermaxhealth - emitterhealth

/mob/living/silicon/pai/getFireLoss()
	return emittermaxhealth - emitterhealth

/mob/living/silicon/pai/getToxLoss()
	return FALSE

/mob/living/silicon/pai/getOxyLoss()
	return FALSE

/mob/living/silicon/pai/getCloneLoss()
	return FALSE



/mob/living/silicon/pai/setCloneLoss()
	return FALSE


/mob/living/silicon/pai/setToxLoss()
	return FALSE

/mob/living/silicon/pai/setOxyLoss()
	return FALSE

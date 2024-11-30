/mob/living/horse
	name = "Horse"
	desc = "Just a horse. Looks awfully human."
	icon = 'icons/mob/human.dmi'
	icon_state = "human_basic"
	hud_type = /datum/hud/human
	can_buckle = TRUE
	buckle_lying = FALSE
	health = 100
	maxHealth = 100

/mob/living/horse/MouseDrop_T(atom/dropping, atom/user)
	// We're fully overriding the parent behaviour because it is pretty bad
	SEND_SIGNAL(src, COMSIG_MOUSEDROPPED_ONTO, dropping, user)
	if(!ishuman(dropping) && !isstructure(dropping))
		return

	if(ishuman(dropping))
		buckle_mob(dropping)
		return TRUE

/mob/living/horse/post_buckle_mob(mob/living/M)
	M.pixel_y += 15

/mob/living/horse/post_unbuckle_mob(mob/living/M)
	M.pixel_y -= 15

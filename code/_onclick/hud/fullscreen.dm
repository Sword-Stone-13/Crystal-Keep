/mob/proc/overlay_fullscreen(category, type, severity)
	var/atom/movable/screen/fullscreen/screen = screens[category]
	if (!screen || screen.type != type)
		// needs to be recreated
		clear_fullscreen(category, FALSE)
		screens[category] = screen = new type()
		screen.category = category
	else if ((!severity || severity == screen.severity) && (!client || screen.screen_loc != "CENTER-7,CENTER-7" || screen.view == client.view))
		// doesn't need to be updated
		return screen

	screen.icon_state = "[initial(screen.icon_state)][severity]"
	screen.severity = severity
	if (client && screen.should_show_to(src))
		screen.update_for_view(client.view)
		client.screen += screen

	return screen


/mob/proc/flash_fullscreen(state)
	var/atom/movable/screen/fullscreen/flashholder/screen = screens["flashholder"]

	if(!screen)
		screen = new /atom/movable/screen/fullscreen/flashholder()
		screens["flashholder"] = screen

	if(client && screen.should_show_to(src))
		screen.update_for_view(client.view)
		client.screen += screen

	flick(state,screen)
	return screen


/mob/proc/clear_fullscreen(category, animated = 10)
	var/atom/movable/screen/fullscreen/screen = screens[category]
	if(!screen)
		return

	screens -= category

	if(animated)
		animate(screen, alpha = 0, time = animated)
		addtimer(CALLBACK(src, PROC_REF(clear_fullscreen_after_animate), screen), animated, TIMER_CLIENT_TIME, flags = ANIMATION_PARALLEL)
	else
		if(client)
			client.screen -= screen
		qdel(screen)

/mob/proc/clear_fullscreen_after_animate(atom/movable/screen/fullscreen/screen)
	if(client)
		client.screen -= screen
	qdel(screen)

/mob/proc/clear_fullscreens()
	for(var/category in screens)
		clear_fullscreen(category)

/mob/proc/hide_fullscreens()
	if(client)
		for(var/category in screens)
			client.screen -= screens[category]

/mob/proc/reload_fullscreen()
	if(client)
		var/atom/movable/screen/fullscreen/screen
		for(var/category in screens)
			screen = screens[category]
			if(screen.should_show_to(src))
				screen.update_for_view(client.view)
				client.screen |= screen
			else
				client.screen -= screen

/atom/movable/screen/fullscreen
	icon = 'icons/mob/screen_full.dmi'
	icon_state = "default"
	screen_loc = "CENTER-7,CENTER-7"
	layer = FULLSCREEN_LAYER
	plane = FULLSCREEN_PLANE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	var/view = 7
	var/severity = 0
	var/show_when_dead = FALSE

/atom/movable/screen/fullscreen/proc/update_for_view(client_view)
	if (screen_loc == "CENTER-7,CENTER-7" && view != client_view)
		var/list/actualview = getviewsize(client_view)
		view = client_view
		transform = matrix(actualview[1]/FULLSCREEN_OVERLAY_RESOLUTION_X, 0, 0, 0, actualview[2]/FULLSCREEN_OVERLAY_RESOLUTION_Y, 0)

/atom/movable/screen/fullscreen/proc/should_show_to(mob/mymob)
	if(!show_when_dead && mymob.stat == DEAD)
		return FALSE
	return TRUE

/atom/movable/screen/fullscreen/Destroy()
	severity = 0
	. = ..()

/atom/movable/screen/fullscreen/brute
	icon_state = "brutedamageoverlay"
	layer = UI_DAMAGE_LAYER
	plane = FULLSCREEN_PLANE

/atom/movable/screen/fullscreen/painflash
	icon_state = "painflash"
	layer = 20.19
	plane = FULLSCREEN_PLANE

/atom/movable/screen/fullscreen/oxy
	icon_state = "oxydamageoverlay"
	layer = UI_DAMAGE_LAYER
	plane = FULLSCREEN_PLANE

/atom/movable/screen/fullscreen/love
	icon_state = "lovehud"
	layer = CRIT_LAYER
	plane = FULLSCREEN_PLANE
	alpha = 0

/atom/movable/screen/fullscreen/love/New(client/C)
	. = ..()
	animate(src, alpha = 255, time = 30)

/atom/movable/screen/fullscreen/crit
	icon_state = "passage"
	layer = CRIT_LAYER
	plane = FULLSCREEN_PLANE

/atom/movable/screen/fullscreen/crit/uncon
	icon_state = "uncon"
	layer = CRIT_LAYER
	plane = FULLSCREEN_PLANE

/atom/movable/screen/fullscreen/crit/zeth
	icon = 'icons/mob/z.dmi'
	icon_state = "zeth"
	name = "Judgement"
	layer = CRIT_LAYER
	plane = FULLSCREEN_PLANE
	mouse_opacity = 1
	nomouseover = FALSE

/atom/movable/screen/fullscreen/crit/zeth/Click()
	if(isliving(usr))
		var/mob/living/L = usr
		if(L.stat != DEAD)
			if(alert("Are you done living?", "", "Yes", "No") == "Yes")
				if(!L.succumb_timer || (world.time < L.succumb_timer + 111 SECONDS) )
					var/ttime =  round(((L.succumb_timer + 111 SECONDS) - world.time) / 10)
					to_chat(L, span_redtext("I'm not dead enough yet. [ttime]"))
				else
					L.succumb(reaper = TRUE)

/atom/movable/screen/fullscreen/crit/death
	icon_state = "DD"
	layer = CRIT_LAYER
	plane = FULLSCREEN_PLANE

/atom/movable/screen/fullscreen/crit/cmode
	icon_state = "cmode"
	layer = 20.09
	plane = FULLSCREEN_PLANE

/atom/movable/screen/fullscreen/crit/vision
	icon_state = "oxydamageoverlay"
	layer = BLIND_LAYER

/atom/movable/screen/fullscreen/blackimageoverlay
	icon_state = "blackimageoverlay"
	layer = BLIND_LAYER
	plane = FULLSCREEN_PLANE

/atom/movable/screen/fullscreen/blind
	icon_state = "blind"
	layer = BLIND_LAYER
	plane = FULLSCREEN_PLANE

/atom/movable/screen/fullscreen/curse
	icon_state = "curse"
	layer = CURSE_LAYER
	plane = FULLSCREEN_PLANE

/atom/movable/screen/fullscreen/flashholder
	icon_state = ""
	layer = CRIT_LAYER
	plane = FULLSCREEN_PLANE

/atom/movable/screen/fullscreen/impaired
	icon_state = "impairedoverlay"

/atom/movable/screen/fullscreen/flash
	icon = 'icons/mob/screen_gen.dmi'
	screen_loc = "WEST,SOUTH to EAST,NORTH"
	icon_state = "flash"

/atom/movable/screen/fullscreen/flash/static
	icon = 'icons/mob/screen_gen.dmi'
	screen_loc = "WEST,SOUTH to EAST,NORTH"
	icon_state = "noise"

/atom/movable/screen/fullscreen/high
	icon = 'icons/mob/screen_gen.dmi'
	screen_loc = "WEST,SOUTH to EAST,NORTH"
	icon_state = "druggy"
	alpha = 80

/atom/movable/screen/fullscreen/purest
	icon = 'icons/mob/screen_gen.dmi'
	screen_loc = "WEST,SOUTH to EAST,NORTH"
	icon_state = "purest"
	alpha = 100

/atom/movable/screen/fullscreen/fade
	icon = 'icons/mob/roguehudback2.dmi'
	screen_loc = ui_backhudl
	icon_state = "fade"
	layer = 50
	plane = 50
	alpha = 255

/atom/movable/screen/fullscreen/color_vision
	icon = 'icons/mob/screen_gen.dmi'
	screen_loc = "WEST,SOUTH to EAST,NORTH"
	icon_state = "flash"
	alpha = 80

/atom/movable/screen/fullscreen/color_vision/green
	color = "#00ff00"

/atom/movable/screen/fullscreen/color_vision/red
	color = "#ff0000"

/atom/movable/screen/fullscreen/color_vision/blue
	color = "#0000ff"

/atom/movable/screen/fullscreen/lighting_backdrop
	icon = 'icons/mob/screen_gen.dmi'
	icon_state = "flash"
	transform = matrix(200, 0, 0, 0, 200, 0)
	plane = LIGHTING_PLANE
	blend_mode = BLEND_OVERLAY
	show_when_dead = TRUE

//Provides darkness to the back of the lighting plane
/atom/movable/screen/fullscreen/lighting_backdrop/lit
	invisibility = INVISIBILITY_LIGHTING
	layer = BACKGROUND_LAYER+21
	color = "#000"
	show_when_dead = TRUE

//Provides whiteness in case you don't see lights so everything is still visible
/atom/movable/screen/fullscreen/lighting_backdrop/unlit
	layer = BACKGROUND_LAYER+20
	show_when_dead = TRUE

/atom/movable/screen/fullscreen/see_through_darkness
	icon_state = "nightvision"
	plane = LIGHTING_PLANE
	layer = LIGHTING_LAYER
	blend_mode = BLEND_ADD
	show_when_dead = TRUE

/atom/movable/screen/fullscreen/maniac 
	icon = 'icons/roguetown/maniac/fullscreen.dmi'
	icon_state = "hall0"
	alpha = 0
	/// Amount of hallucination icon states we have
	var/hall_amount = 13

/atom/movable/screen/fullscreen/maniac/proc/jumpscare(mob/living/scared, silent = FALSE, fade_in = 0.2 SECONDS, duration = 0.5 SECONDS, fade_out = 1 SECONDS)
	if(!silent)
		var/static/list/spookies = list(
			'sound/villain/hall_appear1.ogg',
			'sound/villain/hall_appear2.ogg',
			'sound/villain/hall_appear3.ogg',
		)
		scared.playsound_local(scared, pick(spookies), vol = 100, vary = FALSE)
	icon_state = "hall[rand(1, hall_amount)]"
	animate(src, alpha = 255, time = fade_in, easing = BOUNCE_EASING | EASE_IN | EASE_OUT)
	animate(time = duration, easing = BOUNCE_EASING | EASE_IN | EASE_OUT)
	animate(alpha = 0, time = fade_out, easing = LINEAR_EASING)

/atom/movable/screen/fullscreen/dreaming
	icon = 'icons/roguetown/maniac/fullscreen_wakeup.dmi'
	icon_state = "dream"

/atom/movable/screen/fullscreen/dreaming/waking_up
	icon_state = "wake_up"

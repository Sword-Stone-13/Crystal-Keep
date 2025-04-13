// GLOB.sololquies holds all soliloquies
/datum/soliloquy
	var/name = "Soliloquy"
	var/list/questions = list(
		"Arrival" = "How did you arrive?",
		"Impact" = "What was the most impactful thing that happened to you?",
		"Ending" = "How did your week end?"
	)
	var/list/responses = list() // In-game this will follow the format of list("question" = "response", etc.)
	var/icon/character_image = null // A capture of the player's apperarance, shown at the end of the round.
	var/mob/living/carbon/human/character = null // The player character.

	var/submitted = FALSE // Has this soliloquy been submitted yet?

	var/list/reports = list() // List of people's ckeys who voted this soliloquy inappropriate.
	var/list/voted = list() // List of people's ckeys who voted this soliloquy as good.

/datum/soliloquy/New()
	. = ..()
	GLOB.soliloquies.Add(src)

/datum/soliloquy/Destroy()
	GLOB.soliloquies.Remove(src)
	return ..()
/datum/soliloquy/proc/set_doll(mob/living/carbon/human/H)
	character = H
	var/mob/living/carbon/human/dummy = generate_or_wait_for_human_dummy("soliloquy_[character]")
	dummy.appearance = character.appearance
	dummy.dir = SOUTH
	name = H.real_name
	character_image = getFlatIcon(dummy)
	unset_busy_human_dummy("soliloquy_[character]")
	return TRUE
/datum/soliloquy/proc/submit(mob/user)
	if(!character)
		return FALSE

	set_doll(character)
	submitted = !submitted

	to_chat(character, "<span class='notice'>Your soliloquy has been [submitted ? "submitted" : "unsubmitted"].</span>")
	return TRUE
/datum/soliloquy/proc/update_soliloquy(mob/user)
	if(!user)
		return FALSE

	if(!character_image)
		set_doll(character)

	var/dat = ""

	if(character_image)
		dat += "<center><img src='data:image/png;base64,[icon2base64(character_image)]' style='width: 150px; height: 150px; display: block; margin: 0 auto; image-rendering: auto;'></center><br>"	
		dat += "<center><p>Record your character's journey by answering the questions below. These responses will be displayed at the end of the round as your character's memories.</p></center>"

	dat += "<center><table style='width: 90%;'><br/>"	
	for(var/question_title in questions)
		var/question_text = questions[question_title]
		dat += "<tr><td align='center'><hr style='border: 1px solid #704214; width: 50%; margin: auto;'></td></tr>"
		dat += "<tr><td align='center'><b>[question_title]:</b></td></tr>"
		dat += "<tr><td align='center'>[question_text]</td></tr>"
		dat += "<tr><td align='center'><div style='width: 80%; background-color: #000000; border: 2px solid #704214; color: #FFFFFF; padding: 5px; display: inline-block;'>[responses[question_title] ? responses[question_title] : "No response yet"]</div><a href='?src=[REF(src)];action=edit;question=[question_title]' style='display: inline-block; padding: 5px 10px; margin-left: 5px; font-size: 14px; background-color: #704214; color: #FFFFFF; text-decoration: none; border-radius: 5px;'>🪶</a></td></tr>"
	dat += "</table></center>"	
	dat += "<center><div style='margin-bottom: 10px;'><span style='color: [submitted ? "#00FF00" : "#FF0000"];'>[submitted ? "✓ Submitted" : "✗ Not Submitted"]</span></div>"
	dat += "<a href='?src=[REF(src)];action=submit' style='display: inline-block; padding: 10px 20px; font-size: 16px; background-color: #704214; color: #FFFFFF; text-decoration: none; border-radius: 5px; margin-top: 10px;'>[submitted ? "Unsubmit" : "Submit"] Soliloquy</a></center>"

	var/datum/browser/popup = new(user, "soliloquy", "Soliloquy", 400, 880)
	popup.set_content(dat)
	popup.open()
	onclose(user, "soliloquy")
	

/client/verb/soliloquy()
	set name = "Set Soliloquy Doll"
	set category = "OOC"
	set desc = "Set up a soliloquy doll for the round."

	if(!isliving(mob))
		to_chat(src, "<span class='warning'>You must be a living mob to use this verb.</span>")
		return

	var/mob/living/carbon/human/H = mob

	if(!H.mind || !H.mind.soliloquy)
		to_chat(src, "<span class='warning'>You don't have a soliloquy!</span>")
		return FALSE

	var/datum/soliloquy/soliloquy = H.mind.soliloquy
	
	soliloquy.update_soliloquy(usr)

	return TRUE


/client/verb/view_soliloquys()
	set name = "View Soliloquys"
	set category = "OOC"
	set desc = "View and vote on submitted soliloquys."

	if(!isliving(mob))
		to_chat(src, span_warning("You must be a living mob to use this verb."))
		return

	var/mob/living/carbon/human/human = mob
	if(!human.mind?.soliloquy)
		to_chat(src, span_warning("You don't have a soliloquy!"))
		return

	if(!human.client.choosing_soliloquy)
		if(check_rights(R_ADMIN, FALSE))
			var/bypass = alert(usr, "Viewing soliloquys is usually reserved for chosen players near round end. Do you wish to bypass this restriction?", "Admin Override", "Yes", "No")
			if(bypass != "Yes")
				return
		else
			to_chat(src, span_warning("You haven't been selected to choose a soliloquy yet!"))
			return

	human.mind.soliloquy.view_soliloquys(usr)


/proc/get_submitted_soliloquys()
	var/list/submitted_soliloquys = list()
	for(var/mob/living/carbon/human/human as anything in GLOB.human_list)
		if(!human.mind?.soliloquy?.submitted)
			continue
		submitted_soliloquys += human.mind.soliloquy
	return submitted_soliloquys

/datum/soliloquy/proc/view_soliloquys(mob/user)
	var/list/submitted_soliloquys = get_submitted_soliloquys()

	if(!length(submitted_soliloquys))
		to_chat(user, span_warning("There are no submitted soliloquys to view!"))
		return

	var/list/dat = list()
	dat += "<center><h2 style='color: #704214;'>Submitted Soliloquys</h2></center>"
	dat += "<div style='text-align: center; color: #8b8b8b; margin: 10px; padding: 10px; background-color: #1a1a1a; border: 1px solid #704214;'>"
	dat += "Dear viewer. Cast your vote for soliloquies that resonate interesting or meaningful. Should you encounter any missives containing offensive content or profanity, \
	alert us to their presence."
	dat += "</div>"
	dat += "<hr style='border: 1px solid #704214;'>"
	for(var/datum/soliloquy/soliloquy in submitted_soliloquys)
		
		var/icon/I = soliloquy.character_image

		if(soliloquy.character_image) // obscures the character image
			var/icon/obscured = icon(soliloquy.character_image)			
			obscured.Blend("#020202", ICON_MULTIPLY)
			I = obscured

		dat += "<div style='margin: 10px; padding: 10px; background-color: #1a1a1a; border: 1px solid #704214;'>"
		dat += "<table style='width: 100%;'>"
		dat += "<tr>"
		dat += "<td style='text-align: center;'><div style='background-color: #3b230b; padding: 5px; border: 1px solid #704214; display: inline-block;'><img src='data:image/png;base64,[icon2base64(I)]' width='64' height='64' style='filter: drop-shadow(0 0 2px white) drop-shadow(0 0 2px white)'></div></td>"
		dat += "</tr>"		
		dat += "<tr><td colspan='3'><div style='margin: 5px 0;'>"

		for(var/question_title in soliloquy.questions)
			var/question_text = soliloquy.questions[question_title]
			dat += "<div style='margin-bottom: 10px;'>"
			dat += "<b style='color: #b87333;'>[question_title]:</b><br>"
			dat += "<i style='color: #8b8b8b;'>[question_text]</i><br>"
			dat += "<div style='background-color: #000000; border: 1px solid #704214; color: #FFFFFF; padding: 5px; margin-top: 5px;'>[soliloquy.responses[question_title] || "No response"]</div>"
			dat += "</div>"

		dat += "</div></td></tr>"
		dat += "<tr><td colspan='3' align='right'>"
		dat += "<span style='color: #707070; font-style: italic;'>Submitted by [soliloquy == src ? "you" : "another player"]</span>"
		if(soliloquy != src)
			dat += "<div style='margin-top: 10px;'>"
			dat += "<a href='?src=[REF(src)];action=upvote;soliloquy=[REF(soliloquy)]' style='display: inline-block; padding: 5px 10px; margin-right: 5px; background-color: [(user.ckey in soliloquy.voted) ? "#1a3a1a" : "#2d572c"]; color: #FFFFFF; text-decoration: none; border-radius: 3px;'>[(user.ckey in soliloquy.voted) ? "🠝 Remove Vote" : "🠝 Promote"]</a>"
			dat += "<a href='?src=[REF(src)];action=report;soliloquy=[REF(soliloquy)]' style='display: inline-block; padding: 5px 10px; background-color: [(user.ckey in soliloquy.reports) ? "#3a1a1a" : "#572c2c"]; color: #FFFFFF; text-decoration: none; border-radius: 3px;'>[(user.ckey in soliloquy.reports) ? "⚠️ Reported" : "⚠️ Report Inappropriate"]</a>"
			dat += "</div>"		
			dat += "</td></tr>"
		dat += "</table>"
		dat += "</div>"

	var/datum/browser/popup = new(user, "view_soliloquys", "View Soliloquys", 600, 800)
	popup.set_content(dat.Join())
	popup.open()
/client/verb/debug_soliloquys()
	set name = "Debug Soliloquys"
	set category = "Debug"
	set desc = "Add or remove dummy soliloquys for testing"

	if(!check_rights(R_DEBUG))
		return

	var/choice = input(usr, "What would you like to do?", "Debug Soliloquys") in \
		list("Add Dummy Soliloquy", \
		"Delete All Soliloquys", \
		"Delete Specific Soliloquy", \
		"Manage Soliloquy Choosers", \
		"Reset Votes", \
		"Reset Reports")
	
	switch(choice)
		if("Add Dummy Soliloquy")
			var/datum/soliloquy/S = new()
			S.submitted = TRUE
			
			var/arrival_response = pick(
				"I arrived at Fortress gates, my horse weary from the long journey.",
				"The castle's imposing walls loomed before me as I presented my credentials to the guards.",
				"The sound of iron-shod hooves echoed across the cobblestones as I entered the courtyard.",
				"The bitter winter winds howled through the battlements as I made my way inside.",
			)
			var/impact_response = pick(
				"Witnessing the Grand Ritual in the castle's ancient sanctum left me in awe.",
				"Surviving the siege when the barbarian hordes attacked our walls.",
				"Uncovering ancient texts in the forbidden library beneath the keep.",
				"Standing witness to the King's proclamation during the Crimson Moon.",
			)
			var/ending_response = pick(
				"The castle bells tolled as darkness descended upon our realm.",
				"I still serve within these hallowed walls, by grace of the Old Powers.",
				"The court physician tended my wounds, but the scars remain.",
				"I often find myself gazing from the highest tower, contemplating our fate.",
			)

			S.responses = list(
				"Arrival" = arrival_response,
				"Impact" = impact_response,
				"Ending" = ending_response
			)

			var/mob/living/carbon/human/H = new()
			H.mind = new()
			H.mind.soliloquy = S
			S.character = H
			S.set_doll(H)

			S.character_image = icon('icons/mob/human.dmi', "human_basic")
			
			to_chat(usr, span_notice("Added a dummy soliloquy."))
			
		if("Delete All Soliloquys")
			for(var/mob/living/carbon/human/H in GLOB.human_list)
				if(H.mind?.soliloquy)
					if(!H.ckey)
						H.mind.soliloquy = null
					else
						H.mind.soliloquy.submitted = FALSE
			to_chat(usr, span_notice("Processed all soliloquys."))
			
		if("Delete Specific Soliloquy")
			var/list/soliloquy_list = list()
			for(var/mob/living/carbon/human/H in GLOB.human_list)
				if(H.mind?.soliloquy)
					soliloquy_list[H.mind.soliloquy.name] = H
			
			var/chosen_name = input(usr, "Choose a soliloquy to process:", "Process Soliloquy") in soliloquy_list
			if(chosen_name)
				var/mob/living/carbon/human/H = soliloquy_list[chosen_name]
				if(!H.ckey)
					H.mind.soliloquy = null
					to_chat(usr, span_notice("Deleted soliloquy for [chosen_name]."))
				else
					H.mind.soliloquy.submitted = FALSE
					to_chat(usr, span_notice("Unsubmitted soliloquy for [chosen_name]."))

		if("Manage Soliloquy Choosers")
			var/list/players = list()
			for(var/mob/living/carbon/human/H in GLOB.player_list)
				if(H.client)
					players[H.ckey] = H.client.choosing_soliloquy

			var/list/options = list("Add Player", "Remove Player", "View Current List", "Cancel")
			var/chooser_action = input(usr, "What would you like to do?", "Manage Soliloquy Choosers") in options
			
			switch(chooser_action)
				if("Add Player")
					var/list/potential_players = list()
					for(var/ckey in players)
						if(!players[ckey])
							potential_players += ckey
					var/chosen_player = input(usr, "Choose a player to allow soliloquy selection:", "Add Player") in potential_players
					if(chosen_player)
						var/mob/living/carbon/human/H = get_mob_by_ckey(chosen_player)
						if(H?.client)
							H.client.choosing_soliloquy = TRUE
							to_chat(usr, span_notice("Added [chosen_player] to soliloquy choosers."))
				
				if("Remove Player")
					var/list/current_choosers = list()
					for(var/ckey in players)
						if(players[ckey])
							current_choosers += ckey
					var/chosen_player = input(usr, "Choose a player to remove soliloquy selection:", "Remove Player") in current_choosers
					if(chosen_player)
						var/mob/living/carbon/human/H = get_mob_by_ckey(chosen_player)
						if(H?.client)
							H.client.choosing_soliloquy = FALSE
							to_chat(usr, span_notice("Removed [chosen_player] from soliloquy choosers."))
				
				if("View Current List")
					var/list/current_choosers = list()
					for(var/ckey in players)
						if(players[ckey])
							current_choosers += ckey
					if(length(current_choosers))
						to_chat(usr, span_notice("Current soliloquy choosers: [english_list(current_choosers)]"))
					else
						to_chat(usr, span_notice("No players are currently allowed to choose soliloquys."))

		if("Reset Votes")
			for(var/datum/soliloquy/S in GLOB.soliloquies)
				S.voted = list()
			to_chat(usr, span_notice("All soliloquy votes have been reset."))

		if("Reset Reports")
			for(var/datum/soliloquy/S in GLOB.soliloquies)
				S.reports = list()
			to_chat(usr, span_notice("All soliloquy reports have been reset."))


/datum/soliloquy/Topic(href, href_list)
	if(..())
		return

	var/action = href_list["action"]

	switch(action)
		if("edit")
			var/question = href_list["question"]
			var/response = input(usr, questions[question], "Enter your response")
			if(response)
				responses[question] = response
				update_soliloquy(usr)
			set_doll(character)

			return TRUE

		if("submit")
			submit(usr)
			update_soliloquy(usr)
			return TRUE

		if("upvote")
			var/datum/soliloquy/S = locate(href_list["soliloquy"])
			if(!S)
				return
			if(!S.voted)
				S.voted = list()
			if(!(usr.ckey in S.voted))
				S.voted += usr.ckey
				to_chat(usr, span_notice("You voted for a soliloquy."))
				view_soliloquys(usr)
			else
				S.voted -= usr.ckey
				to_chat(usr, span_notice("You removed your vote from [S.name]'s soliloquy."))
				view_soliloquys(usr)

			return TRUE

		if("report")
			var/datum/soliloquy/S = locate(href_list["soliloquy"])
			if(!S)
				return
			if(!S.reports)
				S.reports = list()
			if(!(usr.ckey in S.reports))
				S.reports += usr.ckey
				to_chat(usr, span_warning("You reported a soliloquy. An admin will review it."))
				message_admins("[usr.ckey] reported [S.name]'s soliloquy.")
				view_soliloquys(usr)
			else
				S.reports -= usr.ckey
				to_chat(usr, span_notice("You removed your report from [S.name]'s soliloquy."))
				view_soliloquys(usr)

			return TRUE


		if("view_available")
			view_soliloquys(usr)
			return TRUE

	return TRUE

/**
	* Gets up to 5 random soliloquys from the global submitted soliloquys list
	* Returns an empty list if no soliloquys are available
*/
/proc/get_random_soliloquys()
	// Create a list to store all available soliloquys
	var/list/all_soliloquys = list()
	for(var/datum/soliloquy/S in get_submitted_soliloquys())
		all_soliloquys += S

	// Create a list to store our randomly selected soliloquys
	var/list/random_soliloquys = list()

	// If we have no soliloquys, return empty list
	if(!length(all_soliloquys))
		return random_soliloquys

	// Get the minimum between 5 and the total number of soliloquys
	var/picks = min(5, length(all_soliloquys))

	// Pick random soliloquys if we have any available
	if(picks > 0)
		random_soliloquys = pick_n_take(all_soliloquys, picks)

	return random_soliloquys

// Selects up to 10 random players (if it's under that, all of them) to choose a soliloquy
/proc/select_soliloquy_choosers()
	var/list/possible_choosers = list()
	
	for(var/mob/M in GLOB.player_list)
		if(M.client)
			possible_choosers += M

	var/num_to_pick = min(10, length(possible_choosers))
	var/list/chosen = list()
	
	if(length(possible_choosers))
		while(length(chosen) < num_to_pick && length(possible_choosers) > 0)
			var/mob/selected = pick(possible_choosers)
			possible_choosers -= selected
			chosen += selected
		
	for(var/mob/M in chosen)
		var/datum/soliloquy/S = M.mind?.soliloquy
		if(!S)
			continue
		M.client.choosing_soliloquy = TRUE
		to_chat(M, span_hierophant_warning("You are to choose a Soliloquy"))
		to_chat(M, span_notice("<a href='?src=[REF(S)];action=view_available'>(View available Soliloquys.)</a> (You can also view soliloquys through OOC > View Soliloquys)"))
		SEND_SOUND(M, 'sound/misc/updatebook.ogg')

	return chosen	


/// Gets the soliloquy with the most votes that has less than 3 reports against it
/// Returns null if no valid soliloquys are found
/proc/get_winning_soliloquy()
	var/datum/soliloquy/winning_soliloquy = null
	var/highest_votes = 0

	for(var/datum/soliloquy/S in get_submitted_soliloquys())
		if(length(S.reports) >= 3)
			continue
		if(length(S.voted) > highest_votes)
			highest_votes = length(S.voted)
			winning_soliloquy = S
		
	return winning_soliloquy


/client/verb/view_and_display_soliloquys()
	set name = "View & Display Soliloquys"
	set category = "Admin"
	set desc = "View submitted soliloquys and display them on screen"

	if(!check_rights(R_ADMIN))
		return

	var/list/soliloquy_choices = list()
	for(var/datum/soliloquy/S in get_submitted_soliloquys())
		soliloquy_choices["[S.name] ([length(S.voted)] votes, [length(S.reports)] reports)"] = S

	var/choice = input(usr, "Select a soliloquy to display", "Display Soliloquy") in soliloquy_choices
	if(!choice)
		return
	
	var/datum/soliloquy/S = soliloquy_choices[choice]

	display_winning_soliloquy(S, usr)

/client/verb/select_chosen_soliloquy()
	set name = "Select Chosen Soliloquy"
	set category = "Admin"
	set desc = "Select a soliloquy to be the chosen one"

	if(!check_rights(R_ADMIN))
		return

	var/list/soliloquy_choices = list()
	soliloquy_choices["RESET - Clear chosen soliloquy"] = null
	for(var/datum/soliloquy/S in get_submitted_soliloquys())
		soliloquy_choices["[S.name] ([length(S.voted)] votes, [length(S.reports)] reports)"] = S

	var/choice = input(usr, "Select a soliloquy to be chosen", "Select Chosen Soliloquy") in soliloquy_choices
	if(!choice)
		return

	var/datum/soliloquy/S = soliloquy_choices[choice]
	GLOB.chosen_soliloquy = S
	if(!S)
		to_chat(usr, span_notice("You have cleared the chosen soliloquy."))
	else
		to_chat(usr, span_notice("You have selected [S.name] as the chosen soliloquy."))


/proc/display_winning_soliloquy(datum/soliloquy/S, mob/user)
	if(!S)
		return
	var/html = {"<div style='text-align: center; background-color: #1a1a1a; padding: 20px; border: 1px solid #704214;'>
		<h1 style='color: #704214; font-family: Arial;'>Soliloquy of the week is...</h2>
		<h1 style='color: #b87333; font-family: Arial; font-size: 32px;'>[S.name]</h2>

		<div style='background-color: #000000; padding: 5px; border: 1px solid #704214; display: inline-block; position: relative;'>
		<div style='position: absolute; width: 0; height: 0; border-left: 75px solid transparent; border-right: 75px solid transparent; border-bottom: 150px solid rgba(255,255,255,0.1); filter: blur(10px); top: 50%; left: 50%; transform: translate(-50%, -50%);'></div>
		<img src='data:image/png;base64,[icon2base64(S.character_image)]' style='width: 150px; height: 150px; display: block; margin: 0 auto; filter: drop-shadow(0 0 2px white) drop-shadow(0 0 2px white); position: relative; z-index: 2;'></div><br><br>"}
	for(var/question in S.questions)
		html += "<div style='margin-bottom: 10px;'>"
		html += "<b style='color: #b87333; font-family: Arial; font-size: 16px;'>[question]:</b><br>"
		html += "<div style='background-color: #000000; border: 1px solid #704214; color: #8b8b8b; padding: 5px; margin-top: 5px;'>[S.responses[question]]</div>"
		html += "</div>"

	html += "</div>"
	var/datum/browser/popup = new(user, "soliloquy", "Soliloquy of the Week", 600, 600)
	popup.set_content(html)
	popup.open()

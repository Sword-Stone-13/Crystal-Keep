#define POPCOUNT_SURVIVORS "survivors"					//Not dead at roundend
#define POPCOUNT_ESCAPEES "escapees"					//Not dead and on centcom/shuttles marked as escaped
#define POPCOUNT_SHUTTLE_ESCAPEES "shuttle_escapees" 	//Emergency shuttle only.

/datum/controller/subsystem/ticker/proc/gather_roundend_feedback()
	gather_antag_data()
	record_nuke_disk_location()
	var/json_file = file("[GLOB.log_directory]/round_end_data.json")
	var/list/file_data = list("escapees" = list("humans" = list(), "silicons" = list(), "others" = list(), "npcs" = list()), "abandoned" = list("humans" = list(), "silicons" = list(), "others" = list(), "npcs" = list()), "ghosts" = list(), "additional data" = list())
	var/num_survivors = 0
	var/num_escapees = 0
	var/num_shuttle_escapees = 0
	var/list/area/shuttle_areas
	if(SSshuttle && SSshuttle.emergency)
		shuttle_areas = SSshuttle.emergency.shuttle_areas
	for(var/mob/m in GLOB.mob_list)
		var/escaped
		var/category
		var/list/mob_data = list()
		if(isnewplayer(m))
			continue
		if(m.mind)
			if(m.stat != DEAD && !isbrain(m) && !iscameramob(m))
				num_survivors++
			mob_data += list("name" = m.name, "ckey" = ckey(m.mind.key))
			if(isobserver(m))
				escaped = "ghosts"
			else if(isliving(m))
				var/mob/living/L = m
				mob_data += list("location" = get_area(L), "health" = L.health)
				if(ishuman(L))
					var/mob/living/carbon/human/H = L
					category = "humans"
					mob_data += list("job" = H.mind.assigned_role, "species" = H.dna.species.name)
				else if(issilicon(L))
					category = "silicons"
					if(isAI(L))
						mob_data += list("module" = "AI")
					if(isAI(L))
						mob_data += list("module" = "pAI")
					if(iscyborg(L))
						var/mob/living/silicon/robot/R = L
						mob_data += list("module" = R.module)
			else
				category = "others"
				mob_data += list("typepath" = m.type)
		if(!escaped)
			if(EMERGENCY_ESCAPED_OR_ENDGAMED && (m.onCentCom() || m.onSyndieBase()))
				escaped = "escapees"
				num_escapees++
				if(shuttle_areas[get_area(m)])
					num_shuttle_escapees++
			else
				escaped = "abandoned"
		if(!m.mind && (!ishuman(m) || !issilicon(m)))
			var/list/npc_nest = file_data["[escaped]"]["npcs"]
			if(npc_nest.Find(initial(m.name)))
				file_data["[escaped]"]["npcs"]["[initial(m.name)]"] += 1
			else
				file_data["[escaped]"]["npcs"]["[initial(m.name)]"] = 1
		else
			if(isobserver(m))
				var/pos = length(file_data["[escaped]"]) + 1
				file_data["[escaped]"]["[pos]"] = mob_data
			else
				if(!category)
					category = "others"
					mob_data += list("name" = m.name, "typepath" = m.type)
				var/pos = length(file_data["[escaped]"]["[category]"]) + 1
				file_data["[escaped]"]["[category]"]["[pos]"] = mob_data
	var/datum/station_state/end_state = new /datum/station_state()
	end_state.count()
	var/station_integrity = min(PERCENT(GLOB.start_state.score(end_state)), 100)
	file_data["additional data"]["station integrity"] = station_integrity
	WRITE_FILE(json_file, json_encode(file_data))
	SSblackbox.record_feedback("nested tally", "round_end_stats", num_survivors, list("survivors", "total"))
	SSblackbox.record_feedback("nested tally", "round_end_stats", num_escapees, list("escapees", "total"))
	SSblackbox.record_feedback("nested tally", "round_end_stats", GLOB.joined_player_list.len, list("players", "total"))
	SSblackbox.record_feedback("nested tally", "round_end_stats", GLOB.joined_player_list.len - num_survivors, list("players", "dead"))
	. = list()
	.[POPCOUNT_SURVIVORS] = num_survivors
	.[POPCOUNT_ESCAPEES] = num_escapees
	.[POPCOUNT_SHUTTLE_ESCAPEES] = num_shuttle_escapees
	.["station_integrity"] = station_integrity

/datum/controller/subsystem/ticker/proc/gather_antag_data()
	var/team_gid = 1
	var/list/team_ids = list()

	for(var/datum/antagonist/A in GLOB.antagonists)
		if(!A.owner)
			continue

		var/list/antag_info = list()
		antag_info["key"] = A.owner.key
		antag_info["name"] = A.owner.name
		antag_info["antagonist_type"] = A.type
		antag_info["antagonist_name"] = A.name //For auto and custom roles
		antag_info["objectives"] = list()
		antag_info["team"] = list()
		var/datum/team/T = A.get_team()
		if(T)
			antag_info["team"]["type"] = T.type
			antag_info["team"]["name"] = T.name
			if(!team_ids[T])
				team_ids[T] = team_gid++
			antag_info["team"]["id"] = team_ids[T]

		if(A.objectives.len)
			for(var/datum/objective/O in A.objectives)
				var/result = O.check_completion() ? "SUCCESS" : "FAIL"
				antag_info["objectives"] += list(list("objective_type"=O.type,"text"=O.explanation_text,"result"=result))
		SSblackbox.record_feedback("associative", "antagonists", 1, antag_info)

/datum/controller/subsystem/ticker/proc/record_nuke_disk_location()
	var/obj/item/disk/nuclear/N = locate() in GLOB.poi_list
	if(N)
		var/list/data = list()
		var/turf/T = get_turf(N)
		if(T)
			data["x"] = T.x
			data["y"] = T.y
			data["z"] = T.z
		var/atom/outer = get_atom_on_turf(N,/mob/living)
		if(outer != N)
			if(isliving(outer))
				var/mob/living/L = outer
				data["holder"] = L.real_name
			else
				data["holder"] = outer.name

		SSblackbox.record_feedback("associative", "roundend_nukedisk", 1 , data)

/datum/controller/subsystem/ticker/proc/gather_newscaster()
	var/json_file = file("[GLOB.log_directory]/newscaster.json")
	var/list/file_data = list()
	var/pos = 1
	for(var/V in GLOB.news_network.network_channels)
		var/datum/newscaster/feed_channel/channel = V
		if(!istype(channel))
			stack_trace("Non-channel in newscaster channel list")
			continue
		file_data["[pos]"] = list("channel name" = "[channel.channel_name]", "author" = "[channel.author]", "censored" = channel.censored ? 1 : 0, "author censored" = channel.authorCensor ? 1 : 0, "messages" = list())
		for(var/M in channel.messages)
			var/datum/newscaster/feed_message/message = M
			if(!istype(message))
				stack_trace("Non-message in newscaster channel messages list")
				continue
			var/list/comment_data = list()
			for(var/C in message.comments)
				var/datum/newscaster/feed_comment/comment = C
				if(!istype(comment))
					stack_trace("Non-message in newscaster message comments list")
					continue
				comment_data += list(list("author" = "[comment.author]", "time stamp" = "[comment.time_stamp]", "body" = "[comment.body]"))
			file_data["[pos]"]["messages"] += list(list("author" = "[message.author]", "time stamp" = "[message.time_stamp]", "censored" = message.bodyCensor ? 1 : 0, "author censored" = message.authorCensor ? 1 : 0, "photo file" = "[message.photo_file]", "photo caption" = "[message.caption]", "body" = "[message.body]", "comments" = comment_data))
		pos++
	if(GLOB.news_network.wanted_issue.active)
		file_data["wanted"] = list("author" = "[GLOB.news_network.wanted_issue.scannedUser]", "criminal" = "[GLOB.news_network.wanted_issue.criminal]", "description" = "[GLOB.news_network.wanted_issue.body]", "photo file" = "[GLOB.news_network.wanted_issue.photo_file]")
	WRITE_FILE(json_file, json_encode(file_data))

/mob/proc/do_game_over()
	if(SSticker.current_state != GAME_STATE_FINISHED)
		return
	if(client)
		client.show_game_over()

/mob/living/do_game_over()
	..()
	adjustEarDamage(0, 6000)
	Stun(6000, 1, 1)
	ADD_TRAIT(src, TRAIT_MUTE, TRAIT_GENERIC)
	walk(src, 0) //stops them mid pathing even if they're stunimmune
	if(isanimal(src))
		var/mob/living/simple_animal/S = src
		S.toggle_ai(AI_OFF)
	if(ishostile(src))
		var/mob/living/simple_animal/hostile/H = src
		H.LoseTarget()
	if(ishuman(src))
		var/mob/living/carbon/human/H = src
		H.mode = AI_OFF
	if(client)
		client.verbs += /client/proc/lobbyooc

/client/proc/show_game_over()
	var/atom/movable/screen/splash/credits/S = new(src, FALSE)
	S.Fade(FALSE,FALSE, 8 SECONDS)
	RollCredits()
//	if(GLOB.credits_icons.len)
//		for(var/i=0, i<=GLOB.credits_icons.len, i++)
//			var/atom/movable/screen/P = new()
//			P.layer = SPLASHSCREEN_LAYER+1
//			P.appearance = GLOB.credits_icons
//			screen += P

/datum/controller/subsystem/ticker/proc/declare_completion()
	set waitfor = FALSE

	log_game("The round has ended.")

	to_chat(world, "<BR><BR><BR><span class='reallybig'>Another week at Crystal Keep. Try again?</span>")
	get_end_reason()

	var/list/key_list = list()
	for(var/client/C in GLOB.clients)
		if(C.mob)
			SSdroning.kill_droning(C)
			C.mob.playsound_local(C.mob, 'sound/music/credits.ogg', 100, FALSE)
		if(isliving(C.mob) && C.ckey)
			key_list += C.ckey
//	if(key_list.len)
//		add_roundplayed(key_list)
	for(var/mob/living/carbon/human/H in GLOB.player_list)
		if(H.stat != DEAD)
			if(H.get_triumphs() < 0)
				H.adjust_triumphs(1)
	add_roundplayed(key_list)
//	SEND_SOUND(world, sound(pick('sound/misc/roundend1.ogg','sound/misc/roundend2.ogg')))
//	SEND_SOUND(world, sound('sound/misc/roundend.ogg'))

	for(var/mob/M in GLOB.mob_list)
		M.do_game_over()

	for(var/I in round_end_events)
		var/datum/callback/cb = I
		cb.InvokeAsync()
	LAZYCLEARLIST(round_end_events)

	to_chat(world, "Round ID: [GLOB.rogue_round_id]")

	sleep(5 SECONDS)

	gamemode_report()

	sleep(10 SECONDS)

	players_report()

	stats_report()

	sleep(10 SECONDS)

	soliloquy_report()

//	for(var/client/C in GLOB.clients)
//		if(!C.credits)
//			C.RollCredits()
//		C.playtitlemusic(40)

//	var/popcount = gather_roundend_feedback()
//	display_report(popcount)

	CHECK_TICK

//	// Add AntagHUD to everyone, see who was really evil the whole time!
//	for(var/datum/atom_hud/antag/H in GLOB.huds)
//		for(var/m in GLOB.player_list)
//			var/mob/M = m
//			H.add_hud_to(M)

	CHECK_TICK

	//Set news report and mode result
//	mode.set_round_result()

//	send2irc("Server", "Round just ended.")

//	if(length(CONFIG_GET(keyed_list/cross_server)))
//		send_news_report()

	CHECK_TICK

	//These need update to actually reflect the real antagonists
	//Print a list of antagonists to the server log
	var/list/total_antagonists = list()
	//Look into all mobs in world, dead or alive
	for(var/datum/antagonist/A in GLOB.antagonists)
		if(!A.owner)
			continue
		if(!(A.name in total_antagonists))
			total_antagonists[A.name] = list()
		total_antagonists[A.name] += "[key_name(A.owner)]"

	CHECK_TICK

	//Now print them all into the log!
	log_game("Antagonists at round end were...")
	for(var/antag_name in total_antagonists)
		var/list/L = total_antagonists[antag_name]
		log_game("[antag_name]s :[L.Join(", ")].")

	CHECK_TICK
	SSdbcore.SetRoundEnd()
	//Collects persistence features
	if(mode.allow_persistence_save)
		SSpersistence.CollectData()

	//stop collecting feedback during grifftime
	SSblackbox.Seal()

	sleep(10 SECONDS)
	SSvote.initiate_vote("map", "Crystal Keep players")
	ready_for_reboot = TRUE
	standard_reboot()

/datum/controller/subsystem/ticker/proc/get_end_reason()
	var/end_reason

	if(istype(SSticker.mode, /datum/game_mode/chaosmode))
		var/datum/game_mode/chaosmode/C = SSticker.mode
		if(C.check_for_lord)
			if(!C.check_for_lord(forced = TRUE))
				end_reason = pick("Without a Monarch, they were doomed to become slaves of Zizo.",
								"Without a Monarch, they were doomed to be eaten by nite creachers.",
								"Without a Monarch, they were doomed to become victims of Gehenna.",
								"Without a Monarch, they were doomed to enjoy a mass-suicide.",
								"Without a Monarch, the Lich made them his playthings.",
								"Without a Monarch, some jealous rival reigned in tyranny.",
								"Without a Monarch, the town was abandoned.")
//		if(C.not_enough_players)
//			end_reason = "The town was abandoned."

		if(C.vampire_werewolf() == "vampire")
			end_reason = "When the Vampires finished sucking the town dry, they moved on to the next one."
		if(C.vampire_werewolf() == "werewolf")
			end_reason = "The Werevolves formed an unholy clan, marauding Crystal Keep until the end of its daes."

		if(C.cultascended)
			end_reason = "ZIZOZIZOZIZOZIZO"

		if(C.headrebdecree)
			end_reason = "The peasant rebels took control of the throne, hail the new community!"


	if(end_reason)
		to_chat(world, span_bigbold("[end_reason]."))
	else
		to_chat(world, span_bigbold("The town has managed to survive another week."))

/datum/controller/subsystem/ticker/proc/gamemode_report()
	var/list/all_teams = list()
	var/list/all_antagonists = list()

	for(var/datum/team/A in GLOB.antagonist_teams)
		if(!A.members)
			continue
		all_teams |= A

	for(var/datum/antagonist/A in GLOB.antagonists)
		if(!A.owner)
			continue
		all_antagonists |= A

	for(var/datum/team/T in all_teams)
		T.roundend_report()
		for(var/datum/antagonist/X in all_antagonists)
			if(X.get_team() == T)
				all_antagonists -= X
		CHECK_TICK

	var/currrent_category
	var/datum/antagonist/previous_category

	sortTim(all_antagonists, GLOBAL_PROC_REF(cmp_antag_category))

	for(var/datum/antagonist/A in all_antagonists)
		if(!A.show_in_roundend)
			continue
		if(A.roundend_category != currrent_category)
			if(previous_category)
				previous_category.roundend_report_footer()
			A.roundend_report_header()
			currrent_category = A.roundend_category
			previous_category = A
		A.roundend_report()

		CHECK_TICK

	if(all_antagonists.len)
		var/datum/antagonist/last = all_antagonists[all_antagonists.len]
		if(last.show_in_roundend)
			last.roundend_report_footer()

	return


/datum/controller/subsystem/ticker/proc/soliloquy_report()
	var/datum/soliloquy/S = GLOB.chosen_soliloquy
	if(!S)
		var/datum/soliloquy/winning_soliloquy = get_winning_soliloquy()
		if(!winning_soliloquy)
			return FALSE

		S = winning_soliloquy


	for(var/mob/M in GLOB.player_list)
		display_winning_soliloquy(S, M)

	return TRUE


/datum/controller/subsystem/ticker/proc/stats_report()
	var/list/shit = list()
	shit += "<br><span class='bold'>Δ--------------------Δ</span><br>"
	shit += "<br><font color='#9b6937'><span class='bold'>Deaths:</span></font> [deaths]"
	shit += "<br><font color='#af2323'><span class='bold'>Blood spilt:</span></font> [round(blood_lost / 100, 1)]L"
	shit += "<br><font color='#36959c'><span class='bold'>TRIUMPH(s) Awarded:</span></font> [tri_gained]"
	shit += "<br><font color='#a02fa4'><span class='bold'>TRIUMPH(s) Stolen:</span></font> [tri_lost * -1]"
	if(GLOB.confessors.len)
		shit += "<br><font color='#93cac7'><span class='bold'>Confessors:</span></font> "
		for(var/x in GLOB.confessors)
			shit += "[x]"
	shit += "<br><br><span class='bold'>∇--------------------∇</span>"
	to_chat(world, "[shit.Join()]")
	return

/datum/controller/subsystem/ticker/proc/standard_reboot()
	if(ready_for_reboot)
		if(mode.station_was_nuked)
			Reboot("Station destroyed by Nuclear Device.", "nuke")
		else
			Reboot("Round ended.", "proper completion")
	else
		CRASH("Attempted standard reboot without ticker roundend completion")

//Common part of the report
/datum/controller/subsystem/ticker/proc/build_roundend_report()
	var/list/parts = list()

	//Gamemode specific things. Should be empty most of the time.
	parts += mode.special_report()

	CHECK_TICK

	//AI laws
	parts += law_report()

	CHECK_TICK

	//Antagonists
	parts += antag_report()

	CHECK_TICK
	//Medals
	parts += medal_report()
	//Station Goals
	parts += goal_report()

	listclearnulls(parts)

	return parts.Join()

/datum/controller/subsystem/ticker/proc/survivor_report(popcount)
	var/list/parts = list()
	var/station_evacuated = EMERGENCY_ESCAPED_OR_ENDGAMED

	if(GLOB.round_id)
		var/statspage = CONFIG_GET(string/roundstatsurl)
		var/info = statspage ? "<a href='?action=openLink&link=[url_encode(statspage)][GLOB.round_id]'>[GLOB.round_id]</a>" : GLOB.round_id
		parts += "[FOURSPACES]Round ID: <b>[info]</b>"
	parts += "[FOURSPACES]Shift Duration: <B>[DisplayTimeText(world.time - SSticker.round_start_time)]</B>"
	parts += "[FOURSPACES]Station Integrity: <B>[mode.station_was_nuked ? span_redtext("Destroyed") : "[popcount["station_integrity"]]%"]</B>"
	var/total_players = GLOB.joined_player_list.len
	if(total_players)
		parts+= "[FOURSPACES]Total Population: <B>[total_players]</B>"
		if(station_evacuated)
			parts += "<BR>[FOURSPACES]Evacuation Rate: <B>[popcount[POPCOUNT_ESCAPEES]] ([PERCENT(popcount[POPCOUNT_ESCAPEES]/total_players)]%)</B>"
			parts += "[FOURSPACES](on emergency shuttle): <B>[popcount[POPCOUNT_SHUTTLE_ESCAPEES]] ([PERCENT(popcount[POPCOUNT_SHUTTLE_ESCAPEES]/total_players)]%)</B>"
		parts += "[FOURSPACES]Survival Rate: <B>[popcount[POPCOUNT_SURVIVORS]] ([PERCENT(popcount[POPCOUNT_SURVIVORS]/total_players)]%)</B>"
		if(SSblackbox.first_death)
			var/list/ded = SSblackbox.first_death
			if(ded.len)
				parts += "[FOURSPACES]First Death: <b>[ded["name"]], [ded["role"]], at [ded["area"]]. Damage taken: [ded["damage"]].[ded["last_words"] ? " Their last words were: \"[ded["last_words"]]\"" : ""]</b>"
			//ignore this comment, it fixes the broken sytax parsing caused by the " above
			else
				parts += "[FOURSPACES]<i>Nobody died this shift!</i>"
	if(istype(SSticker.mode, /datum/game_mode/dynamic))
		var/datum/game_mode/dynamic/mode = SSticker.mode
		parts += "[FOURSPACES]Threat level: [mode.threat_level]"
		parts += "[FOURSPACES]Threat left: [mode.threat]"
		parts += "[FOURSPACES]Executed rules:"
		for(var/datum/dynamic_ruleset/rule in mode.executed_rules)
			parts += "[FOURSPACES][FOURSPACES][rule.ruletype] - <b>[rule.name]</b>: -[rule.cost + rule.scaled_times * rule.scaling_cost] threat"
	return parts.Join("<br>")

/client/proc/roundend_report_file()
	return "data/roundend_reports/[ckey].html"

/datum/controller/subsystem/ticker/proc/show_roundend_report(client/C, previous = FALSE)
	var/datum/browser/roundend_report = new(C, "roundend")
	roundend_report.width = 800
	roundend_report.height = 600
	var/content
	var/filename = C.roundend_report_file()
	if(!previous)
		var/list/report_parts = list(personal_report(C), GLOB.common_report)
		content = report_parts.Join()
		C.verbs -= /client/proc/show_previous_roundend_report
		fdel(filename)
		text2file(content, filename)
	else
		content = file2text(filename)
	roundend_report.set_content(content)
	roundend_report.stylesheets = list()
//	roundend_report.add_stylesheet("roundend", 'html/browser/roundend.css')
//	roundend_report.add_stylesheet("font-awesome", 'html/font-awesome/css/all.min.css')
	roundend_report.open(FALSE)

/datum/controller/subsystem/ticker/proc/personal_report(client/C, popcount)
	var/list/parts = list()
	var/mob/M = C.mob
	if(M.mind && !isnewplayer(M))
		if(M.stat != DEAD && !isbrain(M))
			if(EMERGENCY_ESCAPED_OR_ENDGAMED)
				if(!M.onCentCom() && !M.onSyndieBase())
					parts += "<div class='panel stationborder'>"
					parts += span_marooned("I managed to survive, but were marooned on [station_name()]...")
				else
					parts += "<div class='panel greenborder'>"
					parts += span_greentext("I managed to survive the events on [station_name()] as [M.real_name].")
			else
				parts += "<div class='panel greenborder'>"
				parts += span_greentext("I managed to survive the events on [station_name()] as [M.real_name].")

		else
			parts += "<div class='panel redborder'>"
			parts += span_redtext("I did not survive the events on [station_name()]...")
	else
		parts += "<div class='panel stationborder'>"
	parts += "<br>"
	parts += GLOB.survivor_report
	parts += "</div>"

	return parts.Join()

/datum/controller/subsystem/ticker/proc/players_report()
	for(var/client/C in GLOB.clients)
		give_show_playerlist_button(C)

/datum/controller/subsystem/ticker/proc/display_report(popcount)
	GLOB.common_report = build_roundend_report()
	GLOB.survivor_report = survivor_report(popcount)
	for(var/client/C in GLOB.clients)
		show_roundend_report(C, FALSE)
		give_show_report_button(C)
		CHECK_TICK

/datum/controller/subsystem/ticker/proc/law_report()
	var/list/parts = list()
	var/borg_spacer = FALSE //inserts an extra linebreak to seperate AIs from independent borgs, and then multiple independent borgs.
	//Silicon laws report
	for (var/i in GLOB.ai_list)
		var/mob/living/silicon/ai/aiPlayer = i
		if(aiPlayer.mind)
			parts += "<b>[aiPlayer.name]</b> (Played by: <b>[aiPlayer.mind.key]</b>)'s laws [aiPlayer.stat != DEAD ? "at the end of the round" : "when it was <span class='redtext'>deactivated</span>"] were:"
			parts += aiPlayer.laws.get_law_list(include_zeroth=TRUE)

		parts += "<b>Total law changes: [aiPlayer.law_change_counter]</b>"

		if (aiPlayer.connected_robots.len)
			var/borg_num = aiPlayer.connected_robots.len
			parts += "<br><b>[aiPlayer.real_name]</b>'s minions were:"
			for(var/mob/living/silicon/robot/robo in aiPlayer.connected_robots)
				borg_num--
				if(robo.mind)
					parts += "<b>[robo.name]</b> (Played by: <b>[robo.mind.key]</b>)[robo.stat == DEAD ? " <span class='redtext'>(Deactivated)</span>" : ""][borg_num ?", ":""]"
		if(!borg_spacer)
			borg_spacer = TRUE

	for (var/mob/living/silicon/robot/robo in GLOB.silicon_mobs)
		if (!robo.connected_ai && robo.mind)
			parts += "[borg_spacer?"<br>":""]<b>[robo.name]</b> (Played by: <b>[robo.mind.key]</b>) [(robo.stat != DEAD)? "<span class='greentext'>survived</span> as an AI-less borg!" : "was <span class='redtext'>unable to survive</span> the rigors of being a cyborg without an AI."] Its laws were:"

			if(robo) //How the hell do we lose robo between here and the world messages directly above this?
				parts += robo.laws.get_law_list(include_zeroth=TRUE)

			if(!borg_spacer)
				borg_spacer = TRUE

	if(parts.len)
		return "<div class='panel stationborder'>[parts.Join("<br>")]</div>"
	else
		return ""

/datum/controller/subsystem/ticker/proc/goal_report()
	var/list/parts = list()
	if(mode.station_goals.len)
		for(var/V in mode.station_goals)
			var/datum/station_goal/G = V
			parts += G.get_result()
		return "<div class='panel stationborder'><ul>[parts.Join()]</ul></div>"

/datum/controller/subsystem/ticker/proc/medal_report()
	if(GLOB.commendations.len)
		var/list/parts = list()
		parts += span_header("Medal Commendations:")
		for (var/com in GLOB.commendations)
			parts += com
		return "<div class='panel stationborder'>[parts.Join("<br>")]</div>"
	return ""

/datum/controller/subsystem/ticker/proc/antag_report()
	var/list/result = list()
	var/list/all_teams = list()
	var/list/all_antagonists = list()

	for(var/datum/team/A in GLOB.antagonist_teams)
		if(!A.members)
			continue
		all_teams |= A

	for(var/datum/antagonist/A in GLOB.antagonists)
		if(!A.owner)
			continue
		all_antagonists |= A

	for(var/datum/team/T in all_teams)
		result += T.roundend_report()
		for(var/datum/antagonist/X in all_antagonists)
			if(X.get_team() == T)
				all_antagonists -= X
		result += " "//newline between teams
		CHECK_TICK

	var/currrent_category
	var/datum/antagonist/previous_category

	sortTim(all_antagonists, GLOBAL_PROC_REF(cmp_antag_category))

	for(var/datum/antagonist/A in all_antagonists)
		if(!A.show_in_roundend)
			continue
		if(A.roundend_category != currrent_category)
			if(previous_category)
				result += previous_category.roundend_report_footer()
				result += "</div>"
			result += "<div class='panel redborder'>"
			result += A.roundend_report_header()
			currrent_category = A.roundend_category
			previous_category = A
		result += A.roundend_report()
		result += "<br><br>"
		CHECK_TICK

	if(all_antagonists.len)
		var/datum/antagonist/last = all_antagonists[all_antagonists.len]
		result += last.roundend_report_footer()
		result += "</div>"

	return result.Join()

/proc/cmp_antag_category(datum/antagonist/A,datum/antagonist/B)
	return sorttext(B.roundend_category,A.roundend_category)

/datum/controller/subsystem/ticker/proc/give_show_report_button(client/C)
	var/datum/action/report/R = new
	C.player_details.player_actions += R
	R.Grant(C.mob)
	to_chat(C,"<a href='?src=[REF(R)];report=1'>Show roundend report again</a>")

/datum/controller/subsystem/ticker/proc/give_show_playerlist_button(client/C)
	set waitfor = 0
	to_chat(C,"<a href='?src=[C];playerlistrogue=1'>* SHOW PLAYER LIST *</a>")
	C.commendsomeone(forced = TRUE)

/datum/action/report
	name = "Show roundend report"
	button_icon_state = "round_end"

/datum/action/report/Trigger()
	if(owner && GLOB.common_report && SSticker.current_state == GAME_STATE_FINISHED)
		SSticker.show_roundend_report(owner.client, FALSE)

/datum/action/report/IsAvailable()
	return 1

/datum/action/report/Topic(href,href_list)
	if(usr != owner)
		return
	if(href_list["report"])
		Trigger()
		return

/proc/printplayer(datum/mind/ply, fleecheck)
	var/jobtext = ""
	if(ply.assigned_role)
		jobtext = " the <b>[ply.assigned_role]</b>"
	var/usede = ply.key
	if(ply.key)
		usede = ckey(ply.key)
		if(ckey(ply.key) in GLOB.anonymize)
//			if(check_whitelist(ckey(ply.key)))
			usede = get_fake_key(ckey(ply.key))
	var/text = "<b>[usede]</b> was <b>[ply.name]</b>[jobtext] and"
	if(ply.current)
		if(ply.current.real_name != ply.name)
			text += " <span class='redtext'>died</span>"
		else
			if(ply.current.stat == DEAD)
				text += " <span class='redtext'>died</span>"
			else
				text += " <span class='greentext'>survived</span>"
//		if(fleecheck)
//			var/turf/T = get_turf(ply.current)
//			if(!T || !is_station_level(T.z))
//				text += " while <span class='redtext'>fleeing the station</span>"
//		if(ply.current.real_name != ply.name)
//			text += " as <b>[ply.current.real_name]</b>"
	to_chat(world, "[text]")

/proc/printplayerlist(list/players,fleecheck)
	var/list/parts = list()

	parts += "<ul class='playerlist'>"
	for(var/datum/mind/M in players)
		parts += "<li>[printplayer(M,fleecheck)]</li>"
	parts += "</ul>"
	return parts.Join()


/proc/printobjectives(list/objectives)
	if(!objectives || !objectives.len)
		return
	var/list/objective_parts = list()
	var/count = 1
	for(var/datum/objective/objective in objectives)
		if(objective.check_completion())
			objective_parts += "<b>[objective.flavor] #[count]</b>: [objective.explanation_text] <span class='greentext'>Success!</span>"
		else
			objective_parts += "<b>[objective.flavor] #[count]</b>: [objective.explanation_text] <span class='redtext'>Fail.</span>"
		count++
	return objective_parts.Join("<br>")

/datum/controller/subsystem/ticker/proc/save_admin_data()
	if(IsAdminAdvancedProcCall())
		to_chat(usr, span_adminprefix("Admin rank DB Sync blocked: Advanced ProcCall detected."))
		return
	if(CONFIG_GET(flag/admin_legacy_system)) //we're already using legacy system so there's nothing to save
		return
	else if(load_admins(TRUE)) //returns true if there was a database failure and the backup was loaded from
		return
	sync_ranks_with_db()
	var/list/sql_admins = list()
	for(var/i in GLOB.protected_admins)
		var/datum/admins/A = GLOB.protected_admins[i]
		sql_admins += list(list("ckey" = A.target, "rank" = A.rank.name))
	SSdbcore.MassInsert(format_table_name("admin"), sql_admins, duplicate_key = TRUE)
	var/datum/DBQuery/query_admin_rank_update = SSdbcore.NewQuery("UPDATE [format_table_name("player")] p INNER JOIN [format_table_name("admin")] a ON p.ckey = a.ckey SET p.lastadminrank = a.rank")
	query_admin_rank_update.Execute()
	qdel(query_admin_rank_update)

	//json format backup file generation stored per server
	var/json_file = file("data/admins_backup.json")
	var/list/file_data = list("ranks" = list(), "admins" = list())
	for(var/datum/admin_rank/R in GLOB.admin_ranks)
		file_data["ranks"]["[R.name]"] = list()
		file_data["ranks"]["[R.name]"]["include rights"] = R.include_rights
		file_data["ranks"]["[R.name]"]["exclude rights"] = R.exclude_rights
		file_data["ranks"]["[R.name]"]["can edit rights"] = R.can_edit_rights
	for(var/i in GLOB.admin_datums+GLOB.deadmins)
		var/datum/admins/A = GLOB.admin_datums[i]
		if(!A)
			A = GLOB.deadmins[i]
			if (!A)
				continue
		file_data["admins"]["[i]"] = A.rank.name
	fdel(json_file)
	WRITE_FILE(json_file, json_encode(file_data))

/datum/controller/subsystem/ticker/proc/update_everything_flag_in_db()
	for(var/datum/admin_rank/R in GLOB.admin_ranks)
		var/list/flags = list()
		if(R.include_rights == R_EVERYTHING)
			flags += "flags"
		if(R.exclude_rights == R_EVERYTHING)
			flags += "exclude_flags"
		if(R.can_edit_rights == R_EVERYTHING)
			flags += "can_edit_flags"
		if(!flags.len)
			continue
		var/flags_to_check = flags.Join(" != [R_EVERYTHING] AND ") + " != [R_EVERYTHING]"
		var/datum/DBQuery/query_check_everything_ranks = SSdbcore.NewQuery(
			"SELECT flags, exclude_flags, can_edit_flags FROM [format_table_name("admin_ranks")] WHERE rank = :rank AND ([flags_to_check])",
			list("rank" = R.name)
		)
		if(!query_check_everything_ranks.Execute())
			qdel(query_check_everything_ranks)
			return
		if(query_check_everything_ranks.NextRow()) //no row is returned if the rank already has the correct flag value
			var/flags_to_update = flags.Join(" = [R_EVERYTHING], ") + " = [R_EVERYTHING]"
			var/datum/DBQuery/query_update_everything_ranks = SSdbcore.NewQuery(
				"UPDATE [format_table_name("admin_ranks")] SET [flags_to_update] WHERE rank = :rank",
				list("rank" = R.name)
			)
			if(!query_update_everything_ranks.Execute())
				qdel(query_update_everything_ranks)
				return
			qdel(query_update_everything_ranks)
		qdel(query_check_everything_ranks)

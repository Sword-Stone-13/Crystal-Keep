//DO NOT ADD MORE TO THIS FILE.
//Use vv_do_topic() for datums!
/client/proc/view_var_Topic(href, href_list, hsrc)
	if( (usr.client != src) || !src.holder || !holder.CheckAdminHref(href, href_list))
		return
	var/target = GET_VV_TARGET
	vv_do_basic(target, href_list, href)
	if(istype(target, /datum))
		var/datum/D = target
		D.vv_do_topic(href_list)
	else if(islist(target))
		vv_do_list(target, href_list)
	if(href_list["Vars"])
		debug_variables(locate(href_list["Vars"]))

//Stuff below aren't in dropdowns/etc.

	if(check_rights(R_VAREDIT))

	//~CARN: for renaming mobs (updates their name, real_name, mind.name, their ID/PDA and datacore records).

		if(href_list["rename"])
			if(!check_rights(NONE))
				return

			var/mob/M = locate(href_list["rename"]) in GLOB.mob_list
			if(!istype(M))
				to_chat(usr, "This can only be used on instances of type /mob")
				return

			var/new_name = stripped_input(usr,"What would you like to name this mob?","Input a name",M.real_name,MAX_NAME_LEN)
			if( !new_name || !M )
				return

			message_admins("Admin [key_name_admin(usr)] renamed [key_name_admin(M)] to [new_name].")
			M.fully_replace_character_name(M.real_name,new_name)
			vv_update_display(M, "name", new_name)
			vv_update_display(M, "real_name", M.real_name || "No real name")

		else if(href_list["rotatedatum"])
			if(!check_rights(NONE))
				return

			var/atom/A = locate(href_list["rotatedatum"])
			if(!istype(A))
				to_chat(usr, "This can only be done to instances of type /atom")
				return

			switch(href_list["rotatedir"])
				if("right")
					A.setDir(turn(A.dir, -45))
				if("left")
					A.setDir(turn(A.dir, 45))
			vv_update_display(A, "dir", dir2text(A.dir))


		else if(href_list["makehuman"])
			if(!check_rights(R_SPAWN))
				return

			var/mob/living/carbon/monkey/Mo = locate(href_list["makehuman"]) in GLOB.mob_list
			if(!istype(Mo))
				to_chat(usr, "This can only be done to instances of type /mob/living/carbon/monkey")
				return

			if(alert("Confirm mob type change?",,"Transform","Cancel") != "Transform")
				return
			if(!Mo)
				to_chat(usr, "Mob doesn't exist anymore")
				return
			holder.Topic(href, list("humanone"=href_list["makehuman"]))

		else if(href_list["adjustDamage"] && href_list["mobToDamage"])
			if(!check_rights(NONE))
				return

			var/mob/living/L = locate(href_list["mobToDamage"]) in GLOB.mob_list
			if(!istype(L))
				return

			var/Text = href_list["adjustDamage"]

			var/amount =  input("Deal how much damage to mob? (Negative values here heal)","Adjust [Text]loss",0) as num|null

			if (isnull(amount))
				return

			if(!L)
				to_chat(usr, "Mob doesn't exist anymore")
				return

			var/newamt
			switch(Text)
				if("brute")
					L.adjustBruteLoss(amount)
					newamt = L.getBruteLoss()
				if("fire")
					L.adjustFireLoss(amount)
					newamt = L.getFireLoss()
				if("toxin")
					L.adjustToxLoss(amount)
					newamt = L.getToxLoss()
				if("oxygen")
					L.adjustOxyLoss(amount)
					newamt = L.getOxyLoss()
				if("brain")
					L.adjustOrganLoss(ORGAN_SLOT_BRAIN, amount)
					newamt = L.getOrganLoss(ORGAN_SLOT_BRAIN)
				if("clone")
					L.adjustCloneLoss(amount)
					newamt = L.getCloneLoss()
				if("stamina")
					L.adjustStaminaLoss(amount)
					newamt = L.getStaminaLoss()
				else
					to_chat(usr, "You caused an error. DEBUG: Text:[Text] Mob:[L]")
					return

			if(amount != 0)
				var/log_msg = "[key_name(usr)] dealt [amount] amount of [Text] damage to [key_name(L)]"
				message_admins("[key_name(usr)] dealt [amount] amount of [Text] damage to [ADMIN_LOOKUPFLW(L)]")
				log_admin(log_msg)
				admin_ticket_log(L, "<font color='blue'>[log_msg]</font>")
				vv_update_display(L, Text, "[newamt]")

		else if(href_list[VV_HK_MODIFY_ENGRAVING])
			if(!check_rights(R_DEBUG))
				return
			var/obj/item/I = target
			if(!istype(I) || !I.engraveable)
				to_chat(usr, span_warning("[I] cannot be engraved!"))
				return
			
			var/action = alert(usr, "What would you like to do with the engraving?", "Engraving Options", "View", "Add/Modify", "Remove")
			if(!action)
				return
			
			switch(action)
				if("View")
					if(I.engraved_url)
						to_chat(usr, span_notice("Current engraving URL: [I.engraved_url]"))
						to_chat(usr, span_notice("Engraving quality: [I.engraving_quality]"))
					else
						to_chat(usr, span_notice("No engraving present."))
					
				if("Add/Modify")
					var/input = input(usr, "Enter the URL of the image to engrave (must be externally hosted):", "Engraving", I.engraved_url) as text|null
					if(!input)
						return
					
					if(!validate_url(input))
						to_chat(usr, span_warning("Invalid image URL! URL must start with http:// or https:// and end with .jpg, .jpeg, .png or .gif"))
						return
					
					var/quality = input(usr, "Select engraving quality:", "Engraving Quality", I.engraved_url ? I.engraving_quality : ENGRAVING_QUALITY_CRUDE) as null|anything in list("Crude", "Decent", "Masterful")
					if(!quality)
						return
					
					I.engraved_url = input
					switch(quality)
						if("Crude")
							I.engraving_quality = ENGRAVING_QUALITY_CRUDE
						if("Decent")
							I.engraving_quality = ENGRAVING_QUALITY_DECENT
						if("Masterful")
							I.engraving_quality = ENGRAVING_QUALITY_MASTERFUL
						
					to_chat(usr, span_notice("Engraving modified successfully."))
					
				if("Remove")
					if(!I.engraved_url)
						to_chat(usr, span_warning("[I] has no engraving to remove!"))
						return
					
					I.engraved_url = null
					I.engraving_quality = 0
					to_chat(usr, span_notice("Engraving removed successfully."))

	//Finally, refresh if something modified the list.
	if(href_list["datumrefresh"])
		var/datum/DAT = locate(href_list["datumrefresh"])
		if(istype(DAT, /datum) || istype(DAT, /client))
			debug_variables(DAT)



/proc/send_ooc_note(msg, name, job)
	var/list/names_to = list()
	if(name)
		names_to += name
	if(job)
		var/list/L = list()
		if(islist(job))
			L = job
		else
			L += job
		for(var/J in L)
			for(var/mob/living/carbon/human/X in GLOB.human_list)
				if(X.job == J)
					names_to |= X.real_name
	if(names_to.len)
		for(var/mob/living/carbon/human/X in GLOB.human_list)
			if(X.real_name in names_to)
				if(!X.stat)
					to_chat(X, span_info("[msg]"))

SUBSYSTEM_DEF(treasury)
	name = "treasury"
	wait = 1
	priority = FIRE_PRIORITY_WATER_LEVEL
	var/tax_value = 0.11
	var/queens_tax = 0.15
	var/treasury_value = 0
	var/list/bank_accounts = list()
	var/list/stockpile_datums = list()
	var/multiple_item_penalty = 0.66
	var/interest_rate = 0.25
	var/next_treasury_check = 0
	var/list/log_entries = list()


/datum/controller/subsystem/treasury/Initialize()
	treasury_value = rand(800,1500)
	queens_tax = pick(0.09, 0.15, 0.21, 0.30)

	for(var/path in subtypesof(/datum/roguestock/bounty))
		var/datum/D = new path
		stockpile_datums += D
	for(var/path in subtypesof(/datum/roguestock/stockpile))
		var/datum/D = new path
		stockpile_datums += D
	for(var/path in subtypesof(/datum/roguestock/import))
		var/datum/D = new path
		stockpile_datums += D
	return ..()

/datum/controller/subsystem/treasury/fire(resumed = 0)
	if(world.time > next_treasury_check)
		next_treasury_check = world.time + rand(5 MINUTES, 8 MINUTES)
		var/list/stockpile_items = list()
		if(SSticker.current_state == GAME_STATE_PLAYING)
			for(var/datum/roguestock/X in stockpile_datums)
				if(!X.stable_price && !X.transport_item)
					if(X.demand < initial(X.demand))
						X.demand += rand(5,15)
					if(X.demand > initial(X.demand))
						X.demand -= rand(5,15)
		for(var/datum/roguestock/stockpile/A in stockpile_datums) //Generate some remote resources
			A.held_items[2] += A.passive_generation
			A.held_items[2] = min(A.held_items[2],10) //To a maximum of 10
		var/area/A = GLOB.areas_by_type[/area/rogue/indoors/town/vault]
		var/amt_to_generate = 0
		for(var/obj/item/I in A)
			if(!isturf(I.loc))
				continue
			if(I.get_real_price() <= 0 || istype(I, /obj/item/roguecoin))
				continue
			if(!I.submitted_to_stockpile)
				I.submitted_to_stockpile = TRUE
			if(I.type in stockpile_items)
				stockpile_items[I.type] *= multiple_item_penalty
			else
				stockpile_items[I.type] = I.get_real_price()
			amt_to_generate += (stockpile_items[I.type]*interest_rate)
		amt_to_generate = amt_to_generate - (amt_to_generate * queens_tax)
		amt_to_generate = round(amt_to_generate)
		give_money_treasury(amt_to_generate, "wealth horde")
		var/people_told = 0
		for(var/mob/living/carbon/human/X in GLOB.human_list)
			switch(X.job)
				if("King", "Steward", "Clerk")
					people_told += 1
					send_ooc_note("Income from wealth horde: +[amt_to_generate]", name = X.real_name)
					if(people_told > 3)
						return


/datum/controller/subsystem/treasury/proc/create_bank_account(name, initial_deposit)
	if(!name)
		return
	if(name in bank_accounts)
		return
	bank_accounts += name
	if(initial_deposit)
		bank_accounts[name] = initial_deposit
	else
		bank_accounts[name] = 0
	return TRUE

//increments the treasury directly (tax collection)
/datum/controller/subsystem/treasury/proc/give_money_treasury(amt, source)
	if(!amt)
		return
	treasury_value += amt
	if(source)
		log_to_steward("+[amt] to treasury ([source])")
	else
		log_to_steward("+[amt] to treasury")

//pays to account from treasury (payroll)
/datum/controller/subsystem/treasury/proc/give_money_account(amt, name, source)
	if(!amt)
		return
	if(!name)
		return
	var/found_account
	if (amt > treasury_value)  // Check if the amount exceeds the treasury balance
		send_ooc_note("<b>The Bank:</b> Error: Insufficient funds in the treasury to complete the transaction.", name = name)
		return FALSE  // Return early if the treasury balance is insufficient
	for(var/X in bank_accounts)
		if(X == name)
			if(amt > 0)
				bank_accounts[X] += amt  // Deposit the money into the player's account
				treasury_value -= amt   // Deduct the given amount from the treasury
			else
				// Check if the amount to be fined exceeds the player's account balance
				if(abs(amt) > bank_accounts[X])
					send_ooc_note("<b>The Bank:</b> Error: Insufficient funds in the player's account to complete the fine.", name = name)
					return FALSE  // Return early if the player has insufficient funds
				bank_accounts[X] -= abs(amt)  // Deduct the fine amount from the player's account
				treasury_value += abs(amt)  // Add the fined amount to the treasury
			found_account = TRUE
			break
	if(!found_account)
		return FALSE

	if (amt > 0)
		// Player received money
		if(source)
			send_ooc_note("<b>The Bank:</b> You received money. ([source])", name = name)
			log_to_steward("[amt] from treasury to [name] ([source])")
		else
			send_ooc_note("<b>The Bank:</b> You received money.", name = name)
			log_to_steward("[amt] from treasury to [name]")
	else
		// Player was fined
		if(source)
			send_ooc_note("<b>The Bank:</b> You were fined. ([source])", name = name)
			log_to_steward("[name] was fined [amt] ([source])")
		else
			send_ooc_note("<b>The Bank:</b> You were fined.", name = name)
			log_to_steward("[name] was fined [amt]")

	return TRUE

///Deposits money into a character's bank account. Taxes are deducted from the deposit and added to the treasury.
///@param amt: The amount of money to deposit.
///@param character: The character making the deposit.
///@return TRUE if the money was successfully deposited, FALSE otherwise.
/datum/controller/subsystem/treasury/proc/generate_money_account(amt, mob/living/carbon/human/character)
	if(!amt)
		return FALSE
	if(!character)
		return FALSE
	var/taxed_amount = 0
	var/original_amt = amt
	if(character in bank_accounts)
		if((character.job in GLOB.noble_positions) || HAS_TRAIT(character, TRAIT_NOBLE))
			bank_accounts[character] += amt
		else
			taxed_amount = round(amt * tax_value)
			amt -= taxed_amount
			bank_accounts[character] += amt
			treasury_value += taxed_amount
	else
		return FALSE

	log_to_steward("+[taxed_amount] taxation of [character], who deposited [original_amt]")

	return TRUE


/datum/controller/subsystem/treasury/proc/withdraw_money_account(amt, name)
	if(!amt)
		return
	var/found_account
	for(var/X in bank_accounts)
		if(X == name)
			if(bank_accounts[X] < amt)  // Check if the withdrawal amount exceeds the player's account balance
				send_ooc_note("<b>The Bank:</b> Error: Insufficient funds in the player's account to complete the withdrawal.", name = name)
				return  // Return without processing the transaction
			bank_accounts[X] -= amt
			found_account = TRUE
			break
	if(!found_account)
		return
	log_to_steward("-[amt] withdrawn by [name]")
	return TRUE


/datum/controller/subsystem/treasury/proc/log_to_steward(log)
	log_entries += log
	return

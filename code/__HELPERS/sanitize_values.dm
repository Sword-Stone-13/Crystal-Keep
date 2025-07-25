//general stuff
/proc/sanitize_integer(number, min=0, max=1, default=0)
	if(isnum(number))
		number = round(number)
		if(min <= number && number <= max)
			return number
	return default

/proc/sanitize_text(text, default="")
	if(istext(text))
		return text
	return default

/proc/sanitize_islist(value, default)
	if(islist(value) && length(value))
		return value
	if(default)
		return default

/proc/sanitize_inlist(value, list/List, default)
	if(value in List)
		return value
	if(default)
		return default
	if(List && List.len)
		return pick(List)



//more specialised stuff
/proc/sanitize_gender(gender,neuter=0,plural=1, default="male")
	switch(gender)
		if(MALE, FEMALE)
			return gender
		if(NEUTER)
			if(neuter)
				return gender
			else
				return default
		if(PLURAL)
			if(plural)
				return gender
			else
				return default
	return default

/proc/sanitize_hexcolor(color, desired_format=6, include_crunch=0, default)
	var/crunch = include_crunch ? "#" : ""
	if(!istext(color))
		color = ""

	var/start = 1 + (text2ascii(color,1)==35)
	var/len = length(color)
	var/step_size = 1 + ((len+1)-start != desired_format)

	. = ""
	for(var/i=start, i<=len, i+=step_size)
		var/ascii = text2ascii(color,i)
		switch(ascii)
			if(48 to 57)
				. += ascii2text(ascii)		//numbers 0 to 9
			if(97 to 102)
				. += ascii2text(ascii)		//letters a to f
			if(65 to 70)
				. += ascii2text(ascii+32)	//letters A to F - translates to lowercase
			else
				break

	if(length(.) != desired_format)
		if(default)
			return default
		return crunch + repeat_string(desired_format, "0")

	return crunch + .

/proc/sanitize_ooccolor(color)
	var/list/HSL = rgb2hsl(hex2num(copytext(color,2,4)),hex2num(copytext(color,4,6)),hex2num(copytext(color,6,8)))
	HSL[3] = min(HSL[3],0.4)
	var/list/RGB = hsl2rgb(arglist(HSL))
	return "#[num2hex(RGB[1],2)][num2hex(RGB[2],2)][num2hex(RGB[3],2)]"


/proc/validate_url(url)
	if(!url)
		return FALSE
	
	// Check if URL starts with http:// or https://
	if(!findtext(url, "http://", 1, 8) && !findtext(url, "https://", 1, 9))
		return FALSE
		
	// Check if URL ends with common image extensions
	var/list/valid_extensions = list(".jpg", ".jpeg", ".png", ".gif")
	var/valid_ext = FALSE
	for(var/ext in valid_extensions)
		if(findtext(url, ext, -length(ext)))
			valid_ext = TRUE
			break
	if(!valid_ext)
		return FALSE
		
	return TRUE

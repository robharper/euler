# How many Sundays fell on the first of the month in the 20th c

# Straight-ahead iterative date calculation-based approach
months_noleap = [31,28,31,30,31,30,31,31,30,31,30,31]
months_leap = [31,29,31,30,31,30,31,31,30,31,30,31]

# Jan 1 1900 was a monday, 7th was a sunday
year = 1900
month = 0 #0 == Jan
date = 6 #0-index dates (1st == 0, etc)

# 1900 was not a leap year
months = months_noleap

# Answer
sundays = 0

# Year 2000 is included in 20th c, 1900 is not
while year < 2001
	# Count this sunday if first of month and within 20th c (we started in 1900, must skip this year)
	sundays += 1 if date == 0 && year > 1900
	
	# Advance
	date += 7
	if date >= months[month] 
		date = date % months[month]
		month += 1
		if month >= 12  
			month = 0
			year += 1
			# Set next year's set of month day counts based on leap year calculation
			months = (year % 4 == 0 && 
					(year % 100 != 0 || year % 400 == 0)) ? 
					months_leap : months_noleap
		end
	end
end
puts sundays
# Problem 24

def factorial( n ) 
	(1..n).reduce(:*)
end

def perm_target( target, digits )
	return [digits[0]] if digits.length == 1
	# How many perms of all available digits except 1
	factor = factorial(digits.length-1)
	# How many sets of these perms are needed to get close (but not past) our target
	chunk = (target / factor).floor
	# Chunk must be < digits.length, assuming precondition true
	contribution = digits.slice!(chunk)
	target -= chunk*factor

	perm_target(target, digits).unshift( contribution )
end

puts perm_target( 999999, (0..9).to_a ).to_s

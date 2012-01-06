def has_factor( n, factors )
	root = Math.sqrt(n).floor
	factors.any? do |factor|
		# exit early when factors are too big to be a factor
		return false if factor > root
		n % factor == 0
	end
end

# Start with 2,3 we know are primes
primes = [2,3]
# Then from 5 upwards in steps of 6 (primes are all 6k +/- 1)...
(5...2000000).step(6) do |n|
	# Add to primes (factors) list if not divisible by any prime lower than itself
	primes << n if !has_factor( n, primes )
	primes << n+2 if !has_factor( n+2, primes )
	puts n
end

puts primes
puts primes.reduce(:+)
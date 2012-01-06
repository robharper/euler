# Problem 357
# Find the sum of all positive integers n not exceeding 100 000 000
# such that for every divisor d of n, d+n/d is prime.
# Solved: 1739023853137

# From problem 10
def has_factor( n, factors )
	root = Math.sqrt(n).floor
	factors.any? do |factor|
		# exit early when factors are too big to be a factor
		return false if factor > root
		n % factor == 0
	end
end

limit = 100000000

# Start with 2,3 we know are prime
primes = [2,3]
# Then from 5 upwards in steps of 6 (primes are all 6k +/- 1)...
(5...limit+1).step(6) do |n|
	# Add to primes (factors) list if not divisible by any prime lower than itself
	primes << n if !has_factor( n, primes )
	primes << n+2 if !has_factor( n+2, primes )
	puts n if (n-5) % 60000 == 0
end

puts 'Done primes'

# Binary search - http://snippets.dzone.com/posts/show/11531
class Array
  def bsearch(e, l = 0, u = length - 1)
    return if l>u;m=(l+u)/2;e<self[m]?u=m-1:l=m+1;e==self[m]?m:bsearch(e,l,u)
  end
end

# Now have all primes < sqrt of limit
# Find all factors of each number, test each for primeness
matches = [1,2]
(12..limit).step(12) do |n|
	n = n - 2
	# n-2
	# No sense in searching for factors above sqrt
	subsearch = Math.sqrt(n).floor
	matches << n if (1..subsearch).all? do |d|
		# if is a divisor, true only if satisfies rule
		# if not a divisor, that's ok
		n%d == 0 ? primes.bsearch(d + n/d) : true
	end

	n = n - 4
	# n-6
	# No sense in searching for factors above sqrt
	subsearch = Math.sqrt(n).floor
	matches << n if (1..subsearch).all? do |d|
		# if is a divisor, true only if satisfies rule
		# if not a divisor, that's ok
		n%d == 0 ? primes.bsearch(d + n/d) : true
	end

	puts n if n % 120000 == 0
end

puts matches.inspect
puts matches.reduce(:+)
# Returns true if any of the provided factors divides the given n evenly
def has_factor( n, factors )
	root = Math.sqrt(n).floor
	factors.any? do |factor|
		# exit early when factors are too big to be a factor
		return false if factor > root
		n % factor == 0
	end
end


# Returns an array of all factors of a number (not including the number itself)
def factors_of( number )
	# Get the low factors
	low_factors = (1..Math.sqrt(number).floor).find_all { |f| number%f == 0 }
	# Get the high factors
	factors = Array.new(low_factors)
	low_factors.each { |f| factors << number/f if f != 1 }
	# For perfect squares the last factor added will be a duplicate of the last low factor
	factors.slice!(factors.length-1) if factors.length > 1 and factors.last == low_factors.last 
	factors
end


# Returns an array of all prime factors of the given number
def prime_factor( number )
	factors = []
	2.upto( Math.sqrt(number).floor ) do |d|
		while number % d == 0
			number = number / d
			factors << d
		end
	end
	factors
end


# Generate an array of primes up to given limit
def primes( limit )
	# Start with 2,3 we know are prime
	primes = [2,3]
	# Then from 5 upwards in steps of 6 (primes are all 6k +/- 1)...
	(5..limit).step(6) do |n|
		# Add to primes (factors) list if not divisible by any prime lower than itself
		primes << n if !has_factor( n, primes )
		primes << n+2 if !has_factor( n+2, primes )
	end
	primes
end

# Generates permutations of the given digits, yeilding each to a block
# If the block returns a non-nil value, digit generation stops and this function
# returns the value returned by the block
def number_perms( digits, value='', &block )
	if digits.length == 0
		return block[value.to_i] 
	else
		digits.each do |d|
			if (result = number_perms( digits.select {|v| v!=d}, value + d.to_s, &block ))
				# at the end of recursion block returned a value
				return result
			end
		end
		nil
	end
end


# Make extensions that we'll need
module Enumerable
  	# Extended inject that also provides index
	def find_all_indexes( value )
		results = []
		each_with_index{ |obj, index| results << index if obj == value }
		results	
	end
end

# Binary search - http://snippets.dzone.com/posts/show/11531
class Array
  def bsearch(e, l = 0, u = length - 1)
    return if l>u;m=(l+u)/2;e<self[m]?u=m-1:l=m+1;e==self[m]?m:bsearch(e,l,u)
  end
end
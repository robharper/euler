# Problem 21
# Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
# If d(a) = b and d(b) = a, where a  b, then a and b are an amicable pair and each of a and b are called amicable numbers.
#
# For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; 
# therefore d(220) = 284. 
# The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
#
# Evaluate the sum of all the amicable numbers under 10000.

def factor_sum_of( number )
	# Get the low factors
	low_factors = (1..Math.sqrt(number).floor).find_all { |f| number%f == 0 }
	# Get the high factors
	factors = Array.new(low_factors)
	low_factors.each { |f| factors << number/f if f != 1 }
	# For perfect squares the last factor added will be a duplicate of the last low factor
	factors.slice!(factors.length-1) if factors.length > 1 and factors.last == low_factors.last 
	factors.reduce(:+)
end

d = [0]
amicable = [0,1]

(2..9999).each do |candidate|
	d_value = factor_sum_of(candidate);
	d[candidate] = d_value
	if d_value <= 9999 and d[d_value] == candidate and d_value != candidate
		puts "#{candidate} #{d_value}"
		amicable << candidate
		amicable << d_value
	end
end

puts amicable.inspect
puts amicable.reduce(:+)
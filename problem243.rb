# Problem 243
# A positive fraction whose numerator is less than its denominator is called a proper fraction.
# For any denominator, d, there will be d1 proper fractions; for example, with d = 12:
# 1/12 , 2/12 , 3/12 , 4/12 , 5/12 , 6/12 , 7/12 , 8/12 , 9/12 , 10/12 , 11/12 .

# We shall call a fraction that cannot be cancelled down a resilient fraction.
# Furthermore we shall define the resilience of a denominator, R(d), to be the ratio of its 
# proper fractions that are resilient; for example, R(12) = 4/11 .
# In fact, d = 12 is the smallest denominator having a resilience R(d) < 4/10 .

# Find the smallest denominator d, having a resilience R(d) < 15499/94744 .

require 'euler_common'
require 'rational'

target = 15499.0/94744.0

# This is our R(d) function
def r(number, factors)
	# Calculate the Euclid totient
	num = number * factors.reduce(1.0) { |tot,val| tot * (1-(1.0/val)) }
	# Find R
	num / (number-1)
end

ps = primes(1000)
number = 1
limit = 0

# First check each local minimum (multiples of unique prime factors
# since euclid totient depends only unique prime factors)
ps.each_with_index do |p, idx|
	number *= p
	val = r(number, ps[0..idx])
	if val < target
		limit = idx
		break
	end
end

# Found the first local minimum below target
# Find first number between this and last local minima that meets target
# Essentially, must solve for n/(n-1)*phi < target
# where phi is constant (unique factors don't change)
# n/(n-1) < target/phi
# Since factors remain the same, only check multiples of root
factors = ps[0...limit]
root = factors.reduce(:*)
2.upto(ps[limit]) do |mult|
	# The factors will remain the same
	val = r(root*mult, factors)
	if val < target
		puts "Answer: #{root*mult} R:#{val}"
		break
	end
end
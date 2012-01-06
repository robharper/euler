# Problem 23
#
# A perfect number is a number for which the sum of its proper divisors is exactly equal to the number.
# For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 
# 28 is a perfect number.
#
# A number n is called deficient if the sum of its proper divisors is less than n and it is called 
# abundant if this sum exceeds n.
#
# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be 
# written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that 
# all integers greater than 28123 can be written as the sum of two abundant numbers. However, this 
# upper limit cannot be reduced any further by analysis even though it is known that the greatest 
# number that cannot be expressed as the sum of two abundant numbers is less than this limit.
#
# Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.

require 'euler_common'

limit = 28123

# Find all abundant numbers
abundants = []
(12..limit).each do |n|
	abundants << n if factors_of(n).reduce(:+) > n
end

puts abundants.inspect

# Find all sums of two abundant numbers
sums = []
abundants.combination(2) do |c|
	# ugly hack - add sum of same number
	sums[c[0]*2] = 1 if c[0]*2 < limit
	sums[c[1]*2] = 1 if c[1]*2 < limit
	sums[c[0] + c[1]] = 1 if c[0]+c[1] < limit
end

puts sums.length

# Find holes and sum
answer = sums.find_all_indexes(nil)
puts answer.inspect
puts answer.reduce(:+)
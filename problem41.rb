# Problem 41
# We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly 
# once. For example, 2143 is a 4-digit pandigital and is also prime.
#
# What is the largest n-digit pandigital prime that exists?

require 'euler_common'

max_answer = 987654321
factors = primes( Math.sqrt(max_answer).floor )

answer = 9.downto(5) do |length|
	answer = number_perms( (1..length).to_a.reverse ) do |candidate|
		# Return the first prime value we see
		candidate if !has_factor( candidate, factors )
	end
	break answer if answer
end

puts answer
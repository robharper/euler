# Problem 35
# How many circular primes are there below one million?

require 'euler_common'

puts 'getting primes'
even_re = /[245680]/
candidates = primes(999999).find_all { |n| n==2 or n == 5 or not even_re =~ n.to_s }

puts 'looking for circulars'
answer = candidates.find_all do |n|
	chars = n.to_s.chars.to_a
	isCircular = true
	chars.length.times do 
		# rotate 
		chars.push( chars.shift )
		if !candidates.bsearch( chars.to_s.to_i )
			isCircular = false
			break
		end
	end
	isCircular
end

puts answer.inspect
puts answer.length


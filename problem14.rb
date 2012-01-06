# Problem 14
# The following iterative sequence is defined for the set of positive integers:
# 
# n -> n/2 (n is even)
# n -> 3n + 1 (n is odd)

answer = (1..999999).max_by do |n|
	puts n if n%10000 == 0
	length = 1
	while n != 1
		length += 1
		if n.even?
			n = n/2 
		else
			n = 3*n + 1
		end
	end
	length
end

puts answer
# Find the sum of the digits in the number 2^1000

# Instead of using Big Integers, implement using arrays
# Represent the number backwards to make array iteration simpler
number = [1]

for i in (1..1000)
	acc = 0
	number.each_index do |idx| 
		# Double, accumulate
		number[idx] = number[idx] * 2 + acc
		# Carry if value >= 10
		if number[idx] >= 10
			acc = 1
			number[idx] -= 10
		else
			acc = 0
		end
	end
	if acc > 0
		number.push(acc)
	end
end
# The number (backwards)
puts number.to_s
# The sum of the digits (the answer)
puts number.inject {|acc,val| acc+=val}
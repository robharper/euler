# Find the difference between the sum of the squares of the first one hundred 
# natural numbers and the square of the sum

sum_of_squares = 0
square_of_sum = 0
(1..100).each do |n|
	sum_of_squares += n*n
	square_of_sum += n
end

square_of_sum *= square_of_sum
puts square_of_sum
puts sum_of_squares

puts square_of_sum - sum_of_squares
# 
# Problem 4: Find the largest palindrome made from the product of two 3-digit numbers.
#
def isPalindrome(number)
	str = number.to_s
	mid = (str.length/2).floor
	# 0->mid not inclusive  comp  -mid to end (inclusive)
	str[0...mid] == str[-mid..-1].reverse
end

palindromes = []
(10...999).each do |n|
	(n...999).each do |m|
		palindromes << n*m if isPalindrome m*n
	end
end

puts palindromes.max
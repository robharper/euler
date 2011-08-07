# Problem 40: An irrational fraction is constructed by concatenating the natural numbers in order:
# 0.1234567891011121314151617181920...
# Find the product of the 1, 10, 100, 1000, 10000, 100000, 1000000 digits

def nth_digit(n)
	# Divide up problem as blocks of numbers with different # of digits:
	# Digit blocks: 1*9, 2*90, 3*900, 4*9000, …
	# Block sizes: 9, 180, 2700, 36000
	blockNum = 0
	blockMax = 0
	while n > blockMax
		blockNum += 1
		# Minimum offset of this block
		blockMin = blockMax+1
		# Max offset of this block
		blockMax = blockMin-1 + 9*(10**(blockNum-1))*blockNum
	end
	
	# Algorithm we use to go from digit number to value
	# Pos 1-9: n-1 div 1 + 1
	# Pos 10-189: n-10 div 2 + 10
	# Pos 190-2889: n-190 div 3 + 100
	value = (n-blockMin).div(blockNum) + 10**(blockNum-1)
	# Offset into the number
	ofs = ((n-blockMin) % blockNum)
	puts "#{ofs} digit of #{value}"

	# Evaluate to: from the number, extract the "ofs" digit where zero is MSD
	puts (value.div(10**(blockNum-ofs-1)) % 10)
	value.div(10**(blockNum-ofs-1)) % 10
end

# Find the product of numbers at the given offsets in to the fraction, as asked
puts [1,10,100,1000,10000,100000,1000000].inject(1) {|acc,n| acc * nth_digit(n) }

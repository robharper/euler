# Problem 48: Find the last 10 digits of 1^1 + 2^2 + 3^3 + ... + 1000^1000

# Brute force approach, only keep 10 LSDs
start = Time.now.to_f
truncate = 10**10
answer = 0

for n in (1..1000)
	val = 1
	(1..n).each do
		# perform exponential calc but throw away anything above 10 digits
		val = (val * n) % truncate
	end
	answer = (answer + val) % truncate
end

elapsed = Time.now.to_f - start
puts "#{answer} in #{elapsed} sec"



# Compact approach allowing math to stray into BigNum
start = Time.now.to_f

# Fold, accumulate squares of each number
answer = (1..1000).inject {|acc,n| acc + n**n}

elapsed = Time.now.to_f - start
puts "#{answer.to_s[-10,10]} in #{elapsed} sec"

# Compact is much much faster - keeping numbers small is outweighed by system power calculation and cost of interpretation
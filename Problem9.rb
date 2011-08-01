# Project Euler Problem 9
# There exists exactly one Pythagorean triplet (a^2 + b^2 = c^2) for which a + b + c = 1000.
# Find the product abc.

# c > max(a,b), c<a+b, a+b+c=1000, a,b,c E I
# a < 499
# b = 1000-a-c
# c > a, (1000-a)/2
# c < a+b => c < 500
for a in (1..499)
	minC = [a,(1000-a)/2].max
	for c in (minC..500)
		b = 1000 - a - c
		puts a, b, c, a*b*c if (a*a + b*b == c*c)
	end
end

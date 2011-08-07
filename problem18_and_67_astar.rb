# Problems 18 and 67
# Find the path through the triangle that yeilds the highest sum
# Eg.
#    3
#   7 4
#  2 4 6
# 8 5 9 3


# A path is an array of indices, and a path quality heuristic
# path = { :path=>[0,1,1,2,3], :f=>23 }

# Use A*-style heuristic => path value + best case value to goal
# Result is sub-optimal paths are not explored when they cannot possibly
# match the current best even if they had the maximum value possible for all
# steps remaining to the goal
# Also, algorithm will find best route to a given node first so once a path to
# a node is found that node need not be examined again.  As a result, in the worst
# case each node would be explored (expanded) once



# Make extensions that we'll need
module Enumerable
  	# Extended inject that also provides index
	def inject_with_index(injected)
		each_with_index{ |obj, index| injected = yield(injected, obj, index) }
		injected	
	end
end

# Find the first index in the array that satisfies given block
def find_idx(arr)
	arr.each_with_index { |e,i| return i if yield e } 
	return nil
end

# Insert the value in the given array using the given block to assess the insert point
def sorted_insert(arr, val)
	idx = find_idx(arr) { |e| yield val,e }
	idx = arr.length if idx == nil
	arr.insert(idx, val)
end




# Find path given a triangle and a heuristic function
# The returned array of data indices will maximize the heuristic function 
def max_path( data )
	# Keep some stats
	followed = 0

	# Calculate the score for the root node
	score = yield [0],data

	# ordered list of open candidates from best to worst estimates
	# populate with root node	
	candidates = [ {:path=>[0], :f=>score} ]
	
	# keep track of nodes that are explored.  We will reach a node
	# using the most optimal path first so if we hit the node again
	# later we can discard that path since we already had a better one.
	# Store a row-based array or arrays of followed nodes
	explored = []

	while true
		# Pull off candidate with top score
		node = candidates.shift
		
		# Hit the bottom, found a path
		if node[:path].length == data.length then
			# Print statistics on # nodes explored and total # of nodes in problem
			puts "#{followed} of #{(data.length * (data.length+1))/2} explored"
			return node[:path]
		end
		
		# Row of this node is path_length - 1
		row = node[:path].length-1
		explored[row] = [] if explored[row] == nil
		
		# Skip processing this node if we're already explored it before
		# since we know any subsequent path here has a lower score
		column = node[:path].last
		next if explored[row].include? column
		
		# Remember this node as explored
		explored[row].push column
		followed += 1
	
		# Process left and right directions below current node
		(0..1).each do |n|
			child_idx = column + n
			# Create child's path and score values
			child_path = Array.new(node[:path]).push(child_idx)
			score = yield child_path,data
			# Create child object
			child = {:path=>child_path, :f=>score}
			# Sorted insert in candidates list based on :f value 
			# Highest f value goes at head of list
			sorted_insert(candidates, child) { |val,e| val[:f] >= e[:f] }
		end
	end
end


# Convert a string input into a data array
def get_data_from_string( inp )
	data = []
	inp.each_line do |line|
		# Split by space, convert strings to ints
		row = line.chomp.split.collect { |e| e.to_i }
		data.push( row ) if row.length > 0
	end
	return data
end

# Convert a file input into a data array
def get_data_from_file( file )
	data = []
	File.open(file, "r") do |infile|
		while (line = infile.gets)
			# Split by space, convert strings to ints
			row = line.chomp.split.collect { |e| e.to_i }
			data.push( row ) if row.length > 0
		end
  	end
	return data
end


# Find the sum of the given path
def path_sum (path, data)
	path.inject_with_index(0) { |acc, e, i| acc + data[i][e] }
end




######################
# Problem 18 - 15 rows
p18 = get_data_from_string <<-eos
75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23
eos

answer = max_path( p18 ) { |path,data| (data.length-path.length) * 99 + path_sum(path,data) }
puts path_sum(answer,p18)


#######################
# Problem 67 - 100 rows
p67 = get_data_from_file 'triangle.txt'
answer = max_path( p67 ) { |path,data| (data.length-path.length) * 99 + path_sum(path,data) }
puts path_sum(answer,p67)


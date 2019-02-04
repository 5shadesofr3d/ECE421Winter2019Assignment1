require './SMatrix'

# Debugging stuff ... will remove later

def add
	s = SMatrix.new([
		[0, 2, 0],
		[0, 5, 0],
		[0, 8, 0]
	])
	m = SMatrix.new([
		[0, 2, 0],
		[0, 5, 0],
		[0, 8, 0]
	])

	a = s + m

	print "add ---"
	puts
	print s.to_s
	puts

	print m.to_s
	puts

	print a.to_s
	puts
end

def subtract
	s = SMatrix.new([
		[0, 2, 0],
		[0, 5, 0],
		[0, 8, 0]
	])
	m = SMatrix.new([
		[0, 2, 0],
		[0, 5, 0],
		[0, 8, 0]
	])

	a = s - m

	print "subtract ---"
	puts
	print s.to_s
	puts

	print m.to_s
	puts

	print a.to_s
	puts
end


def multiply
	s = SMatrix.new([
		[0, 3, 0],
		[0, 6, 0],
		[0, 9, 0]
	])
	m = 3

	a = s * m

	print "multiply ---"
	puts
	print s.to_s
	puts

	print m.to_s
	puts

	print a.to_s
	puts
end

def divide
	s = SMatrix.new([
		[0, 3, 0],
		[0, 6, 0],
		[0, 9, 0]
	])
	m = 3

	a = s / m

	print "divide ---"
	puts
	print s.to_s
	puts

	print m.to_s
	puts

	print a.to_s
	puts
end

add
subtract
multiply
divide

# s[0, 0] = 9

# i = IdentityMatrix.new(3)

# z = ZeroMatrix.new(3, 3)

# d = DiagonalMatrix.new(3, 3, 2, 5, 7)


# print i.to_s
# puts

# print z.to_s
# puts

# print d.to_s
# puts

# f = StorageFactory.new
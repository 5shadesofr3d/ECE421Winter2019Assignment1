require './SMatrix'

# Debugging stuff ... will remove later

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
# s[0, 0] = 9

# i = IdentityMatrix.new(3)

# z = ZeroMatrix.new(3, 3)

# d = DiagonalMatrix.new(3, 3, 2, 5, 7)

print a.to_s
puts

# print i.to_s
# puts

# print z.to_s
# puts

# print d.to_s
# puts

# f = StorageFactory.new
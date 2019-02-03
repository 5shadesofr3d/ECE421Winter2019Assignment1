require './SMatrix'
require './factory/StorageFactory'

# Debugging stuff ... will remove later

s = SMatrix.new(3, 3,
	[1, 2, 3],
	[4, 5, 6],
	[7, 8, 9]
)
s[0, 0] = 10

i = IdentityMatrix.new(3)

z = ZeroMatrix.new(3, 3)

d = DiagonalMatrix.new(3, 3, 2, 5, 7)

print s.to_s
puts

print i.to_s
puts

print z.to_s
puts

print d.to_s
puts

f = StorageFactory.new
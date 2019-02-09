require './SMatrix'
require 'matrix'

# Debugging stuff ... will remove later

def add
	s = SMatrix.new(NMatrix[[0, 2, 0], [0, 5, 0], [0, 8, 0]], :yale)
	m = SMatrix.new(NMatrix[[0, 2, 0], [0, 5, 0], [0, 8, 0]], :yale)
	# s = NMatrix.new([3, 3], stype: :list)
	# m = s.clone

	a = s + m

	print "add ---"
	puts
	print s.to_s
	puts

	print m.to_s
	puts

	print a.to_s
	puts

	a
end

def subtract
	s = SMatrix.new(Matrix[
		[0, 2, 0],
		[0, 5, 0],
		[0, 8, 0]
	], :dok)

	m = SMatrix.new(Matrix[
		[0, 2, 0],
		[0, 5, 0],
		[0, 8, 0]
	], :lil)

	a = s - m

	print "subtract ---"
	puts
	print s.to_s
	puts

	print m.to_s
	puts

	print a.to_s
	puts

	a
end


def multiply
	s = SMatrix.new(Matrix[
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

	a
end

def divide
	s = SMatrix.new(Matrix[
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

	a
end

a = add
subtract
multiply
divide

print "As Matrix: \n\t#{a.to_matrix.to_s}\n"
print "As NMatrix: \n\t#{a.to_nmatrix.to_s}\n"
print "As Yale: \n#{a.to_yale.to_s}\n"
print "As Dok: \n#{a.to_dok.to_s}\n"
print "As Lil: \n#{a.to_lil.to_s}\n"
print "As float: \n#{a.to_f.to_s}\n"

nzv = []
a.each_non_zero do |value|
	nzv << value
end
print "Non zero values: \n\t#{nzv}\n"

diag = []
a.each_diagonal_element do |value|
	diag << value
end
print "diagonal values: \n\t#{diag}\n"

print "sparsity:\n\t#{a.sparsity}\n"

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
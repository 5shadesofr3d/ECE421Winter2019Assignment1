require './SMatrix'
require 'matrix'

# Debugging stuff ... will remove later

def add
	s = SMatrix.new(NMatrix[[0, 2, 0], [0, 5, 0], [0, 8, 0]], :yale)
	m = SMatrix.new(NMatrix[[0, 2, 0], [0, 5, 0], [0, 8, 0]], :dok)
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

def dot
	a = SMatrix.new(Matrix[
		[0, 3, 0],
		[0, 6, 0],
		[0, 9, 0]
	])
	i = SMatrix.I(3)

	c = i % a

	print "dot ---"
	puts
	print a.to_s
	puts

	print i.to_s
	puts

	print c.to_s
	puts

	c
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
dot
divide

print "As Matrix: \n\t#{a.to_matrix.to_s}\n"
print "As NMatrix: \n\t#{a.to_nmatrix.to_s}\n"
print "As Yale: \n#{a.to_yale.to_s}\n"
print "As Dok: \n#{a.to_dok.to_s}\n"
print "As Lil: \n#{a.to_lil.to_s}\n"
print "As float: \n#{a.to_f.to_s}\n"
print "As transpose:\n#{a.t.to_s}\n"

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

print "lower values: \n\t#{a.lower_triangle}\n"

print "upper values: \n\t#{a.upper_triangle}\n"

print "sparsity:\n\t#{a.sparsity}\n"

print "partition:\n#{a.partition([1, a.rows], [1, a.columns])}\n"

print "tridiagonal:\n\t#{a.tridiagonal?}\n"

print "zeros:\n#{SMatrix.zero(5).to_s}\n"

print "identity:\n#{SMatrix.I(5).to_s}\n"

print "random:\n#{SMatrix.random(5).to_s}\n"

testrand = SMatrix.random(30, 30)

for i in 0..29 do
	for j in 0..29 do
		print "#{testrand[i, j]}\n"
		# check that the value is an integer which is valid
		# NOTE: will complex numbers be a factor in the future?
		#assert(@rand[i, j].is_a? Integer) || assert(@rand[i, j].is_a? Numeric)
	end
end


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
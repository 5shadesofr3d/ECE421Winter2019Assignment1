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

a = SMatrix.random(3).to_i.to_yale
print "matrix_a:\n#{a.to_s}\n"
print "multiply:\n#{(a % a).to_s}\n"
print "square:\n#{(a ^ 0).to_s}\n"

sMatrix1 = SMatrix.new(Matrix[
    [3, 0, -2],
    [2, 0, -2],
    [0, 1, 1]
], :yale)
sMatrix2 = sMatrix1.to_dok
sMatrix3 = sMatrix1.to_lil

rMatrix1 = sMatrix1.power(-1)
rMatrix2 = sMatrix2.power(-2)
rMatrix3 = sMatrix3.power(-3)
dMatrix3 = ~sMatrix3 % ~sMatrix3 % ~sMatrix3

print "inv:\n#{(rMatrix3).to_s}\n"
print "inv pwr:\n#{dMatrix3.to_s}\n"
print "inv pwr:\n#{dMatrix3==rMatrix3}\n"

# s[0, 0] = 9

# i = IdentityMatrix.new(3)

# z = ZeroMatrix.new(3, 3)

# d = DiagonalMatrix.new(3, 3, 2, 5, 7)


# print i.to_s
# puts
#
# print z.to_s
# puts

# print d.to_s
# puts

# f = StorageFactory.new

s = SMatrix.new(NMatrix[[1, 2, 3], [0, 5, 0], [0, 8, 0]], :yale)
m = SMatrix.new(NMatrix[[1, 2, 3], [0, 5, 0], [0, 8, 0]], :lil)
p = SMatrix.new(NMatrix[[1, 2, 0], [0, 5, 0], [0, 8, 3]], :dok)

# puts "Total Sum Test:"
# puts p.total_sum
# puts m.total_sum
# puts s.total_sum

# puts "Row Sum Test:"
# puts s.row_sum(2)
# puts m.row_sum(2)
# puts p.row_sum(2)

# puts "Col Sum Test:"
# puts s.col_sum(1)
# puts m.col_sum(1)
# puts p.col_sum(0)

testFloat = SMatrix.random(3, 3).to_lil

print "Matrix type: #{testFloat.type}\n"
print "Matrix is type? Dok: #{testFloat.type.is_a? Dok}\n"
print "\tLil: #{testFloat.type == Lil}\n"
print "\tYale: #{testFloat.type.is_a? Yale}\n"
print "Float Matrix:#{testFloat.to_s}\n"
for i in 0..2 do
	for j in 0..2 do
		print "Is a float? -> [#{i}, #{j}]: #{testFloat[i, j]} #{testFloat[i, j].is_a? Float}\n"
	end 
end
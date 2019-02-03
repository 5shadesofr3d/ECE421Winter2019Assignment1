require 'nmatrix'
require 'test/unit'

# SMatrix = Standard Matrix ?
# do we really need it since we are only concerned about sparse matrices?
# Also name can be confused with sparse matrix...
class SMatrix
	include Test::Unit::Assertions

	def initialize(rows, columns, *matrix)
		# constructs a standard matrix

		# pre
		assert rows.is_a? Integer and columns.is_a? Integer
		assert rows >= 0 and columns >= 0
		
		# post
		@rows = rows
		@columns = columns
		@matrix = NMatrix[*matrix]

		for i in 0 .. (rows - 1)
			for j in 0 .. (columns - 1)
				# puts "#{i}#{j}"
				assert_same(matrix[i][j], self[i, j])
			end
		end

	end

	def [](i, j)
		# returns the matrix index at position i, j
		
		# pre
		assert i.is_a? Integer and j.is_a? Integer
		assert 0 <= i and i < @rows
		assert 0 <= j and j < @columns

		# post
		return @matrix[i, j]
	end

	def []=(i, j, value)
		# returns the matrix index at position i, j
		
		# pre
		assert i.is_a? Integer and j.is_a? Integer
		assert 0 <= i and i < @rows
		assert 0 <= j and j < @columns

		# post
		@matrix[i, j] = value
	end

	def to_s
		# converts the matrix into a string

		# pre

		# post
		return @matrix.to_a.to_s
	end

	def identity?
		# returns true if the matrix is an identity matrix

		# pre
		is_identity = true

		# post
		for i in 0 .. (@rows - 1)
			for j in 0 .. (@columns - 1)
				return false if (i == j and self[i, j] != 1) or (i != j and self[i, j] != 0)
			end
		end

		return is_identity
	end

	def zero?
		# returns true if the matrix is a zero matrix
		
		# pre
		is_identity = true

		# post
		for i in 0 .. (@rows - 1)
			for j in 0 .. (@columns - 1)
				return false if self[i, j] != 0
			end
		end

		return is_identity
	end

	@rows
	@columns
	@matrix

end

class IdentityMatrix < SMatrix

	def initialize(size)
		# constructs an identity matrix

		# pre
		assert size.is_a? Integer
		@rows = @columns = size
		@matrix = NMatrix.eye(size)

		# post
		assert self.identity?
	end

end

class ZeroMatrix < SMatrix

	def initialize(rows, columns)
		# constructs a zero matrix

		# pre
		assert rows.is_a? Integer and columns.is_a? Integer
		@rows = rows
		@columns = columns
		@matrix = NMatrix.zeros([rows, columns])

		# post
		assert self.zero?
	end

end

s = SMatrix.new(3, 3,
	[1, 2, 3],
	[4, 5, 6],
	[7, 8, 9]
)

i = IdentityMatrix.new(3)

z = ZeroMatrix.new(3, 3)

print s.to_s
puts

print i.to_s
puts

print z.to_s
puts
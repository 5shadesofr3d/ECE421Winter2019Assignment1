require 'nmatrix'
require 'test/unit'

# SMatrix = Standard Matrix ?
# do we really need it since we are only concerned about sparse matrices?
# Also name can be confused with sparse matrix...
class SMatrix
	include Test::Unit::Assertions

	def initialize(rows, columns, *matrix)
		# pre
		assert rows.is_a? Integer
		assert columns.is_a? Integer
		
		# post
		@rows = rows
		@columns = columns
		@matrix = NMatrix[matrix]
		for i in 0 .. (rows - 1)
			for j in 0 .. (columns - 1)
				puts "#{i}#{j}"
				assert_same(matrix[i][j], self[i, j])
			end
		end
	end

	def [](i, j)
		# returns the matrix index at position i, j
		
		# pre
		assert i.is_a? Integer
		assert j.is_a? Integer
		assert 0 <= i && i < @rows
		assert 0 <= j && j < @columns

		# post
		return @matrix[i, j]
	end

	@rows
	@columns
	@matrix

end

# class IdentityMatrix < SMatrix

# 	def initialize(rows, columns)
# 		super(rows, columns)
# 		assert @matrix.identity?
# 	end

# end

s = SMatrix.new(3, 3,
	[1, 2, 3],
	[4, 5, 6],
	[7, 8, 9]
)
puts s[0, 0]
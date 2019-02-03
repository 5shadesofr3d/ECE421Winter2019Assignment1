require 'test/unit'

class SMatrix
	include Test::Unit::Assertions

	@row
	@column

	def initialize(row, column)
		# pre
		assert row.is_a? Integer
		assert column.is_a? Integer
		
		# post
		@row = row
		@column = column

	end

	def [](row, column)
		# returns the matrix index at position row, column
		
		# pre
		assert row.is_a? Integer
		assert column.is_a? Integer
		assert 0 <= row && row < @row
		assert 0 <= column && column < @column

		# post

	end

end

s = SMatrix.new(10, 10)
puts s[0, 0]
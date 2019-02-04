class Dok

public
	def [](i, j)
		# returns the matrix index at position i, j
		assert valid?

		# pre
		assert i.is_a? Integer and j.is_a? Integer
		assert 0 <= i and i < @rows
		assert 0 <= j and j < @columns

		# post
		
		assert valid?

		@hash[i, j]
	end

	def []=(i, j, value)
		# returns the matrix index at position i, j
		assert valid?

		# pre
		assert i.is_a? Integer and j.is_a? Integer
		assert 0 <= i and i < @rows
		assert 0 <= j and j < @columns
		assert value.is_a? Numeric

		# post
		@hash[i, j] = value

		assert valid?
	end

private
	@hash = Hash.new

end
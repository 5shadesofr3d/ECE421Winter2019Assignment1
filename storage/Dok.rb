require './storage/SparseStorage'

class Dok < SparseStorage

public
	def initialize(rows, columns)
		@hash = Hash.new

		super(rows, columns)

		assert valid?
	end

	def valid?
		super and @hash.is_a? Hash
	end

	def [](i, j)
		# returns the matrix index at position i, j

		# pre
		assert i.is_a? Integer and j.is_a? Integer
		assert 0 <= i and i < @rows
		assert 0 <= j and j < @columns

		# post
		0 if not @hash.key? [i, j]
		@hash[[i, j]] # otherwise
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
		if value == 0 and @hash.key? [i, j]
			@hash.delete [i, j]
		else
			@hash[[i, j]] = value
		end

		assert valid?
	end

	def each
		for i in 0 .. @rows - 1
			for j in 0 .. @columns - 1
				yield self[i, j]
			end
		end
	end

private
	@hash

end
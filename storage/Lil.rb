class Lil < SparseStorage
	public
		def initialize(rows, columns)
			assert rows.is_a? Integer
			assert columns.is_a? Integer
			assert rows >= 0
			assert columns >= 0

			#TODO: Implement

			assert valid?
		end

		def valid?
			#TODO: Implement
		end

		def [](i, j)
			# returns the matrix index at position i, j

			# pre
			assert i.is_a? Integer and j.is_a? Integer
			assert 0 <= i and i < @rows
			assert 0 <= j and j < @columns

			#TODO: Implement

			# post
			assert valid?

		end

		def []=(i, j, value)
			# returns the matrix index at position i, j
			assert valid?

			# pre
			assert i.is_a? Integer and j.is_a? Integer
			assert 0 <= i and i < @rows
			assert 0 <= j and j < @columns
			assert value.is_a? Numeric

			#TODO: Implement

			# post
			assert valid?
		end

	private
		@hash
end

class Lil < NStorage
	# --- Invariants ---
	# @self.is_a? SparseStorage
	# @self.rows >= 0
	# @self.cols >= 0
	# ------------------
	public
		def initialize(rows, columns)
			assert rows.is_a? Integer
			assert columns.is_a? Integer
			assert rows >= 0
			assert columns >= 0

			#TODO: Implement

			assert valid?
		end

		def get_matrix
			return @storage
		end

		def set_matrix(mat)
			@storage = mat
		end

		def valid?
			super
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

		def each
			# returning the enumerator for each of the elements in the yield matrix

			#pre
			assert valid?

			# use the NMatrix each value. It has its own way of going through different
			# storage types
			# @matrix.each_with_indices do |element|
			# => yield element
			# end

			#post
			assert valid?
		end
end

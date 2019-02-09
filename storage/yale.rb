require_relative 'nstorage'

class Yale < NStorage
	# --- Invariants ---
	# @self.is_a? SparseStorage
	# @self.rows >= 0
	# @self.cols >= 0
	# ------------------
	public
		def initialize(rows, columns)
			#return nil unless rows.is_a? Integer and columns.is_a? Integer
			#assert columns.is_a? Integer
			#assert rows >= 0
			#assert columns >= 0

			super(rows,columns)
			#TODO: Implement

			#assert valid?
		end

		def get_matrix
			super
		end

		def set_matrix(mat)
			super
		end

		def valid?
			super
		end

		def [](i, j)
			super
		end

		def []=(i, j, value)
			super
		end

		def each
			# returning the enumerator for each of the elements in the yield matrix

			#pre
			super

			# use the NMatrix each value. It has its own way of going through different
			# storage types
			# @matrix.each_with_indices do |element|
			# => yield element
			# end

			#post
		end
	end

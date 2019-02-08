class SparseStorage
	include Test::Unit::Assertions

public
	def initialize(rows, columns)
		# constructs a standard matrix

		# pre
		assert rows.is_a? Integer and columns.is_a? Integer
		assert rows >= 0 and columns >= 0

		# post
		@rows = rows
		@columns = columns

		assert valid?
	end

	def get_matrix
		raise AbstractClassError
	end

	def set_matrix(mat)
		raise AbstractClassError
	end

	def [](i, j)
		raise AbstractClassError
	end

	def []=(i, j, value)
		raise AbstractClassError
	end

	def valid?
		# returns true if class invariants hold
		return false unless @rows.is_a? Integer and @columns.is_a? Integer
		return false unless @rows >= 0 and @columns >= 0
		return false unless sparsity > 0.5

		return true
	end

	def sparsity
		# returns the sparsity of the storage

		# pre
		zero_values = 0.0
		total_values = @rows * @columns

		for i in 0 .. @rows - 1
			for j in 0 .. @columns - 1
				zero_values += 1 if self[i, j] == 0
			end
		end

		# post
		assert zero_values >= 0
		zero_values / total_values
	end

	def each_index
		# provides index iterators
		assert valid?

		for i in 0 .. @rows - 1
			for j in 0 .. @columns - 1
				yield i, j
			end
		end

		assert valid?
	end

	def each
		# iterates through each matrix element
		assert valid?

		for i in 0 .. @rows - 1
			for j in 0 .. @columns - 1
				yield self[i, j]
			end
		end

		assert valid?
	end


	def to_a
		# converts storage to an array of rows format
		assert valid?

		arr = []
		for i in 0 .. @rows - 1
			row = []
			for j in 0 .. @columns - 1
				row << self[i, j]
			end
			arr << row
		end

		assert valid?

		arr
	end

	# TODO: Is this how we should deal with abstract methods? Or should we leave them out?
	def det
		raise NotImplementedError
	end

	def invert
		raise NotImplementedError
	end

	def complex_conjugate
		raise NotImplementedError
	end

	attr_reader :rows, :columns

end

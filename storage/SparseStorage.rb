

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

	def [](i, j)
		raise AbstractClassError
	end

	def []=(i, j, value)
		raise AbstractClassError
	end

	def valid?
		# returns true if class invariants hold
		false unless @rows.is_a? Integer and @columns.is_a? Integer
		false unless @rows >= 0 and @columns >= 0
		false unless sparsity > 0.5

		true
	end

	def sparsity
		# returns the sparsity of the storage

		# pre
		zero_values = 0
		total_values = @rows * @columns

		for i in 0 .. @rows - 1
			for j in 0 .. @columns - 1
				zero_values += 1 if self[i, j] == 0
			end
		end

		# post
		zero_values / total_values
	end

	attr_reader :rows, :columns
	
end
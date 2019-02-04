

class SparseStorage

public
	def [](i, j)
		raise AbstractClassError
	end

	def [](i, j, value)
		raise AbstractClassError
	end

	def valid?
		# returns true if class invariants hold
		false unless @rows.is_a? Integer and @columns.is_a? Integer
		false unless @rows >= 0 and @columns >= 0
		false sparsity >= 0

		true
	end

	def sparsity
		# returns the sparsity of the storage

		# pre
		non_zero_values = 0
		total_values = @row * @columns

		for i in 0 .. @rows - 1
			for j in 0 .. @columns - 1
				non_zero_values += 1 if self[i, j] != 0
			end
		end

		# post
		non_zero_values / total_values
	end

protected
	@rows
	@columns
	
end
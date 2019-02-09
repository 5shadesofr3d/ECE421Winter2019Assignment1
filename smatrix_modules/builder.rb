module Builder
	def self.eye(size)
		#pre
		assert size.is_a? Integer
		assert size > 0
		#TODO: Implementation

		#post
		#assert result.identity?
		assert valid?
	end

	def self.zero(rows, cols)
		#pre
		assert rows.is_a? Integer
		assert cols.is_a? Integer
		assert rows > 0
		assert cols > 0
		#TODO: Implementation

		#post
		#assert result.identity?
		assert valid?
	end

	def self.random(rows, cols)
		#pre
		assert rows.is_a? Integer
		assert cols.is_a? Integer
		assert rows > 0
		assert cols > 0
		#TODO: Implementation

		#post
		#assert result.sparsity <= 0.5
		assert valid?
	end

	def self.tridiagonal(upper, middle, lower, size)
		#pre
		assert size.is_a? Integer
		assert upper.is_a? Matrix
		assert middle.is_a? Matrix
		assert lower.is_a? Matrix
		assert size > 0
		#TODO: Implementation
		#result = ....
		#post
		#assert result.tridiagonal?
		assert valid?
	end
end
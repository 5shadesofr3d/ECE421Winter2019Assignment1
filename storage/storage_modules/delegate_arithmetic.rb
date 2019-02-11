module DelegateArithmetic
	def +(m1)
		assert m1.is_a? SparseStorage

		@storage += m1.storage

		self
	end

	def -(m1)
		assert m1.is_a? SparseStorage

		@storage -= m1.storage

		self
	end

	def *(scalar)
		assert scalar.is_a? Numeric

		@storage *= scalar

		self
	end

	def /(scalar)
		assert scalar != 0
		assert scalar.is_a? Numeric

		@storage /= scalar

		self
	end

	def **(scalar)
		assert scalar.is_a? Numeric

		@storage **= scalar

		self
	end

	def power(pow)
		assert pow.is_a? Integer

		@storage = @storage.pow(pow).cast(dtype: :object)

		self
	end

	def dot(m1)
		assert valid?
		assert m1.is_a? SparseStorage

		@storage.dot(m1.storage)
	end
end

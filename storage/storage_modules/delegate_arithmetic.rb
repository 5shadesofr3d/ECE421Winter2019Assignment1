module DelegateArithmetic
	def +(m1)
		assert @storage.class == m1.storage.class
		
		@storage += m1.storage

		self
	end

	def -(m1)
		assert @storage.class == m1.storage.class

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
		assert @storage.is_a? NMatrix
		@storage.pow(pow)

		self
	end

	def dot(m1)
		@storage.dot(m1.cast(@storage.stype))

		self
	end
end
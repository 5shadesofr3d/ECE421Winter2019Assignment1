module DelegateArithmetic
	def +(m1)
		assert m1.is_a? SparseStorage
		if m1.is_a? Dok or m1.is_a? Lil
			yFactory = YaleFactory.new
			m1 = yFactory.create(m1)
		end

		@storage += m1.storage

		self
	end

	def -(m1)
		assert m1.is_a? SparseStorage
		if m1.is_a? Dok
			yFactory = YaleFactory.new
			m1 = yFactory.create(m1)
		end
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
		assert pow.is_a? Numeric
		@storage.pow(pow)

		self
	end

	def dot(m1)
		assert valid?
		assert m1.is_a? SparseStorage

		@storage.dot(m1)

		assert valid?
		self
	end
end

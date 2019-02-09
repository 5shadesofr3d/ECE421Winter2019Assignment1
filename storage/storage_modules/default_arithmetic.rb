module DefaultArithmetic
	def +(m1)
		assert valid?
		assert m1.is_a? SparseStorage

		self.each_index do |i, j|
			self[i, j] += m1[i, j]
		end

		assert valid?

		self
	end

	def -(m1)
		assert valid?
		assert m1.is_a? SparseStorage

		self.each_index do |i, j|
			self[i, j] -= m1[i, j]
		end

		assert valid?

		self
	end

	def *(scalar)
		assert valid?
		assert scalar.is_a? Numeric

		self.each_index do |i, j|
			self[i, j] *= scalar
		end

		assert valid?

		self
	end

	def /(scalar)
		assert valid?
		assert scalar != 0
		assert scalar.is_a? Numeric

		self.each_index do |i, j|
			self[i, j] /= scalar
		end

		assert valid?

		self
	end

	def **(scalar)
		assert valid?
		assert scalar.is_a? Numeric

		self.each_index do |i, j|
			self[i, j] **= scalar
		end

		assert valid?

		self
	end

	def dot(mat)
		raise NotImplementedError
	end

	def power(pow)
		raise NotImplementedError
	end
end
module DefaultArithmetic
	def +(m1)
		assert valid?
		assert m1.is_a? SparseStorage

		self.each_common_index(m1) do |i, j|
			self[i, j] += m1[i, j]
		end

		assert valid?

		self
	end

	def -(m1)
		assert valid?
		assert m1.is_a? SparseStorage

		self.each_common_index(m1) do |i, j|
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
		assert valid?
		assert self.columns == mat.rows

		result = self.class.new(self.rows, mat.columns)
		result.each_index do |i, j|
			for k in 0 .. self.columns - 1
				result[i, j] += self[i, k] * mat[k, j]
			end
		end
		
		assert valid?

		return result
	end

	def power(pow)
		assert valid?
		assert pow.is_a? Integer

		result = self.clone
		if (pow < 0)
			pow = -pow
			result = result.invert
		end

		while (pow > 1)
			result = result.dot(self)
			pow -= 1
		end

		assert valid?
		return result
	end
end
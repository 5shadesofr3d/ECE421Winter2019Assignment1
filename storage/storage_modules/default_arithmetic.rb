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
		#Note: dot product not defined for DOK data structure,
		# Converting to YALE format then performing the operation
		assert mat.is_a? SparseStorage
		yFactory = YaleFactory.new()
		dFactory = DokFactory.new()
		tempYaleSelf = yFactory.create(self)
		tempYaleArg = yFactory.create(mat)
		result = dFactory.create(tempYaleSelf.dot(tempYaleArg))
		assert result.is_a? Dok
		return result
	end

	def power(pow)
		assert mat.is_a? SparseStorage
		yFactory = YaleFactory.new()
		dFactory = DokFactory.new()
		tempYaleSelf = yFactory.create(self)
		result = dFactory.create(tempYaleSelf.pow(pow))
		assert result.is_a? Dok
		return result
	end
end
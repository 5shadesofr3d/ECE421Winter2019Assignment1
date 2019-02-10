module Arithmetic
	#Generic add for all SMatrix storage types
	def +(mat)
		#pre
		assert valid?
		assert mat.is_a? SMatrix
		assert mat.shape == self.shape

		result = self.clone
		result.storage += mat.storage

		#post
		assert mat.shape == self.shape
		assert @storage.is_a? SparseStorage
		assert valid?
		return result
	end

	#Generic sub for all SMatrix types
	def -(mat)
		#pre
		assert valid?
		assert mat.is_a? SMatrix
		assert mat.shape == self.shape

		result = self.clone
		result.storage -= mat.storage

		#post
		assert mat.shape == self.shape
		assert @storage.is_a? SparseStorage
		assert valid?
		return result
	end

	#Generic divide for all SMatrix types
	def /(scalar)
		#pre
		assert valid?
		assert scalar.is_a? Numeric

		result = self.clone
		result.storage /= scalar

		#post
		assert @storage.is_a? SparseStorage
		assert valid?

		return result
	end

	#Generic exponent for all SMatrix types
	def **(scalar)
		#pre
		assert valid?
		assert scalar.is_a? Numeric

		result = self.clone
		result.storage **= scalar

		#post
		assert @storage.is_a? SparseStorage
		assert valid?

		return result
	end

	#Generic multiply for all SMatrix types
	def *(scalar)
		#pre
		assert valid?
		assert scalar.is_a? Numeric

		result = self.clone
		result.storage *= scalar

		#post
		assert @storage.is_a? SparseStorage
		assert valid?

		return result
	end

	# Note: NMatrix only supports the dot product of the
	# same matrix type.
	def dot(mat)
		#pre
		assert valid?
		assert mat.is_a? SMatrix
		assert mat.rows == @storage.cols #MxN * NxK

		#post
		@storage = @storage.dot(mat)
		assert mat.is_a? SMatrix
		assert valid?
	end

	# Raise matrix to a power
	def power(pow)
		assert valid?
		assert pow.is_a? Integer
		assert @storage.shape[0] == @storage.shape[1]

		@storage.pow(pow)
		assert valid?
	end
end
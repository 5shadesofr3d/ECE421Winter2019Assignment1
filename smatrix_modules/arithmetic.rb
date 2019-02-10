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
		#assert result.storage + result.storage == (2*result.storage) #A+A = 2A
		#assert result.storage == self.clone.storage + mat.storage #A+B = B+A
		#TODO: assert result.storage+ZEROMATRIX == result.storage A+0 = A
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
		#TODO: assert result.storage-result.storage == ZERO matrix A-0 = A
		assert valid?
		return result
	end

	#Generic divide for all SMatrix types
	def /(scalar)
		#pre
		assert valid?
		assert scalar != 0
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

		result = self.clone
		result.storage = @storage.dot(mat)
		#post
		assert mat.is_a? SMatrix
		assert result.storage == mat.storage.dot(@storage) #AB == BA
		#TODO: assert result.storage * result.storage.transpose == EYE A*A^-1 = I
		#TODO: assert @storage*EYE == @storage #AI = A
		#TODO: assert EYE*@storage == @storage #IA = A
		assert valid?
		return result
	end

	# Raise matrix to a power
	def power(pow)
		assert valid?
		assert pow.is_a? Integer
		assert @storage.shape[0] == @storage.shape[1]

		result = self.clone
		result.storage = @storage.pow(pow)

		assert
		assert valid?
		return result
	end
end

module Arithmetic
	#Generic add for all SMatrix storage types
	def +(mat)
		#pre
		assert valid?
		assert mat.is_a? SMatrix
		assert mat.shape == self.shape

		mat_factory = mat.ftype
		mat.store_as(self.ftype) # convert the matrix to the same type as lhs
		result = self.clone
		result.storage += mat.storage
		mat.store_as(mat_factory) # convert the matrix to original type

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

		mat_factory = mat.ftype
		mat.store_as(self.ftype) # convert the matrix to the same type as lhs
		result = self.clone
		result.storage -= mat.storage
		mat.store_as(mat_factory) # convert the matrix to original type

		#post
		assert mat.shape == self.shape
		assert @storage.is_a? SparseStorage

		#TODO: assert result.storage-result.storage == ZERO matrix A-0 = A
		assert valid?
		return result
	end

	def -@
		assert valid?

		result = SMatrix.zero(self.rows, self.columns)
		result.store_as(self.ftype)
		result.storage -= self.storage

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
		assert valid?, "class invariants failed [begin]"
		assert (mat.is_a? SMatrix), "rhs is not a SMatrix"
		assert self.rows == mat.columns

		mat_factory = mat.ftype
		mat.store_as(self.ftype)
		result = SMatrix.new(self.storage.dot(mat.storage), self.ftype)
		mat.store_as(mat_factory)

		#post
		assert (mat.is_a? SMatrix), "rhs is no longer an SMatrix"
		#TODO: assert result.storage * result.storage.transpose == EYE A*A^-1 = I
		#TODO: assert @storage*EYE == @storage #AI = A
		#TODO: assert EYE*@storage == @storage #IA = A
		assert valid?, "class invariants failed [end]"
		return result
	end

	def %(mat)
		dot(mat)
	end

	# Raise matrix to a power
	def power(pow)
		assert valid?
		assert pow.is_a? Integer
		assert @storage.shape[0] == @storage.shape[1]

		result = self.clone
		result.storage = @storage.power(pow)

		assert
		assert valid?
		return result
	end
end

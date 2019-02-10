module Operations
	def sparsity
		assert valid?
		@storage.sparsity
	end

	def trace
		#pre
		assert valid?
		assert @storage.rows == @storage.cols
		result = @storage.trace
		assert valid?
		result
	end

	def rank
		assert valid?
		result = @storage.rank
		assert valid?
		result
	end

	def row_sum(rowNum)
		assert valid?
		assert rowNum.is_a? Integer
		assert rowNum >= 0
		assert rowNum < @storage.rows
		result = @storage.row_sum
		assert valid?
		result
	end

	def col_sum(colNum)
		assert valid?
		assert colNum.is_a? Integer
		assert colNum >= 0
		assert colNum < @storage.cols
		result = @storage.col_sum
		assert valid?
		result
	end

	def total_sum
		assert valid?
		result = @storage.total_sum
		assert valid?
		result
	end

	def transpose
		assert valid?
		#pre
		#matrix to be transposed has been initialized
		result = @storage.transpose
		#post
		assert valid?
		assert result.shape[0] == @storage.shape[1]
		assert result.shape[1] == @storage.shape[0]
		result
	end

	# TODO:
	# NMatrix only implements this for dense matrices
	# so we must convert types then calculate then convert back.
	# Inefficient but necessary for now.
	def inverse
		assert valid?

		#pre
		assert @storage.det != 0 #det != 0
		assert @storage.shape[0] == @storage.shape[1] #square only

		#post
		@storage = @storage.invert
		assert @storage.shape[0] == @storage.shape[1]
		assert valid?
	end

	#TODO: NMatrix only implements this for 2D, square, dense, floating type matrices.
  # Should we discard this feature?
	def hessenberg
		assert valid?
		assert @storage.rows == @storage.cols

		assert valid?
	end


  #TODO: What is this to do?
	def diagonal
		assert valid?
		#pre

		#TODO: Implement

		#post
		assert valid?
	end

	def determinant
		assert valid?

		#pre
		assert @storage.shape[0] == @storage.shape[1] #square

		#post
		return @storage.det
	end

	# in a SMatrix.
	def cholesky
		yFactory = YaleFactory.new
		# Pre
		assert valid?
		assert @storage.symmetric? or @storage.hermitian?
		result = @storage.cholesky_factorization
		# Post
		# We need to wrap returned matrices as an SMatrix
		return [yFactory.create(result[0]),yFactory.create(result[1])]

	end

	# TODO: Implement this, this has only been implemented for Dense
	# matrices in SMatrix so conversions MUST be done.
	def lu_factorization
		yFactory = YaleFactory.new
		#pre
		assert valid?
		assert @storage.shape[0] == @storage.shape[1]
		# TODO: Needs to be a 2D matrix
		result = @storage.lu_factorization

		#post
		# We need to wrap returned matrices as an SMatrix
		return [yFactory.create(result[0]),yFactory.create(result[1])]
	end

	def conjugate
		# Pre-conditions
		yFactory = YaleFactory.new
		assert valid?

		# Post
		# We need to wrap returned matrix as an SMatrix
		return yFactory.create(@storage.complex_conjugate)
	end
end
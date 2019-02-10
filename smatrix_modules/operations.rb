module Operations
	def sparsity
		assert valid?
		@storage.sparsity
	end

	def trace
		#pre
		assert valid?
		assert @storage.rows == @storage.cols
		@storage.trace
		#TODO: Implement
		assert valid?
	end

	def rank
		assert valid?
		@storage.rank
		assert valid?
	end

	def row_sum(rowNum)
		assert valid?
		assert rowNum.is_a? Integer
		assert rowNum >= 0
		assert rowNum < @storage.rows
		@storage.row_sum
		assert valid?
	end

	def col_sum(colNum)
		assert valid?
		assert colNum.is_a? Integer
		assert colNum >= 0
		assert colNum < @storage.cols
		@storage.col_sum
		assert valid?
	end

	def total_sum
		assert valid?
		@storage.total_sum
		assert valid?
	end

	def transpose
		assert valid?
		#pre
		#matrix to be transposed has been initialized
		#TODO: Implement
		#post
		#@storage = @storage transposed
		assert valid?
	end

	# TODO:
	# NMatrix only implements this for dense matrices
	# so we must convert types then calculate then convert back.
	# Inefficient but necessary for now.
	def inverse
		assert valid?

		#pre
		assert @storage.shape[0] == @storage.shape[1] #square only

		#post
		@storage = @storage.invert
		assert @storage.shape[0] == @storage.shape[1]
		assert valid?
	end

	#TODO: NMatrix only implements this for 2D, square, dense, floating type matrices.
	def hessenberg
		assert valid?
		assert @storage.rows == @storage.cols

		assert valid?
	end

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

	# TODO: Returns an upper and lower NMatrix which needs to be wrapped
	# in a SMatrix.
	def cholesky
		assert valid?

		# Pre
		assert @storage.symmetric?
		# assert @storage.hermatian?

		# Post
		return @storage.cholesky_factorization

	end

	# TODO: Implement this, this has only been implemented for Dense
	# matrices in SMatrix so conversions MUST be done. Additionally,
	# lu_decomposition is not implemented. The contract must be changed
	# to implement lu_factorization
	def lu_factorization
		assert valid?

		#pre
		# TODO: Needs to be a 2D matrix

		@storage = @storage.lu_factorization

		#post
		assert valid?

	end

	def conjugate
		# Pre-conditions
		assert valid?

		# Post
		@storage.complex_conjugate

		assert valid?
	end
end
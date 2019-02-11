module Operations
	def sparsity
		assert valid?
		@storage.sparsity
	end

	def trace
		#pre
		assert valid?
		assert @storage.rows == @storage.columns
		result = @storage.trace
		assert valid?
		result
	end

	def rank
		assert valid?

		return self.to_matrix.rank
	end

	def row_sum(rowNum)
		assert valid?
		assert rowNum.is_a? Integer
		assert rowNum >= 0
		assert rowNum < @storage.rows
		result = @storage.row_sum(rowNum)
		assert valid?
		result
	end

	def col_sum(colNum)
		assert valid?
		assert colNum.is_a? Integer
		assert colNum >= 0
		assert colNum < @storage.columns
		result = @storage.col_sum(colNum)
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
		result = SMatrix.new(@storage.transpose, self.ftype)

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
		assert self.determinant != 0
		assert square?
		assert regular?, "Not a regular matrix (thus not invertible)."
		#post
		store_as(self.ftype, self.to_matrix.inverse)

		assert square?
		assert valid?
	end

	def determinant
		assert valid?

		#pre
		assert square? #square

		#post
		return self.to_matrix.determinant
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

	def lu_factorization
		# matrices in SMatrix so conversions MUST be done.
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

	def partition(rows = [0, self.rows], columns = [0, self.columns])
		# returns a partion of the current matrix
		assert valid?
		assert (rows.is_a? Array) and (columns.is_a? Array)
		assert (rows[0] < rows[1]) and (columns[0] < columns[1])
		assert (rows[1] <= self.rows) and (columns[1] <= self.columns)

		row_count = rows[1] - rows[0]
		column_count = columns[1] - columns[0]

		matrix = Matrix.zero(row_count, column_count)
		part = SMatrix.new(matrix)

		part.each_index do |i, j|
			part[i, j] = self[i + rows[0], j + columns[0]]
		end

		part
	end

	def ~
		assert valid?
		result = self.clone
		result.inverse
		assert valid?

		return result
	end

	def t
		assert valid?

		return self.transpose
	end
end

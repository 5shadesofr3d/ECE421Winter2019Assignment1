module DelegateOperations
	def trace
		assert valid?
		assert @rows == @columns
		@storage.trace
	end

	def rank
		assert valid?
		@storage.rank
	end

	def det
		assert valid?
		@storage.det
	end

	def complex_conjugate
		assert valid?
		@storage.complex_conjugate
	end

	def cholesky_factorization
		assert valid?
		@storage.factorize_cholesky
	end

	def col_sum(col_num)
		assert valid?
		assert col_num >= 0
		assert col_num < @storage.cols
		@storage.sum(0)[col_num]
	end

	def row_sum(row_num)
		assert valid?
		assert row_num >= 0
		assert row_num < @storage.rows
		@storage.sum(1)[row_num]
	end

	def total_sum
		sum = 0
		@storage.each do |x|
			sum += x
		end
		return sum
	end
end
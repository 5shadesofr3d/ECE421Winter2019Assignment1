module DelegateOperations
	def trace
		assert valid?
		assert @rows == @columns
		@storage.trace
	end

	def transpose
		assert valid?
		@storage.transpose
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

	def total_sum
		sum = 0
		@storage.each do |x|
			sum += x
		end
		return sum
	end
end
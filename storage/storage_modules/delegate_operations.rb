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
end
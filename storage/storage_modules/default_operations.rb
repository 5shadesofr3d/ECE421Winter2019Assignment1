module DefaultOperations
	# TODO: Is this how we should deal with abstract methods? Or should we leave them out?
	def det
		raise NotImplementedError
	end

	def invert
		raise NotImplementedError
	end

	def complex_conjugate
		raise NotImplementedError
	end

	def lu_factorization
		raise NotImplementedError
	end

	def cholesky_factorization
		raise NotImplementedError
	end

	def hermitian?
		raise NotImplementedError
	end
end
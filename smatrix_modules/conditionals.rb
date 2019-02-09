module Conditionals
	def sparse?
		assert valid?

		@storage.sparsity > 0.5
	end

	def identity?
		# returns true if the matrix is an identity matrix
		assert valid?
		# pre
		return false if @storage.cols != @storage.rows

		# post
		@storage.each_index do |i, j|
			return false if (i == j and self[i, j] != 1) or (i != j and self[i, j] != 0)
		end

		assert valid?
		true
	end

	def zero?
		# returns true if the matrix is a zero matrix
		assert valid?
		# pre

		# post

		@storage.each_index do |i, j|
			return false if self[i, j] != 0
		end

		assert valid?
		true
	end

	def diagonal?
		# returns true if the matrix is a diagonal matrix
		assert valid?

		self.to_matrix.diagonal?
	end

	def tridiagonal?
		#pre
		assert valid?
		#TODO: Implement
		#post
		assert valid?
	end

	def symmetric?
		assert valid?
		#TODO: Implement
		assert valid?
	end

	def hermitian?
		#Pre
		assert valid?

		# Post
		@storage.hermitian?
	end

	def normal?(matrix)
		assert valid?

		# Pre-conditions
		# assert @storage.type == NMatrix?
		# assert @matrix.type == NMatrix?

		# Post
		# (@storage.conjugate.transpose * @matrix) ==
		# (@storage * @matrix.conjugate.transpose)

		assert valid?
	end
end
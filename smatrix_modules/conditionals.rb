module Conditionals
	def sparse?
		assert valid?

		@storage.sparsity > 0.5
	end

	def identity?
		# returns true if the matrix is an identity matrix
		assert valid?
		# pre
		return false unless square?

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

		upper = partition([0, self.rows - 1], [1, self.columns])
		lower = partition([1, self.rows], [0, self.columns - 1])

		return ((upper.upper_triangle.all? {|value| value == 0}) and (lower.lower_triangle.all? {|value| value == 0}))
	end

	def symmetric?
		assert valid?
		assert square?

		self.each_index do |i, j|
			return false unless self[i, j] == self[j, i]
		end

		assert valid?

		true
	end

	def hermitian?
		#Pre
		assert valid?

		# Post
		self.to_matrix.hermitian?
	end

	def normal?
		assert valid?

		self.to_matrix.normal?
	end

	def orthogonal?
		assert valid?

		self.to_matrix.orthogonal?
	end

	def permutation?
		assert valid?

		self.to_matrix.permutation?
	end

	def singular?
		assert valid?

		self.to_matrix.singular?
	end

	def regular?
		assert valid?

		self.to_matrix.regular?
	end

	def real?
		assert valid?

		self.to_matrix.real?
	end

	def square?
		assert valid?

		self.rows == self.columns
	end

	def unitary?
		assert valid?

		self.to_matrix.unitary?
	end

	def upper_triangular?
		assert valid?

		self.to_matrix.upper_triangular?
	end

	def lower_triangular?
		assert valid?

		self.to_matrix.lower_triangular?
	end
end
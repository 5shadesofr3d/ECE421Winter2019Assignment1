require 'test/unit'

class SparseStorage
	include Test::Unit::Assertions

	public
	def initialize(row_count, column_count)
		# constructs a standard matrix

		# pre
		assert row_count.is_a? Integer and column_count.is_a? Integer
		assert row_count >= 0 and column_count >= 0

		# post
		@rows = row_count
		@columns = column_count

		assert valid?
	end

	def get_matrix
		raise AbstractClassError
	end

	def set_matrix(mat)
		raise AbstractClassError
	end

	def [](i, j)
		raise AbstractClassError
	end

	def []=(i, j, value)
		raise AbstractClassError
	end

	def shape
		assert valid?
		[@rows, @columns]
	end

	def valid?
		# returns true if class invariants hold
		return false unless @rows.is_a? Integer and @columns.is_a? Integer
		return false unless @rows >= 0 and @columns >= 0

		return true
	end

	def sparsity
		# returns the sparsity of the storage

		# pre
		zero_values = 0.0
		total_values = @rows * @columns

		self.each do |value|
			zero_values += 1 if value == 0
		end

		# post
		assert zero_values >= 0
		zero_values / total_values
	end

	def each_index
		# provides index iterators
		assert valid?

		for i in 0 .. @rows - 1
			for j in 0 .. @columns - 1
				yield i, j
			end
		end

		assert valid?
	end

	def each
		# iterates through each matrix element
		assert valid?

		for i in 0 .. @rows - 1
			for j in 0 .. @columns - 1
				yield self[i, j]
			end
		end

		assert valid?
	end


	def to_a
		# converts storage to an array of rows format
		assert valid?

		arr = []
		for i in 0 .. @rows - 1
			row = []
			for j in 0 .. @columns - 1
				row << self[i, j]
			end
			arr << row
		end

		assert valid?

		arr
	end

	def +(m1)
		assert valid?
		assert m1.is_a? SparseStorage

		self.each_index do |i, j|
			self[i, j] += m1[i, j]
		end

		assert valid?

		self
	end

	def -(m1)
		assert valid?
		assert m1.is_a? SparseStorage

		self.each_index do |i, j|
			self[i, j] -= m1[i, j]
		end

		assert valid?

		self
	end

	def *(scalar)
		assert valid?
		assert scalar.is_a? Numeric

		self.each_index do |i, j|
			self[i, j] *= scalar
		end

		assert valid?

		self
	end

	def /(scalar)
		assert valid?
		assert scalar != 0
		assert scalar.is_a? Numeric

		self.each_index do |i, j|
			self[i, j] /= scalar
		end

		assert valid?

		self
	end

	def **(scalar)
		assert valid?
		assert scalar.is_a? Numeric

		self.each_index do |i, j|
			self[i, j] **= scalar
		end

		assert valid?

		self
	end

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

	def dot(mat)
		raise NotImplementedError
	end

	def power(pow)
		raise NotImplementedError
	end

	def clone
		raise AbstractClassError
	end

	attr_reader :rows, :columns

end

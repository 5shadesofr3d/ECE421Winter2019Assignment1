require_relative 'sparse_storage'

class Dok < SparseStorage
	# --- Invariants ---
	# @self.is_a? SparseStorage
	# @self.rows >= 0
	# @self.cols >= 0
	# ------------------
public
	def initialize(rows, columns)
		assert rows.is_a? Integer
		assert columns.is_a? Integer
		assert rows >= 0
		assert columns >= 0
		@hash = Hash.new

		super(rows, columns)

		assert valid?
	end

	def get_matrix
		return @hash
	end

	def set_matrix(mat)
		@hash = mat
	end

	def valid?
		super and @hash.is_a? Hash
	end

	def [](i, j)
		# returns the matrix index at position i, j

		# pre
		assert i.is_a? Integer and j.is_a? Integer
		assert 0 <= i and i < @rows
		assert 0 <= j and j < @columns

		# post
		if @hash.key?([i, j])
			return @hash[[i, j]]
		else
			return 0
		end
	end

	def []=(i, j, value)
		# returns the matrix index at position i, j
		assert valid?

		# pre
		assert i.is_a? Integer and j.is_a? Integer
		assert 0 <= i and i < @rows
		assert 0 <= j and j < @columns
		assert value.is_a? Numeric

		# post
		if value == 0 and @hash.key? [i, j]
			@hash.delete [i, j]
		else
			@hash[[i, j]] = value
		end

		assert valid?
	end

	def add(m1)
		assert m1.is_a? SparseStorage
		@hash.each_index do |i, j|
			@hash[i, j] += m1[i, j]
		end
	end

	def subtract(m1)
		assert m1.is_a? SparseStorage
		@hash.each_index do |i, j|
			@hash[i, j] -= m1[i, j]
		end
	end

	def multiply(scalar)
		assert scalar.is_a? Numeric
		@hash.each_index do |i, j|
			@hash[i, j] *= scalar
		end
	end

	def divide(scalar)
		assert scalar != 0
		assert scalar.is_a? Numeric
		@hash.each_index do |i, j|
			@hash[i, j] /= scalar
		end
	end

	def exponent(scalar)
		assert scalar.is_a? Numeric
		@hash.each_index do |i, j|
			@hash[i, j] **= scalar
		end
	end

	#For this case, we have the choice of New Implementation,
	#Conversion to NMatrix, or no implementation at all
	def trace
		raise NotImplementedException
	end

	#For this case, we have the choice of New Implementation,
	#Conversion to NMatrix, or no implementation at all
	def rank
		raise NotImplementedException
	end

private
	@hash

end
require 'matrix'
require 'test/unit'

require './factory/YaleFactory'
require './factory/DokFactory'

class SMatrix
	include Test::Unit::Assertions
	# --- Invariants ---
	# @storage.is_a? SparseStorage
	# ------------------

public
	def initialize(matrix)
		# constructs a standard matrix
		# pre

		# post
		@storage = DokFactory.new.create(matrix)

		@storage.each_index do |i, j|
			if matrix.is_a? Array
				assert_same(matrix[i][j], self[i, j])
			else
				assert_same(matrix[i, j], self[i, j])
			end
		end

		assert valid?
	end

	def valid?
		# returns true if all class invariants hold
		false if not @storage.is_a? SparseStorage

		true
	end

	def [](i, j)
		# returns the matrix index at position i, j

		assert valid?

		# pre
		assert i.is_a? Integer and j.is_a? Integer
		assert 0 <= i and i < @storage.rows
		assert 0 <= j and j < @storage.columns

		# post
		assert valid?

		@storage[i, j]
	end

	def []=(i, j, value)
		# returns the matrix index at position i, j
		assert valid?
		# pre
		assert i.is_a? Integer and j.is_a? Integer
		assert 0 <= i and i < @storage.rows
		assert 0 <= j and j < @storage.columns
		assert value.is_a? Numeric

		# post
		@storage[i, j] = value

		assert valid?
	end

	def to_s
		# converts the matrix into a string
		assert valid?
		# pre
		str = ""

		# post
		col = 0

		@storage.each do |value|
			str += "#{value} "
			col += 1
			if col == @storage.columns
				col = 0
				str += "\n"
			end
		end

		assert valid?
		str
	end

	def identity?
		# returns true if the matrix is an identity matrix
		assert valid?
		# pre
		false if @storage.columns != @storage.rows

		# post
		@storage.each_index do |i, j|
			false if (i == j and self[i, j] != 1) or (i != j and self[i, j] != 0)
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
			false if self[i, j] != 0
		end

		assert valid?
		true
	end

	def diagonal?
		# returns true if the matrix is a diagonal matrix
		assert valid?
		# pre

		# post

		assert valid?
		Matrix[*@storage.to_a].diagonal?
	end

	#Generic add for all SMatrix types
	def +(mat)
		assert valid?

		#pre
		assert mat.is_a? SMatrix
		assert mat.shape == self.shape

		#TODO: Main functionality
		result = SMatrix.new(@storage)

		@storage.each_index do |i, j|
			result[i, j] += mat[i, j]
		end

		#post
		assert self.shape == result.shape
		assert result.is_a? SMatrix
		@storage.each_index do |i, j|
			assert result[i, j] == self[i, j] + mat[i, j]
		end

		assert valid?
		result
	end

	#Generic sub for all SMatrix types
	def -(mat)
		assert valid?

		#pre
		assert mat.is_a? SMatrix
		assert mat.shape == self.shape

		#TODO: Main functionality
		result = SMatrix.new(@storage)

		@storage.each_index do |i, j|
			result[i, j] -= mat[i, j]
		end

		#post
		assert self.shape == result.shape
		assert result.is_a? SMatrix
		@storage.each_index do |i, j|
			assert result[i, j] == self[i, j] - mat[i, j]
		end

		assert valid?
		result
	end

	#Generic divide for all SMatrix types
	def /(scalar)
		assert valid?
		#pre
		assert scalar.is_a? Numeric
		assert scalar != 0

		#TODO: Main functionality
		result = SMatrix.new(@storage)

		@storage.each_index do |i, j|
			result[i, j] /= scalar
		end

		#post
		assert result.shape == self.shape
		@storage.each_index do |i, j|
			assert result[i, j] == self[i, j] / scalar
		end

		assert valid?
		result
	end

	#Generic exponent for all SMatrix types
	def **(scalar)
		assert valid?
		#pre
		assert scalar.is_a? Numeric

		#TODO: Main functionality
		result = SMatrix.new(@storage)

		@storage.each_index do |i, j|
			result[i, j] **= scalar
		end

		#post
		assert result.shape == self.shape
		@storage.each_index do |i, j|
			assert result[i, j] == self[i, j] ** scalar
		end

		assert valid?
		result
	end

	#Generic multiply for all SMatrix types
	def *(scalar)
		assert valid?
		#pre
		assert scalar.is_a? Numeric

		#TODO: Main functionality
		result = SMatrix.new(@storage)
		@storage.each_index do |i, j|
			result[i, j] *= scalar
		end

		#post
		assert result.shape == self.shape
		@storage.each_index do |i, j|
			assert result[i, j] == self[i, j] * scalar
		end

		assert valid?
		result
	end

	def dot(mat)
		#pre
		assert valid?
		assert mat.is_a? SMatrix
		assert mat.rows == @storage.cols #MxN * NxK
		# TODO Implementation

		#post
		#@storage = @storage DOT mat
		assert mat.is_a? SMatrix
		assert valid?
	end

	def trace()
		#pre
		assert valid?
		assert @storage.rows == @storage.cols
		#Matrix MUST be square to trace
		@storage.trace

		assert valid?
	end

	def rank()
		assert valid?
		#TODO: Implement
		#No real assertions here..?
		assert valid?
	end

	def row_sum(rowNum)
		assert valid?
		assert rowNum.is_a? Integer
		assert rowNum >= 0
		assert rowNum < @storage.rows
		#TODO: Implement
		assert valid?
	end

	def col_sum(colNum)
		assert valid?
		assert colNum.is_a? Integer
		assert colNum >= 0
		assert colNum < @storage.cols
		#TODO: Implement
		assert valid?
	end

	def total_sum()
		assert valid?
		#TODO: Implement
		assert valid?
	end

	def transpose()
		assert valid?
		#pre
		#matrix to be transposed has been initialized
		@storage = @storage.transpose()
		#post
		#@storage = @storage transposed
		assert valid?
	end

	#Raise matrix to a power
	def power(pow)
		assert valid?
		assert pow.is_a? Integer
		assert @storage.shape[0] == @storage.shape[1] ##square matrix
		@storage.pow(pow)
		assert valid?
	end

	def inverse()
		assert valid?
		#pre
		assert @storage.shape[0] == @storage.shape[1] #square only

		#TODO:
		#SMatrix only implements this for dense matricies
		#so we must convert types then calculate then convert back..
		#inefficient but necessary for now

		#post
		# @storage = @storage^-1
		assert valid?
	end

	def diagonal()
		assert valid?
		#pre

		@storage.diagonal()

		#post
		assert valid?
	end

	def determinant()
		assert valid?
		#pre
		assert @storage.shape[0] == @storage.shape[1] #square
		@storage.det()
		#post
		assert valid?
	end

	def cholesky()
		assert valid?
		assert @storage.symmetric? #Matrix MUST be symmetric
		#TODO: Implement SMatrix cholesky factorization
		assert valid?
	end

	def luDecomp
		assert valid?
		#pre

		#TODO: Implement this, this has only been implemented for Dense
		#matricies in SMatrix so conversions MUST be done

		#post
		assert valid?
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
		@storage.symmetric?
		assert valid?
	end

	def shape
		assert valid?
		[@storage.rows, @storage.columns]
	end

private
	@storage

end

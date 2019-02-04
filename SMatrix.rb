require 'nmatrix'
require 'matrix'
# require './IMatrix'
require 'test/unit'

require './factory/YaleFactory'
require './factory/DokFactory'

class SMatrix
	include Test::Unit::Assertions
	# --- Invariants ---
	# @rows, @columns are Integers
	# @rows >= 0
	# @columns >= 0
	#
	# @storage.is_a? SparseStorage
	# ------------------

public
	def initialize(*matrix)
		# constructs a standard matrix
		# pre

		# post
		@storage = DokFactory.new.create(matrix)

		@storage.each_index do |i, j|
			assert_same(matrix[i][j], self[i, j])
		end
	end

	def [](i, j)
		# returns the matrix index at position i, j

		# pre
		assert i.is_a? Integer and j.is_a? Integer
		assert 0 <= i and i < @storage.rows
		assert 0 <= j and j < @storage.columns

		# post
		@storage[i, j]
	end

	def []=(i, j, value)
		# returns the matrix index at position i, j

		# pre
		assert i.is_a? Integer and j.is_a? Integer
		assert 0 <= i and i < @storage.rows
		assert 0 <= j and j < @storage.columns
		assert value.is_a? Numeric

		# post
		@storage[i, j] = value
	end

	def to_s
		# converts the matrix into a string

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

		str
	end

	def identity?
		# returns true if the matrix is an identity matrix

		# pre
		false if @storage.columns != @storage.rows

		# post
		@storage.each_index do |i, j|
			false if (i == j and self[i, j] != 1) or (i != j and self[i, j] != 0)
		end

		true
	end

	def zero?
		# returns true if the matrix is a zero matrix

		# pre

		# post

		@storage.each_index do |i, j|
			false if self[i, j] != 0
		end

		true
	end

	def diagonal?
		# returns true if the matrix is a diagonal matrix

		# pre

		# post
		Matrix[*@storage.to_a].diagonal?
	end

	#Generic add for all NMatrix types
	def add(mat)
		#pre
		assert mat.is_a? NMatrix
		assert mat.shape == @matrix.shape

		#TODO: Main functionality
		result = @matrix + mat
		@matrix = @matrix + mat

		#post
		assert @matrix.shape == mat.shape
		assert result == @matrix
	end

	#Generic sub for all NMatrix types
	def subtract(mat)
		#pre
		assert mat.is_a? NMatrix
		assert mat.shape == @matrix.shape

		#TODO: Main functionality
		result = @matrix - mat
		@matrix = @matrix - mat

		#post
		assert @matrix.shape == mat.shape
		assert result == @matrix
	end

	#Generic divide for all NMatrix types
	def divide(scalar)
		#pre
		assert scalar.is_a? Integer
		assert scalar != 0

		#TODO: Main functionality
		result = @matrix/scalar
		@matrix = @matrix/scalar

		#post
		assert result == @matrix
	end

	#Generic exponent for all NMatrix types
	def exponent(scalar)
		#pre
		assert scalar.is_a? Integer

		#TODO: Main functionality
		result = @matrix**scalar
		@matrix = @matrix**scalar

		#post
		assert result == @matrix
	end

	#Generic multiply for all NMatrix types
	def multiply(scalar)
		#pre
		assert scalar.is_a? Integer

		#TODO: Main functionality
		result = @matrix*scalar
		@matrix = @matrix*scalar

		#post
		assert result == @matrix
	end

	def dot(mat)
		#pre
		assert mat.is_a? NMatrix

		@matrix.dot(mat)

		#post
		#@matrix = @matrix DOT mat
		assert mat.is_a? NMatrix
	end

	def trace()
		#pre
		#Matrix MUST be square to trace
		assert @matrix.rows == @matrix.cols

		@matrix.trace
	end

	def rank()
		#TODO: Implement
		#No real assertions here..?
	end

	def row_sum(rowNum)
		assert rowNum.is_a? Integer
		assert rowNum >= 0
		assert rowNum < @matrix.rows
		#TODO: Implement
	end

	def col_sum(colNum)
		assert colNum.is_a? Integer
		assert colNum >= 0
		assert colNum < @matrix.cols
		#TODO: Implement
	end

	def total_sum()
		#TODO: Implement
	end

	def transpose()
		#pre
		#matrix to be transposed has been initialized
		@matrix = @matrix.transpose()
		#post
		#@matrix = @matrix transposed
	end

	#Raise matrix to a power
	def power(pow)
		assert pow.is_a? Integer
		assert @matrix.shape[0] == @matrix.shape[1] ##square matrix
		@matrix.pow(pow)
	end

	def inverse()
		#pre
		assert @matrix.shape[0] == @matrix.shape[1] #square only

		#TODO:
		#NMatrix only implements this for dense matricies
		#so we must convert types then calculate then convert back..
		#inefficient but necessary for now

		#post
		# @matrix = @matrix^-1
	end

	def diagonal()
		#pre

		@matrix.diagonal()

		#post
	end

	def determinant()
		#pre
		assert @matrix.shape[0] == @matrix.shape[1] #square
		@matrix.det()
		#post
	end

	def cholesky()
		assert @matrix.symmetric? #Matrix MUST be symmetric
		#TODO: Implement NMatrix cholesky factorization
	end

	def luDecomp
		#pre

		#TODO: Implement this, this has only been implemented for Dense
		#matricies in NMatrix so conversions MUST be done

		#post
	end

	def symmetric?
		@matrix.symmetric?
	end

private
	@storage

end
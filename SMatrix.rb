require 'nmatrix'
require 'matrix'
# require './IMatrix'
require 'test/unit'

require './factory/YaleFactory'
require './factory/DokFactory'

class SMatrix
	include Test::Unit::Assertions
	# --- Invariants ---
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

	#Generic add for all NMatrix types
	def add(mat)
		assert valid?

		#pre
		assert mat.is_a? NMatrix
		assert mat.shape == @matrix.shape

		#TODO: Main functionality
		result = @matrix + mat
		@matrix = @matrix + mat

		#post
		assert @matrix.shape == mat.shape
		assert result == @matrix

		assert valid?
	end

	#Generic sub for all NMatrix types
	def subtract(mat)
		assert valid?

		#pre
		assert mat.is_a? NMatrix
		assert mat.shape == @matrix.shape

		#TODO: Main functionality
		result = @matrix - mat
		@matrix = @matrix - mat

		#post
		assert @matrix.shape == mat.shape
		assert result == @matrix

		assert valid?
	end

	#Generic divide for all NMatrix types
	def divide(scalar)
		assert valid?
		#pre
		assert scalar.is_a? Integer
		assert scalar != 0

		#TODO: Main functionality
		result = @matrix/scalar
		@matrix = @matrix/scalar

		#post
		assert result == @matrix

		assert valid?
	end

	#Generic exponent for all NMatrix types
	def exponent(scalar)
		assert valid?
		#pre
		assert scalar.is_a? Integer

		#TODO: Main functionality
		result = @matrix**scalar
		@matrix = @matrix**scalar

		#post
		assert result == @matrix
		assert valid?
	end

	#Generic multiply for all NMatrix types
	def multiply(scalar)
		assert valid?
		#pre
		assert scalar.is_a? Integer

		#TODO: Main functionality
		result = @matrix*scalar
		@matrix = @matrix*scalar

		#post
		assert result == @matrix
		assert valid?
	end

	def dot(mat)
		assert valid?
		#pre
		assert mat.is_a? NMatrix

		@matrix.dot(mat)

		#post
		#@matrix = @matrix DOT mat
		assert mat.is_a? NMatrix
		assert valid?
	end

	def trace()
		assert valid?
		#pre
		#Matrix MUST be square to trace
		assert @matrix.rows == @matrix.cols

		@matrix.trace
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
		assert rowNum < @matrix.rows
		#TODO: Implement
		assert valid?
	end

	def col_sum(colNum)
		assert valid?
		assert colNum.is_a? Integer
		assert colNum >= 0
		assert colNum < @matrix.cols
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
		@matrix = @matrix.transpose()
		#post
		#@matrix = @matrix transposed
		assert valid?
	end

	#Raise matrix to a power
	def power(pow)
		assert valid?
		assert pow.is_a? Integer
		assert @matrix.shape[0] == @matrix.shape[1] ##square matrix
		@matrix.pow(pow)
		assert valid?
	end

	def inverse()
		assert valid?
		#pre
		assert @matrix.shape[0] == @matrix.shape[1] #square only

		#TODO:
		#NMatrix only implements this for dense matricies
		#so we must convert types then calculate then convert back..
		#inefficient but necessary for now

		#post
		# @matrix = @matrix^-1
		assert valid?
	end

	def diagonal()
		assert valid?
		#pre

		@matrix.diagonal()

		#post
		assert valid?
	end

	def determinant()
		assert valid?
		#pre
		assert @matrix.shape[0] == @matrix.shape[1] #square
		@matrix.det()
		#post
		assert valid?
	end

	def cholesky()
		assert valid?
		assert @matrix.symmetric? #Matrix MUST be symmetric
		#TODO: Implement NMatrix cholesky factorization
		assert valid?
	end

	def luDecomp
		assert valid?
		#pre

		#TODO: Implement this, this has only been implemented for Dense
		#matricies in NMatrix so conversions MUST be done

		#post
		assert valid?
	end

	def symmetric?
		assert valid?
		@matrix.symmetric?
		assert valid?
	end

private
	@storage

end
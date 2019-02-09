require 'matrix'
require 'test/unit'

require './factory/yale_factory'
require './factory/dok_factory'

class SMatrix
	include Test::Unit::Assertions
	# --- Invariants ---
	# @storage.is_a? SparseStorage
	# @storage.rows >= 0
	# @storage.cols >= 0
	# ------------------

	public
	def initialize(matrix, storage_factory = DokFactory.new)
		# constructs a standard matrix

		# pre
		assert storage_factory.is_a? StorageFactory
		assert StorageFactory.valid? matrix

		# post
		store_as(storage_factory, matrix)

		@storage.each_index do |i, j|
			assert_same(matrix[i, j], self[i, j], "Expected [i, j] = #{matrix[i, j]}, but got #{self[i, j]}")
		end

		assert valid?
	end

	def valid?
		# returns true if all class invariants hold
		return false unless (@storage.is_a? SparseStorage) or (@storage.is_a? NilClass)

		true
	end

	def each
		#pre
		assert valid?
		#@storage.each do |value|

		#post
		assert valid?
	end

	def each_col(col_index)
		#pre
		assert @storage.cols >= 0
		assert col_index <= @storage.cols
		assert valid?


		#post
		assert valid?
	end

	def each_row(row_index)
		#pre
		assert @storage.rows >= 0
		assert row_index <= @storage.rows
		assert valid?

		#post
		assert valid?
	end

	def for_main_diagonal
		#pre
		assert @storage.rows == @storage.cols
		assert valid?

		#post
		assert valid?
	end

	def [](i, j)
		# returns the matrix index at position i, j

		assert valid?

		# pre
		assert i.is_a? Integer and j.is_a? Integer
		assert 0 <= i and i < @storage.rows
		assert 0 <= j and j < @storage.columns

		# position
		assert valid?

		@storage[i, j]
	end

	def []=(i, j, value)
		# sets the matrix index at position i, j
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
		false if @storage.cols != @storage.rows

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

	#Generic add for all SMatrix types
	def +(mat)
		#pre
		assert valid?
		assert mat.is_a? SMatrix
		assert mat.shape == self.shape

		result = self.clone
		result.storage += mat.storage

		#post
		assert mat.shape == self.shape
		assert @storage.is_a? SparseStorage
		assert valid?
		return result
	end

	#Generic sub for all SMatrix types
	def -(mat)
		#pre
		assert valid?
		assert mat.is_a? SMatrix
		assert mat.shape == self.shape

		result = self.clone
		result.storage -= mat.storage

		#post
		assert mat.shape == self.shape
		assert @storage.is_a? SparseStorage
		assert valid?
		return result
	end

	#Generic divide for all SMatrix types
	def /(scalar)
		#pre
		assert valid?
		assert scalar.is_a? Numeric

		result = self.clone
		result.storage /= scalar

		#post
		assert @storage.is_a? SparseStorage
		assert valid?
		
		return result
	end

	#Generic exponent for all SMatrix types
	def **(scalar)
		#pre
		assert valid?
		assert scalar.is_a? Numeric

		result = self.clone
		result.storage **= scalar

		#post
		assert @storage.is_a? SparseStorage
		assert valid?

		return result
	end

	#Generic multiply for all SMatrix types
	def *(scalar)
		#pre
		assert valid?
		assert scalar.is_a? Numeric

		result = self.clone
		result.storage *= scalar

		#post
		assert @storage.is_a? SparseStorage
		assert valid?

		return result
	end

	# Note: NMatrix only supports the dot product of the
	# same matrix type.
	def dot(mat)
		#pre
		assert valid?
		assert mat.is_a? SMatrix
		assert mat.rows == @storage.cols #MxN * NxK

		#post
		@storage = @storage.dot(mat)
		assert mat.is_a? SMatrix
		assert valid?
	end

	def trace
		#pre
		assert valid?
		assert @storage.rows == @storage.cols
		#Matrix MUST be square to trace
		#TODO: Implement
		assert valid?
	end

	def rank
		assert valid?
		#TODO: Implement
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

	def total_sum
		assert valid?
		#TODO: Implement
		assert valid?
	end

	def transpose
		assert valid?
		#pre
		#matrix to be transposed has been initialized
		#TODO: Implement
		#post
		#@storage = @storage transposed
		assert valid?
	end

	# Raise matrix to a power
	def power(pow)
		assert valid?
		assert pow.is_a? Integer
		assert @storage.shape[0] == @storage.shape[1]

		@storage.pow(pow)
		assert valid?
	end

	# TODO:
	# NMatrix only implements this for dense matrices
	# so we must convert types then calculate then convert back.
	# Inefficient but necessary for now.
	def inverse
		assert valid?

		#pre
		assert @storage.shape[0] == @storage.shape[1] #square only

		#post
		@storage = @storage.invert
		assert @storage.shape[0] == @storage.shape[1]
		assert valid?
	end

	#TODO: NMatrix only implements this for 2D, square, dense, floating type matrices.
	def hessenberg
		assert valid?
		assert @storage.rows == @storage.cols

		assert valid?
	end

	def diagonal
		assert valid?
		#pre

		#TODO: Implement

		#post
		assert valid?
	end

	def determinant
		assert valid?

		#pre
		assert @storage.shape[0] == @storage.shape[1] #square

		#post
		return @storage.det
	end

	# TODO: Returns an upper and lower NMatrix which needs to be wrapped
	# in a SMatrix.
	def cholesky
		assert valid?

		# Pre
		assert @storage.symmetric?
		# assert @storage.hermatian?

		# Post
		return @storage.cholesky_factorization

	end

	# TODO: Implement this, this has only been implemented for Dense
	# matrices in SMatrix so conversions MUST be done. Additionally,
	# lu_decomposition is not implemented. The contract must be changed
	# to implement lu_factorization
	def lu_factorization
		assert valid?

		#pre
		# TODO: Needs to be a 2D matrix

		@storage = @storage.lu_factorization

		#post
		assert valid?

	end

	def shape
		assert valid?
		@storage.shape
	end

	def store_as(factory, storage = @storage)
		assert valid?

		# pre
		assert factory.is_a? StorageFactory
		
		@factory = factory
		@storage = @factory.create(storage)

		# post
		assert @factory.is_a? StorageFactory
		assert @storage.is_a? SparseStorage

		assert valid?
	end

	def rows
		assert valid?
		@storage.rows
	end

	def columns
		assert valid?
		@storage.columns
	end

	# TODO: Do these 2 functions violate dry?
	def upper_triangle(k = 0)
		assert valid?

		# Pre-conditions
		assert k.is_a? Integer and k >= 0
		assert @storage.shape.size == 2

		# Post
		# @storage.upper_triangle(k)

		assert valid?
	end

	def upper_triangle!(k = 0)
		assert valid?

		# Pre-conditions
		assert k.is_a? Integer and k >= 0
		assert @storage.shape.size == 2

		# Post
		# @storage.upper_triangle!(k)

		assert valid?
	end

	def lower_triangle(k = 0)
		assert valid?

		# Pre-conditions
		assert k.is_a? Integer and k >= 0
		assert @storage.shape.size == 2

		# Post
		# @storage.lower_triangle(k)

		assert valid?
	end

	def lower_triangle!(k = 0)
		assert valid?

		# Pre-conditions
		assert k.is_a? Integer and k >= 0
		assert @storage.shape.size == 2

		# Post
		# @storage.lower_triangle!(k)

		assert valid?
	end

	def conjugate
		# Pre-conditions
		assert valid?

		# Post
		@storage.complex_conjugate

		assert valid?
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

	def buildTridiagonal(upper, middle, lower, size)
		#pre
		assert size.is_a? Integer
		assert upper.is_a? Matrix
		assert middle.is_a? Matrix
		assert lower.is_a? Matrix
		assert size > 0
		#TODO: Implementation
		#result = ....
		#post
		#assert result.tridiagonal?
		assert valid?
	end

	def buildEye(size)
		#pre
		assert size.is_a? Integer
		assert size > 0
		#TODO: Implementation

		#post
		#assert result.identity?
		assert valid?
	end

	def buildZero(rows, cols)
		#pre
		assert rows.is_a? Integer
		assert cols.is_a? Integer
		assert rows > 0
		assert cols > 0
		#TODO: Implementation

		#post
		#assert result.identity?
		assert valid?
	end

	def buildRandom(rows, cols)
		#pre
		assert rows.is_a? Integer
		assert cols.is_a? Integer
		assert rows > 0
		assert cols > 0
		#TODO: Implementation

		#post
		#assert result.sparsity <= 0.5
		assert valid?
	end

	def equals(mat)
		assert valid?
		assert mat.is_a? SparseStorage

		assert valid?
	end

	def clone
		return SMatrix.new(@storage, @factory)
	end

	protected
	attr_accessor :storage, :factory
end

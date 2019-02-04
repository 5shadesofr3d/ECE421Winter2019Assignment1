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
	# @matrix.is_a? NMatrix
	# ------------------

public
	def initialize(mSize)
	    ##Create square matrix of size mSize
	    ##Init full of zeros
	    #TODO: Factory here to build the matrix
	    @matrix = NMatrix(mSize, 0)
	end

	def initialize(rows, columns, *matrix)
		# constructs a standard matrix

		# pre
		assert rows.is_a? Integer and columns.is_a? Integer
		assert rows >= 0 and columns >= 0
		assert matrix.is_a? Array and matrix.size == rows # will likely replace this

		# post
		@rows = rows
		@columns = columns
		@matrix = DokFactory.new.create(matrix)

		for i in 0 .. (rows - 1)
			for j in 0 .. (columns - 1)
				assert_same(matrix[i][j], self[i, j])
			end
		end

	end

	def [](i, j)
		# returns the matrix index at position i, j

		# pre
		assert i.is_a? Integer and j.is_a? Integer
		assert 0 <= i and i < @rows
		assert 0 <= j and j < @columns

		# post
		@matrix[i, j]
	end

	def []=(i, j, value)
		# returns the matrix index at position i, j

		# pre
		assert i.is_a? Integer and j.is_a? Integer
		assert 0 <= i and i < @rows
		assert 0 <= j and j < @columns
		assert value.is_a? Numeric

		# post
		@matrix[i, j] = value
	end

	def to_s
		# converts the matrix into a string

		# pre
		str = ""

		# post
		col = 0

		@matrix.each do |value|
			str += "#{value} "
			col += 1
			if col == @matrix.columns
				col = 0
				str += "\n"
			end
		end

		str
	end

	def identity?
		# returns true if the matrix is an identity matrix

		# pre
		false if @columns != @rows

		# post
		for i in 0 .. (@rows - 1)
			for j in 0 .. (@columns - 1)
				false if (i == j and self[i, j] != 1) or (i != j and self[i, j] != 0)
			end
		end

		true
	end

	def zero?
		# returns true if the matrix is a zero matrix

		# pre

		# post
		for i in 0 .. (@rows - 1)
			for j in 0 .. (@columns - 1)
				false if self[i, j] != 0
			end
		end

		true
	end

	def diagonal?
		# returns true if the matrix is a diagonal matrix

		# pre

		# post
		Matrix[*@matrix.to_a].diagonal?
	end

	def add(mat)
	    #pre
	    # mat = sparse yale format matrix
	    # mat and _matrix must be matricies of the same size

	    #TODO: Main functionality

	    @matrix = @matrix + mat

	    #post
	    # result = m1 + m2
	    # result has same dimensions as m1 and m2
	end

	def subtract(mat)
	    #pre
	    # mat = sparse yale format matrix
	    # mat and _matrix must be matricies of the same size

	    #TODO: Main functionality

	    @matrix = @matrix - mat


	    #post
	    # result = m1 - m2
	end

	def divide(scalar)
	    #pre
	    # scalar = whole number integer to divide by

	    #TODO: Main functionality

	    @matrix = @matrix/scalar

	    #post
	    # result = m1 / m2
	end

	def exponent(scalar)
	    #pre
	    # scalar = whole number integer to exponentiate by

	    #TODO: Main functionality

	    @matrix = @matrix**scalar


	    #post
	    # result = m1 ^ m2
	end

	def multiply(scalar)
	    #pre
	    # scalar = whole number integer to multiply by

	    #TODO: Main functionality
	    @matrix = @matrix*scalar



	    #post
	    # result = m1 * m2
	end

private
	@rows
	@columns
	@matrix

end

# class IdentityMatrix < SMatrix
# 	# --- Invariants ---
# 	# @rows == @columns
# 	# index [i, i] == 1
# 	# index [i, j] == 0 if i =! j
# 	# ------------------

# 	def initialize(size)
# 		# constructs an identity matrix

# 		# pre
# 		assert size.is_a? Integer

# 		# post
# 		@rows = @columns = size
# 		@matrix = NMatrix.eye(size) # use factory here ?
# 		assert self.identity?
# 	end

# end

# class ZeroMatrix < SMatrix
# 	# --- Invariants ---
# 	# index [i, j] == 0
# 	# ------------------

# 	def initialize(rows, columns)
# 		# constructs a zero matrix

# 		# pre
# 		assert rows.is_a? Integer and columns.is_a? Integer

# 		# post
# 		@rows = rows
# 		@columns = columns
# 		@matrix = NMatrix.zeros([rows, columns]) # user factory here?
# 		assert self.zero?
# 	end

# end

# class DiagonalMatrix < SMatrix
# 	# --- Invariants ---
# 	# index [i, j] == 0 if i != j
# 	# ------------------

# 	def initialize(*values)
# 		# constructs a diagonal matrix

# 		# pre
# 		for value in values
# 			assert value.is_a? Numeric
# 		end

# 		# post
# 		@rows = @columns = values.size
# 		@matrix = NMatrix.diagonal(values) # use factory here?
# 		assert self.diagonal?
# 	end

# end

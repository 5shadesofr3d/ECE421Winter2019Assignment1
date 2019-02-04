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

	def add(mat)
	    #pre
	    # mat = sparse yale format matrix
	    # mat and _matrix must be matricies of the same size

	    #TODO: Main functionality

	    @storage = @storage + mat

	    #post
	    # result = m1 + m2
	    # result has same dimensions as m1 and m2
	end

	def subtract(mat)
	    #pre
	    # mat = sparse yale format matrix
	    # mat and _matrix must be matricies of the same size

	    #TODO: Main functionality

	    @storage = @storage - mat


	    #post
	    # result = m1 - m2
	end

	def divide(scalar)
	    #pre
	    # scalar = whole number integer to divide by

	    #TODO: Main functionality

	    @storage = @storage/scalar

	    #post
	    # result = m1 / m2
	end

	def exponent(scalar)
	    #pre
	    # scalar = whole number integer to exponentiate by

	    #TODO: Main functionality

	    @storage = @storage**scalar


	    #post
	    # result = m1 ^ m2
	end

	def multiply(scalar)
	    #pre
	    # scalar = whole number integer to multiply by

	    #TODO: Main functionality
	    @storage = @storage*scalar



	    #post
	    # result = m1 * m2
	end

private
	@storage

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
# 		@storage = NMatrix.eye(size) # use factory here ?
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
# 		@storage = NMatrix.zeros([rows, columns]) # user factory here?
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
# 		@storage = NMatrix.diagonal(values) # use factory here?
# 		assert self.diagonal?
# 	end

# end

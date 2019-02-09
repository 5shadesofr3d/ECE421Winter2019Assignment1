require 'matrix'
require 'test/unit'

require_relative 'factory/yale_factory'
require_relative 'factory/dok_factory'
require_relative 'factory/lil_factory'

require_relative 'smatrix_modules/arithmetic'
require_relative 'smatrix_modules/operations'
require_relative 'smatrix_modules/iterators'
require_relative 'smatrix_modules/conditionals'
require_relative 'smatrix_modules/builder'
require_relative 'smatrix_modules/triangle'
require_relative 'smatrix_modules/conversions'

class SMatrix
	include Test::Unit::Assertions
	include Arithmetic
	include Operations
	include Iterators
	include Conditionals
	include Builder
	include Triangle
	include Conversions

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
		assert (@storage.is_a? SparseStorage), "Expected SparseStorage, Got #{@storage.class}"

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

require 'matrix'
require 'test/unit'

require_relative 'factory/yale_factory'
require_relative 'factory/dok_factory'
require_relative 'factory/lil_factory'

require_relative 'smatrix_modules/arithmetic'
require_relative 'smatrix_modules/operations'
require_relative 'smatrix_modules/conditionals'
require_relative 'smatrix_modules/builder'
require_relative 'smatrix_modules/triangle'
require_relative 'smatrix_modules/conversions'

require_relative 'storage/storage_modules/iterators'

class SMatrix
	include Test::Unit::Assertions
	include Arithmetic
	include Operations
	include Iterators
	include Conditionals
	include Builder
	include Triangle
	include Conversions

	@@FACTORY_MAP = {
		dok: DokFactory,
		lil: LilFactory,
		yale: YaleFactory
	}

	public
	def initialize(matrix, type = :yale)
		# constructs a standard matrix

		# pre
		assert @@FACTORY_MAP.key? type
		assert StorageFactory.valid? matrix

		# post
		store_as(type, matrix)

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

	def store_as(type, storage = @storage)
		assert valid?

		# pre
		assert @@FACTORY_MAP.key? type

		@factory = @@FACTORY_MAP[type].new
		@storage = @factory.create(storage)

		# post
		assert @factory.is_a? StorageFactory
		assert (@storage.is_a? SparseStorage), "Expected SparseStorage, Got #{@storage.class}"

		assert valid?

		self
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
		print mat.shape
		print self.shape
		#assert mat.is_a? SparseStorage

		for i in 0..self.rows - 1
			for j in 0..self.columns - 1
				if self[i, j] != mat[i, j]
					return false
				end
			end
		end
		return true

		assert valid?
	end

	def storage
		@storage
	end

	def clone
		return SMatrix.new(@storage, @@FACTORY_MAP.key(@factory.class))
	end

	protected
	attr_accessor :storage, :factory
end

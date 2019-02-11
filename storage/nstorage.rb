require 'nmatrix'

require_relative 'sparse_storage'
require_relative 'storage_modules/delegate_operations'

class NStorage < SparseStorage
	include DelegateOperations

	def initialize(row_count, column_count)
		# constructs a standard matrix
		super(row_count, column_count)

		assert valid?
	end

	def valid?
		super and @storage.is_a? NMatrix
	end

	def [](i, j)
		# returns the matrix index at position i, j

		# pre
		assert i.is_a? Integer and j.is_a? Integer
		assert 0 <= i and i < @rows
		assert 0 <= j and j < @columns

		# post
		assert valid?
		
		@storage[i, j]
	end

	def []=(i, j, value)
		# assigning a value the matrix index at position i, j
		assert valid?

		# pre
		assert i.is_a? Integer and j.is_a? Integer
		assert 0 <= i and i < @rows
		assert 0 <= j and j < @columns
		assert value.is_a? Numeric

		# post
		assert valid?

		@storage[i, j] = value
	end

	def invert
		assert valid?

		original_type = @storage.stype
		result = @storage.cast(:dense) # Convert to do inversion.
		result.inverse.cast(original_type) # Invert and convert back before returning.
		@storage.cast(original_type, :object)
	end

	def lu_factorization
		assert valid?

		original_type = @storage.stype
		result = @storage.cast(:dense) # Convert to do factorization.
		@storage.cast(original_type, :object)
		result.factorize_lu.cast(original_type)
	end

	def hermitian?
		assert @storage.is_a? NMatrix
		@storage.hermitian?
	end

	def clone
		instance = self.class.new(@rows, @columns)
		instance.storage = @storage.clone

		instance
	end

	protected
	attr_accessor :storage
end

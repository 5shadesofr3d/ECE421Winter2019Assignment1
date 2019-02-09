require 'test/unit'

require_relative 'storage_modules/default_arithmetic'
require_relative 'storage_modules/default_operations'
require_relative 'storage_modules/iterators'

class SparseStorage
	include Test::Unit::Assertions
	include DefaultArithmetic
	include DefaultOperations
	include Iterators

	public
	def initialize(row_count, column_count)
		# constructs a standard matrix

		# pre
		assert row_count.is_a? Integer and column_count.is_a? Integer
		assert row_count >= 0 and column_count >= 0

		# post
		@rows = row_count
		@columns = column_count

		assert valid?
	end

	def get_matrix
		raise AbstractClassError
	end

	def set_matrix(mat)
		raise AbstractClassError
	end

	def [](i, j)
		raise AbstractClassError
	end

	def []=(i, j, value)
		raise AbstractClassError
	end

	def shape
		assert valid?
		[@rows, @columns]
	end

	def valid?
		# returns true if class invariants hold
		return false unless @rows.is_a? Integer and @columns.is_a? Integer
		return false unless @rows >= 0 and @columns >= 0

		return true
	end

	def sparsity
		# returns the sparsity of the storage

		# pre
		zero_values = 0.0
		total_values = @rows * @columns

		self.each do |value|
			zero_values += 1 if value == 0
		end

		# post
		assert zero_values >= 0
		zero_values / total_values
	end

	def clone
		raise AbstractClassError
	end

	attr_reader :rows, :columns
end

require 'test/unit'
require 'nmatrix'
require './storage/dok'
require './storage/lil'

Yale = NMatrix

class StorageFactory
	include Test::Unit::Assertions

	TYPE = {
		yale: Yale,
		dok: Dok,
		lil: Lil,
		matrix: Matrix,
		nmatrix: NMatrix
	}

	def create(matrix)
		raise AbstractClassError
	end

	def self.valid?(storage)
		return TYPE.has_value? storage.class
	end

	def valid?(storage)
		return StorageFactory.valid? storage
	end

	def from_array(storage)
		# returns a Dok object which contains content from storage

		# pre
		assert storage.is_a? Array

		# post
		rows = storage.size
		columns = storage[0].size if rows > 0
		dok = Dok.new(rows, columns)

		for i in 0 .. rows - 1
			for j in 0 .. columns - 1
				dok[i, j] = storage[i][j]
			end
		end

		dok
	end
end

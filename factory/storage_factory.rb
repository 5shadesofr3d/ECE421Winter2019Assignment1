require 'test/unit'
require 'nmatrix'
require './storage/dok'
require './storage/lil'

Yale = NMatrix

class StorageFactory
	include Test::Unit::Assertions

	@@TYPE = {
		yale: Yale,
		dok: Dok,
		lil: Lil,
		nmatrix: NMatrix,
		matrix: Matrix
	}

	def create(matrix)
		raise AbstractClassError
	end

	def self.valid?(storage)
		return @@TYPE.has_value? storage.class
	end

	def valid?(storage)
		return StorageFactory.valid? storage
	end

	def create_instance(storage, type)
		assert valid? storage

		if storage.is_a? @@TYPE[type]
			return storage.clone
		end

		instance = @@TYPE[type].new(rows(storage), columns(storage))
		
		instance.each_index do |i, j|
			instance[i, j] = storage[i, j]
		end

		return instance
	end

	def rows(storage)
		assert valid? storage

		if storage.is_a? Matrix
			return storage.row_count
		else
			return storage.shape[0]
		end
	end

	def columns(storage)
		assert valid? storage

		if storage.is_a? Matrix
			return storage.column_count
		else storage.is_a? NMatrix
			return storage.shape[1]
		end
	end

end

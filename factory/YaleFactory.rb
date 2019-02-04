require './StorageFactory'
require 'matrix'
require 'nmatrix'

# NOTE: Yale and Compressed Sparse Row (CSR) are equivalent
# Also we use the NMatrix gem to represent the YaleStorage for us
class YaleFactory < StorageFactory

	def create(storage)
		# returns a YaleStorage containing the same values of the specified storage

		# pre
		assert valid? storage
		created = nil

		case storage.class
		when Yale
			created = storage
		when Dok

		when Lil

		when Matrix

		when Array

		end

		# post
		assert created.is_a? Yale
		created
	end

end
require './factory/storage_factory'
require 'matrix'
require 'nmatrix'

# NOTE: Yale and Compressed Sparse Row (CSR) are equivalent
# Also we use the NMatrix gem to represent the YaleStorage for us
class YaleFactory < StorageFactory
	# --- Invariants ---
	# @self.is_a? StorageFactory
	# ------------------


	def create(storage)
		# returns a YaleStorage containing the same values of the specified storage

		# pre
		assert valid? storage
		created = nil
		case storage
		when Yale
			created = storage
		when Dok

		when Lil

		when Matrix

		when Array
			created = Yale[*storage]
		end

		# post
		assert created.is_a? Yale
		created
	end

end

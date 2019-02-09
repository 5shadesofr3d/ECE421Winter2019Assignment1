require_relative 'storage_factory'

# NOTE: Yale and Compressed Sparse Row (CSR) are equivalent
# Also we use the NMatrix gem to represent the YaleStorage for us
class YaleFactory < StorageFactory
	# --- Invariants ---
	# @self.is_a? StorageFactory
	# ------------------

	def create(storage)
		# returns a DOKStorage containing the same values of the specified storage

		# pre
		assert valid? storage
		
		type = :yale
		created = create_instance(storage, type)

		# post
		assert (created.is_a? @@TYPE[type]), "Expected #{@@TYPE[type]}, but got: #{created.class}"
		created
	end

end

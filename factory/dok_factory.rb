require_relative 'storage_factory'

# NOTE: Dictionary of Keys (DOK)
class DokFactory < StorageFactory
	# --- Invariants ---
	# @self.is_a? StorageFactory
	# ------------------
	
	def create(storage)
		# returns a DOKStorage containing the same values of the specified storage

		# pre
		assert valid? storage
		
		type = :dok
		created = create_instance(storage, type)

		# post
		assert (created.is_a? @@TYPE[type]), "Expected #{@@TYPE[type]}, but got: #{created.class}"
		created
	end

end

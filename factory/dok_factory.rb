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

		created = from_array(storage.to_a)

		# post
		assert (created.is_a? Dok), "Expected Dok, but got: #{created.class}"
		created
	end

end

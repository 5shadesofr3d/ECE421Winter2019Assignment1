require_relative 'storage_factory'

# NOTE: List of List (LIL)
class LilFactory < StorageFactory
	# --- Invariants ---
	# @self.is_a? StorageFactory
	# ------------------

	def create(storage)
		# returns a LILStorage containing the same values of the specified storage

		# pre
		assert valid? storage

		type = :lil
		created = create_instance(storage, type)

		# post
		assert (created.is_a? @@TYPE[type]), "Expected #{@@TYPE[type]}, but got: #{created.class}"
		created
	end

end

require './StorageFactory'

# NOTE: Dictionary of Keys (DOK)
class DokFactory < StorageFactory

	def create(storage)
		# returns a DOKStorage containing the same values of the specified storage

		# pre
		assert valid? storage
		created = nil

		case storage.class
		when Yale
			
		when Dok
			created = storage
		when Lil
			
		when Matrix

		when Array

		end

		# post
		assert created.is_a? Dok
		created
	end

end
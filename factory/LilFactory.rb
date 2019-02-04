require './StorageFactory'

# NOTE: List of List (LIL)
class LilFactory < StorageFactory

	def create(storage)
		# returns a LILStorage containing the same values of the specified storage

		# pre
		assert valid? storage
		created = nil

		case storage.class
		when Yale
			
		when Dok

		when Lil
			created = storage
		when Matrix

		when Array

		end

		# post
		assert created.is_a? Lil
		created
	end

end
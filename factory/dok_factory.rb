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
		created = nil

		case storage
		when Yale

		when Dok
			created = from_array(storage.to_a)
		when Lil

		when Matrix
			created = from_array(storage.to_a)
		when Array
			created = from_array(storage)
		end

		# post
		assert (created.is_a? Dok), "Expected Dok, but got: #{created.class}"
		created
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

require_relative 'nstorage'

class Yale < NStorage
	# --- Invariants ---
	# @self.is_a? SparseStorage
	# @self.rows >= 0
	# @self.cols >= 0
	# ------------------
	public
	def initialize(row_count, column_count)
		@storage = NMatrix.new([row_count, column_count], stype: :yale)
		
		super(row_count, column_count)
		assert valid?
	end

	def get_matrix
		return @storage
	end

	def set_matrix(mat)
		@storage = mat
	end

	def valid?
		super
	end
end

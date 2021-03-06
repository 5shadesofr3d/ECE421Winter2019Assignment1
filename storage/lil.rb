require_relative 'nstorage'

class Lil < NStorage
	# --- Invariants ---
	# @self.is_a? SparseStorage
	# @self.rows >= 0
	# @self.cols >= 0
	# ------------------

	public
	def initialize(row_count, column_count)
		@storage = NMatrix.new([row_count, column_count], stype: :list, dtype: :object)
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
		super and @storage.stype == :list
	end

	def type
		return Lil
	end

end

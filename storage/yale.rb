require_relative 'nstorage'
require_relative 'storage_modules/delegate_arithmetic'

class Yale < NStorage
	include DelegateArithmetic
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
		super and @storage.stype == :yale
	end

	def type
		return Yale
	end
end

require 'test/unit'
require 'nmatrix'
require './storage/Dok'
require './storage/Lil'

Yale = NMatrix

class StorageFactory
	include Test::Unit::Assertions
	# --- Invariants ---
	# @self.is_a? StorageFactory
	# ------------------

	def create(matrix)
		raise AbstractClassError
	end

	def valid?(storage)
		return (storage.is_a? Yale or storage.is_a? Dok or storage.is_a? Lil or storage.is_a? Matrix or storage.is_a? Array)
	end
end
module Conversions
	def to_s
		# converts the matrix into a string
		assert valid?
		# pre
		str = ""

		# post
		self.each_row do |row|
			str += "[ "
			row.each {|v| str += "%8.2f ".rjust(5) % v}
			str += "]\n"
		end

		assert valid?
		str
	end

	def to_a
		# converts storage to an array of rows format
		assert valid?

		arr = []
		self.each_row do |row|
			arr << row
		end

		assert arr.is_a? Array
		assert valid?

		arr
	end

	def to_f
		assert valid?
		result = self.clone
		self.each_index do |i, j|
			result[i, j] = result[i, j].to_f
		end
		assert valid?

		result
	end

	def to_matrix
		assert valid?
		result = Matrix[*self.to_a]
		assert result.is_a? Matrix
		assert valid?

		result
	end

	def to_nmatrix
		assert valid?
		result = NMatrix[*self.to_a]
		assert result.is_a? NMatrix
		assert valid?

		result
	end

	def to_yale
		assert valid?
		result = self.clone.store_as(:yale)
		assert result.storage.is_a? Yale
		assert valid?

		result
	end

	def to_lil
		assert valid?
		result = self.clone.store_as(:lil)
		assert result.storage.is_a? Lil
		assert valid?

		result
	end

	def to_dok
		assert valid?
		result = self.clone.store_as(:dok)
		assert result.storage.is_a? Dok
		assert valid?

		result
	end
end
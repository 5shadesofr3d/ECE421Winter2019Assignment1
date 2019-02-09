module Conversions
	def to_s
		# converts the matrix into a string
		assert valid?
		# pre
		str = ""

		# post
		col = 0
		
		@storage.each do |value|
			str += "#{value} "
			col += 1
			if col == @storage.columns
				col = 0
				str += "\n"
			end
		end

		assert valid?
		str
	end

	def to_a
		# converts storage to an array of rows format
		assert valid?

		arr = []
		for i in 0 .. @rows - 1
			row = []
			for j in 0 .. @columns - 1
				row << self[i, j]
			end
			arr << row
		end

		assert valid?

		arr
	end

	def to_f
		assert valid?
		result = self.clone
		self.each_index do |i, j|
			result[i, j] = self[i, j].to_f
		end
		assert valid?

		result
	end

	def to_matrix
		assert valid?

		Matrix self.to_a
	end

	def to_nmatrix
		NMatrix self.to_a
	end

	def to_yale
		assert valid?
		result = self.clone.store_as(:yale)
		assert result.is_a? yale
		assert valid?

		result
	end

	def to_lil
		assert valid?
		result = self.clone.store_as(:lil)
		assert result.is_a? Lil
		assert valid?

		result
	end

	def to_dok
		assert valid?
		result = self.clone.store_as(:dok)
		assert result.is_a? Dok
		assert valid?

		result
	end
end
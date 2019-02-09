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

	end

	def to_matrix

	end

	def to_nmatrix

	end
end
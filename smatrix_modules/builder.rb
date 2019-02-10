module Builder
	def self.eye(size)
		#pre
		assert size.is_a? Integer
		assert size > 0
		#TODO: Implementation

		#post
		#assert result.identity?
		assert valid?
	end

	def self.zero(rows, cols)
		#pre
		assert rows.is_a? Integer
		assert cols.is_a? Integer
		assert rows > 0
		assert cols > 0
		#TODO: Implementation

		#post
		#assert result.identity?
		assert valid?
	end

	def self.random(rows, cols)
		#pre
		assert rows.is_a? Integer
		assert cols.is_a? Integer
		assert rows > 0
		assert cols > 0
		#TODO: Implementation

		#post
		#assert result.sparsity <= 0.5
		assert valid?
	end

	def self.tridiagonal(upper, middle, lower, size)
		#pre
		assert size.is_a? Integer
		assert upper.is_a? Matrix
		assert middle.is_a? Matrix
		assert lower.is_a? Matrix
		assert size > 0
		#TODO: Implementation
		#result = ....
		#post
		#assert result.tridiagonal?
		assert valid?
	end

	def partition(rows = [0, self.rows], columns = [0, self.columns])
		assert valid?
		assert (rows.is_a? Array) and (columns.is_a? Array)
		assert (rows[0] < rows[1]) and (columns[0] < columns[1])
		assert (rows[1] <= self.rows) and (columns[1] <= self.columns)

		row_count = rows[1] - rows[0]
		column_count = columns[1] - columns[0]

		matrix = Matrix.zero(row_count, column_count)
		part = SMatrix.new(matrix)

		part.each_index do |i, j|
			part[i, j] = self[i + rows[0], j + columns[0]]
		end

		part
	end
end
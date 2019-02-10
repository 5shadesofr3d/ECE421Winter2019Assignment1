module Builder
	def self.I(size)
		self.eye(size)
	end

	def self.eye(size)
		#pre
		assert size.is_a? Integer
		assert size > 0

		result = SMatrix.new(Matrix.I(size))

		#post
		assert result.identity?

		result
	end

	def self.zero(rows, cols = rows)
		#pre
		assert rows.is_a? Integer
		assert cols.is_a? Integer
		assert rows > 0
		assert cols > 0
		
		result = SMatrix.new(Matrix.zero(rows, cols))

		#post
		assert result.zero?

		result
	end

	def self.random(rows, cols)
		#pre
		assert rows.is_a? Integer
		assert cols.is_a? Integer
		assert rows > 0
		assert cols > 0

		matrix = Matrix.build(rows, cols) { rand }
		result = SMatrix.new(matrix)

		#post
		result
	end

	def self.tridiagonal(upper, middle, lower)
		#pre
		assert size.is_a? Integer
		assert upper.is_a? Array and middle.is_a? Array and lower.is_a? Array
		assert upper.length == middle.length - 1 == lower.length
		assert middle.length >= 3

		result = SMatrix.zero(middle.length)

		result.each_diagonal_index(1) do |i, j|
			result[i, j] = upper.shift
		end
		result.each_diagonal_index(0) do |i, j|
			result[i, j] = middle.shift
		end
		result.each_diagonal_index(-1) do |i, j|
			result[i, j] = lower.shift
		end

		#post
		assert result.tridiagonal?

		result
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
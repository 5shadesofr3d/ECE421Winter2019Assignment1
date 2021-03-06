module Builder
	include Test::Unit::Assertions

	def I(size)
		self.eye(size)
	end

	def eye(size)
		#pre
		assert size.is_a? Integer
		assert size >= 0

		result = SMatrix.new(Dok.new(size, size))
		result.each_diagonal_index do |i, j|
			result[i, j] = 1
		end

		#post
		assert result.identity?

		result
	end

	def zero(rows, cols = rows)
		#pre
		assert rows.is_a? Integer
		assert cols.is_a? Integer
		assert rows >= 0
		assert cols >= 0
		
		result = SMatrix.new(Dok.new(rows, cols))

		#post
		assert result.zero?

		result
	end

	def random(rows, cols = rows, non_zero_factor = 0.3, spread = 1000)
		#pre
		assert (rows.is_a? Integer), "rows not an integer"
		assert (cols.is_a? Integer), "cols not an integer"
		assert rows >= 0
		assert cols >= 0

		result = SMatrix.zero(rows, cols)
		result.each_index do |i, j|
			if rand <= non_zero_factor
				result[i, j] = rand * spread
			end
		end

		#post
		result
	end

	def tridiagonal(upper, middle, lower)
		#pre
		assert upper.is_a? Array and middle.is_a? Array and lower.is_a? Array
		assert (upper.length == middle.length - 1) and (upper.length == lower.length)
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
end
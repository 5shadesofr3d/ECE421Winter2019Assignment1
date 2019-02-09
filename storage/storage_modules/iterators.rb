module Iterators
	def each
		# iterates through each matrix element
		assert valid?
		
		self.each_index do |i, j|
			yield self[i, j]
		end

		assert valid?
	end

	def each_index
		# provides index iterators
		assert valid?

		for i in 0 .. self.rows - 1
			for j in 0 .. self.columns - 1
				yield i, j
			end
		end

		assert valid?
	end

	def each_non_zero
		# provides index iterators
		assert valid?

		self.each_non_zero_index do |i, j|
			yield self[i, j]
		end

		assert valid?
	end

	def each_non_zero_index
		# provides index iterators
		assert valid?

		self.each_index do |i, j|
			yield i, j unless self[i, j] == 0
		end

		assert valid?
	end

	def each_column
		#pre
		assert self.columns >= 0
		assert valid?

		for j in 0 .. self.columns - 1
			col = []
			for i in 0 .. self.rows - 1
				col << self[i, j]
			end
			yield col
		end

		#post
		assert valid?
	end

	def each_row
		#pre
		assert self.rows >= 0
		assert valid?

		for i in 0 .. self.rows - 1
			row = []
			for j in 0 .. self.columns - 1
				row << self[i, j]
			end
			yield row
		end

		#post
		assert valid?
	end

	def each_diagonal_index
		#pre
		assert valid?

		for i in 0 .. [self.rows, self.columns].min - 1
			yield i, i
		end

		#post
		assert valid?
	end

	def each_diagonal_element
		#pre
		assert valid?

		self.each_diagonal_index do |i, j|
			yield self[i, j]
		end

		#post
		assert valid?
	end
end
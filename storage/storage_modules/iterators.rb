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

	def get_column(col_num)
		#pre
		assert self.columns >= 0
		assert valid?

		col = []
		for i in 0 .. self.rows - 1
			col << self[i, col_num]
		end
		yield col

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

  def get_row(row_num)
		#pre
		assert self.rows >= 0
		assert valid?

		row = []
		for j in 0 .. self.columns - 1
			row << self[row_num, j]
		end
		yield row

		#post
		assert valid?
	end

	def each_diagonal_index(offset = 0)
		# if offset < 0, below main diagonal
		# if offset > 0, above main diagonal
		# if offset = 0, main diagonal

		#pre
		assert valid?

		if (offset > 0)
			for i in 0 .. [self.rows - offset, self.columns - offset].min - 1
				yield i, i + offset
			end
		elsif (offset < 0)
			for i in 0 .. [self.rows + offset, self.columns + offset].min - 1
				yield i - offset, i
			end
		else
			for i in 0 .. [self.rows, self.columns].min - 1
				yield i, i
			end
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

	def each_lower_index
		assert valid?
		for o in 1 .. self.rows - 1
			self.each_diagonal_index(-o) do |i, j|
				yield i, j
			end
		end
		assert valid?
	end

	def each_lower
		assert valid?
		self.each_lower_index do |i, j|
			yield self[i, j]
		end
		assert valid?
	end

	def each_upper_index
		assert valid?
		for o in 1 .. self.rows - 1
			self.each_diagonal_index(o) do |i, j|
				yield i, j
			end
		end
		assert valid?
	end

	def each_upper
		assert valid?
		self.each_upper_index do |i, j|
			yield self[i, j]
		end
		assert valid?
	end
end
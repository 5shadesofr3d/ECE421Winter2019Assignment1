module Iterators
	def each
		# iterates through each matrix element
		assert valid?
		
		for i in 0 .. @rows - 1
			for j in 0 .. @columns - 1
				yield self[i, j]
			end
		end

		assert valid?
	end

	def each_index
		# provides index iterators
		assert valid?

		for i in 0 .. @rows - 1
			for j in 0 .. @columns - 1
				yield i, j
			end
		end

		assert valid?
	end

	def each_col(col_index)
		#pre
		assert @storage.cols >= 0
		assert col_index <= @storage.cols
		assert valid?


		#post
		assert valid?
	end

	def each_row(row_index)
		#pre
		assert @storage.rows >= 0
		assert row_index <= @storage.rows
		assert valid?

		#post
		assert valid?
	end

	def for_main_diagonal
		#pre
		assert @storage.rows == @storage.cols
		assert valid?

		#post
		assert valid?
	end
end
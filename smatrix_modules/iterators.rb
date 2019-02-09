module Iterators
	def each
		#pre
		assert valid?
		#@storage.each do |value|

		#post
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
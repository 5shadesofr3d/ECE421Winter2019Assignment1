module DefaultOperations
	# TODO: Is this how we should deal with abstract methods? Or should we leave them out?
	def det
		yFactory = YaleFactory.new
		temp = yFactory.create(self)
		return temp.det
	end

	def transpose
		result = self.class.new(self.columns, self.rows)
		self.each_non_zero_index do |i, j|
			result[j, i] = self[i, j]
		end
		return result
	end

	def invert
		assert result.is_a? Dok
		yFactory = YaleFactory.new
		dFactory = DokFactory.new
		temp = yFactory.create(self)
		temp = temp.invert
		result = dFactory.create(temp)
		assert result.is_a? Dok
		return result
	end

	def complex_conjugate
		assert result.is_a? Dok
		yFactory = YaleFactory.new
		dFactory = DokFactory.new
		temp = yFactory.create(self)
		temp = temp.complex_conjugate
		result = dFactory.create(temp)
		assert result.is_a? Dok
		return result
	end

	def lu_factorization
		assert result.is_a? Dok
		yFactory = YaleFactory.new
		temp = yFactory.create(self)
		return temp.factorize_lu
	end

	def cholesky_factorization
		assert result.is_a? Dok
		yFactory = YaleFactory.new
		temp = yFactory.create(self)
		return temp.factorize_cholesky
	end

	def hermitian?
		assert result.is_a? Dok
		yFactory = YaleFactory.new
		temp = yFactory.create(self)
		return temp.hermitian?
	end

	def col_sum(col_num)
		sum = 0
		self.get_column(col_num).each do |x|
			sum += x
		end
		sum
	end

	def row_sum(row_num)
		sum = 0
		self.get_row(row_num).each do |x|
			sum += x
		end
		sum
	end

	def total_sum
		sum = 0
		self.each_non_zero do |x|
			sum += x
		end
		sum
	end
end
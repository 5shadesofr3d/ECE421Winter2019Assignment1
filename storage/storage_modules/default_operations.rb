module DefaultOperations
	# TODO: Is this how we should deal with abstract methods? Or should we leave them out?
	def det
		yFactory = YaleFactory.new
		temp = yFactory.create(@storage)
		return temp.det
	end

	def transpose
		result = self.class.new(self.columns, self.rows)
		result.each_index do |i, j|
			result[i, j] = self[j, i]
		end
		return result
	end

	def invert
		assert result.is_a? Dok
		yFactory = YaleFactory.new
		dFactory = DokFactory.new
		temp = yFactory.create(@storage)
		temp = temp.invert
		result = dFactory.create(temp)
		assert result.is_a? Dok
		return result
	end

	def complex_conjugate
		assert result.is_a? Dok
		yFactory = YaleFactory.new
		dFactory = DokFactory.new
		temp = yFactory.create(@storage)
		temp = temp.complex_conjugate
		result = dFactory.create(temp)
		assert result.is_a? Dok
		return result
	end

	def lu_factorization
		assert result.is_a? Dok
		yFactory = YaleFactory.new
		temp = yFactory.create(@storage)
		return temp.factorize_lu
	end

	def cholesky_factorization
		assert result.is_a? Dok
		yFactory = YaleFactory.new
		temp = yFactory.create(@storage)
		return temp.factorize_cholesky
	end

	def hermitian?
		assert result.is_a? Dok
		yFactory = YaleFactory.new
		temp = yFactory.create(@storage)
		return temp.hermitian?
	end

	def col_sum(colNum)
		raise NotImplementedError
	end

	def row_sum(rowNum)
		raise NotImplementedError
	end

	def total_sum
		raise NotImplementedError
	end
end
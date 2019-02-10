require 'factory/yale_factory'
require 'factory/lil_factory'

module DelegateArithmetic
	def +(m1)
		assert m1.is_a? SparseStorage
		if m1.is_a? Dok
			yFactory = yFactory.new
			m1 = yFactory.create(m1)
		end
		@storage += m1.storage

		self
	end

	def -(m1)
		assert m1.is_a? SparseStorage
		if m1.is_a? Dok
			yFactory = yFactory.new
			m1 = yFactory.create(m1)
		end
		@storage -= m1.storage

		self
	end

	def *(scalar)
		assert scalar.is_a? Numeric
		@storage *= scalar

		self
	end

	def /(scalar)
		assert scalar != 0
		assert scalar.is_a? Numeric
		@storage /= scalar

		self
	end

	def **(scalar)
		assert scalar.is_a? Numeric
		@storage **= scalar

		self
	end

	def power(pow)
		assert pow.is_a? Numeric
		@storage.pow(pow)

		self
	end

	def dot(m1)
		assert m1.is_a? SparseStorage
		yFactory = YaleFactory.new
		lFactory = LilFactory.new
		if @storage.is_a? Yale
			m1 = yFactory.create(m1)
			@storage.dot(m1)
		else #Lil
			m1 = lFactory.create(m1)
			@storage.dot(m1)
		end
		assert @storage.is_a? SparseStorage
		self
	end
end
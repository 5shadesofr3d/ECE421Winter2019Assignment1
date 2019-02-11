require_relative '../SMatrix'
require 'test/unit'
require_relative '../storage/yale'
require_relative '../storage/dok'
require_relative '../storage/lil'
require 'complex'
require 'matrix'

class TestConditionals<Test::Unit::TestCase
	# this is to test all conditionals when comparing differnet sMatrices
	# NOTE: may need to create dummy stubs. similar to the previous class

	# For these test cases, it doesn't need to be random test cases.
	# probably just use extreme point analysis for the data points, etc.

	def test_identity
		#setup

		yaleMatrix = SMatrix.new(Yale.new(3, 3))
		dokMatrix = SMatrix.new(Dok.new(3, 3), :dok)
		lilMatrix = SMatrix.new(Lil.new(3, 3), :lil)

		for i in 0..2 do
			for j in 0..2 do
				if i == j
					value = 1
				else
					value = 0
				end

				yaleMatrix[i, j] = value
				dokMatrix[i, j] = value
				lilMatrix[i, j] = value

			end
		end

		#Ensure all equal the 3x3 identity matrix

		assert(yaleMatrix.identity?)
		assert(dokMatrix.identity?)
		assert(lilMatrix.identity?)

		#Take away a different 1 from each

		yaleMatrix[0,0] = 0
		dokMatrix[1,1] = 0
		lilMatrix[2,2] = 0

		assert(!yaleMatrix.identity?)
		assert(!dokMatrix.identity?)
		assert(!lilMatrix.identity?)

		#Add one back, and an extra 1 elsewhere

		yaleMatrix[0,0] = 1
		yaleMatrix[0,1] = 1
		dokMatrix[1,1] = 1
		dokMatrix[1,2] = 1
		lilMatrix[2,2] = 1
		lilMatrix[2,0] = 1

		assert(!yaleMatrix.identity?)
		assert(!dokMatrix.identity?)
		assert(!lilMatrix.identity?)

	end

	def test_zero
		#setup

		yaleMatrix = SMatrix.new(Yale.new(3, 3))
		dokMatrix = SMatrix.new(Dok.new(3, 3), :dok)
		lilMatrix = SMatrix.new(Lil.new(3, 3), :lil)

		value = 0
		for i in 0..2 do
			for j in 0..2 do
				yaleMatrix[i, j] = value
				dokMatrix[i, j] = value
				lilMatrix[i, j] = value
			end
		end

		#Ensure all equal the 3x3 zero matrix

		assert(yaleMatrix.zero?)
		assert(dokMatrix.zero?)
		assert(lilMatrix.zero?)

		#Add a 1 to each

		yaleMatrix[0,0] = 1
		dokMatrix[1,1] = 1
		lilMatrix[2,2] = 1

		assert(!yaleMatrix.zero?)
		assert(!dokMatrix.zero?)
		assert(!lilMatrix.zero?)

	end

	def test_diagonal
		#setup

		yaleMatrix = SMatrix.new(Yale.new(3, 3))
		dokMatrix = SMatrix.new(Dok.new(3, 3), :dok)
		lilMatrix = SMatrix.new(Lil.new(3, 3), :lil)

		for i in 0..2 do
			for j in 0..2 do
				if i == j
					value = i + 1
				else
					value = 0
				end

				yaleMatrix[i, j] = value
				dokMatrix[i, j] = value
				lilMatrix[i, j] = value

			end
		end

		#Ensure all equal the 3x3 zero matrix

		assert(yaleMatrix.diagonal?)
		assert(dokMatrix.diagonal?)
		assert(lilMatrix.diagonal?)

		#Add one back, and an extra 1 elsewhere

		yaleMatrix[0,1] = 1
		dokMatrix[1,2] = 1
		lilMatrix[2,0] = 1

		assert(!yaleMatrix.identity?)
		assert(!dokMatrix.identity?)
		assert(!lilMatrix.identity?)

	end

	def test_tridiagonal
		#setup

		yaleMatrix = SMatrix.new(Yale.new(4, 4))
		dokMatrix = SMatrix.new(Dok.new(4, 4), :dok)
		lilMatrix = SMatrix.new(Lil.new(4, 4), :lil)

		for i in 0..3 do
			for j in 0..3 do
				if i == j or i == j - 1 or i - 1 == j
					value = i + 1
				else
					value = 0
				end

				yaleMatrix[i, j] = value
				dokMatrix[i, j] = value
				lilMatrix[i, j] = value

			end
		end

		#Ensure all are tridiagonal

		assert(yaleMatrix.tridiagonal?)
		assert(dokMatrix.tridiagonal?)
		assert(lilMatrix.tridiagonal?)

		#Add an extra 1 elsewhere

		yaleMatrix[0,2] = 1
		dokMatrix[1,3] = 1
		lilMatrix[3,1] = 1

		assert(!yaleMatrix.tridiagonal?)
		assert(!dokMatrix.tridiagonal?)
		assert(!lilMatrix.tridiagonal?)

	end

	def test_symmetry
		#setup

		yaleMatrix = SMatrix.new(Yale.new(3, 3))
		dokMatrix = SMatrix.new(Dok.new(3, 3), :dok)
		lilMatrix = SMatrix.new(Lil.new(3, 3), :lil)

		for i in 0..2 do
			for j in 0..2 do

				yaleMatrix[i, j] = rand(6)
				yaleMatrix[j, i] = yaleMatrix[i, j]
				dokMatrix[i, j] = rand(6)
				dokMatrix[j, i] = dokMatrix[i, j]
				lilMatrix[i, j] = rand(6)
				lilMatrix[j, i] = lilMatrix[i, j]

			end
		end

		assert(yaleMatrix.symmetric?)
		assert(dokMatrix.symmetric?)
		assert(lilMatrix.symmetric?)

		#Randomly change one of the elements...

		row = rand(2)

		column = rand(2)
		until column != row do
			column = rand(2)
		end

		yaleMatrix[row, column] = 7
		dokMatrix[row, column] = 7
		lilMatrix[row, column] = 7

		assert(!yaleMatrix.symmetric?)
		assert(!dokMatrix.symmetric?)
		assert(!lilMatrix.symmetric?)

	end

	def test_hermitian

	end

	def test_normal

	end

	def test_orthoganal

		yaleMatrix = SMatrix.new(Yale.new(2, 2))
		dokMatrix = SMatrix.new(Dok.new(2, 2), :dok)
		lilMatrix = SMatrix.new(Lil.new(2, 2), :lil)

		for i in 0..1 do
			for j in 0..1 do
				yaleMatrix[i, j] = 0
				dokMatrix[i, j] = 0
				lilMatrix[i, j] = 0
			end
		end

		yaleMatrix[0,0] = 1
		yaleMatrix[1,1] = 1

		dokMatrix[0,0] = 1
		dokMatrix[1,1] = -1

		lilMatrix[0,0] = 1
		lilMatrix[1,1] = -1

		assert(yaleMatrix.orthogonal?)
		assert(dokMatrix.orthogonal?)
		assert(lilMatrix.orthogonal?)

		yaleMatrix[0,0] = 0
		dokMatrix[1,1] = 0
		lilMatrix[0,1] = 1

		assert(!yaleMatrix.orthogonal?)
		assert(!dokMatrix.orthogonal?)
		assert(!dokMatrix.orthogonal?)

	end

	def test_permutation
		yaleMatrix = SMatrix.new(Yale.new(3, 3))
		dokMatrix = SMatrix.new(Dok.new(3, 3), :dok)
		lilMatrix = SMatrix.new(Lil.new(3, 3), :lil)

		valueOne = rand(3)
		valueTwo = rand(3)
		until valueTwo != valueOne do
			valueTwo = rand(3)
		end
		if valueOne != 0 and valueTwo != 0
			valueThree = 0
		elsif valueOne != 1 and valueTwo != 1
			valueThree = 1
		else
			valueThree = 2
		end

		for i in 0..2 do
			for j in 0..2 do
				if (i == 0 and j == valueOne) or (i == 1 and j == valueTwo) or (i == 2 and j == valueThree)
					yaleMatrix[i,j] = 1
					dokMatrix[i,j] = 1
					lilMatrix[i,j] = 1
				end
				yaleMatrix[i, j] = 0
				dokMatrix[i, j] = 0
				lilMatrix[i, j] = 0
			end
		end

		#assert(yaleMatrix.permutation?)
		#assert(dokMatrix.permutation?)
		#assert(lilMatrix.permutation?)

		value = rand(2)
		if yaleMatrix[0, value] == 1
			yaleMatrix[1, value] = 1
		else
			yaleMatrix[0, value] = 1
		end

		value = rand(2)
		if dokMatrix[0, value] == 1
			dokMatrix[1, value] = 1
		else
			dokMatrix[0, value] = 1
		end

		value = rand(2)
		if lilMatrix[0, value] == 1
			lilMatrix[1, value] = 1
		else
			lilMatrix[0, value] = 1
		end

		assert(!yaleMatrix.permutation?)
		assert(!dokMatrix.permutation?)
		assert(!lilMatrix.permutation?)

	end

	# def test_singular
	# 	yaleMatrix = SMatrix.new(Yale.new(2, 2))
	# 	dokMatrix = SMatrix.new(Dok.new(2, 2), :dok)
	# 	lilMatrix = SMatrix.new(Lil.new(2, 2), :lil)
	#
	# 	invertedValues = [1, 0.5, 0.25, 0.125, 0.0625]
	# 	values = [1, 2, 4, 8, 16]
	# 	random = rand(5)
	# 	invertedValue = invertedValues[random]
	# 	value = values[random]
	#
	#
	#
	# 	yaleMatrix[0, 0] = 1
	# 	yaleMatrix[0, 1] = invertedValue
	# 	yaleMatrix[1, 0] = value
	# 	yaleMatrix[1, 1] = 1
	#
	# 	dokMatrix[0, 0] = 1
	# 	dokMatrix[0, 1] = invertedValue
	# 	dokMatrix[1, 0] = value
	# 	dokMatrix[1, 1] = 1
	#
	# 	lilMatrix[0, 0] = 1
	# 	lilMatrix[0, 1] = invertedValue
	# 	lilMatrix[1, 0] = value
	# 	lilMatrix[1, 1] = 1
	#
	# 	assert(yaleMatrix.singular?)
	# 	assert(dokMatrix.singular?)
	# 	assert(lilMatrix.singular?)
	#
	# 	randomX = rand(2)
	# 	randomY = rand(2)
	# 	randomValue = rand(100)
	# 	until randomValue > 16 do
	# 		randomValue = rand(100)
	# 	end
	#
	# 	yaleMatrix[randomX, randomY] = randomValue
	# 	dokMatrix[randomX, randomY] = randomValue
	# 	lilMatrix[randomX, randomY] = randomValue
	#
	# 	assert(!yaleMatrix.singular?)
	# 	assert(!dokMatrix.singular?)
	# 	assert(!lilMatrix.singular?)
	#
	#
	# end

	# def test_regular
	# 	yaleMatrix = SMatrix.new(Yale.new(2, 2))
	# 	dokMatrix = SMatrix.new(Dok.new(2, 2), :dok)
	# 	lilMatrix = SMatrix.new(Lil.new(2, 2), :lil)
	#
	#
	#
	# 	yaleMatrix[0, 0] = 0.5
	# 	yaleMatrix[0, 1] = 0.5
	# 	yaleMatrix[1, 0] = 0.3
	# 	yaleMatrix[1, 1] = 0.7
	#
	# 	dokMatrix[0, 0] = 0.5
	# 	dokMatrix[0, 1] = 0.5
	# 	dokMatrix[1, 0] = 0.3
	# 	dokMatrix[1, 1] = 0.7
	#
	# 	lilMatrix[0, 0] = 0.5
	# 	lilMatrix[0, 1] = 0.5
	# 	lilMatrix[1, 0] = 0.3
	# 	lilMatrix[1, 1] = 0.7
	#
	# 	assert(yaleMatrix.regular?)
	# 	assert(dokMatrix.regular?)
	# 	assert(lilMatrix.regular?)
	#
	# 	yaleMatrix[0, 0] = -5
	# 	dokMatrix[0, 0] = -5
	# 	lilMatrix[0, 0] = -5
	#
	# 	assert(!yaleMatrix.regular?)
	# 	assert(!dokMatrix.regular?)
	# 	assert(!lilMatrix.regular?)
	#
	#
	# end

	def test_real
		yaleMatrix = SMatrix.new(Yale.new(3, 3))
		dokMatrix = SMatrix.new(Dok.new(3, 3), :dok)
		lilMatrix = SMatrix.new(Lil.new(3, 3), :lil)


		for i in 0..2 do
			for j in 0..2 do
				value = rand(10)

				yaleMatrix[i, j] = value
				dokMatrix[i, j] = value
				lilMatrix[i, j] = value

			end
		end

		assert(yaleMatrix.real?)
		assert(dokMatrix.real?)
		assert(lilMatrix.real?)

		yaleMatrix[rand(3), rand(3)] = Complex(rand(10), rand(10))
		dokMatrix[rand(3), rand(3)] = Complex(rand(10), rand(10))
		lilMatrix[rand(3), rand(3)] = Complex(rand(10), rand(10))

		assert(!yaleMatrix.real?)
		assert(!dokMatrix.real?)
		assert(!lilMatrix.real?)

	end

	def test_square
		yaleMatrix = SMatrix.new(Yale.new(2, 2))
		dokMatrix = SMatrix.new(Dok.new(2, 2), :dok)
		lilMatrix = SMatrix.new(Lil.new(2, 2), :lil)

		assert(yaleMatrix.square?)
		assert(dokMatrix.square?)
		assert(lilMatrix.square?)

		yaleMatrix2 = SMatrix.new(Yale.new(2, 3))
		dokMatrix2 = SMatrix.new(Dok.new(2, 3), :dok)
		lilMatrix2 = SMatrix.new(Lil.new(2, 3), :lil)


		assert(!yaleMatrix2.square?)
		assert(!dokMatrix2.square?)
		assert(!lilMatrix2.square?)
	end

	def test_unitary
		yaleMatrix = SMatrix.new(Yale.new(2, 2))
		dokMatrix = SMatrix.new(Dok.new(2, 2), :dok)
		lilMatrix = SMatrix.new(Lil.new(2, 2), :lil)

		yaleMatrix[0, 0] = Complex(1, 1)/2
		dokMatrix[0, 0] = Complex(1, 1)/2
		lilMatrix[0, 0] = Complex(1, 1)/2

		yaleMatrix[0, 1] = Complex(1, -1)/2
		dokMatrix[0, 1] = Complex(1, -1)/2
		lilMatrix[0, 1] = Complex(1, -1)/2

		yaleMatrix[1, 0] = Complex(1, -1)/2
		dokMatrix[1, 0] = Complex(1, -1)/2
		lilMatrix[1, 0] = Complex(1, -1)/2

		yaleMatrix[1, 1] = Complex(1, 1)/2
		dokMatrix[1, 1] = Complex(1, 1)/2
		lilMatrix[1, 1] = Complex(1, 1)/2

		assert(yaleMatrix.unitary?)
		assert(dokMatrix.unitary?)
		assert(lilMatrix.unitary?)

		row = rand(2)
		column = rand(2)

		yaleMatrix[row, column] = 0
		dokMatrix[row, column] = 0
		lilMatrix[row, column] = 0

		assert(!yaleMatrix.unitary?)
		assert(!dokMatrix.unitary?)
		assert(!lilMatrix.unitary?)
	end

	def test_upper_triangular
		yaleMatrix = SMatrix.new(Yale.new(3, 3))
		dokMatrix = SMatrix.new(Dok.new(3, 3), :dok)
		lilMatrix = SMatrix.new(Lil.new(3, 3), :lil)


		for i in 0..2 do
			for j in 0..2 do
				value = rand(10)
				if j >= i
					yaleMatrix[i, j] = value
					dokMatrix[i, j] = value
					lilMatrix[i, j] = value
				else
					yaleMatrix[i, j] = 0
					dokMatrix[i, j] = 0
					lilMatrix[i, j] = 0
				end

			end
		end

		assert(yaleMatrix.upper_triangular?)
		assert(dokMatrix.upper_triangular?)
		assert(lilMatrix.upper_triangular?)

		randomRow = rand(2) + 1
		randomCol = rand(2)

		if randomCol == randomRow
			randomCol = 0
		end

		yaleMatrix[randomRow, randomCol] = rand(9) + 1
		dokMatrix[randomRow, randomCol] = rand(9) + 1
		lilMatrix[randomRow, randomCol] = rand(9) + 1

		assert(!yaleMatrix.upper_triangular?)
		assert(!dokMatrix.upper_triangular?)
		assert(!lilMatrix.upper_triangular?)

	end

	def test_lower_triangular
		yaleMatrix = SMatrix.new(Yale.new(3, 3))
		dokMatrix = SMatrix.new(Dok.new(3, 3), :dok)
		lilMatrix = SMatrix.new(Lil.new(3, 3), :lil)


		for i in 0..2 do
			for j in 0..2 do
				value = rand(10)
				if i >= j
					yaleMatrix[i, j] = value
					dokMatrix[i, j] = value
					lilMatrix[i, j] = value
				else
					yaleMatrix[i, j] = 0
					dokMatrix[i, j] = 0
					lilMatrix[i, j] = 0
				end

			end
		end

		assert yaleMatrix.lower_triangular?
		assert dokMatrix.lower_triangular?
		assert lilMatrix.lower_triangular?

		randomRow = rand(2)
		randomCol = rand(2) + 1

		if randomCol == randomRow
			randomRow = 0
		end

		yaleMatrix[randomRow, randomCol] = rand(9) + 1
		dokMatrix[randomRow, randomCol] = rand(9) + 1
		lilMatrix[randomRow, randomCol] = rand(9) + 1

		assert !yaleMatrix.lower_triangular?
		assert !dokMatrix.lower_triangular?
		assert !lilMatrix.lower_triangular?

	end

end

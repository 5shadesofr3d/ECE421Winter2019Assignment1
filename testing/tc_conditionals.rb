require_relative '../SMatrix'
require 'test/unit'
require_relative '../storage/yale'
require_relative '../storage/dok'
require_relative '../storage/lil'
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

	end

	def test_diagonal

	end

	def test_tridiagonal

	end

	def test_symmetry

	end

	def test_hermitian

	end

	def test_normal

	end

	def test_orthoganal

	end

	def test_permutation

	end

	def test_singular

	end

	def test_regular

	end

	def test_real

	end

	def test_square

	end

	def test_unitary

	end

	def upper_triangular

	end

	def lower_triangular

	end

end
